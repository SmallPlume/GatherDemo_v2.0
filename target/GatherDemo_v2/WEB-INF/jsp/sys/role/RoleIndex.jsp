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
		/* fit:true,*/
		fitColumns:true, 
		rownumbers:true,
		showPageList:false,
		columns:[[
		    {field:'id',title:'项目id',checkbox:true},
	  		{field:'roleno',title:'角色代号',width:100,align:'center'},
			{field:'rolename',title:'角色名称',width:100,align:'center'},
			{field:'roleremark',title:'角色说明',width:200,align:'center'}
		]], 
		toolbar:'#tt_btn',  
        pagination:true
	});
	
	//新增弹出框
	$("#add").on("click", function(){
		show({uri:'<%=$root %>/sys/role/addRole.do',title:'新增角色',iconCls:'icon-add',width:600,height:400,options:{
			success:function(){
				$('#grid').datagrid('reload');
			}
		}});
	});
	
	//修改
	$("#update").on("click", function(){
		var rows = $("#grid").datagrid('getSelections');
		if(rows.length!="1"){
			$.messager.alert("操作提示","只能选择一条！","error");
			return false;
		}
		show({uri:'<%=$root %>/sys/role/addRole.do?id='+rows[0].id,title:'修改角色',iconCls:'icon-edit',width:600,height:400,options:{
			success:function(){
				$('#grid').datagrid('reload');
			}
		}});
	});
	
	//删除
	$("#delete").on("click", function(){
		var rows = $("#grid").datagrid('getSelections');
		if(rows.length < 0){
			$.messager.alert("操作提示","选择一条！","error");
			return false;
		}
		var gnl=confirm("确定要删除?"); if(gnl==false) return false;
		$.post('<%=$root %>/sys/role/deltRole.do',{'id':rows[0].id},function(r){
			if(r.code<0) return alert(r.msg);
	        $.messager.show({
               title: "操作提示",
               msg: "删除成功！",
               showType: 'slide',
               timeout: 2000
            });
		    $('#grid').datagrid('reload');
		});
	});
	
	//分配权限
	$("#allot").on("click",function(){
		var rows = $("#grid").datagrid('getSelections');
		if(rows.length!="1"){
			$.messager.alert("操作提示","只能选择一条！","error");
			return false;
		}
		var id = rows[0].id;
		show({uri:'<%=$root %>/sys/role/allot.do?id='+id,title:'【'+rows[0].rolename+'】选择权限',iconCls:'icon-app',width:400,height:600,options:{
			success:function(){
				$('#grid').datagrid('reload');
			}
		}});
	});
});

//查询
function toSearch(){
	var obj = new Object();
	obj['roleno'] = $("#roleno").val()==''?null:$("#roleno").val();
	obj['rolename'] = $("#rolename").val()==''?null:'%'+$("#rolename").val()+'%';
	$('#grid').datagrid('load',obj);
}

//清空
function toClean(){
	$('#form').form('clear');
}
</script>
</head>
<body class="easyui-layout">
<div id="body" region="center" > 
  <!-- 查询条件区域 -->
  <div id="search_area" >
    <div id="conditon">
    <form id="form">
      <table border="0">
        <tr>
          <td>角色代码:</td>
          <td ><input class="textbox" name="roleno" id="roleno" style="height:18px;" /></td>
          <td>&nbsp;角色名称:</td>
          <td><input class="textbox" name="rolename" id="rolename" style="height:18px;" /></td>
          <td style="padding-left:80px;">
              <a href="javascript:void(0)" class="easyui-linkbutton my-search-button" onclick="toSearch()" iconCls="icon-search" plain="true">查询</a>
              <a href="javascript:void(0)" class="easyui-linkbutton my-search-button" onclick="toClean()" iconCls="icon-reload" plain="true" >重置</a>
          </td>
        </tr>
      </table>
      </form>
    </div>
    <span id="openOrClose"></span>
  </div>
  <!-- 数据表格区域 -->
  <table id="grid" style="table-layout:fixed;"></table>
  <!-- 表格顶部工具按钮 -->
  <div id="tt_btn">
      <a href="javascript:void(0)" id="add" class="easyui-linkbutton" iconCls="icon-add" plain="true">新增</a>
      <a href="javascript:void(0)" id="update" class="easyui-linkbutton" iconCls="icon-edit" plain="true">修改</a>
      <a href="javascript:void(0)" id="delete" class="easyui-linkbutton" iconCls="icon-remove" plain="true">删除</a>
      <a href="javascript:void(0)" id="allot" class="easyui-linkbutton" iconCls="icon-app" plain="true">分配权限</a>
   </div>
</div>
</body>
</html>