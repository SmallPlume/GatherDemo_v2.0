package com.modules.sys.svc.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tk.mybatis.mapper.entity.Example;

import com.modules.base.orm.Result;
import com.modules.sys.dao.SubscriberDao;
import com.modules.sys.orm.Subscriber;
import com.modules.sys.svc.SubscriberSVC;
import com.modules.sys.util.PasswordHelper;

@Service("subscriberSVC")
public class SubscriberSVCImpl implements SubscriberSVC{
	
	@Autowired
	private SubscriberDao subDao;
	
	/**
	 * 根据用户名称查询
	 * @param userName
	 * @return
	 */
	@Override
	public Subscriber getUserByName(String userName){
		if(userName != null){
			Subscriber sub =  subDao.getByUserName(userName);
			if(sub!=null){
				return sub;
			}
			return null;
		}
		return null;
	}
	
	/**
	 * 根据用户名查询角色
	 * @param userName
	 * @return
	 */
	@Override
	public Set<String> getRoles(String userName){
		if(userName != null){
			Set<String> roles =  subDao.getRoles(userName);
			if(roles.size()>0){
				return roles;
			}
			return null;
		}
		return null;
	}
	
	/**
	 * 根据用户帐号查询权限
	 * @param userName
	 * @return
	 */
	@Override
	public Set<String> getPermissions(String userName){
		if(userName != null){
			Set<String> permissions = subDao.getPermissions(userName);
			if(permissions.size()>0){
				return permissions;
			}
			return null;
		}
		return null;
	}
	
	/**
	 * 保存用户信息
	 * @param sub
	 * @return 
	 */
	@Override
	public Result save(Subscriber sub){
		PasswordHelper passwordHelper = new PasswordHelper();
		if(sub != null){
			sub.setPassword("12345");  //一开始时密码
			passwordHelper.encryptPassword(sub);
			subDao.insert(sub);
			
			/*Subscriber sub2 = new Subscriber();
			sub2.setId(null);
			subDao.insert(sub2);*/
			
			return Result.ok();
		}
		return Result.error("系统新增时报错！");
	}
	
	/**
	 * 根据id查询
	 * @param id
	 * @return
	 */
	@Override
	public Subscriber findOne(String id){
		if(id != null || !"".equals(id)){
			Subscriber sub = subDao.selectByPrimaryKey(id);
			return sub;
		}
		return null;
	}
	
	/**
	 * 根据id查询
	 * @param id
	 * @return
	 */
	@Override
	public List<Subscriber> queryList(Subscriber sub){
		if(sub != null){
			Example example = new Example(Subscriber.class);
			/*if(sub == null){
				example.createCriteria()
				.andEqualTo("roleid",sub.getRoleid())  //id
				.andEqualTo("sex",sub.getSex())  //性别
				.andEqualTo("ifactivate",sub.getIfactivate())  //是否激活
				.andEqualTo("lastlogintime",sub.getLastlogintime());
			}*/
			List<Subscriber> subList = subDao.selectByExample(example);
			return subList;
		}
		return null;
	}
	
	/**
	 * 根据id查询
	 * @param id
	 * @return
	 */
	@Override
	public List<Subscriber> queryListByXml(Map<String,String> map){
		List<Subscriber> subList = subDao.queryList(map);
		return subList;
	}
	
	/**
	 * 根据id删除
	 * @param id
	 */
	@Override
	public void delete(String id){
		if(id != null || !"".equals(id)){
			subDao.delete(id);
		}
	}
	
	@Override
	public Result editActivity(String id,String ifactivate,String ifspeak){
		Map<String,String> map = new HashMap<String,String>();
		map.put("id", id);
		map.put("ifactivate", ifactivate);
		map.put("ifspeak", ifspeak);
		try{ 
			subDao.editActivity(map);
			return Result.ok();
		}catch(Exception e){
			e.printStackTrace();
			return Result.error("操作错误！");
		}
	}

}
