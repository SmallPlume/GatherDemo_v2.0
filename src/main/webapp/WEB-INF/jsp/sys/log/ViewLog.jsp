<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@include file="../../../jsp/base/base.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>查看日志详细</title>
<style type="text/css">
#tab{
	width:100%;
}
#tab tr{
	height:43px;
	
}
#tab tr th{
	width:20%;
	text-align: left;
	padding-left:30px;
	border-bottom:1px #cccccc solid;
}
#tab tr td{
	width:80%;
	text-align: left;
	padding-left:30px;
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
	var time = FormatDate("${log.createdate}");
	$("#createTime").html(time);
});
</script>
</head>
<body>
	<div style="display: none;">
		<input type="text" id="time" data-options="editable:false,value:'<fmt:formatDate value="${log.createdate}" pattern="yyyy-MM-dd HH:MM:SS"/>'" class="easyui-datebox form-text"/>
	</div>
	<table id="tab">
		<tr>
			<th>帐号:</th>
			<td>${log.username }</td>
		</tr>
		<tr>
			<th>创建时间:</th>
			<td id="createTime"></td>
		</tr>
		<tr>
			<th>操作:</th>
			<td>${log.handle }</td>
		</tr>
		<tr>
			<th>操作的方法:</th>
			<td>${log.method }</td>
		</tr>
		<tr>
			<th>URL:</th>
			<td>${log.url }</td>
		</tr>
		<tr>
			<th>IP地址:</th>
			<td>${log.ip }</td>
		</tr>
		<tr style="height:100px;">
			<th>参数:</th>
			<td>${log.parameter }</td>
		</tr>
	</table>
</body>
</html>