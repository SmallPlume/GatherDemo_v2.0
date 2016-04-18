package com.modules.sys.svc;

import java.util.List;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.modules.sys.dao.PermissionDao;
import com.modules.sys.orm.Permission;

@Service("permissionSVC")
public class PermissionSVC {
	
	@Autowired
	private PermissionDao dao;
	
	/**
	 * 获取全部菜单
	 * @return
	 */
	public JSONArray queryList(String username,String menu){
		List<Permission> list = dao.getMenu(username, menu);
		JSONArray json = new JSONArray();
		for (Permission module : list) {
			JSONObject jo = new JSONObject();
			jo.put("id", module.getId());
            jo.put("pId", module.getPid());
            jo.put("name", module.getPermitname());
            jo.put("icon", module.getIcon());
            if(module.getUrl()!=null){
            	jo.put("file",module.getUrl());
			}
			if("1".equals(module.getIfopen())){
				jo.put("open", "true");
			}
			json.add(jo);
		}
		return json;
	}

}
