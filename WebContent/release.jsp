<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>��ҳ</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="css/release.css">
</head>
<body class="bg">
    <div class="show1">
	    <a href="PassrateServlet"><img alt="" src="imgs/r1.jpg"></a>
	    <h4 class="w1">�鿴������</h4>
    </div>
	<div class="show3">
	    <a href="homework.jsp"><img alt="" src="imgs/r3.jpg"></a>
	    <h4 class="w2">������ҵ</h4>
    </div>
</body>
</html>