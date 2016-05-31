package com.modules.base.orm;

import java.util.Date;

public class User {
	
	/**用户id**/
	private String id;
	
	/** sessionID**/
	private String session;
	
	/**用户帐号**/
	private String name;
	
	/**昵称**/
	private String nickName;
	
	/**性别（0：男；1：女；2：未知）**/
	private int sex;
	
	/**邮箱**/
	private String email;
	
	/**手机号码**/
	private String phoneNum;
	
	/**头像图片**/
	private String icon;
	
	/**是否禁止fatie**/
	private String ifSpeak;
	
	/**最后登录时间**/
	private Date lastLoginTime;
	
	/** 登录域名 **/
	private String loginorg;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getSession() {
		return session;
	}

	public void setSession(String session) {
		this.session = session;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	public int getSex() {
		return sex;
	}

	public void setSex(int sex) {
		this.sex = sex;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhoneNum() {
		return phoneNum;
	}

	public void setPhoneNum(String phoneNum) {
		this.phoneNum = phoneNum;
	}

	public String getIcon() {
		return icon;
	}

	public void setIcon(String icon) {
		this.icon = icon;
	}

	public String getIfSpeak() {
		return ifSpeak;
	}

	public void setIfSpeak(String ifSpeak) {
		this.ifSpeak = ifSpeak;
	}

	public Date getLastLoginTime() {
		return lastLoginTime;
	}

	public void setLastLoginTime(Date lastLoginTime) {
		this.lastLoginTime = lastLoginTime;
	}

	public String getLoginorg() {
		return loginorg;
	}

	public void setLoginorg(String loginorg) {
		this.loginorg = loginorg;
	}
	
}
