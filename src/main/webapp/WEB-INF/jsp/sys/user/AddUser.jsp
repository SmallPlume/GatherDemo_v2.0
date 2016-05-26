<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@include file="../../../jsp/base/base.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>新增用户</title>
<script type="text/javascript">
$(function(){
	$('#roleid').combobox({
		url:'<%=$root %>/sys/role/list.do',
		valueField:'id',
		textField:'rolename',
		panelHeight:'auto',
		editable:false
	});
	if('${item.id}'!='') $('#username').textbox({readonly:true});
	if('${item.sex}'==='') $('#sex').combobox('setValue','0');
	
	
});

function submitForm(){
	var params = $('#form').serializeArray();
	$.post('<%=$root %>/sys/saveUser.do', params,function(r){
		if(r.code<0) return top.$alert(r.msg);
		top.$ok('${item.id}'===''?'保存成功！':'修改成功！');
		return top.$window.close(window,1);
	}, "json");
}
</script>
</head>

<body>
    <form id="form" method="post">
    	<div style="display: none;">
    		<input type="text" name="id" value="${item.id }" />
    	</div>
        <table id="tab" cellpadding="5">
            <tr>
                <th>帐号:</th>
                <td colspan="3"><input class="easyui-textbox" type="text" name="username" id="username" data-options="required:true" value="${item.username }" /></td>
            </tr>
            <tr>
                <th>邮箱:</th>
                <td colspan="3"><input class="easyui-textbox" type="text" name="email" data-options="required:true,validType:'email'" value="${item.email }" /></td>
            </tr>
            <tr>
                <th>角色:</th>
                <td colspan="3"><input class="easyui-combobox" id="roleid" type="text" name="roleid" data-options="required:true" value="${item.roleid }" /></td>
            </tr>
			<tr>
                <th>昵称:</th>
                <td colspan="3"><input class="easyui-textbox" id="nickname" type="text" name="nickname" value="${item.nickname }" /></td>
            </tr>
			<tr>
				<th>性别:</th>
				<td style="width:100px;"><input class="easyui-combobox" name="sex" id="sex" style="width:60px;" value="${item.sex }" data-options="panelHeight:'auto',valueField:'label',textField: 'value',data: [{label: '0',value: '男'},{label: '1',value: '女'}]" /></td>
				<th>年龄:</th>
				<td><input class="easyui-numberbox" precision="0" max="200" min="1" size="8" maxlength="3" style="width:60px; text-align:right;" name="age" value="${item.age }==''?0:${item.age }" /></td>
			</tr>
			<tr>
                <th>手机:</th>
                <td colspan="3"><input class="easyui-textbox" id="phonenum" type="text" name="phonenum" value="${item.phonenum }" /></td>
            </tr>
            <tr>
            	<th>头像:</th>
				<td colspan="3">
					<input type="button" class="easyui-linkbutton" value="选择文件" id="browse" style="width:80px; height:25px;" />
					<ul id="file-list"></ul>
				</td>
			</tr>
            <!-- <tr>
                <th>Message:</th>
                <td>
                	<input class="easyui-textbox" name="message" data-options="multiline:true" style="height:60px"></input>
                </td>
            </tr> -->
            
        </table>
    </form>
    <div style="text-align:center;padding:5px">
        <a href="javascript:void(0)" class="easyui-linkbutton" onclick="submitForm()" style="width:60px; height:25px; margin-right: 20px;">保存</a>
        <a href="javascript:void(0)" class="easyui-linkbutton" onclick="clearForm()" style="width:60px; height:25px;">清空</a>
    </div>
</body>
</html>