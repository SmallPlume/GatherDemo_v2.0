package com.modules.sys.dao;

import java.util.List;

import com.modules.sys.orm.Module;
import com.modules.sys.util.NetStarDao;

public interface ModuleDao extends NetStarDao<Module> {
	
	/**
	 * 获取父节点
	 * @return
	 */
	public List<Module> getRoot();
	
	/**
	 * 根据父类id获取
	 * @param pid
	 * @return
	 */
	public List<Module> getByPid(String pid);
	
	
	
}
