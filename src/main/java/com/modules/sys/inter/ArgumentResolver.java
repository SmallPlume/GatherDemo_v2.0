package com.modules.sys.inter;

import org.springframework.core.MethodParameter;
import org.springframework.web.bind.support.WebArgumentResolver;
import org.springframework.web.context.request.NativeWebRequest;

import com.modules.base.orm.User;
import com.modules.sys.svc.SessionContext;

public class ArgumentResolver implements WebArgumentResolver {
	
	public final static String SESSION_KEY = "SESSION_USER";
	
	private SessionContext context;
	
	public SessionContext getContext() {
		return context;
	}

	public void setContext(SessionContext context) {
		this.context = context;
	}

	/**
	 * 获取登录用户
	 * @param request
	 * @return
	 */
	protected User getUser() {
		//context.refresh(request);
		return context.getUser();
	}

	@Override
	public Object resolveArgument(MethodParameter methodParameter,
			NativeWebRequest webRequest) throws Exception {
		//HttpServletRequest request = webRequest.getNativeRequest(HttpServletRequest.class);
		if(methodParameter.getParameterType().equals(User.class)){
			//通过线程用户获取用户信息
			User user = getUser();
			if(user!=null){
				return user;
			}
		}
		return WebArgumentResolver.UNRESOLVED;
	}

}
