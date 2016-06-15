package com.modules.base.svc.impl;

import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;

import org.springframework.stereotype.Service;

import com.modules.base.orm.Result;
import com.modules.base.svc.BaseSVC;
import com.modules.sys.util.NetStarDao;

@Service("baseSVC")
public class BaseSVCImpl<T> implements BaseSVC<T>{

	private NetStarDao<T> dao;
	
	private Class<T> clazz;
	
	@Override
	public Result saveBase(T t) {
		dao.insert(t);
		return Result.ok();
	}

	public BaseSVCImpl(){
		  Class clazzTmp = this.getClass();
		  Type  type = clazzTmp.getGenericSuperclass();
		   if(type instanceof ParameterizedType  ){
			   ParameterizedType parameterizedType = (ParameterizedType)type;
			    clazz = (Class<T>) parameterizedType.getActualTypeArguments()[0];
		   }
		}
		
	public BaseSVCImpl(Class<T> clazz) {
		this.clazz = clazz;
	}

	public void setDao(NetStarDao<T> dao) {
		this.dao = dao;
	}

}
