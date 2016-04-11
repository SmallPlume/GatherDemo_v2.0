package com.modules.sys.ctrl;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.modules.base.orm.Page;
import com.modules.base.orm.Result;
import com.modules.base.orm.User;
import com.modules.sys.orm.Role;
import com.modules.sys.orm.Subscriber;
import com.modules.sys.svc.RoleSVC;
import com.modules.sys.svc.SubscriberSVC;

@Controller
@RequestMapping("/")
public class CoreCTRL {

	@Autowired
	private RoleSVC roleSVC;
	
	public final static String SESSION_KEY = "SESSION_USER";
	
	/**
	 * Ê×Ò³
	 * @return
	 */
	@RequestMapping(value="index",method=RequestMethod.GET)
	public String Index(Model model){
		Subject subject = SecurityUtils.getSubject();
		if(subject.isAuthenticated()==true){
			Subject currentUser = SecurityUtils.getSubject();
			Session session = currentUser.getSession();
			Subscriber sub = (Subscriber) session.getAttribute(SESSION_KEY);
			model.addAttribute("user", sub);
			return "/index";
		}
		return "/login";
	}
	
	/**
	 * µÇÂ½Ò³
	 * @return
	 */
	@RequestMapping(value="login",method=RequestMethod.GET)
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
	@RequestMapping(value="index",method=RequestMethod.POST)
	public @ResponseBody Boolean login(Subscriber sub) throws IOException{
		Subject subject=SecurityUtils.getSubject();
		
		UsernamePasswordToken token=new UsernamePasswordToken(sub.getUsername().trim().toString(),sub.getPassword().trim().toString());
		token.setRememberMe(true);
		try{
			subject.login(token);
			return true;
		}catch(Exception e){
			e.printStackTrace();
			return false;
		}
	}
	
	/**
	 * ÍË³öµÇÂ¼
	 * @return
	 */
	@RequestMapping(value="loginout",method=RequestMethod.GET)
	public String loginOut(){
		Subject subject=SecurityUtils.getSubject();
		subject.logout();
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
	
	
	@RequestMapping(value="user/index",method=RequestMethod.GET)
	public String userPage(User user,Model model){
		
		//ï¿½ï¿½Ò³
		PageHelper.startPage(1, 10);
		List<Role> list = roleSVC.queryList(new Role());
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
