package com.modules.web.dao;

import java.util.List;

import com.modules.sys.util.NetStarDao;
import com.modules.web.orm.Context;

public interface ContextDao extends NetStarDao<Context>{

	/**
	 * 获取博客列表
	 * @param map
	 * @return
	 */
	public List<Context> queryList();
}
