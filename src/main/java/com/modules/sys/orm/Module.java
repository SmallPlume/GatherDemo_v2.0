package com.modules.sys.orm;

import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * 菜单目录树形
 * @author Acer
 *
 */
@Table(name="s_module")
public class Module {
	
	/** ID **/
	@Id
	@GeneratedValue(generator = "UUID")
	private String id;
	
	/** 上级ID **/
	private String pid;
	
	/** 名称 **/
	private String name;
	
	/** url **/
	private String url;
	
	/** 是否展开 **/
	private String ifopen;
	
	/** 一般的图标 **/
	private String icon;
	
	/** 是否目录('0':表示否,'1':表示是) **/
	private String dir;
	
	/** 是否菜单('0':表示否,'1':表示是) **/
	private String menu;
	
	/** 是否公开 **/
	private Integer valid;
	
	/** 排序 **/
	private Integer rank;
	
	/** 权限no **/
	private String permitno;
	
	/** 权限注解 **/
	private String permitmark;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPid() {
		return pid;
	}

	public void setPid(String pid) {
		this.pid = pid;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
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
	
	public String getDir() {
		return dir;
	}

	public void setDir(String dir) {
		this.dir = dir;
	}

	public void setValid(Integer valid) {
		this.valid = valid;
	}

	public String getMenu() {
		return menu;
	}

	public void setMenu(String menu) {
		this.menu = menu;
	}

	public Integer getRank() {
		return rank;
	}

	public void setRank(Integer rank) {
		this.rank = rank;
	}

	public String getPermitno() {
		return permitno;
	}

	public void setPermitno(String permitno) {
		this.permitno = permitno;
	}

	public String getPermitmark() {
		return permitmark;
	}

	public void setPermitmark(String permitmark) {
		this.permitmark = permitmark;
	}

	public Integer getValid() {
		return valid;
	}
	
}
