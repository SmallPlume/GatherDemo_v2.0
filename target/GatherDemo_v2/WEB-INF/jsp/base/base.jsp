<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%String $root=request.getContextPath(); %>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv='X-UA-Compatible' content='IE=edge'>
<meta name="renderer" content="webkit">
<script type="text/javascript">
var $root = "<%=$root %>";
var me = '<%=session.getAttribute("me")%>';
var base = '${base}';
</script>
<!-- EasyUI Css -->
<link rel="stylesheet" type="text/css" href="<%=$root %>/css/default.css"></link>
<link rel="stylesheet" type="text/css" href="<%=$root %>/js/jquery-easyui-1.4.5/themes/gray/easyui.css"></link>
<link rel="stylesheet" type="text/css" href="<%=$root %>/js/jquery-easyui-1.4.5/themes/default/textbox.css"></link>
<link rel="stylesheet" type="text/css" href="<%=$root %>/js/jquery-easyui-1.4.5/themes/icon.css"></link>

<%-- <script type="text/javascript" src="<%=$root %>/js/jquery/jquery-2.1.4.min.js"></script> --%>

<!-- EasyUI JS -->
<script type="text/javascript" src="<%=$root %>/js/jquery-easyui-1.4.5/jquery.min.js"></script>
<script type="text/javascript" src="<%=$root %>/js/jquery-easyui-1.4.5/jquery.easyui.min.js"></script>
<script type="text/javascript" src="<%=$root %>/js/jquery-easyui-1.4.5/locale/easyui-lang-zh_CN.js"></script>

<link rel="stylesheet" type="text/css" href="<%=$root %>/js/JQuery-zTree-v3.5.15/css/zTreeStyle/zTreeStyle.css"></link>
<script type="text/javascript" src="<%=$root %>/js/JQuery-zTree-v3.5.15/jquery.ztree.all-3.5.min.js"></script>

<script type="text/javascript" src="<%=$root %>/js/main/base.js"></script>
<script type="text/javascript" src="<%=$root %>/js/main/easyui-validate.js"></script>
<script type="text/javascript" src="<%=$root %>/js/main/form.js"></script>
<script type="text/javascript" src="<%=$root %>/js/main/window.js"></script>

<script type="text/javascript" src="<%=$root %>/js/extends.js"></script>
<script type="text/javascript" src="<%=$root %>/js/common.js"></script>

<!-- plupload -->
<script type="text/javascript" src="<%=$root %>/js/main/upload.js"></script>
<script type="text/javascript" src="<%=$root %>/js/plupload/plupload.full.min.js"></script>

