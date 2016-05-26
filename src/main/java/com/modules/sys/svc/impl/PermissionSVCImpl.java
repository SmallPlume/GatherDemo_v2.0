package com.modules.sys.svc.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tk.mybatis.mapper.entity.Example;

import com.modules.base.orm.Result;
import com.modules.sys.dao.PermissionDao;
import com.modules.sys.orm.Permission;
import com.modules.sys.svc.PermissionSVC;

@Service("permissionSVC")
public class PermissionSVCImpl implements PermissionSVC {
	
	@Autowired
	private PermissionDao dao;
	
	/**
	 * 获取全部菜单
	 * @return
	 */
	@Override
	public JSONArray queryPermit(String username,String menu){
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

	@Override
	public JSONArray queryByRoleId(String id) {
		Example example = new Example(Permission.class);
		example.createCriteria().andEqualTo("roleid", id);
		List<Permission> permit = dao.selectByExample(example);
		if(permit.size()>0){
			JSONArray jsonArray = new JSONArray();
			for (Permission permission : permit) {
				jsonArray.add(permission.getModuleid());
			}
			return jsonArray;
		}
		return null;
	}

	@Override
	public Result savePermit(String roleid, String permitids) {
		if(roleid != null && !"".equals(roleid)){
			try{
				//新增权限时，先删除旧权限
				Example example = new Example(Permission.class);
				example.createCriteria().andEqualTo("roleid", roleid);
				dao.deleteByExample(example);
				if(!"".equals(permitids.trim().toString())){
					String[] moduleids = permitids.trim().toString().split(",",-1);
					List<Permission> list = new ArrayList<Permission>();
					if(moduleids.length>0){
						for (String moduleid : moduleids) {
							Permission p = new Permission();
							p.setId(UUID.randomUUID().toString());
							p.setRoleid(roleid);
							p.setModuleid(moduleid);
							list.add(p);
						}
						dao.savePermit(list);
					}
				}
				return Result.ok();
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		return Result.error("添加权限错误");
	}

}
