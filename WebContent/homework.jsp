<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>布置作业</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="css/homework.css"/>
</head>
<body class="bg">
	<h1>今日作业</h1>
   	<form action="publish" method="post">
	   	<div class="show">
		           班级:<input type="text" name="cl"/></br>
		           语文:<input type="text" name="ch"/></br>
		           数学:<input type="text" name="ma"/></br>
		          英语:<input type="text" name="en"/></br>
		          科学:<input type="text" name="sc"/></br>
		          美术:<input type="text" name="ar"/></br>
		</div>
		<input id="show2" type="submit" value="布置">            
   </form>
</body>
</html>
