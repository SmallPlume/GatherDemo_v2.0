package com.modules.sys.dao;

import com.modules.sys.orm.Permission;
import com.modules.sys.util.NetStarDao;

public interface PermissionDao extends NetStarDao<Permission>{
	
	/**
	 * 保存权限信息
	 */
	public void save(Permission pers);

}
