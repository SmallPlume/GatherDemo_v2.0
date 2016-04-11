<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@include file="../../../jsp/base/base.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>角色列表</title>
<script type="text/javascript">
$(function(){
	$('#grid').datagrid({
		url:'<%=$root %>/sys/role/roleList.do',
		height:$("#body").height()-$('#search_area').height()-5,
		width:$("#body").width(),
		idField:'id',
		singleSelect:true, 
		nowrap:true,
		fitColumns:true,
		rownumbers:true,
		showPageList:false,
		columns:[[
		    {field:'id',title:'项目id',checkbox:true},
	  		{field:'roleno',title:'角色代号',width:100,align:'center'},
			{field:'rolename',title:'角色名称',width:100,align:'center'},
			{field:'roleremark',title:'角色说明',width:200,align:'center'},
		]],
		toolbar:'#tt_btn',  
        pagination:true,
		onDblClickRow:function(rowIndex, rowData){
			viewDetail(rowData.id);
		}
	});
	
	//新增弹出框
	$("#add").on("click", function(){
		show({uri:'<%=$root %>/sys/addUser.do',title:'新增用户',iconCls:'icon-view',width:600,height:400,options:{
			success:function(){
				$('#grid').datagrid('reload');
			}
		}});
	});
	
	//修改
	$("#update").on("click", function(){
		$parent.messager.alert("提示","update", "info");
	});
	
	//删除
	$("#delete").on("click", function(){
		$parent.messager.alert("提示","delete", "info");
	});
	
});

//是否禁用或启用
function editValid(id,type){
	$.post("<%=$root %>/sys/editActivity.do", { "id": id,"ifactivate":type},function(r){
	       if(r.code<0) return $.messager.alert("操作提示", r.msg,"error");
	       
	       $.messager.show({
               title: "操作提示",
               msg: "操作成功！",
               showType: 'slide',
               timeout: 2000
           });
		   $('#grid').datagrid('reload');
	}, "json");
}

//是否禁言
function editShutup(id,privilege,type){
	if(privilege=='0'){
		$.post("<%=$root %>/sys/editActivity.do", { "id": id,"ifactivate":privilege,"ifspeak":type},function(r){
			if(r.code<0) return $.messager.alert("操作提示", r.msg,"error");
		}, "json");
	}
}

//查询
function toSearch(){
	var params = $('#form').serializeArray();
	var obj = new Object();
	$.each(params,function(i,v){
		obj[v.name] = v.value;
	});
	
	$('#grid').datagrid('load',obj);
}

//清空
function toClean(){
	$('#form').form('clear');
}

function viewDetail(id){
	show({uri:'<%=$root %>/sys/viewUser.do?id='+id,title:'查看用户信息',iconCls:'icon-view',width:800,height:500,options:{
		success:function(){
			$('#grid').datagrid('reload');
		}
	}});
}
</script>
</head>
<body class="easyui-layout">
<div id="body" region="center" > 
  <!-- 查询条件区域 -->
  <div id="search_area" >
    <div id="conditon">
      <table border="0">
        <tr>
          <td>用户名:</td>
          <td ><input class="textbox" name="username" id="userName" /></td>
          <td>&nbsp;性别:</td>
          <td><input class="textbox" name="sex" id="sex" /></td>
          <td>&nbsp;部门:</td>
          <td><input class="textbox" name="department" id="department" /></td>
          <td>
              <a href="javascript:void(0)" class="easyui-linkbutton my-search-button" iconCls="icon-search" plain="true">查询</a> 
              <a href="javascript:void(0)" class="easyui-linkbutton my-search-button" iconCls="icon-reload" plain="true" >重置</a>
          </td>
        </tr>
      </table>
    </div>
    <span id="openOrClose"></span> 
  </div>
  <!-- 数据表格区域 -->
  <table id="grid" style="table-layout:fixed;"></table>
  <!-- 表格顶部工具按钮 -->
  <div id="tt_btn">
      <a href="javascript:void(0)" id="add" class="easyui-linkbutton" iconCls="icon-add" plain="true">新增</a>
      <a href="javascript:void(0)" id="update" class="easyui-linkbutton" iconCls="icon-edit" plain="true">修改</a>
      <a href="javascript:void(0)" id="allot" class="easyui-linkbutton" iconCls="icon-app" plain="true">分配权限</a>
      <a href="javascript:void(0)" id="delete" class="easyui-linkbutton" iconCls="icon-remove" plain="true">删除</a>
   </div>
</div>
</body>
</html>