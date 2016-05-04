package com.modules.sys.svc;

import net.sf.json.JSONArray;

public interface PermissionSVC {

	public JSONArray queryList(String username,String menu);
	
}
