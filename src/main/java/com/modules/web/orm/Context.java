package com.modules.web.orm;

import javax.persistence.Table;
import javax.persistence.Transient;

@Table(name="w_context")
public class Context extends BasePojo {

	//标题
	private String title;
	
	//正文
	private String context;
	
	//标签
	private String tag;
	
	//组id
	private String groupid;
	
	//是否可以评论
	private String ifspeak;
	
	//组名
	@Transient
	private String groupname;
	
	@Transient
	private String username;

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContext() {
		return context;
	}

	public void setContext(String context) {
		this.context = context;
	}

	public String getTag() {
		return tag;
	}

	public void setTag(String tag) {
		this.tag = tag;
	}

	public String getGroupid() {
		return groupid;
	}

	public void setGroupid(String groupid) {
		this.groupid = groupid;
	}

	public String getIfspeak() {
		return ifspeak;
	}

	public void setIfspeak(String ifspeak) {
		this.ifspeak = ifspeak;
	}

	public String getGroupname() {
		return groupname;
	}

	public void setGroupname(String groupname) {
		this.groupname = groupname;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}
	
}
