package com.modules.sys.ctrl;

import java.io.IOException;
import java.util.List;

import net.sf.json.JSONArray;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.session.mgt.eis.SessionDAO;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.modules.base.orm.Result;
import com.modules.base.orm.User;
import com.modules.sys.constant.ModuleType;
import com.modules.sys.orm.Role;
import com.modules.sys.orm.Subscriber;
import com.modules.sys.svc.PermissionSVC;
import com.modules.sys.svc.RoleSVC;
import com.modules.sys.svc.SubscriberSVC;

@Controller
public class CoreCTRL {

	@Autowired
	private RoleSVC roleSVC;
	
	@Autowired
	private SubscriberSVC subSVC;
	
	@Autowired
	private PermissionSVC permissionSVC;
	
	@Autowired
	private SessionDAO sessionDAO;
	
	public final static String SESSION_KEY = "SESSION_USER";
	
	public final static String SESSION_MODULE = "SESSION_MODULE";
	
	/**
	 * Ê×Ò³
	 * @return
	 */
	@RequestMapping(value="/index",method=RequestMethod.GET)
	public String Index(Model model){
		Subject subject = SecurityUtils.getSubject();
		if(subject.isAuthenticated()==true){
			//²Ëµ¥
			JSONArray module = new JSONArray();
			if("admin".equals(subject.getPrincipal().toString())){
				module = permissionSVC.queryPermit(null, ModuleType.menu.type);
			}else{
				module = permissionSVC.queryPermit(subject.getPrincipal().toString(), ModuleType.menu.type);
			}
			model.addAttribute("module", module.toString());
			return "/index";
		}
		return "/login";
	}
	
	/**
	 * µÇÂ½Ò³
	 * @return
	 */
	@RequestMapping(value="/login",method=RequestMethod.GET)
	public String gotoLogin(){
		return "/login";
	}
	
	/**
	 * µÇÂ½
	 * @param user
	 * @param request
	 * @return
	 * @throws IOException 
	 */
	@RequestMapping(value="/login",method=RequestMethod.POST)
	public @ResponseBody Result login(Subscriber sub){
		Subject subject=SecurityUtils.getSubject();
		UsernamePasswordToken token=new UsernamePasswordToken(sub.getUsername().trim().toString(),sub.getPassword().trim().toString());
		token.setRememberMe("on".equals(sub.getSubject())?true:false);
		try{
			subject.login(token);
			return Result.ok("ÑéÖ¤³É¹¦£¡");
		}catch (IncorrectCredentialsException e) {
			return Result.error("ÓÃ»§Ãû/ÃÜÂë´íÎó");
        }catch (AuthenticationException e) {
        	return Result.error("ÓÃ»§Ãû/ÃÜÂë´íÎó");
        }
	}
	
	@RequestMapping(value="/setLogin",method=RequestMethod.POST)
	public void setLoginInfo(User user){
		subSVC.login(user);
	}
	
	/**
	 * ÍË³öµÇÂ¼
	 * @return
	 */
	@RequestMapping(value="/loginout",method=RequestMethod.GET)
	public String loginOut(){
		subSVC.logout();
		return "redirect:/login.do";
	}
	
	
	/**
	 * Î´ÖªÒ³
	 * @return
	 */
	@RequestMapping(value="/unauthor")
	public String unauthor(){
		return "/unauthor";
	}
	
	
	@RequestMapping(value="/user/index",method=RequestMethod.GET)
	public String userPage(User user,Model model){
		
		//ï¿½ï¿½Ò³
		PageHelper.startPage(1, 10);
		List<Role> list = roleSVC.queryRole(new Role());
		for (Role role : list) {
			System.out.println("---------------------"+role.getRolename()+"--------------------");
		}
		model.addAttribute("msg", user.getNickName());
		return "/success";
	}
	
	@RequestMapping(value="upload",method=RequestMethod.GET)
	public String upload1(){
		return "/index";
	}
	
	/**------------------------------------------------------------------------**/
	
	
}
