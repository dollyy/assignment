<%@ page language="java" contentType="text/html; charset=gbk"
	pageEncoding="gbk"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>askedProblums</title>
<link rel="stylesheet" href="css/probl.css" type="text/css">
</head>
<body>
	<div class="img1"><a name="top"></a></div>
  	<div class="logo"><a href="index.jsp">ÄÏ¾©Ïþ×¯Ñ§Ôº¸½ÊôÐ¡Ñ§</a></div>
  	<div class="link_person"><a href="person">¸öÈËÖÐÐÄ</a></div>  
	<article>
		<div>
			<img src="imgs/e.jpg" class="img2"> <img src="imgs/11.png"
				class="img3">
			<div class="introduce">
				<b>Í¬Ñ§ÃÇÓÐÈÎºÎµÄÎÊÌâ¶¼¿ÉÒÔÌá³öÀ´Å¶~<br> °ÑÎÊÌâÅ×³öÀ´£¬²ÅÓÐ¸üºÃµÄÌáÉýÅ¶
				</b>
			</div>
		</div>
		<div class="problums">
            <div class="msg">ÄãËÑË÷µÄÎÊÌâÒÑÓÐÈËÎÊ¹ý£¬Çë²Î¿¼£º</div>
            <div class="stress1">
	            <ul>
	            <%
	          		String q = (String)request.getAttribute("prob");
	            	String arr[] = q.split("&");
	            	for(int i = 0; i < arr.length; i ++){
	            %>
						<li><%out.print(arr[i]);%></li>
				<% 
	            	}
	            %>
	            </ul>
            </div>
            <a href="chat.jsp" class="back">·µ»Ø</a>
        </div>
	</article>
	<div class="footer">
    	<div class="back">
    		<a href="#top"><img src="imgs/top.png"></a>
    	</div>
    	<div class="f1">
    		<a>Òâ¼û·´À¡</a>
    		<a>ÁªÏµÎÒÃÇ</a>
    	</div>
    	<div class="f2">
    		Copyright&nbsp;&copy;2016&nbsp;&nbsp;Ñ§Éú×÷ÒµÏµÍ³
    	</div>
    </div>
</body>
</html>
