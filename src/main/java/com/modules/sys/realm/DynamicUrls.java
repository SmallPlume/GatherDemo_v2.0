package com.modules.sys.realm;

import org.apache.shiro.config.Ini;
import org.apache.shiro.config.Ini.Section;
import org.springframework.beans.factory.FactoryBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.modules.sys.svc.ModuleSVC;

@Component
public class DynamicUrls implements FactoryBean<Ini.Section> {

	@Autowired
	private ModuleSVC moduleSVC;
	
	//shiro默认的链接定义
	private String filterChainDefinitions;
	
	public void setFilterChainDefinitions(String filterChainDefinitions) {
		this.filterChainDefinitions = filterChainDefinitions;
	}

	@Override
	public Section getObject() throws Exception {
		Ini ini = new Ini();
		ini.load(filterChainDefinitions);
		
		Ini.Section section = ini.getSection(Ini.DEFAULT_SECTION_NAME);
		
		/**
		/sys/**=anyRoles[admin,employee]
		/user/**=roles[admin]
		/user=perms["user:view"] 
		**/
		
		section.put("/**", "authc");
		section.put("/sys/**", "anyRoles[admin,employee]");
		section.put("/user/**", "roles[employee]");
		section.put("/user", "perms['user:view']");
		
		return section;
	}

	@Override
	public Class<?> getObjectType() {
		// TODO Auto-generated method stub
		return Section.class;
	}

	@Override
	public boolean isSingleton() {
		// TODO Auto-generated method stub
		return false;
	}

}
