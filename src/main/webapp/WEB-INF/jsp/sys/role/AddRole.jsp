<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@include file="../../../jsp/base/base.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>新增角色</title>
<script type="text/javascript">
//保存
function submitForm(){
	var params = $('#form').serializeArray();
	$.post('<%=$root %>/sys/role/saveRole.do', params,function(r){
		if(r.code<0) return top.$alert(r.msg);
		top.$ok('${item.id}'===''?'保存成功！':'修改成功！');
		return top.$window.close(window,1);
	}, "json");
}

//清空
function toClean(){
	$('#form').form('clear');
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
                <th>角色代码:</th>
                <td><input class="easyui-textbox" type="text" name="roleno" data-options="required:true" value="${item.roleno }" /></td>
            </tr>
            <tr>
                <th>角色名称:</th>
                <td><input class="easyui-textbox" type="text" name="rolename" data-options="required:true" value="${item.rolename }" /></td>
            </tr>
            <tr>
                <th>角色说明:</th>
                <td><textarea type="text" class="form-text" name="roleremark" style="width:80%; height:100px;">${item.roleremark }</textarea></td>
            </tr>
        </table>
    </form>
    <div style="text-align:center;padding:5px">
        <a href="javascript:void(0)" class="easyui-linkbutton" onclick="submitForm()" style="width:60px; height:25px; margin-right: 20px;">保存</a>
        <a href="javascript:void(0)" class="easyui-linkbutton" onclick="toClean()" style="width:60px; height:25px;">清空</a>
    </div>
</body>
</html>