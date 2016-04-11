package com.modules.sys.realm;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;

import com.modules.sys.orm.Subscriber;
import com.modules.sys.svc.SubscriberSVC;

public class MyRealm extends AuthorizingRealm{

	@Autowired
	private SubscriberSVC userSVC;
	
	public final static String SESSION_KEY = "SESSION_USER";
	
	@Override
	protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
		//获取帐号
		String userName = (String)principals.getPrimaryPrincipal();
		SimpleAuthorizationInfo authorizationInfo = new SimpleAuthorizationInfo();
		//获取帐号角色
		authorizationInfo.setRoles(userSVC.getRoles(userName));
		//获取帐号权限
		authorizationInfo.setStringPermissions(userSVC.getPermissions(userName));
		return authorizationInfo;
	}

	@Override
	protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {
		String userName = (String)token.getPrincipal();
		System.out.println("--------------------------"+userName+"-------------------------");
		Subscriber sub = userSVC.getUserByName(userName);
		AuthenticationInfo authcInfo = new SimpleAuthenticationInfo(sub.getUsername(),sub.getPassword(),getName());
		
		//shiro的session
		Subject currentUser = SecurityUtils.getSubject();
		Session session = currentUser.getSession();
		session.setAttribute(SESSION_KEY, sub);
		
		return authcInfo;
	}

}
