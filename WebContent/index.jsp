
<%@page import="stuMsg.Homework"%>
<%@page import="stuServlet.Index"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=gbk" pageEncoding="gbk"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="css/index.css">
<script src="js/jquery-1.7.2.min.js"></script>
<script src="js/index.js"></script>
<title>学生端首页</title>
</head>
<body>

  <div class="bg"><a name="top"></a></div>
  <div class="logo"><a href="index.jsp">南京晓庄学院附属小学</a></div>
  <div class="link_person"><a href="person">个人中心</a></div>
    <div class="homework">
        <div class="subject chinese">语文</div>
        <div class="subject math">数学</div>
        <div class="subject English">英语</div>
        <div class="subject art">美术</div>
        <div class="subject sicence">科学</div>
<%
	List<Homework> home=new Index().getHW();
	for(Homework hw:home){
%>
        <div class="hw daily chinese"><%=hw.getChi() %></div>
        <div class="hw daily math"><%=hw.getMath() %></div>
        <div class="hw daily English"><%=hw.getEng() %></div>
        <div class="hw daily art"><%=hw.getSci() %></div>
        <div class="hw daily sicence"><%=hw.getArt() %></div>
<%
	}
%>
    </div>
    <div class="safety">
        <div class="left"></div>
        <div class="title title1">生活安全小常识</div>
        <div class="title title2">大讲堂</div>
        <div class="right">
           <div class="row row1">
                <div class="s s_01"></div>
                <div class="w w_01">安全交通常识</div>
                <div class="s s_02"></div>
                <div class="w w_02">电路安全常识</div>
                <div class="s s_03"></div>
                <div class="w w_03">与陌生人接触</div>
           </div>
           <div class="row row2">
                <div class="s s_04"></div>
                <div class="w w_04">溺水安全常识</div>
                <div class="s s_05"></div>
                <div class="w w_05">食品安全常识</div>
                <div class="s s_06"></div>
                <div class="w w_06">校园安全常识</div>
           </div>    
        </div>
    </div>
    <div class="k_01">
        <div class="close"></div>
        <img src="imgs/k_01.jpg" alt="安全交通常识">
    </div>
    <div class="k_02">
        <div class="close"></div>
        <img src="imgs/k_02.jpg" alt="电路安全常识">
    </div>
    <div class="k_03">
        <div class="close"></div>
        <img src="imgs/k_03.jpg" alt="与陌生人接触">
    </div>
    <div class="k_04">
        <div class="close"></div>
        <img src="imgs/k_04.jpg" alt="溺水安全常识">  
    </div>
    <div class="k_05">
        <div class="close"></div>
        <img src="imgs/k_05.jpg" alt="食品安全常识">
    </div>
    <div class="k_06">
        <div class="close"></div>
        <img src="imgs/k_06.jpg" alt="校园安全常识">
    </div>
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