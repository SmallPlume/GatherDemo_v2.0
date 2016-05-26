package com.modules.sys.svc;

import com.modules.base.orm.Result;

import net.sf.json.JSONArray;

public interface PermissionSVC {

	public JSONArray queryPermit(String username,String menu);
	
	/**
	 * 根据角色id获取权限
	 * @param id
	 * @return
	 */
	public JSONArray queryByRoleId(String id);
	
	/**
	 * 保存权限
	 * @param roleid
	 * @param permitids
	 * @return
	 */
	public Result savePermit(String roleid,String permitids);
	
}
