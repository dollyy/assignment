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
  	<div class="logo"><a href="index.jsp">�Ͼ���ׯѧԺ����Сѧ</a></div>
  	<div class="link_person"><a href="person">��������</a></div>
	<article>
		<div>
			<img src="imgs/e.jpg" class="img2"> <img src="imgs/11.png"
				class="img3">
			<div class="introduce">
				<b>ͬѧ�����κε����ⶼ���������Ŷ~<br> �������׳��������и��õ�����Ŷ
				</b>
			</div>
		</div>
		<div class="problums">
			<div class="frame1">
				<img src="imgs/f.jpg" alt="" class="com_head1">
				<div class="name1">
					���꼶2��<br>������
				</div>
				<div class="frame_1">����1:</div>
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
				<div class="remove"><a href="modify?option=remove&ques=p_q3">ɾ��������</a></div>
			</div>

			<div class="frame2">
				<div class="frame_1">����2:</div>
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
				<div class="remove"><a href="modify?option=remove&ques=p_q3">ɾ��������</a></div>
			</div>

			<div class="frame3">
				<div class="frame_1">����3:</div>
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
				<div class="remove"><a href="modify?option=remove&ques=p_q3">ɾ��������</a></div>
			</div>
			
			<div class="return"><a href="chat.jsp">����</a></div>
		</div>
	</article>
	    <div class="footer">
    	<div class="back">
    		<a href="#top"><img src="imgs/top.png"></a>
    	</div>
    	<div class="f1">
    		<a>�������</a>
    		<a>��ϵ����</a>
    	</div>
    	<div class="f2">
    		Copyright&copy;2016&nbsp;&nbsp;ѧ����ҵϵͳ
    	</div>
    </div>
</body>
</html>

