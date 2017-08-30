
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
<title>Ñ§Éú¶ËÊ×Ò³</title>
</head>
<body>

  <div class="bg"><a name="top"></a></div>
  <div class="logo"><a href="index.jsp">ÄÏ¾©Ïþ×¯Ñ§Ôº¸½ÊôÐ¡Ñ§</a></div>
  <div class="link_person"><a href="person">¸öÈËÖÐÐÄ</a></div>
    <div class="homework">
        <div class="subject chinese">ÓïÎÄ</div>
        <div class="subject math">ÊýÑ§</div>
        <div class="subject English">Ó¢Óï</div>
        <div class="subject art">ÃÀÊõ</div>
        <div class="subject sicence">¿ÆÑ§</div>
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
        <div class="title title1">Éú»î°²È«Ð¡³£Ê¶</div>
        <div class="title title2">´ó½²ÌÃ</div>
        <div class="right">
           <div class="row row1">
                <div class="s s_01"></div>
                <div class="w w_01">°²È«½»Í¨³£Ê¶</div>
                <div class="s s_02"></div>
                <div class="w w_02">µçÂ·°²È«³£Ê¶</div>
                <div class="s s_03"></div>
                <div class="w w_03">ÓëÄ°ÉúÈË½Ó´¥</div>
           </div>
           <div class="row row2">
                <div class="s s_04"></div>
                <div class="w w_04">ÄçË®°²È«³£Ê¶</div>
                <div class="s s_05"></div>
                <div class="w w_05">Ê³Æ·°²È«³£Ê¶</div>
                <div class="s s_06"></div>
                <div class="w w_06">Ð£Ô°°²È«³£Ê¶</div>
           </div>    
        </div>
    </div>
    <div class="k_01">
        <div class="close"></div>
        <img src="imgs/k_01.jpg" alt="°²È«½»Í¨³£Ê¶">
    </div>
    <div class="k_02">
        <div class="close"></div>
        <img src="imgs/k_02.jpg" alt="µçÂ·°²È«³£Ê¶">
    </div>
    <div class="k_03">
        <div class="close"></div>
        <img src="imgs/k_03.jpg" alt="ÓëÄ°ÉúÈË½Ó´¥">
    </div>
    <div class="k_04">
        <div class="close"></div>
        <img src="imgs/k_04.jpg" alt="ÄçË®°²È«³£Ê¶">  
    </div>
    <div class="k_05">
        <div class="close"></div>
        <img src="imgs/k_05.jpg" alt="Ê³Æ·°²È«³£Ê¶">
    </div>
    <div class="k_06">
        <div class="close"></div>
        <img src="imgs/k_06.jpg" alt="Ð£Ô°°²È«³£Ê¶">
    </div>
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