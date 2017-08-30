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
  	<div class="logo"><a href="index.jsp">南京晓庄学院附属小学</a></div>
  	<div class="link_person"><a href="person">个人中心</a></div>  
	<article>
		<div>
			<img src="imgs/e.jpg" class="img2"> <img src="imgs/11.png"
				class="img3">
			<div class="introduce">
				<b>同学们有任何的问题都可以提出来哦~<br> 把问题抛出来，才有更好的提升哦
				</b>
			</div>
		</div>
		<div class="problums">
            <div class="msg">你搜索的问题已有人问过，请参考：</div>
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
            <a href="chat.jsp" class="back">返回</a>
        </div>
	</article>
	<div class="footer">
    	<div class="back">
    		<a href="#top"><img src="imgs/top.png"></a>
    	</div>
    	<div class="f1">
    		<a>意见反馈</a>
    		<a>联系我们</a>
    	</div>
    	<div class="f2">
    		Copyright&nbsp;&copy;2016&nbsp;&nbsp;学生作业系统
    	</div>
    </div>
</body>
</html>
