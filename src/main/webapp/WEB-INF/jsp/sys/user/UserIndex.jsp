<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@include file="../../../jsp/base/base.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户列表</title>
<script type="text/javascript">
$(function(){
	$('#grid').datagrid({
		url:'<%=$root %>/sys/userList.do',
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
	  		{field:'username',title:'账号',width:100,align:'center',editor:{
	  			type:'validatebox',options:{required:true}
	  		}},
			{field:'nickname',title:'昵称',width:100,align:'center',editor:{
				type:'validatebox',options:{required:true}
			}},
			{field:'roleName',title:'权限',width:80,align:'center'},
			{field:'sex',title:'性别',width:50,align:'center',formatter:function(v,r,i){
				return (v=="0"?"男":"女");
			}},
			{field:'lastlogintime',title:'最后登陆时间',align:'center',width:80},
			{field:'activity',title:'是否在线',width:35,align:'left',formatter:function(v,r,i){
				return (v=='0'?'离线':'在线:<a href="javascript:void(0);" onclick="changeActivity(\''+r.id+'\')"><span style="color:red">【踢出】</span></a>');
			}},
			{field:'ifactivate',title:'是否激活',width:35,align:'center',formatter:function(v,r,i){
				return v=='0'?'是:<a href="javascript:void(0);" onclick="editShutup(\''+r.id+'\',1,\''+r.ifspeak+'\')"><span style="color:red">【禁止】</span></a>':'否:<a href="javascript:void(0);" onclick="editShutup(\''+r.id+'\',0,\''+r.ifspeak+'\')">【激活】</a>';
			}},
			{field:'ifspeak',title:'是否禁言',width:35,align:'center',formatter:function(v,r,i){
				return v=='0'?'否:<a href="javascript:void(0);" onclick="editShutup(\''+r.id+'\',\''+r.ifactivate+'\',1)"><span style="color:red">【禁言】</span></a>':'是:<a href="javascript:void(0);" onclick="editShutup(\''+r.id+'\',\''+r.ifactivate+'\',0)">【开启】</a>';
			}}
			/* {field:'cz',title:'&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;操作',width:150,align:'left',formatter:function(v,r,l){
                var btn = '';
				if(r.ifactivate=='0'){
					btn = '<input class="start" onChange="editValid(\''+r.id+'\',1)" style="height:20px; width:40px;" checked>';
					if(r.ifspeak=='0'){
						btn += '<input class="shutup" onChange="editShutup(\''+r.id+'\',\''+r.ifactivate+'\',1)" style="height:20px; width:40px;" checked>';
					}else{
						btn += '<input class="shutup" onChange="editShutup(\''+r.id+'\',\''+r.ifactivate+'\',1)" style="height:20px; width:40px;">';
					}
				}else{
					btn = '<input class="start" onChange="editValid(\''+r.id+'\',1)" style="height:20px; width:40px;">';
				}
                return btn;
			}} */
		]],
		toolbar:'#tt_btn',  
        pagination:true,
		onDblClickRow:function(rowIndex, rowData){
			viewDetail(rowData.id);
		},
		onLoadSuccess:function(data){  
            $('.start').switchbutton({onText:'开',offText:'关'});
            $('.shutup').switchbutton({onText:'开',offText:'关'});
        }
	});
	
	$('#roleid').combobox({
		url:'<%=$root %>/sys/role/list.do',
		valueField:'id',
		textField:'rolename',
		panelHeight:'auto',
		editable:false
	});
	
	//新增弹出框
	$("#add").on("click", function(){
		show({uri:'<%=$root %>/sys/addUser.do',title:'新增用户',iconCls:'icon-add',width:450,height:600,options:{
			success:function(){
				$('#grid').datagrid('reload');
			}
		}});
	});
	
	//修改
	$("#update").on("click", function(){
		var rows = $("#grid").datagrid('getSelections');
		if(rows.length!="1"){
			alert("请选择一条需要操作的记录！");
			return false;
		}
		show({uri:'<%=$root %>/sys/addUser.do?id='+rows[0].id,title:'修改用户',iconCls:'icon-edit',width:450,height:600,options:{
			success:function(){
				$('#grid').datagrid('reload');
			}
		}});
	});
	
	//查看
	$("#view").on("click",function(){
		var rows = $("#grid").datagrid('getSelections');
		if(rows.length != '1'){
			alert("请选择一条需要操作的记录！");
			return false;
		}
		viewDetail(rows[0].id);
	});
	
	//删除
	$("#delete").on("click", function(){
		var rows = $("#grid").datagrid('getSelections');
		if(rows.length < 0){
			alert("请选择需要操作的记录！");
			return false;
		}
		var gnl=confirm("确定要删除?"); if(gnl==false) return false;
		//遍历id
		var ids = new Array();
		for(var i=0;i<rows.length;i++){
			ids[i] = rows[i].id;
		}
		$.post("<%=$root %>/sys/user/delt.do",{"ids":JSON.stringify(ids)},function(r){
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
	
	//分配角色
	$("#allotRole").on("click",function(){
		var rows = $("#grid").datagrid('getSelections');
		if(rows.length!="1"){
			alert("请选择一条需要操作的记录！");
			return false;
		}
		var id = rows[0].id;
		show({uri:'<%=$root %>/sys/user/allotRole.do?id='+id,title:'用户【'+rows[0].username+'】分配角色',iconCls:'icon-code',width:500,height:400,options:{
			success:function(){
				$('#grid').datagrid('reload');
			}
		}});
	});
	
	//重置密码
	$("#refreshPass").on("click",function(){
		var rows = $("#grid").datagrid('getSelections');
		if(rows.length<'1'){
			alert("请选择一条需要操作的记录！");
			return false;
		}
		var ids = new Array();
		for(var i=0;i<rows.length;i++){
			ids[i] = rows[i].id;
		}
		$.post("<%=$root %>/sys/user/resetPass.do",{"userids":JSON.stringify(ids)},function(r){
			if(r.code<0) return $.messager.alert("操作提示", r.msg,"error");
	        $.messager.show({
               title: "操作提示",
               msg: "初始化密码成功，密码为:12345",
               showType: 'slide',
               timeout: 2000
            });
		    $('#grid').datagrid('reload');
		});
	});
	
});

//是否禁言
function editShutup(id,ifactivate,ifspeak){
	if(id!=null){
		$.post("<%=$root %>/sys/editActivity.do",{"id":id,"ifactivate":ifactivate,"ifspeak":ifspeak},function(r){
			console.log(r);
			if(r.code<0) return $.messager.alert("操作提示", r.msg,"error");
		});
		$('#grid').datagrid('reload');
	}
}

//强制踢出
function changeActivity(id){
	if(id!=null){
		$.post("<%=$root %>/sys/UserloginOut.do",{"id":id},function(r){
			if(r.code<0) return $.messager.alert("操作提示", r.msg,"error");
		});
		$('#grid').datagrid('reload');
	}
}

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

//查看用户信息
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
      <!-- 超级管理员才有删除功能 -->
      <shiro:hasRole name="admin"><%-- <shiro:hasAnyRoles name="admin,employee"> --%>
      	<a href="javascript:void(0)"  id="delete" class="easyui-linkbutton" iconCls="icon-remove" plain="true">删除</a>
      </shiro:hasRole><%-- </shiro:hasAnyRoles> --%>
      <a href="javascript:void(0)"  id="view" class="easyui-linkbutton" iconCls="icon-view" plain="true">查看</a>
      <a href="javascript:void(0)"  id="allotRole" class="easyui-linkbutton" iconCls="icon-code" plain="true">分配角色</a>
      <shiro:hasRole name="admin">
      	<a href="javascript:void(0)"  id="refreshPass" class="easyui-linkbutton" iconCls="icon-pswd" plain="true">重置密码</a>
      </shiro:hasRole>
   </div>
</div>
</body>
</html>