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
<title>个人中心</title>
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
    <div class="logo">学校logo</div>
    <div class="center">交流中心</div>
    <div class="pic">个人中心</div>
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
                   <div class="semester">一</div>
			        <c:forEach var="s" items="${requestScope.msg }">
	                    <div class="grades names">${s.sname }</div>
	                    <div class="grades classnum">${s.sclass }</div>
	                    <div class="grades nums">${s.snum }</div>
			        </c:forEach>
                   <div class="course">
                       <div class="course_">数学</div>
                       <div class="course_">英语</div>
                       <div class="course_">科学</div>
                       <div class="course_">体育</div>
                       <div class="course_">美术</div>
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
<!--                 <div class="h_name">学生姓名</div>
                <div class="h_class">年级班级</div>
                <div class="h_num">学号</div> -->
<!--                 <select name="" id="choose">
                    <option value="">语文</option>
                    <option value="">数学</option>
                    <option value="">英语</option>
                    <option value="">科学</option>
                </select> -->
                
                <!-- 修改 -->
			<ul id="navigation"> 
				<li onmouseover="displaySubMenu(this)" onmouseout="hideSubMenu(this)"> 
				<a href="#">成绩查询</a> 
					<ul> 
						<!-- 可以通过javabean传id -->
						<!-- 把id和subject传给servlet，怎样回来？ -->
						<li><a href="grade_chart?g_id=20130203&subject=g_chi">语文</a></li> 
						<li><a href="grade_chart?g_id=20130203&subject=g_math">数学</a></li> 
						<li><a href="grade_chart?g_id=20130203&subject=g_eng">英语</a></li> 
						<li><a href="grade_chart?g_id=20130203&subject=g_sci">科学</a></li> 
						<li><a href="grade_chart?g_id=20130203&subject=g_art">美术</a></li>
					</ul> 
				</li>
				<li>
				<!--直接引用无效  -->
				<img src="grade_chart"/> </li> 
			</ul> 
            
            </li>
            <li class="content message_">
                    <div class="mess_ mess1">
                        <div class="msg1"></div>王清老师回答了你的问题
                    </div>
                    <div class="mess_ mess2">
                        <div class="msg1"></div>陈天昊同学向你提出了一个问题
                    </div>
                    <div class="mess_ mess3">
                        <div class="msg1 msg"></div>苏启舟同学回答了你的问题
                    </div>
                    <div class="mess_ mess4">
                        <div class="msg1 msg"></div>董馨阳同学回答了你的问题
                    </div>
            </li>
        </ol>
    </div>
    <div class="footer">
    	<a>意见反馈</a>
    	<a>联系我们</a>
    	<br>
    	
    </div>

</body>
</html>