<%@ page language="java" contentType="text/html; charset=gbk"
    pageEncoding="gbk"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="css/log.css">
<script type="text/javascript" src="js/log.js"></script>
<title>��½</title>
</head>
<body>
    <div class="bg"></div>
    <div class="login">
       <div class="log_bg"></div>
       <div class="tip">�뱾Уͬѧ�ȵ�¼</div>
       <form name="form1">
	       <input id="num" name="num" type="text" placeholder="������ѧ��" onchange="numch()">
	       <span id="nw" class="numwarn">ѧ�Ų�����</span>
	       <span id="nw2" class="numwarn">������ѧ��</span>
	       <input id="pwd" name="pwd" type="password" placeholder="����������" onchange="pwdch()">
	       <span id="pw" class="pwdwarn">�������</span>
	       <span id="pw2" class="pwdwarn">����������</span>
	       <div id="forget"><a href="modify.jsp">��������</a></div>
	       <input id="logbutton" type="button" value="��½" onclick="log()">
       </form>
       <div id="tip2">*��¼�˺�Ϊѧ��<br>*��ʼ���������ѧ���ֲᡷ</div>
    </div>
</body>
</html>