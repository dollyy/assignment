<%@ page language="java" contentType="text/html; charset=gbk"
    pageEncoding="gbk"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="css/modify.css">
<script type="text/javascript" src="js/modify.js" charset="gbk"></script>
</head>
<body>
	<div class="bg"></div>
	 <div class="login">
       <div class="log_bg"></div>
       <div class="back"><a href="log.jsp"><</a></div>
       <div class="tip">请填写相关信息</div>
       <form name="form1">
       		<input type="text" id="name" class="name" placeholder="请输入姓名" onchange="nach()">
       		<span id="na" class="namewarn">请输入姓名</span>
       		<span id="nn" class="namewarn">姓名与学号不符</span>
       		<input type="text" id="num" class="num" placeholder="请输入学号" onchange="nuch()">
       		<span id="nu" class="numwarn">请输入学号</span>
       		<input type="password" id="pwd" class="pwd" placeholder="新密码不得少于6位" onblur="cal1()" onchange="pwch()">
       		<span id="pw" class="pwdwarn">请输入密码</span>
       		<span id="pw0" class="pwdwarn">密码不得少于6位</span>
       		<input type="password" id="pwd2" class="pwd2" placeholder="请再次输入密码" onchange="pw2ch()">
       		<span id="pw2" class="pwd2warn">请再次输入密码</span>
       		<span id="pw3" class="pwd2warn">两次密码不一致</span>
       		<input type="reset" class="btn1" value="重置">
       		<input type="button" class="btn2" value="提交" onclick="sub()">
       </form>
     </div>
</body>
</html>