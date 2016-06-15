package com.modules.web.svc;

import java.util.List;
import java.util.Map;

import com.modules.base.orm.Result;
import com.modules.web.orm.Context;

public interface ContextSVC {

	/**
	 * 保存
	 * @param cont
	 * @return
	 */
	public Result save(Context cont);
	
	/**
	 * 更新
	 * @param cont
	 * @return
	 */
	public Result edit(Context cont);
	
	/**
	 * 查找
	 * @param id
	 * @return
	 */
	public Context findOne(String id);
	
	/**
	 * 列表
	 * @param map
	 * @return
	 */
	public List<Context> queryList();
}
