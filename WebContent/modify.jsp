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
       <div class="tip">����д�����Ϣ</div>
       <form name="form1">
       		<input type="text" id="name" class="name" placeholder="����������" onchange="nach()">
       		<span id="na" class="namewarn">����������</span>
       		<span id="nn" class="namewarn">������ѧ�Ų���</span>
       		<input type="text" id="num" class="num" placeholder="������ѧ��" onchange="nuch()">
       		<span id="nu" class="numwarn">������ѧ��</span>
       		<input type="password" id="pwd" class="pwd" placeholder="�����벻������6λ" onblur="cal1()" onchange="pwch()">
       		<span id="pw" class="pwdwarn">����������</span>
       		<span id="pw0" class="pwdwarn">���벻������6λ</span>
       		<input type="password" id="pwd2" class="pwd2" placeholder="���ٴ���������" onchange="pw2ch()">
       		<span id="pw2" class="pwd2warn">���ٴ���������</span>
       		<span id="pw3" class="pwd2warn">�������벻һ��</span>
       		<input type="reset" class="btn1" value="����">
       		<input type="button" class="btn2" value="�ύ" onclick="sub()">
       </form>
     </div>
</body>
</html>