package com.modules.web.svc.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tk.mybatis.mapper.entity.Example;

import com.modules.base.orm.Result;
import com.modules.web.dao.ContextDao;
import com.modules.web.orm.Context;
import com.modules.web.svc.ContextSVC;
import com.util.ReflectUtils;

@Service("contextSVC")
public class ContextSVCImpl implements ContextSVC {

	@Autowired
	private ContextDao dao;
	
	@Override
	public Result save(Context cont) {
		try{
			dao.insert(cont);
			return Result.ok();
		}catch(Exception e){
			e.printStackTrace();
		}
		return Result.error("ÐÂÔöÊ§°Ü£¡");
	}

	@Override
	public Result edit(Context cont) {
		try{
			Context o_cont = dao.selectByPrimaryKey(cont.getId());
			ReflectUtils.copy(o_cont, cont, true);
			Example example = new Example(Context.class);
			example.createCriteria().andEqualTo("id",o_cont.getId());
			dao.updateByExampleSelective(o_cont, example);
			return Result.ok();
		}catch(Exception e){
			e.printStackTrace();
		}
		return Result.error("ÐÞ¸ÄÊ§°Ü£¡");
	}

	@Override
	public Context findOne(String id) {
		if(id!=null || !"".equals(id)){
			return dao.selectByPrimaryKey(id);
		}
		return null;
	}

	@Override
	public List<Context> queryList() {
		return dao.queryList();
	}

}
