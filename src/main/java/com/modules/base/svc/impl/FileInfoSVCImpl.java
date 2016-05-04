package com.modules.base.svc.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.modules.base.dao.FileInfoDao;
import com.modules.base.orm.FileInfo;
import com.modules.base.orm.Result;
import com.modules.base.svc.FileInfoSVC;

@Service("fileInfoSVC")
public class FileInfoSVCImpl implements FileInfoSVC{

	@Autowired
	private FileInfoDao dao;
	
	/**
	 * ±£´æ
	 * @param files
	 * @return
	 */
	@Override
	public Result save(FileInfo file){
		try{
			if(file != null){
				dao.insertFile(file);
				//dao.insertFile(file);
			}
			return Result.ok();
		}catch(Exception e){
			e.printStackTrace();
			return Result.error("ÉÏ´«´íÎó£¡");
		}
	}
	
	/**
	 * É¾³ý
	 * @param id
	 * @return
	 */
	@Override
	public Result delete(String id){
		if(id != null){
			dao.deleteByPrimaryKey(id);
			return Result.ok();
		}
		return Result.error("É¾³ýÊ§°Ü£¡");
	}
	
	/**
	 * ²éÑ¯
	 * @param id
	 * @return
	 */
	@Override
	public FileInfo queryById(String id){
		if(id != null){
			return dao.selectByPrimaryKey(id);
		}
		return null;
	}
	
	
}
