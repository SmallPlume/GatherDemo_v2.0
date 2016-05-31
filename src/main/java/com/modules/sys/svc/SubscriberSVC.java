package com.modules.sys.svc;

import java.util.List;
import java.util.Map;
import java.util.Set;

import com.modules.base.orm.Result;
import com.modules.base.orm.User;
import com.modules.sys.orm.Subscriber;

public interface SubscriberSVC {
	
	/**
	 * 日志记录用户登录
	 * @param sub
	 * @return
	 */
	public void login(User user);
	
	public void logout();
	
	public Subscriber getUserByName(String userName);
	
	public Set<String> getRoles(String userName);
	
	public Set<String> getPermissions(String userName);
	
	public Result saveUser(Subscriber sub);
	
	public Result editUser(Subscriber sub);
	
	public Subscriber findOne(String id);
	
	public List<Subscriber> queryUser(Subscriber sub);
	
	public List<Subscriber> queryUserByXml(Subscriber sub);
	
	public void deltUser(String id);
	
	public Result editActivity(String id,String ifactivate,String ifspeak);
	
	/**
	 * 分配角色
	 * @param id
	 * @return
	 */
	public Result editUserRole(String id,String roleid);
	
	/**
	 * 重置密码
	 * @param userid
	 * @param pass
	 * @return
	 */
	public Result savePass(String userid);
	
	/**
	 * 删除用户
	 * @param ids
	 * @return
	 */
	public Result deltUsers(String ids,User user);
	
	/**
	 * 判断是否存在该角色的用户
	 * @param rid
	 * @return
	 */
	public Boolean getUserByRoleId(String rid);
	
}
