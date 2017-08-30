<%@page import="stuMsg.Cprob"%>
<%@page import="stuServlet.Cgetprob"%>
<%@ page language="java" contentType="text/html; charset=gbk"
	pageEncoding="gbk"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>askedProblums</title>
<link rel="stylesheet" href="css/problums.css" type="text/css">
</head>
<body>
	<%
	Cgetprob getprob = new Cgetprob();
	Cprob prob = getprob.searchProblums();
	%>
	<div class="img1"></div>
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
			<div class="frame1">
				<img src="imgs/f.jpg" alt="" class="com_head1">
				<div class="name1">
					三年级2班<br>王晓晓
				</div>
				<div class="frame_1">问题1:</div>
				<div class="stress1">
					<ul>
					<%
					String arr1[] = prob.getP_q1().split("&");
					for(int i = 0; i < arr1.length; i ++){
					%>
							<li><%out.print(arr1[i]);%></li>
					<% 
					}
					%>
					</ul>
				</div>
				<div class="remove"><a href="modify?option=remove&ques=p_q3">删除该问题</a></div>
			</div>

			<div class="frame2">
				<div class="frame_1">问题2:</div>
				<div class="stress1">
					<ul>
						<%
						String arr2[] = prob.getP_q2().split("&");
						for(int i = 0; i < arr2.length; i ++){
						%>
							<li><%out.print(arr2[i]);%></li>
						<% 
						}
						%>
					</ul>
				</div>
				<div class="remove"><a href="modify?option=remove&ques=p_q3">删除该问题</a></div>
			</div>

			<div class="frame3">
				<div class="frame_1">问题3:</div>
				<div class="stress1">
					<ul>
						<%
						String arr3[] = prob.getP_q3().split("&");
						for(int i = 0; i < arr3.length; i ++){
						%>
							<li><%out.print(arr3[i]);%></li>
						<% 
						}
						%>
					</ul>
				</div>
				<div class="remove"><a href="modify?option=remove&ques=p_q3">删除该问题</a></div>
			</div>
			
			<div class="return"><a href="chat.jsp">返回</a></div>
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
    		Copyright&copy;2016&nbsp;&nbsp;学生作业系统
    	</div>
    </div>
</body>
</html>

