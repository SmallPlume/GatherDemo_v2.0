package com.modules.sys.svc.impl;

import java.util.ArrayList;
import java.util.List;

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
			dao.deltLog(list);
			return Result.ok();
		}catch(Exception e){
			e.printStackTrace();
		}
		return Result.error("É¾³ýÊ§°Ü£¡");
	}

	@Override
	public List<Log> queryLog(Log log) {
		if("".equals(log.getUsername())){
			log.setUsername(null);
		}
		if("".equals(log.getMethod())){
			log.setMethod(null);
		}
		if("".equals(log.getBeginDate())){
			log.setBeginDate(null);
		}
		if("".equals(log.getEndDate())){
			log.setEndDate(null);
		}
		List<Log> list = dao.queryLog(log);
		return list;
	}

	@Override
	public Log findOne(String id) {
		if(id!=null || !"".equals(id)){
			Log log = dao.selectByPrimaryKey(id);
			if(log != null){
				return log;
			}
		}
		return null;
	}

}
