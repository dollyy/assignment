<%@ page language="java" contentType="text/html; charset=gbk" pageEncoding="gbk"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="css/log.css"/>
<script type="text/javascript" src="js/Tlog.js"></script>
<title>��½</title>
</head>
<body>
    <div class="bg"></div>
    <div class="login">
       <div class="log_bg"></div>
           <form name="form1"> 
	       <div class="tip">�뱾У��ʦ�ȵ�¼</div>
	       <input id="num" type="text" placeholder="�������ʺ�" onchange="numch()">
	       <span id="nw2" class="numwarn">�������ʺ�</span>
	       <span id="nw" class="numwarn">�ʺŲ�����</span>
	       <input id="pwd" type="password" placeholder="����������" onchange="pwdch()">
	       <span id="pw" class="pwdwarn">�������</span>
	       <span id="pw2" class="pwdwarn">����������</span>
	       <div id="forget"><a href="modify.html">��������</a></div>
	       <input id="logbutton" type="button" value="��½"  onclick="log()">
	      </form> 
    </div>
</body>
</html>