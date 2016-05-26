<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@include file="../../../jsp/base/base.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>分配权限</title>
<script type="text/javascript">
var zTree; 
var treeNodes;
var setting = {
		data: {
			simpleData: {
				enable: true
			}
		},
		view: {
			selectedMulti: true
		},
		check:{
			enable: true,  
            nocheckInherit: false,
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
/**
 * http://www.ztree.me/v3/demo.php#_201
 * 被勾选时：关联父 不关联子
 */
setting.check.chkboxType = { "Y" : "p", "N" : "ps" };

$(function(){
	loadTree();
	
	$("#save").on("click",function(){
		var treeObj=$.fn.zTree.getZTreeObj("tree");
		var nodes=treeObj.getCheckedNodes(true);
		var array = new Array();
        for(var i=0;i<nodes.length;i++){
        	array[i] = nodes[i].id;
        }
        
        $.ajax({
        	url:'<%=$root %>/sys/role/savePermit.do',
        	type:'POST',
        	dataType:'json',
        	data:'rid='+'${roleid}'+'&pids='+array,
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
	
	//全选
	$("#checkAll").on("click",function(){
		var treeObj = $.fn.zTree.getZTreeObj("tree");
	    treeObj.checkAllNodes(true);
	});
	
	//取全选
	$("#cacelAllcheck").on("click",function(){
		var treeObj = $.fn.zTree.getZTreeObj("tree");
	    treeObj.checkAllNodes(false);
	});
	
});

function loadTree(){
	$.ajax({
        async : false,  
        cache:false,  
        type: 'POST',  
        dataType : "json",  
        url:'<%=$root %>/sys/perms/menuTree.do',
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

	//初始化选中
	var zTreeCheked = '${zTreeCheked}';
	if(zTreeCheked!==''){
		$.each(JSON.parse(zTreeCheked),function(i,val){
			var node = zTree.getNodeByParam("id", val);
			zTree.checkNode(node,true, true);
		});
	}
}
</script>
</head>
<body class="easyui-layout">
	<div style="background-color:#FAFAFA; text-align: left; border-bottom:1px #cccccc solid;">
	<a href="javascript:void(0)" id="save" class="easyui-linkbutton" iconCls="icon-save" plain="true">保存</a>&nbsp;&nbsp;
		<a href="javascript:void(0)" id="checkAll" class="easyui-linkbutton" iconCls="icon-chk1" plain="true">全选</a>&nbsp;&nbsp;
		<a href="javascript:void(0)" id="cacelAllcheck" class="easyui-linkbutton" iconCls="icon-chk0" plain="true">取消</a>
	</div>
	<div style="margin:6px 10px 10px 10px;">
		<ul id="tree" class="ztree"></ul>
	</div>
</body>
</html>