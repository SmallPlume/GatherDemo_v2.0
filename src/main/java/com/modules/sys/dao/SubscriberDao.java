package com.modules.sys.dao;

import java.util.List;
import java.util.Map;
import java.util.Set;

import com.modules.sys.orm.Subscriber;
import com.modules.sys.util.NetStarDao;

public interface SubscriberDao extends NetStarDao<Subscriber>{
	
	/** 
	 * 根据帐号查询 
	 */
	public Subscriber getByUserName(String userName);
	
	/** 
	 * 根据帐号查询角色 
	 **/
	public Set<String> getRoles(String userName);
	
	/**
	 * 根据帐号查询权限
	 **/
	public Set<String> getPermissions(String userName);
	
	/**
	 * 保存用户信息
	 * @param sub
	 */
	public void save(Subscriber sub);
	
	/**
	 * 更新用户信息
	 * @param sub
	 */
	/*public void update(Subscriber sub);*/
	
	/**
	 * 删除用户信息
	 * @param id
	 */
	public void delete(String id);
	
	/**
	 * 根据id查找用户信息
	 * @return
	 */
	public Subscriber findOne(String id);
	
	/**
	 * 列出用户信息
	 * @return
	 */
	public List<Subscriber> queryList(Map<String,String> map);
	
	/**
	 * 用户状态
	 * @param map
	 */
	public void editActivity(Map<String,String> map);
	
	/**
	 * 批量删除
	 * @param ids
	 */
	public void deleteUser(List<String> ids);
}
