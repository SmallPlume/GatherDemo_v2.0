<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@include file="../../../jsp/base/base.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>日志列表</title>
<script type="text/javascript">
$(function(){
	$('#grid').datagrid({
		url:'<%=$root %>/sys/log/list.do',
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
		    {field:'id',title:'id',checkbox:true},
		    {field:'userid',title:'帐号ID',width:130,align:'left'},
		    {field:'username',title:'帐号名',width:70,align:'left'},
		    {field:'createdate',title:'创建时间',width:100,align:'center'},
		    {field:'handle',title:'操作',width:100,align:'center'},
		    {field:'url',title:'URL',width:130,align:'left'},
		    {field:'method',title:'方法',width:70,align:'left'},
		    {field:'ip',title:'IP地址',width:100,align:'center'},
	  		{field:'parameter',title:'参数',width:200,align:'left'}
		]], 
		toolbar:'#tt_btn',  
        pagination:true,
		onDblClickRow:function(rowIndex, rowData){
			viewDetail(rowData.id);
		}
	});
	
	//删除
	$("#delete").on("click", function(){
		$parent.messager.alert("提示","delete", "info");
	});
	
});


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
      <a href="javascript:void(0)" id="delete" class="easyui-linkbutton" iconCls="icon-remove" plain="true">删除</a>
   </div>
</div>
</body>
</html>