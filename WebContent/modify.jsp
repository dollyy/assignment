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
       <div class="tip">ÇëÌîÐ´Ïà¹ØÐÅÏ¢</div>
       <form name="form1">
       		<input type="text" id="name" class="name" placeholder="ÇëÊäÈëÐÕÃû" onchange="nach()">
       		<span id="na" class="namewarn">ÇëÊäÈëÐÕÃû</span>
       		<span id="nn" class="namewarn">ÐÕÃûÓëÑ§ºÅ²»·û</span>
       		<input type="text" id="num" class="num" placeholder="ÇëÊäÈëÑ§ºÅ" onchange="nuch()">
       		<span id="nu" class="numwarn">ÇëÊäÈëÑ§ºÅ</span>
       		<input type="password" id="pwd" class="pwd" placeholder="ÐÂÃÜÂë²»µÃÉÙÓÚ6Î»" onblur="cal1()" onchange="pwch()">
       		<span id="pw" class="pwdwarn">ÇëÊäÈëÃÜÂë</span>
       		<span id="pw0" class="pwdwarn">ÃÜÂë²»µÃÉÙÓÚ6Î»</span>
       		<input type="password" id="pwd2" class="pwd2" placeholder="ÇëÔÙ´ÎÊäÈëÃÜÂë" onchange="pw2ch()">
       		<span id="pw2" class="pwd2warn">ÇëÔÙ´ÎÊäÈëÃÜÂë</span>
       		<span id="pw3" class="pwd2warn">Á½´ÎÃÜÂë²»Ò»ÖÂ</span>
       		<input type="reset" class="btn1" value="ÖØÖÃ">
       		<input type="button" class="btn2" value="Ìá½»" onclick="sub()">
       </form>
     </div>
</body>
</html>