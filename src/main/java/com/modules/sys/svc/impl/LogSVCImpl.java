package com.modules.sys.svc.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONArray;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.modules.base.orm.Result;
import com.modules.sys.dao.LogDao;
import com.modules.sys.orm.Log;
import com.modules.sys.svc.LogSVC;

@Service("logSVC")
public class LogSVCImpl implements LogSVC {

	@Autowired
	private LogDao dao;
	
	@Override
	public void saveLog(Log log) {
		dao.saveLog(log);
	}

	@Override
	public Result deltLog(String ids) {
		try{
			List<String> list = new ArrayList<String>();
			JSONArray logIds = JSONArray.fromObject(ids);
			for(int i=0; i<logIds.size(); i++){
				list.add(logIds.get(i).toString());
			}
			dao.deltLog(logIds);
			return Result.ok();
		}catch(Exception e){
			e.printStackTrace();
		}
		return Result.error("É¾³ýÊ§°Ü£¡");
	}

	@Override
	public List<Log> queryLog(Log log) {
		@SuppressWarnings("rawtypes")
		Map map = new HashMap();
		map.put("username", log.getUsername()==""?null:log.getUsername());
		map.put("beginDate", log.getBeginDate());
		map.put("endDate", log.getEndDate());
		map.put("method", log.getMethod()==""?null:log.getMethod());
		List<Log> list = dao.queryLog(map);
		return list;
	}

}
