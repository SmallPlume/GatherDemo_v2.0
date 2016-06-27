package com.modules.sys.ctrl;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.modules.base.orm.FileInfo;
import com.modules.base.orm.Result;
import com.modules.base.svc.FileInfoSVC;
import com.modules.util.orm.Plupload;
import com.modules.util.svc.PluploadUtil;

@Controller
@RequestMapping("/file")
public class FileCTRL {

	@Autowired
	private FileInfoSVC fileSVC;
	
	public static final String FileDir = "uploadfile\\";
	
	/**
	 * 文件上传
	 * @param request
	 * @param plupload
	 * @throws IOException 
	 */
	@RequestMapping(value="/upload", method = RequestMethod.POST)
	public @ResponseBody Result upload(HttpServletRequest request, Plupload plupload) throws IOException{
		plupload.setRequest(request);
		//文件存储路径
		Date day = new Date();//获取时间
		SimpleDateFormat format=new SimpleDateFormat("yyyyMMdd");
		String path = format.format(day);
		
        File dir = new File(plupload.getRequest().getSession().getServletContext().getRealPath("/") + FileDir+"/"+path);
		//File dir = new File(filePath + FileDir+"/"+path);
		
		System.out.println("文件存储路径========"+dir.getPath()); 
        //比如：D:\workplace\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\GatherDemo_v2  、uploadfile\20160425
		FileInfo fileInfo = new FileInfo();
		fileInfo.setPath(FileDir + path);  //文件上传路径
		fileInfo.setName(plupload.getName());  //文件名称
		fileInfo.setExtName(plupload.getName());  //文件扩展名
		fileInfo.setStatus("0");  //使用中
        try{
        	PluploadUtil.upload(plupload, dir,fileInfo);
        	System.out.println("name="+plupload.getName() + "----id="+plupload.getId());
        	//判断文件是否上传成功（被分成块的文件是否全部上传完成）
            if (PluploadUtil.isUploadFinish(plupload)) {
                System.out.println("name="+plupload.getName() + "----id="+plupload.getId());
            }
            
        }catch(IllegalStateException e){
        	e.printStackTrace();
        }
        fileSVC.save(fileInfo);
        return Result.data(fileInfo);
	}

	/**
	 * 获取图片
	 * @param icon
	 * @param request
	 * @param response
	 * @throws IOException
	 */
	@RequestMapping("/icon/{icon}")
	public void getIcon(@PathVariable("icon") String icon,HttpServletRequest request, HttpServletResponse response) throws IOException {
		if(StringUtils.isEmpty(icon)){
			icon = "";
		}
		
		FileInfo fileInfo = fileSVC.queryById(icon);
		String filePath = request.getSession().getServletContext().getRealPath("/")+fileInfo.getPath()+"\\"+fileInfo.getName();
		
		File file = new File(filePath);
		
		//判断文件是否存在，如果不存在，就返回默认图标
		if(!file.canRead()){
			file = new File(request.getSession().getServletContext().getRealPath("/") + FileDir+"icon.png");
		}
		response.setContentType("image/*");
		FileInputStream inputStream = null;
		OutputStream stream = response.getOutputStream();
		try{
			inputStream = new FileInputStream(file);
	        byte[] data = new byte[(int)file.length()];
	        int length = inputStream.read(data);
	        if(length!=-1){
	        	stream.write(data, 0, length);
	        	stream.flush();
	        }
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			inputStream.close();
	        stream.close();
		}
	}
	
	/**
	 * 删除附件
	 * @param id
	 * @param request
	 * @param response
	 */
	@RequestMapping(value="/deltFile/{id}",method = RequestMethod.POST)
	public void delt(@PathVariable("id") String id,HttpServletRequest request, HttpServletResponse response){
		if(id != null || !"".equals(id)){
			FileInfo fileInfo = fileSVC.queryById(id);
			String filePath = request.getSession().getServletContext().getRealPath("/")+fileInfo.getPath()+"\\"+fileInfo.getName();
			
			File file = new File(filePath);
			if(file.isFile() && file.exists()){
				fileSVC.delete(id);
				file.delete();
			}
		}
	}
	
	
}
