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
	width:100%;
}
#tab tr th{
	width:15%;
	height:50px;
	text-align:right;
	border-bottom:1px #cccccc solid;
}
#tab tr td{
	text-align:left;
	height:50px;
	border-bottom:1px #cccccc solid;
}
</style>
<script type="text/javascript">
function FormatDate (strTime) {
    var date = new Date(strTime);
    var year = date.getFullYear();
    var month = (date.getMonth()+ 1) < 10  ? '0' + (date.getMonth() + 1) : (date.getMonth() + 1);
    var day = (date.getDate())< 10 ? '0' + (date.getDate()) : (date.getDate());
    var hours = (date.getHours())< 10 ? '0' + (date.getHours()) : (date.getHours());
    var minutes = (date.getMinutes()) < 10 ? '0' + (date.getMinutes()) : (date.getMinutes());
    var seconds = (date.getSeconds()) < 10 ? '0' + (date.getSeconds()) : (date.getSeconds());
    return year+"-"+month+"-"+day+" "+hours+':'+minutes+':'+seconds; 
}

$(function(){
	var time = FormatDate("${user.lastlogintime }");
	$("#lastlogintime").html(time==null?'':time);
	
	//图片显示
	var img = '${user.icon}';
	if(img==null || img===''){
		$('#headImg').attr('src','<%=$root %>/images/head.png');
	}else{
		$('#headImg').attr('src','<%=$root %>/file/icon/${user.icon}.do');
	}
});
</script>
</head>
<body>
	<table id="tab">
		<tr>
			<th>帐号:</th>
			<td>${user.username }</td>
			<th>昵称:</th>
			<td>${user.nickname }</td>
			<td rowspan="3">
				<img id="headImg" style="width:150px; height:150px;"/>
			</td>
		</tr>
		<tr>
			<th>性别:</th>
			<td>${user.sex=='0'?'男':'女' }</td>
			<th>年龄:</th>
			<td>${user.age }</td>
		</tr>
		<tr>
			<th>手机号码:</th>
			<td>${user.phonenum }</td>
			<th>邮箱:</th>
			<td>${user.email }</td>
		</tr>
		<tr>
			<th>角色:</th>
			<td>${user.roleName }</td>
			<th>是否激活:</th>
			<td>${user.ifactivate=='0'?'是':'否' }</td>
			<th>是否禁言:</th>
			<td>${user.ifspeak=='0'?'否':'是' }</td>
		</tr>
		<tr>
			<th>最后登录时间:</th>
			<td id="lastlogintime"></td>
			<th>登录设备:</th>
			<td>${user.logindevice }</td>
			<th>登录域名:</th>
			<td>${user.loginorg }</td>
		</tr>
	</table>
</body>
</html>