package com.modules.sys.svc;

import java.util.List;

import com.modules.base.orm.Result;
import com.modules.sys.orm.Log;

public interface LogSVC {

	/**
	 * 保存日志
	 * @param log
	 */
	public void saveLog(Log log);
	
	/**
	 * 删除日志
	 * @param ids
	 */
	public Result deltLog(String ids);
	
	/**
	 * 查询列表
	 * @param map
	 * @return
	 * @throws Exception 
	 */
	public List<Log> queryLog(Log log);
	
	/**
	 * 查看
	 * @param id
	 * @return
	 */
	public Log findOne(String id);
	
}
