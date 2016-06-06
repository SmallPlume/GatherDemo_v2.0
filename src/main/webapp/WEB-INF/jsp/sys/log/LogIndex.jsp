<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@include file="../../../jsp/base/base.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>日志列表</title>
<style type="text/css">
.input{
	height:20px;
}
</style>
<script type="text/javascript">
$(function(){
	$('#grid').datagrid({
		url:'<%=$root %>/sys/log/list.do',
		height:$("#body").height()-$('#search_area').height()-5,
		width:$("#body").width(),
		pageSize:20,
		pageList:[20,30,40,50],
		loadmsg:'正在加载...',
		singleSelect:false,
		nowrap:true,
		fitColumns:true, 
		rownumbers:true,
		showPageList:false,
		columns:[[
		    {field:'id',title:'id',checkbox:true},
		    {field:'username',title:'帐号名',width:70,align:'center'},
		    {field:'createdate',title:'创建时间',width:100,align:'center'},
		    {field:'handle',title:'操作',width:80,align:'center'},
		    {field:'url',title:'URL',width:130,align:'left',formatter:function(v,r,i){
		    	return v==null?'空':v;
		    }},
		    {field:'method',title:'方法',width:70,align:'left',formatter:function(v,r,i){
		    	return v==null?'空':v;
		    }},
		    {field:'ip',title:'IP地址',width:100,align:'center',formatter:function(v,r,i){
		    	return v==null?'空':v;
		    }},
	  		{field:'parameter',title:'参数',width:300,align:'left',formatter:function(v,r,i){
	  			return v==null?'空':v;
	  		}}
		]],
		toolbar:'#tt_btn',
        pagination:true,
		onDblClickRow:function(rowIndex, rowData){
			viewDetail(rowData.id);
		}
	});
	
	//删除
	$("#delete").on("click", function(){
		var rows = $("#grid").datagrid('getSelections');
		if(rows.length<1){
			alert("选择要删除项！");
			return false;
		}
		var ids = new Array();
		for(var i=0; i<rows.length; i++){
			ids[i] = rows[i].id;
		}
		$.post("<%=$root %>/sys/log/delt.do",{"ids":JSON.stringify(ids)},function(r){
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
	
	//查看
	$("#view").on("click",function(){
		var rows = $("#grid").datagrid('getSelections');
		if(rows.length!='1'){
			alert("请选择一条要查看项！");
			return false;
		}
		var id = rows[0].id;
		viewDetail(id);
	});
	
});

//查询
function toSearch(){
	var params = $('#form').serializeArray();
	var obj = new Object();
	$.each(params,function(i,v){
		if(v.value==='' || v.value==null){
			obj[v.name] = null;
		}else{
			obj[v.name] = v.value;
		}
	});
	$('#grid').datagrid('load',obj);
}

//清空
function toClean(){
	$('#form').form('clear');
}

function viewDetail(id){
	show({uri:'<%=$root %>/sys/log/view.do?id='+id,title:'查看日志详细',iconCls:'icon-view',width:800,height:500,options:{
		success:function(){
			//$('#grid').datagrid('reload');
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
    <form id="form">
      <table border="0">
        <tr>
          <td>帐号:</td>
          <td ><input class="textbox" name="username" id="userName" style="height:18px;"/></td>
          <td>&nbsp;方法:</td>
          <td><input class="textbox" name="method" id="method" style="height:18px;"/></td>
          <td>&nbsp;创建时间:</td>
          <td>
          	<input class="easyui-datebox textbox" name="beginDate" id="beginDate" data-options="editable:false" />&nbsp;—
          	<input class="easyui-datebox textbox" name="endDate" id="endDate" data-options="editable:false" />
          </td>
          <td style="padding-left:80px;">
              <a href="javascript:void(0)" class="easyui-linkbutton my-search-button" onclick="toSearch()" data-options="editable:false" iconCls="icon-search" plain="true">查询</a>
              <a href="javascript:void(0)" class="easyui-linkbutton my-search-button" onclick="toClean()" data-options="editable:false" iconCls="icon-reload" plain="true" >重置</a>
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
  	<shiro:hasRole name="admin">
      <a href="javascript:void(0)" id="delete" class="easyui-linkbutton" iconCls="icon-remove" plain="true">删除</a>
    </shiro:hasRole>
      <a href="javascript:void(0)" id="view" class="easyui-linkbutton" iconCls="icon-view" plain="true">查看</a>
   </div>
</div>
</body>
</html>