<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.text.SimpleDateFormat"%>  
<%@page import="java.util.Date"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@include file="../../jsp/base/base.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="<%=$root %>/js/JQuery-zTree-v3.5.15/css/zTreeStyle/zTreeStyle.css">
<script type="text/javascript" src="<%=$root %>/js/JQuery-zTree-v3.5.15/jquery.ztree.all-3.5.min.js"></script>
<title>后台管理系统模板</title>
<%-- <script type="text/javascript" src="<%=$root %>/js/index.js"></script> --%>
</head>
<body class="easyui-layout">
<!-- 头部标题 -->
<div data-options="region:'north',border:false" style="height:60px; padding:5px; background:#F3F3F3"> 
	<a href="javascript:void(0)"><span class="northTitle">EasyUI框架</span></a>
    <div class="loginInfo">
		<span>登录用户:</span>
		<a class="easyui-menubutton" data-options="menu:'#mm',iconCls:'icon-user'" href="javascript:void(0);"><shiro:principal/></a>
		<a href="#" class="easyui-menubutton" data-options="menu:'#mm1',iconCls:'icon-help'" href="javascript:void(0);" onclick="addTabs('menu1','user.do','icon-save');">Help</a>
		<a href="#" class="easyui-linkbutton" data-options="plain:true" onclick="ifExist();">安全退出</a>
	</div>
	<div id="mm" style="width:100px;">
        <div>编辑</div>
        <div>修改密码</div>
    </div>
    <div id="mm1" style="width:100px;">
        <div><a class="easyui-menubutton" data-options="iconCls:'icon-help'" href="javascript:void(0);" onclick="addTabs('menu1','user.do','icon-save');">Help</a></div>
        <div>Update</div>
        <div>About</div>
    </div>
</div>

<!-- 左侧导航 -->
<div data-options="region:'west',split:true,title:'导航菜单', fit:false" style="width:200px;"> 
  <ul id="menuTree" class="ztree">
  </ul>
</div>

<!-- 页脚信息 -->
<div data-options="region:'south',border:false" style="height:20px; background:#F3F3F3; padding:2px; vertical-align:middle;">
	<span id="sysVersion">系统版本：V1.0</span>
    <span id="nowTime"></span>
</div>

<!-- 内容tabs -->
<div id="center" data-options="region:'center'">
  <div id="tabs" class="easyui-tabs">
    <div title="首页" style="padding:5px;display:block;" >
      <p>模板说明：</p>
        <ul>
          <li>主界面使用 easyui1.3.5</li>
          <li>导航树使用 JQuery-zTree-v3.5.15</li>
        </ul>
      <p>特性说明：</p>
        <ul>
          <li>所有弹出框均显示在顶级父窗口</li>
          <li>修改easyui window拖动，移动时显示窗口而不显示虚线框，并限制拖动范围</li>
        </ul>
      <p>测试EhCache页面缓存</p>    
      <%    
	    SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");  
	    out.print(format.format(new Date()));    
	    System.out.println(System.currentTimeMillis());    
	  %>
    </div>
  </div>
</div>

<!-- 用于弹出框 -->
<div id="parent_win"></div>
<script type="text/javascript">
//系统时间显示
setInterval("document.getElementById('nowTime').innerHTML=new Date().toLocaleString()+' 星期'+'日一二三四五六'.charAt(new Date().getDay());",1000);
var setting = {
data: {
	simpleData: {
		enable: true
	}
},
view: {
	selectedMulti: false
},
callback: {
	onClick:function(e, id, node){
		var zTree = $.fn.zTree.getZTreeObj("menuTree");
		if(node.isParent) {
			zTree.expandNode();
		} else {
			addTabs(node.name, node.file);
		}
	}
}
};

$(function() {
	var zNodes = ${module};
	$.fn.zTree.init($("#menuTree"), setting, zNodes);
	var zTree = $.fn.zTree.getZTreeObj("menuTree");

	//中间部分tab
	$('#tabs').tabs({  
		border:false,
		fit:true,
		onSelect: function(title, index){
			var treeNode = zTree.getNodeByParam("name", title, null);
			zTree.selectNode(treeNode);
		}
	}); 

	$('.index_panel').panel({
	    width:300,  
	    height:200,  
	    closable:true,
	    minimizable:true,
	    title:'My Panel'
	});

});

//添加一个选项卡面板 
function addTabs(title, url, icon){
	if(!$('#tabs').tabs('exists', title)){
		$('#tabs').tabs('add',{  
			title:title,  
			content:'<iframe src="'+url+'" frameBorder="0" border="0" scrolling="no" style="width: 100%; height: 100%;"/>',  
			closable:true
		});
	} else {
		$('#tabs').tabs('select', title);
	}
}

function ifExist(){
	 $.messager.confirm("操作提示", "您确定要执行操作吗？", function(data) {
         if(data) {
        	$.get("<%=$root %>/logout.do",function(){
        		location="<%=$root %>/";
        	});
         }
     });
}

function submitForm(){
	var params = $('#form').serializeArray();
	$.post("<%=$root %>/sys/saveUser.do", params,function(r){
	}, "json");
}

function abc(id){
	alert("id======"+id);
}
</script>

</body>
</html>
