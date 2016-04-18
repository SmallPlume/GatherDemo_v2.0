<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@include file="../../../jsp/base/base.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>权限管理</title>
<script type="text/javascript">
var node_ = '';
var type_ = '';
var setting = {
	data: {
		simpleData: {
			enable: true
		}
	},
	view: {
		selectedMulti: true
	},
	callback: {
		onClick:function(e, id, node){
			node_ = node;
			if(node.isParent) {  
				//是否父节点
				fillInfo(node,'1');
				type_ = '1';
				hideButton(true);
			} else {  
				//是否子节点
				fillInfo(node,'0');
				type_ = '0';
				showButton(false);
			}
			
		}
	}
};

var zTree;  
var treeNodes; 
$(function(){
	$('#toolbar').toolbar({buttons:[
 		{name:'add',iconCls:'icon-add',text:'新增子菜单'},
 		{name:'back',iconCls:'icon-back',text:'返回'},
       	{name:'save',iconCls:'icon-save',text:'保存'},
       	<shiro:hasRole name="admin">{name:'delt',iconCls:'icon-remove',text:'删除'},</shiro:hasRole>
       	/* {name:'clean',iconCls:'icon-clear',text:'清空'} */
  	],handler:handler});
	
	hideButton(true);
	$('div.toolbar a').eq(0).hide();
	loadTree();

});

function loadTree(){
	$.ajax({  
        async : false,  
        cache:false,  
        type: 'POST',  
        dataType : "json",  
        url:'<%=$root %>/sys/perms/menuTree.do', //请求的action路径  
        error: function () {
        	//请求失败处理函数  
        	top.$ok('请求失败！');
        },  
        success:function(data){ //请求成功后处理函数。    
            treeNodes = data;   //把后台封装好的简单Json格式赋给treeNodes  
        }  
    });  
  
	$.fn.zTree.init($("#tree"), setting, treeNodes);
	zTree = $.fn.zTree.getZTreeObj("tree");
}

//按钮功能
function handler() {
	if(this.name == 'add') return toAdd();
	if(this.name == 'back') return toBack();
	if(this.name == 'clean') return toClean();
	if(this.name == 'save') return toSave();
	if(this.name == 'delt') return toDelete();
}

/**
 * 保存、修改
 */
function toSave(){
	//验证
	if(!$('#form').form("validate")) return;
	var params = $('#form').serializeArray();
	console.info(params);
	$.post('<%=$root %>/sys/perms/saveModule.do', params,function(r){
		if(r.code<0) return top.$alert(r.msg);
		top.$ok('保存成功！');
		loadTree();
	}, "json");
	showButton(false);
	toClean();
	node_ = '';
}

/**
 * 删除
 */
function toDelete(){
	var id = $("#id").val();
	if(id==null || id==''){
		alert("请选择权限目录！");
		return;
	}
	$.post('<%=$root %>/sys/perms/deltModule.do',{id:id},function(r){
		if(r.code<0) return top.$alert(r.msg);
		top.$ok('删除成功！');
		loadTree();
	}, "json");
	toClean();
	node_ = '';
}

/**
 * 新增
 */
function toAdd(){
	if(node_==null || node_==''){
		alert("请选择权限目录！");
		return;
	}
	hideButton(false);
	toClean();
	
	$("#pid").val(node_.id);
	$("#pName").val(node_.name);
}

/**
 * 返回
 */
function toBack(){
	showButton(false);
	fillInfo(node_,type_);
}

/**
 * 隐藏按钮
 */
function hideButton(type){
	if(type){
		$('div.toolbar a').eq(0).show();
		$('div.toolbar a').eq(2).show();
		$('div.toolbar a').eq(1).hide();
		$('div.toolbar a').eq(3).hide();
	}else{
		$('div.toolbar a').eq(0).hide();
		$('div.toolbar a').eq(1).show();
		$('div.toolbar a').eq(2).show();
		$('div.toolbar a').eq(3).hide();
	}
}

/**
 * 显示按钮
 */
function showButton(type){
	if(type){
		$('div.toolbar a').eq(0).show();
		$('div.toolbar a').eq(1).hide();
		$('div.toolbar a').eq(2).show();
		$('div.toolbar a').eq(3).show();
	}else{
		$('div.toolbar a').eq(0).show();
		$('div.toolbar a').eq(1).hide();
		$('div.toolbar a').eq(2).show();
		$('div.toolbar a').eq(3).show();
	}
}

/**
 * 通过点击目录获取信息
 */
function fillInfo(node,type){
	$("#id").val(node.id);
	$("#name").val(node.name);
	$("#pid").val(node.pid);
	//顶级节点没有上级目录
	if(node.getParentNode()){
		$("#pName").val(node.getParentNode().name);
	}
	
	$("#rank").val(node.attributes.rank);
	$("#url").val(node.attributes.url);
	$("#permitno").val(node.attributes.permitno);
	$("#permitmark").val(node.attributes.permitmark);
	
	$("#dir").switchbutton(node.attributes.dir=='1'?'check':'uncheck');
	$("#menu").switchbutton(node.attributes.menu=='1'?'check':'uncheck');
	
	//子节点目录没有展开
	if(type==='1'){
		hideButton(true);
		$("#ifopen").switchbutton('enable');
		$("#ifopen").switchbutton(node.attributes.ifopen=='1'?'check':'uncheck');
	}else{
		showButton(true);
		$("#ifopen").switchbutton('disable');
		$("#ifopen").switchbutton('uncheck');
	}
}

//清空
function toClean(){
	$('#form').form('clear');
}
</script>
</head>
<body class="easyui-layout">
	<div data-options="region:'west',border:true,title:'权限菜单',split:true" style="width:300px;">
		<ul id="tree" class="ztree"></ul>
	</div>
	<div data-options="region:'center',border:true,title:'菜单信息管理'">
		<div id="toolbar" class="toolbar"></div>
		<div>
			<form id="form">
			<table id="perm_tab" cellpadding="5">
				<tr>
					<th>菜单名称:</th>
					<td>
						<input type="hidden" name="id" id="id" />
						<input type="text" class="easyui-validatebox form-text" name="name" id="name" data-options="required:true"/>
					</td>
					<th>上级节点:</th>
					<td>
						<input type="hidden" name="pid" id="pid" />
						<input type="text" class="form-text" id="pName" readonly="readonly"/>
					</td>
				</tr>
				<tr>
					<th>是否目录:</th>
					<td><input class="easyui-switchbutton" name="dir" id="dir" onText="开" offText="关" checked></td>
					<th>排序:</th>
					<td><input type="text" class="form-text" name="rank" id="rank" onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')"/></td>
				</tr>
				<tr>
					<th>是否菜单:</th>
					<td><input class="easyui-switchbutton" name="menu" id="menu" onText="开" offText="关" checked/></td>
					<th>是否展开:</th>
					<td><input class="easyui-switchbutton" name="ifopen" id="ifopen" onText="开" offText="关" /></td>
				</tr>
				<tr>
					<th>菜单No:</th>
					<td colspan="3"><input type="text" class="form-text" name="permitno" id="permitno" style="width:80%; height:30px;" /></td>
				</tr>
				<tr>
					<th>路径URL:</th>
					<td colspan="3"><input type="text" class="form-text" name="url" id="url" style="width:80%; height:30px;" /></td>
				</tr>
				<tr>
					<th>菜单解释:</th>
					<td colspan="3"><textarea type="text" class="form-text" name="permitmark" id="permitmark" style="width:80%; height:100px;"></textarea></td>
				</tr>
			</table>
			</form>
		</div>
	</div>
</body>
</html>