package com.modules.sys.svc;

import java.util.List;

import com.modules.base.orm.Result;
import com.modules.sys.orm.Role;

public interface RoleSVC{

	public Role select(Role role);
	
	public List<Role> queryRole(Role role);
	
	public List<Role> queryRoles();
	
	public Result saveRole(Role role);
	
	public Result editRole(Role role);
	
	public Role findOne(String id);
	
	public Result deltRole(String id);
	
}
