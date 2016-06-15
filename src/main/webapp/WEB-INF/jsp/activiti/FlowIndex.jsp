<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@include file="../../jsp/base/base.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>工作流列表</title>
<script type="text/javascript">
$(function(){
	$('#grid').datagrid({
		url:'<%=$root %>/sys/flow/queryList.do',
		height:$("#body").height()-$('#search_area').height()-5,
		width:$("#body").width(),
		idField:'id',
		/* singleSelect:true, */
		nowrap:true,
		fitColumns:true,
		rownumbers:true,
		showPageList:false,
		columns:[[
		    {field:'id',title:'项目id',checkbox:true},
	  		{field:'key',title:'流程键',width:100,align:'center'},
			{field:'name',title:'流程名称',width:100,align:'center'},
			{field:'startTime',title:'发起时间',width:80,align:'center'}
		]],
		toolbar:'#tt_btn',  
        pagination:true
	});
	
	//新增弹出框
	$("#add").on("click", function(){
		show({uri:'<%=$root %>/sys/addUser.do',title:'新增用户',iconCls:'icon-add',width:450,height:600,options:{
			success:function(){
				$('#grid').datagrid('reload');
			}
		}});
	});
	
});

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
          <td>用户名:</td>
          <td ><input class="textbox" name="username" style="height:18px;" /></td>
          <td>&nbsp;角色:</td>
          <td><input class="easyui-combobox" type="text" name="roleid" id="roleid" style="height:18px;" /></td>
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
  <table id="grid" style="table-layout:fixed;" ></table>
  <!-- 表格顶部工具按钮 -->
  <div id="tt_btn">
      <a href="javascript:void(0)"  id="add" class="easyui-linkbutton" iconCls="icon-add" plain="true">新增</a>
      <a href="javascript:void(0)"  id="update" class="easyui-linkbutton" iconCls="icon-edit" plain="true">修改</a>
   </div>
</div>
</body>
</html>