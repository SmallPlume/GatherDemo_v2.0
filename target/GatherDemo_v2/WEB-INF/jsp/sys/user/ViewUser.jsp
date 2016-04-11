<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@include file="../../../jsp/base/base.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>查看用户信息</title>
<style type="text/css">
#tab{
	border:1px red solid;
}
#tab tr td{
	border:1px red solid;
}
</style>
</head>
<body>
	<table id="tab">
		<tr>
			<th>帐号</th>
			<td>${user.username }</td>
			<%-- <th>密码</th>
			<td><shiro:hasRole name="admin">${user.password }</shiro:hasRole></td> --%>
			<th>昵称</th>
			<td>${user.nickname }</td>
			<td rowspan="3">
				<img alt="" src="" />
			</td>
		</tr>
		<tr>
			<th>性别</th>
			<td>${user.sex }</td>
			<th>年龄</th>
			<td>${user.age }</td>
		</tr>
		<tr>
			<th>手机号码</th>
			<td>${user.phonenum }</td>
			<th>邮箱</th>
			<td>${user.email }</td>
		</tr>
		<tr>
			<th>角色</th>
			<td>${user.roleid }</td>
			<th>是否激活</th>
			<td>${user.ifactivate }</td>
			<th>是否禁言</th>
			<td>${user.ifspeak }</td>
		</tr>
		<tr>
			<th>最后登录时间</th>
			<td>${user.lastlogintime }</td>
			<th>登录设备</th>
			<td>${user.logindevice }</td>
			<th>登录域名</th>
			<td>${user.loginorg }</td>
		</tr>
	</table>
</body>
</html>