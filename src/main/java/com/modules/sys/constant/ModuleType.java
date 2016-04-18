package com.modules.sys.constant;

/**
 * 菜单、目录类型
 * @author Acer
 *
 */
public enum ModuleType {
	
	dir("0","目录"),menu("1","菜单");

	public String type;
	public String name;
	
	ModuleType(String type,String name){
		this.type = type;
		this.name = name;
	}
}
