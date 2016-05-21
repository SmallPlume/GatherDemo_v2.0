package com.modules.sys.orm;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

/**
 * 系统用户
 * @author Acer
 *
 */
@Table(name="s_user")
public class Subscriber implements Serializable {
	
	private static final long serialVersionUID = 1L;

	/** 用户id **/
	@Id
	@GeneratedValue(generator = "UUID")
	private String id;
	
	/** 帐号名称 **/
	private String username;
	
	/** 密码 **/
	private String password;
	
	/** 盐 **/
	private String salt;
	
	/** 昵称 **/
	private String nickname;
	
	/** 性别（0：男；1：女；2：未知）**/
	private int sex;
	
	/** 年龄 **/
	private String age;
	
	/** 邮箱 **/
	private String email;
	
	/** 手机 **/
	private String phonenum;
	
	/** 对应的角色 **/
	private String roleid;
	
	/** 头像图片 **/
	private String icon;
	
	/** 是否激活 **/
	private String ifactivate;
	
	/** 是否禁止发帖 **/
	private String ifspeak;
	
	/** 最后登录时间 **/
	private Date lastlogintime;
	
	/** 登录设备 **/
	private String logindevice;
	
	/** 登录域名 **/
	private String loginorg;
	
	/**=========与数据库无关=========**/
	
	/** 登录是否保存cookie **/
	@Transient
	private String cookie;
	
	/** 角色名称 **/
	@Transient
	private String roleName;
	
	/** 是否在线 **/
	@Transient
	private String activity;
	
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public int getSex() {
		return sex;
	}

	public void setSex(int sex) {
		this.sex = sex;
	}

	public String getAge() {
		return age;
	}

	public void setAge(String age) {
		this.age = age;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getIcon() {
		return icon;
	}

	public void setIcon(String icon) {
		this.icon = icon;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getPhonenum() {
		return phonenum;
	}

	public void setPhonenum(String phonenum) {
		this.phonenum = phonenum;
	}

	public String getRoleid() {
		return roleid;
	}

	public void setRoleid(String roleid) {
		this.roleid = roleid;
	}

	public String getIfactivate() {
		return ifactivate;
	}

	public void setIfactivate(String ifactivate) {
		this.ifactivate = ifactivate;
	}

	public String getIfspeak() {
		return ifspeak;
	}

	public void setIfspeak(String ifspeak) {
		this.ifspeak = ifspeak;
	}

	public Date getLastlogintime() {
		return lastlogintime;
	}

	public void setLastlogintime(Date lastlogintime) {
		this.lastlogintime = lastlogintime;
	}

	public String getLogindevice() {
		return logindevice;
	}

	public void setLogindevice(String logindevice) {
		this.logindevice = logindevice;
	}

	public String getLoginorg() {
		return loginorg;
	}

	public void setLoginorg(String loginorg) {
		this.loginorg = loginorg;
	}
	
	public String getRoleName() {
		return roleName;
	}

	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}
	
	public String getCookie() {
		return cookie;
	}

	public void setCookie(String cookie) {
		this.cookie = cookie;
	}
	
	public String getSalt() {
		return salt;
	}
	
	public String getCredentialsSalt() {
        return username + salt;
    }

	public void setSalt(String salt) {
		this.salt = salt;
	}

	public String getActivity() {
		return activity;
	}

	public void setActivity(String activity) {
		this.activity = activity;
	}

	public Subscriber(String id, String username, String password, String salt,
			String nickname, int sex, String age, String email,
			String phonenum, String roleid, String icon, String ifactivate,
			String ifspeak, Date lastlogintime, String logindevice,
			String loginorg, String cookie, String roleName) {
		super();
		this.id = id;
		this.username = username;
		this.password = password;
		this.salt = salt;
		this.nickname = nickname;
		this.sex = sex;
		this.age = age;
		this.email = email;
		this.phonenum = phonenum;
		this.roleid = roleid;
		this.icon = icon;
		this.ifactivate = ifactivate;
		this.ifspeak = ifspeak;
		this.lastlogintime = lastlogintime;
		this.logindevice = logindevice;
		this.loginorg = loginorg;
		this.cookie = cookie;
		this.roleName = roleName;
	}

	public Subscriber() {
		
	}
	
}
