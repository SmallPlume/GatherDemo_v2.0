package com.modules.sys.ctrl;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
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
	
	public static final String FileDir = "uploadfile/";
	
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
		System.out.println("文件存储路径========"+dir.getPath()); 
        //比如：D:\workplace\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\GatherDemo_v2  、uploadfile\20160425
		FileInfo fileInfo = new FileInfo();
		fileInfo.setPath(FileDir+"/"+path);  //文件上传路径
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
        System.out.println("fileID================================"+fileInfo.getId());
        return Result.data(fileInfo);
	}

	
}
