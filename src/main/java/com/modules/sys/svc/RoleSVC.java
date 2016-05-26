package com.modules.sys.svc;

import java.util.List;

import com.modules.sys.orm.Role;

public interface RoleSVC{

	public Role select(Role role);
	
	public List<Role> queryRole(Role role);
	
	public List<Role> queryRoles();
	
	public void saveRole(Role role);
	
	public void editRole(Role role);
	
}
