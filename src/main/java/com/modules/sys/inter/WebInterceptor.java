package com.modules.sys.inter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.modules.base.orm.User;
import com.modules.sys.dao.Context;

public class WebInterceptor extends HandlerInterceptorAdapter {

	@Autowired
	private Context context;
	
	public Context getContext() {
		return context;
	}

	public void setContext(Context context) {
		this.context = context;
	}

	/**
	 * 获取登录用户
	 * @param request
	 * @return
	 */
	protected User getUser(HttpServletRequest request) {
		//context.refresh(request);
		return context.getUser(request);
	}
	
	@Override
	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler) throws Exception {
		User user = getUser(request);
		if (user != null) {
			context.registCurrentUser(user);
		}
		return super.preHandle(request, response, handler);
	}

	@Override
	public void postHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		// TODO Auto-generated method stub
		super.postHandle(request, response, handler, modelAndView);
	}

	@Override
	public void afterCompletion(HttpServletRequest request,
			HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		context.releaseCurrentUser();
		super.afterCompletion(request, response, handler, ex);
	}

	@Override
	public void afterConcurrentHandlingStarted(HttpServletRequest request,
			HttpServletResponse response, Object handler) throws Exception {
		// TODO Auto-generated method stub
		super.afterConcurrentHandlingStarted(request, response, handler);
	}

}
