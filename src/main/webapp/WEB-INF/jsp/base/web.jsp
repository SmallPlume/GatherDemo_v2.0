<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
<!-- css -->
<link rel="stylesheet" href="<%=$root %>/css/blog/bootstrap.min.css">
<link rel="stylesheet" href="<%=$root %>/css/blog/ionicons.min.css">
<link rel="stylesheet" href="<%=$root %>/css/blog/pace.css">
<link rel="stylesheet" href="<%=$root %>/css/blog/custom.css">

<!-- js -->
<script src="<%=$root %>/js/jquery/jquery-2.1.4.min.js"></script>
<script src="<%=$root %>/js/blog/bootstrap.min.js"></script>
<script src="<%=$root %>/js/blog/pace.min.js"></script>
<script src="<%=$root %>/js/blog/modernizr.custom.js"></script>


