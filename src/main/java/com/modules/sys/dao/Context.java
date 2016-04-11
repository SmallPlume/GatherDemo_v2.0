package com.modules.sys.dao;

import javax.servlet.http.HttpServletRequest;

import com.modules.base.orm.User;

/**
 * 系统上下文
 * @author Acer
 */
public interface Context {
	
	/**
	 * <p>
	 * 注销 撤值
	 * </p>
	 * 
	 * @param request
	 * @return boolean
	 */
	boolean signOut(HttpServletRequest request);
	
	/**
	 * <p>
	 * 刷新会话
	 * </p>
	 * 
	 * @param request
	 */
	void refresh(HttpServletRequest request);

	/**
	 * <p>
	 * 获取会话用户
	 * </p>
	 * 
	 * @param request
	 * @return User
	 */
	User getUser(HttpServletRequest request);

	/**
	 * <p>
	 * 获取当前线程中的用户
	 * </p>
	 * 
	 * @return User
	 */
	User getCurrentUser();

	/**
	 * <p>
	 * 释放线程用户
	 * </p>
	 */
	void releaseCurrentUser();

	/**
	 * <p>
	 * 注册线程用户
	 * </p>
	 * 
	 * @param user
	 */
	void registCurrentUser(User user);

}
