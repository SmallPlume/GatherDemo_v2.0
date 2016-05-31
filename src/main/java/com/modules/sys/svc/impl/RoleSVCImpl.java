package com.modules.sys.svc.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tk.mybatis.mapper.entity.Example;
import tk.mybatis.mapper.entity.Example.Criteria;

import com.modules.base.orm.Result;
import com.modules.sys.dao.RoleDao;
import com.modules.sys.orm.Role;
import com.modules.sys.svc.RoleSVC;
import com.util.ReflectUtils;

@Service("roleSVC")
public class RoleSVCImpl implements RoleSVC{
	
	@Autowired
	private RoleDao dao;
	
	/**
	 * 根据条件查询
	 * @param role
	 * @return
	 */
	@Override
	public Role select(Role role){
		//查询条件
		Example example = new Example(Role.class);
		example.createCriteria()
			.andEqualTo("id",role.getId())  //id
			.andEqualTo("rolename",role.getRolename());  //角色名称
		dao.selectByExample(example);
		return null;
	}
	
	/**
	 * 查询全部
	 * @param role
	 * @return
	 */
	@Override
	public List<Role> queryRole(Role role){
		Example example = new Example(Role.class);
		Criteria criteria = example.createCriteria();
		if(!"".equals(role.getRoleno())){
			criteria.andEqualTo("roleno",role.getRoleno());
		}
		if(!"".equals(role.getRolename())){
			criteria.andLike("rolename", role.getRolename());
		}
		List<Role> list = dao.selectByExample(example);
		return list;
	}
	
	
	/**
	 * 保存角色
	 * @param role
	 */
	@Override
	public Result saveRole(Role role){
		if(role != null){
			try{
				dao.save(role);
				return Result.ok();
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		return Result.error("新增角色失败！");
	}
	
	/**
	 * 更新角色
	 * @param role
	 */
	@Override
	public Result editRole(Role role){
		if(role != null){
			Role o_role = dao.selectByPrimaryKey(role.getId());
			ReflectUtils.copy(o_role, role, true);
			Example example = new Example(Role.class);
			example.createCriteria().andEqualTo("id",role.getId());
			dao.updateByExample(o_role, example);
			return Result.ok();
		}
		return Result.error("修改角色失败！");
	}

	@Override
	public List<Role> queryRoles() {
		return dao.selectAll();
	}

	@Override
	public Role findOne(String id) {
		if(id != null || !"".equals(id)){
			return dao.selectByPrimaryKey(id);
		}
		return null;
	}

	@Override
	public Result deltRole(String id) {
		try{
			dao.deleteByPrimaryKey(id);
			return Result.ok();
		}catch(Exception e){
			e.printStackTrace();
		}
		return Result.error("删除失败！");
	}
	
}
