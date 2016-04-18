package com.modules.sys.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.modules.sys.orm.Permission;
import com.modules.sys.util.NetStarDao;

public interface PermissionDao extends NetStarDao<Permission>{
	
	/**
	 * 保存权限信息
	 */
	public void save(Permission pers);

	/**
	 * 获取目录
	 * @return
	 */
	public List<Permission> getMenu(@Param(value="username")String username,@Param(value="menu") String menu);
	
	/**
	 * 根据moduleid删除信息
	 * @param moduleid
	 */
	public void delByModuleid(@Param(value="moduleid")String moduleid);
}
