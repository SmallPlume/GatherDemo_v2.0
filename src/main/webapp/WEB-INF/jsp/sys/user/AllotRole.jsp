<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@include file="../../../jsp/base/base.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>分配角色</title>
<script type="text/javascript">
$(function(){
	//初始化
	load();
	//保存
	$("#save").on("click",function(){
		var rows = $("#grid").datagrid('getSelections');
		if(rows.length!="1"){
			$.messager.alert("操作提示","请选择一条数据！","error");
			return false;
		}
		$.ajax({
        	url:'<%=$root %>/sys/user/allotRole.do',
        	type:'POST',
        	dataType:'json',
        	data:'id='+'${AllotMap.allotUserid}'+'&roleid='+rows[0].id,
        	async:false,
        	success:function(r){
        		if(r.code<0) return top.$alert(r.msg);
        		top.$ok('保存成功！');
        		return top.$window.close(window,1);
        	},
        	error:function(r){
        		$parent.messager.alert("错误提示",r.error, "error");
        	}
        });
	});
	
});

function load(){
	$('#grid').datagrid({
		url:'<%=$root %>/sys/role/roleList.do',
		height:$("#body").height()-$('#search_area').height()-5,
		width:$("#body").width(),
		idField:'id',
		singleSelect:true,
		nowrap:true,
		fit:true,
		fitColumns:true,
		rownumbers:true,
		showPageList:false,
		columns:[[
		    {field:'id',title:'项目id',checkbox:true},
			{field:'rolename',title:'角色名称',width:100,align:'center'},
			{field:'roleno',title:'角色代号',width:100,align:'center'},
			{field:'roleremark',title:'角色说明',width:200,align:'center'}
		]], 
		toolbar:'#tt_btn',  
        pagination:true,
        onLoadSuccess:function(data){
        	$.each(data.rows,function(i,v){
        		if(v.id=='${AllotMap.roleid}'){
        			$('#grid').datagrid('selectRow', i);
        		}
        	});
        }
	});
}

</script>
</head>
<body>
	<table id="grid" style="table-layout:fixed;" ></table>
	<!-- 表格顶部工具按钮 -->
    <div id="tt_btn">
      <a href="javascript:void(0)" id="save" class="easyui-linkbutton" iconCls="icon-save">保存</a>
    </div>
</body>
</html>