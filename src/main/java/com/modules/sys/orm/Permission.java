package com.modules.sys.orm;

import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

@Table(name = "s_permission")
public class Permission {
	
	/** ID **/
	@Id
	@GeneratedValue(generator = "UUID")
	private String id;
	
	/**对应的角色id**/
	private String roleid;
	
	/** 对应的菜单id **/
	private String moduleid;
	
	
	//------------一下字段与数据库无关-------------//
	/**权限代号**/
	@Transient
	private String permitno;
	
	/**权限名称**/
	@Transient
	private String permitname;
	
	/**父类id**/
	@Transient
	private String pid;
	
	/**排序**/
	@Transient
	private Integer rank;
	
	/** url地址 **/
	@Transient
	private String url;
	
	/** 是否展开 **/
	@Transient
	private String ifopen;
	
	/** 一般的图标 **/
	@Transient
	private String icon;
	
	/** 是否目录('0':表示是,'1':表示否) **/
	@Transient
	private String dir;
	
	/** 是否菜单('0':表示是,'1':表示否) **/
	@Transient
	private String menu;
	
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPermitno() {
		return permitno;
	}

	public void setPermitno(String permitno) {
		this.permitno = permitno;
	}

	public String getPermitname() {
		return permitname;
	}

	public void setPermitname(String permitname) {
		this.permitname = permitname;
	}

	public String getPid() {
		return pid;
	}

	public void setPid(String pid) {
		this.pid = pid;
	}

	public String getRoleid() {
		return roleid;
	}

	public void setRoleid(String roleid) {
		this.roleid = roleid;
	}

	public Integer getRank() {
		return rank;
	}

	public void setRank(Integer rank) {
		this.rank = rank;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public String getIfopen() {
		return ifopen;
	}

	public void setIfopen(String ifopen) {
		this.ifopen = ifopen;
	}

	public String getIcon() {
		return icon;
	}

	public void setIcon(String icon) {
		this.icon = icon;
	}

	public String getModuleid() {
		return moduleid;
	}

	public void setModuleid(String moduleid) {
		this.moduleid = moduleid;
	}

	public String getDir() {
		return dir;
	}

	public void setDir(String dir) {
		this.dir = dir;
	}

	public String getMenu() {
		return menu;
	}

	public void setMenu(String menu) {
		this.menu = menu;
	}
	
}
