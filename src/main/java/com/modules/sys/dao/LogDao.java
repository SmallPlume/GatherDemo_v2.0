package com.modules.sys.dao;

import java.util.List;

import com.modules.sys.orm.Log;
import com.modules.sys.util.NetStarDao;

public interface LogDao extends NetStarDao<Log> {

	/**
	 * ÐÂÔö
	 * @param log
	 */
	public void saveLog(Log log);
	
	/**
	 * É¾³ý
	 * @param ids
	 */
	public void deltLog(List<String> ids);
	
	/**
	 * ²éÕÒ
	 * @param map
	 * @return
	 */
	public List<Log> queryLog(Log log);
}
