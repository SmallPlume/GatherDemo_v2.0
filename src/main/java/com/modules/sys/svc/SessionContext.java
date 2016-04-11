package com.modules.sys.svc;

import javax.servlet.http.HttpServletRequest;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;

import com.modules.base.orm.User;
import com.modules.sys.dao.Context;
import com.modules.sys.orm.Subscriber;

public class SessionContext implements Context {
	
	public final static String SESSION_KEY = "SESSION_USER";

	/** 线程用户 **/
	private static ThreadLocal<User> threadUser = new ThreadLocal<User>();
	
	/**
	 * 登出
	 */
	@Override
	public boolean signOut(HttpServletRequest request) {
		// TODO Auto-generated method stub
		return false;
	}

	/**
	 * 刷新用户
	 */
	@Override
	public void refresh(HttpServletRequest request) {
		// TODO Auto-generated method stub

	}
	
	@Override
	public User getUser(HttpServletRequest request) {
		Subject currentUser = SecurityUtils.getSubject();
		Session session = currentUser.getSession();
		Subscriber sub = (Subscriber) session.getAttribute(SESSION_KEY);
		if(sub != null){
			return (User) AutoFinesh(sub);
		}
		return null;
	}

	@Override
	public User getCurrentUser() {
		return threadUser.get();
	}

	@Override
	public void releaseCurrentUser() {
		threadUser.remove();
	}

	@Override
	public void registCurrentUser(User user) {
		if (user != null) {
			threadUser.set(user);
		}
	}
	
	public User AutoFinesh(Subscriber subscriber){
		User user = new User();
		user.setId(subscriber.getId());
		user.setName(subscriber.getUsername());
		user.setNickName(subscriber.getNickname());
		user.setIcon(subscriber.getIcon());
		user.setIfSpeak(subscriber.getIfspeak());
		user.setPhoneNum(subscriber.getPhonenum());
		user.setLastLoginTime(subscriber.getLastlogintime());
		user.setSex(subscriber.getSex());
		user.setEmail(subscriber.getEmail());
		return user;
	}

}
