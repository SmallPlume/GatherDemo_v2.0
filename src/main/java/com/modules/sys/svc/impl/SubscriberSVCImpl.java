package com.modules.sys.svc.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import net.sf.json.JSONArray;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tk.mybatis.mapper.entity.Example;

import com.modules.base.orm.Result;
import com.modules.base.orm.User;
import com.modules.sys.dao.SubscriberDao;
import com.modules.sys.orm.Subscriber;
import com.modules.sys.svc.SubscriberSVC;
import com.modules.sys.util.PasswordHelper;
import com.util.ReflectUtils;

@Service("subscriberSVC")
public class SubscriberSVCImpl implements SubscriberSVC{
	
	@Autowired
	private SubscriberDao subDao;
	
	@Autowired
	private HttpServletRequest request;
	
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
		}
		return null;
	}
	
	/**
	 * 保存用户信息
	 * @param sub
	 * @return 
	 */
	@Override
	public Result saveUser(Subscriber sub){
		PasswordHelper passwordHelper = new PasswordHelper();
		try{
			sub.setAge(sub.getAge()==""?"0":sub.getAge());
			sub.setId(UUID.randomUUID().toString());
			sub.setPassword("12345");  //一开始时密码
			passwordHelper.encryptPassword(sub);
			sub.setIfactivate("0");  //默认激活
			sub.setIfspeak("0");  //默认可以开言
			subDao.insertSelective(sub);
			return Result.ok();
		}catch(Exception e){
			e.printStackTrace();
		}
		return Result.error("系统新增时报错！");
	}
	
	/**
	 * 
	 * @param sub
	 * @return
	 */
	@Override
	public Result editUser(Subscriber sub){
		if(sub != null){
			Subscriber o_sub = subDao.selectByPrimaryKey(sub.getId());
			ReflectUtils.copy(o_sub, sub, true);
			Example example = new Example(Subscriber.class);
			example.createCriteria().andEqualTo("id",o_sub.getId());
			subDao.updateByExample(o_sub, example);
			return Result.ok();
		}
		return Result.error("更新失败！");
	}
	
	/**
	 * 根据id查询
	 * @param id
	 * @return
	 */
	@Override
	public Subscriber findOne(String id){
		if(id != null || !"".equals(id)){
			Subscriber sub = subDao.findOne(id);
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
	public List<Subscriber> queryUser(Subscriber sub){
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
	public List<Subscriber> queryUserByXml(Subscriber sub){
		Map map = new HashMap();
		if(sub!=null){
			if(!"".equals(sub.getUsername())){
				map.put("username",sub.getUsername());
			}
			if(!"".equals(sub.getRoleid())){
				map.put("roleid",sub.getRoleid());
			}
		}
		List<Subscriber> subList = subDao.queryList(map);
		return subList;
	}
	
	/**
	 * 根据id删除
	 * @param id
	 */
	@Override
	public void deltUser(String id){
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

	@Override
	public Result editUserRole(String id,String roleid) {
		if(id!=null){
			Subscriber sub = subDao.selectByPrimaryKey(id);
			if(sub!=null){
				sub.setRoleid(roleid);
				Example example = new Example(Subscriber.class);
				example.createCriteria().andEqualTo("id", id);
				subDao.updateByExample(sub, example);
				return Result.ok();
			}
		}
		return Result.error("分配角色失败！");
	}

	@Override
	public Result savePass(String userids) {
		PasswordHelper passwordHelper = new PasswordHelper();
		if(userids != null){
			JSONArray ids = JSONArray.fromObject(userids);
			for (int i=0;i<ids.size();i++) {
				Subscriber sub = subDao.selectByPrimaryKey(ids.get(i));
				if(sub != null){
					sub.setPassword("12345");  //初始化密码
					passwordHelper.encryptPassword(sub);
					Example example = new Example(Subscriber.class);
					example.createCriteria().andEqualTo("id",ids.get(i));
					subDao.updateByExample(sub, example);
				}
			}
			return Result.ok();
		}
		return Result.error("初始化密码失败！");
	}

	
	@Override
	public Result deltUsers(String ids,User user) {
		List<String> ListIds = new ArrayList<String>();
		try{
			if(ids != null){
				JSONArray userids = JSONArray.fromObject(ids);
				for(int i=0; i<userids.size(); i++){
					//不能删除自己的
					if(!user.getId().equals(userids.get(i).toString())){
						ListIds.add(userids.get(i).toString());
					}
				}
			}
			//当只选自己删除时，不能删除
			if(ListIds.size()>0){
				subDao.deleteUser(ListIds);
			}else{
				return Result.error("操作错误或者不能删除自己！");
			}
			return Result.ok();
		}catch(Exception e){
			e.printStackTrace();
		}
		return Result.error("删除失败！");
	}

	@Override
	public void login(User user) {
		//用户没有登录
		if(user==null){
			return;
		}
	}

	@Override
	public void logout() {
		Subject subject=SecurityUtils.getSubject();
		subject.logout();
	}

	@Override
	public Boolean getUserByRoleId(String rid) {
		if(rid != null || !"".equals(rid)){
			Example example = new Example(Subscriber.class);
			example.createCriteria().andEqualTo("roleid", rid);
			int i = subDao.selectCountByExample(example);
			if(i<=0){
				return true;
			}
		}
		return false;
	}

}
