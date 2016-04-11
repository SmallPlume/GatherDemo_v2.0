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
		singleSelect:true, 
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
			{field:'lastlogintime',title:'最后登陆时间',width:120,align:'left'},
			{field:'ifactivate',title:'是否激活',align:'center',formatter:function(v){
				return v=='0'?'是':'否';
			}},
			{field:'ifspeak',title:'是否禁言',align:'center',formatter:function(v){
				return v=='0'?'否':'<span style="color:red">是<span>';
			}},
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

//监听窗口大小变化
/* window.onresize = function(){
	setTimeout(domresize,300);
}; */
//改变表格宽高
/* function domresize(){
	$('#tt').datagrid('resize',{  
		height:$("#body").height()-$('#search_area').height()-5,
		width:$("#body").width()
	});
} */
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
              <a  href="javascript:void(0)" class="easyui-linkbutton my-search-button" iconCls="icon-search" plain="true">查询</a> 
              <a  href="javascript:void(0)" class="easyui-linkbutton my-search-button" iconCls="icon-clean" plain="true" >重置</a>
          </td>
        </tr>
      </table>
    </div>
    <span id="openOrClose"></span> 
  </div>
  <!-- 数据表格区域 -->
  <table id="grid" style="table-layout:fixed;" ></table>
  <!-- 表格顶部工具按钮 -->
  <div id="tt_btn">
      <a href="javascript:void(0)"  id="add" class="easyui-linkbutton" iconCls="icon-add" plain="true">新增</a>
      <a href="javascript:void(0)"  id="update" class="easyui-linkbutton" iconCls="icon-edit" plain="true">修改</a> 
      <a href="javascript:void(0)"  id="delete" class="easyui-linkbutton" iconCls="icon-remove" plain="true">删除</a>
   </div>
</div>
</body>
</html>