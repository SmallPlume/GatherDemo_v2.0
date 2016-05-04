package com.modules.sys.svc;

import java.util.List;

import com.modules.sys.orm.Role;

public interface RoleSVC{

	public Role select(Role role);
	
	public List<Role> queryList(Role role);
	
	public void save(Role role);
	
	public void update(Role role);
	
}
