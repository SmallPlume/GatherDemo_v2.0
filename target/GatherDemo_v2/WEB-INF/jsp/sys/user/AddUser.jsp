<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@include file="../../../jsp/base/base.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>新增用户</title>
<script type="text/javascript">
function submitForm(){
	var params = $('#form').serializeArray();
	$.post('<%=$root %>/sys/saveUser.do', params,function(r){
		if(r.code<0) return top.$alert(r.msg);
		top.$ok('保存成功！');
		return top.$window.close(window,1);
	}, "json");
}

</script>
</head>

<body>
    <form id="form" method="post">
        <table id="tab" cellpadding="5">
            <tr>
                <th>帐号:</th>
                <td><input class="easyui-textbox" type="text" name="username" data-options="required:true"></input></td>
            </tr>
            <tr>
                <th>邮箱:</th>
                <td><input class="easyui-textbox" type="text" name="email" data-options="required:true,validType:'email'"></input></td>
            </tr>
            <tr>
                <th>角色:</th>
                <td><input class="easyui-textbox" type="text" name="subject" data-options="required:true"></input></td>
            </tr>
            <tr>
                <th>Message:</th>
                <td><input class="easyui-textbox" name="message" data-options="multiline:true" style="height:60px"></input></td>
            </tr>
        </table>
    </form>
    <div style="text-align:center;padding:5px">
        <a href="javascript:void(0)" class="easyui-linkbutton" onclick="submitForm()">Submit</a>
        <a href="javascript:void(0)" class="easyui-linkbutton" onclick="clearForm()">Clear</a>
    </div>
</body>
</html>