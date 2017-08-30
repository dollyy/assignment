<%@ page language="java" contentType="text/html; charset=gbk"
    pageEncoding="gbk"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="css/log.css">
<script type="text/javascript" src="js/log.js"></script>
<title>µÇÂ½</title>
</head>
<body>
    <div class="bg"></div>
    <div class="login">
       <div class="log_bg"></div>
       <div class="tip">Çë±¾Ð£Í¬Ñ§ÏÈµÇÂ¼</div>
       <form name="form1">
	       <input id="num" name="num" type="text" placeholder="ÇëÊäÈëÑ§ºÅ" onchange="numch()">
	       <span id="nw" class="numwarn">Ñ§ºÅ²»´æÔÚ</span>
	       <span id="nw2" class="numwarn">ÇëÊäÈëÑ§ºÅ</span>
	       <input id="pwd" name="pwd" type="password" placeholder="ÇëÊäÈëÃÜÂë" onchange="pwdch()">
	       <span id="pw" class="pwdwarn">ÃÜÂë´íÎó</span>
	       <span id="pw2" class="pwdwarn">ÇëÊäÈëÃÜÂë</span>
	       <div id="forget"><a href="modify.jsp">Íü¼ÇÃÜÂë</a></div>
	       <input id="logbutton" type="button" value="µÇÂ½" onclick="log()">
       </form>
       <div id="tip2">*µÇÂ¼ÕËºÅÎªÑ§ºÅ<br>*³õÊ¼ÃÜÂëÏê¼û¡¶Ñ§ÉúÊÖ²á¡·</div>
    </div>
</body>
</html>