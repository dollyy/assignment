<%@page import="stuServlet.Person"%>
<%@page import="stuMsg.Course"%>
<%@page import="stu.BinTree"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=gbk" pageEncoding="gbk"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
 <link rel="stylesheet" href="css/person.css">
 <script src="js/jquery-1.7.2.min.js"></script>
 <script src="js/person.js"></script>
<title>¸öÈËÖÐÐÄ</title>
<script type="text/javascript"> 
function displaySubMenu(li) { 
var subMenu = li.getElementsByTagName("ul")[0]; 
subMenu.style.display = "block"; 
} 
function hideSubMenu(li) { 
var subMenu = li.getElementsByTagName("ul")[0]; 
subMenu.style.display = "none"; 
} 
</script> 
</head>
<body>

 <div class="bg"></div>
    <div class="logo">Ñ§Ð£logo</div>
    <div class="center">½»Á÷ÖÐÐÄ</div>
    <div class="pic">¸öÈËÖÐÐÄ</div>
    <div class="main">
        <c:forEach var="s" items="${requestScope.msg }">
        	<div class="name">${s.sname }</div>
        	<div class="class">${s.sclass }</div>
        	<div class="num">${s.snum }</div>
        </c:forEach>
        <div class="index_">
            <div class="index1"></div>
            <div class="hover1"></div>
            
            <div class="index2"></div>
            <div class="hover2"></div>
            
            <div class="index3"></div>
            <div class="hover3"></div>
            
            <div class="index4"></div>
            <div class="hover4"></div>
            <ul>
                <li class="index11"></li>
                <li class="index21"></li>
                <li class="index31"></li>
                <li class="index41"></li>
            </ul>
        </div>
        <ol>
            <li class="content chart_">
<%
	int flag=0;
	List<Course> co=new Person().getCou();
	String mon[],tue[],wed[],thu[],fri[];
	for(Course c:co){
		mon=c.getMon().split(",");
		tue=c.getTue().split(",");
		wed=c.getWed().split(",");
		thu=c.getThu().split(",");
		fri=c.getFri().split(",");
		for(int i=0;i<mon.length;i++){
%>
			<div class="weeks"><%=mon[i] %></div>
<%
		}
		for(int i=0;i<tue.length;i++){
%>
			<div class="weeks weeks2"><%=tue[i] %></div>
<%
		}for(int i=0;i<tue.length;i++){
%>
			<div class="weeks weeks3"><%=wed[i] %></div>
<%
		}
		for(int i=0;i<tue.length;i++){
%>
			<div class="weeks weeks4"><%=thu[i] %></div>
<%
		}
		for(int i=0;i<tue.length;i++){
%>
			<div class="weeks weeks5"><%=fri[i] %></div>
<%
		}
	}
%>
                </li>
            <li class="content grade_">
                   <div class="year">2016-2017</div>
                   <div class="semester">Ò»</div>
			        <c:forEach var="s" items="${requestScope.msg }">
	                    <div class="grades names">${s.sname }</div>
	                    <div class="grades classnum">${s.sclass }</div>
	                    <div class="grades nums">${s.snum }</div>
			        </c:forEach>
                   <div class="course">
                       <div class="course_">ÊýÑ§</div>
                       <div class="course_">Ó¢Óï</div>
                       <div class="course_">¿ÆÑ§</div>
                       <div class="course_">ÌåÓý</div>
                       <div class="course_">ÃÀÊõ</div>
                   </div>
                   <div class="course scores">
                   <%
                   		Object obj=application.getAttribute("num");
                   		if(obj == null){
                   			return;
                   		}
                   		int num=Integer.valueOf(obj.toString());
                   		List<String> sco=new BinTree().search(num);
                   
                   %>
                       <div class="course_ scores_"></div>
                       <div class="course_ scores_"></div>
                       <div class="course_ scores_"></div>
                       <div class="course_ scores_"></div>
                       <div class="course_ scores_"></div>
                   </div>
                   <div class="course rank"></div>
                </li>
            <li class="content history_">
<!--                 <div class="h_name">Ñ§ÉúÐÕÃû</div>
                <div class="h_class">Äê¼¶°à¼¶</div>
                <div class="h_num">Ñ§ºÅ</div> -->
<!--                 <select name="" id="choose">
                    <option value="">ÓïÎÄ</option>
                    <option value="">ÊýÑ§</option>
                    <option value="">Ó¢Óï</option>
                    <option value="">¿ÆÑ§</option>
                </select> -->
                
                <!-- ÐÞ¸Ä -->
			<ul id="navigation"> 
				<li onmouseover="displaySubMenu(this)" onmouseout="hideSubMenu(this)"> 
				<a href="#">³É¼¨²éÑ¯</a> 
					<ul> 
						<!-- ¿ÉÒÔÍ¨¹ýjavabean´«id -->
						<!-- °ÑidºÍsubject´«¸øservlet£¬ÔõÑù»ØÀ´£¿ -->
						<li><a href="grade_chart?g_id=20130203&subject=g_chi">ÓïÎÄ</a></li> 
						<li><a href="grade_chart?g_id=20130203&subject=g_math">ÊýÑ§</a></li> 
						<li><a href="grade_chart?g_id=20130203&subject=g_eng">Ó¢Óï</a></li> 
						<li><a href="grade_chart?g_id=20130203&subject=g_sci">¿ÆÑ§</a></li> 
						<li><a href="grade_chart?g_id=20130203&subject=g_art">ÃÀÊõ</a></li>
					</ul> 
				</li>
				<li>
				<!--Ö±½ÓÒýÓÃÎÞÐ§  -->
				<img src="grade_chart"/> </li> 
			</ul> 
            
            </li>
            <li class="content message_">
                    <div class="mess_ mess1">
                        <div class="msg1"></div>ÍõÇåÀÏÊ¦»Ø´ðÁËÄãµÄÎÊÌâ
                    </div>
                    <div class="mess_ mess2">
                        <div class="msg1"></div>³ÂÌìê»Í¬Ñ§ÏòÄãÌá³öÁËÒ»¸öÎÊÌâ
                    </div>
                    <div class="mess_ mess3">
                        <div class="msg1 msg"></div>ËÕÆôÖÛÍ¬Ñ§»Ø´ðÁËÄãµÄÎÊÌâ
                    </div>
                    <div class="mess_ mess4">
                        <div class="msg1 msg"></div>¶­Ü°ÑôÍ¬Ñ§»Ø´ðÁËÄãµÄÎÊÌâ
                    </div>
            </li>
        </ol>
    </div>
    <div class="footer">
    	<a>Òâ¼û·´À¡</a>
    	<a>ÁªÏµÎÒÃÇ</a>
    	<br>
    	
    </div>

</body>
</html>