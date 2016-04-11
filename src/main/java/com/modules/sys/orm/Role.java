package com.modules.sys.orm;

import java.io.Serializable;

import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Table(name="s_role")
public class Role implements Serializable {
	
	private static final long serialVersionUID = 1L;

	/** id **/
	@Id
	@GeneratedValue(generator = "UUID")
	private String id;
	
	/** 角色代号 **/
	private String roleno;
	
	/** 角色名称 **/
	private String rolename;
	
	/** 角色说明 **/
	private String roleremark;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getRoleno() {
		return roleno;
	}

	public void setRoleno(String roleno) {
		this.roleno = roleno;
	}

	public String getRolename() {
		return rolename;
	}

	public void setRolename(String rolename) {
		this.rolename = rolename;
	}

	public String getRoleremark() {
		return roleremark;
	}

	public void setRoleremark(String roleremark) {
		this.roleremark = roleremark;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

}
