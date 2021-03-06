<%@page import="stuServlet.Person"%>
<%@page import="stuMsg.Course"%>
<%@page import="stu.BinTree"%>
<%@page import="java.util.List"%>
<%@page language="java" contentType="text/html; charset=gbk" pageEncoding="gbk"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
 <link rel="stylesheet" href="css/person.css">
 <script src="js/jquery-1.7.2.min.js"></script>
 <script src="js/person.js"></script>
<title>个人中心</title>
</head>
<body>

 <div class="bg"><a name="top"></a></div>
        <div class="logo"><a href="index.jsp">南京晓庄学院附属小学</a></div>
        <div class="link_person"><a href="person.jsp">个人中心</a></div>  
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
                       <div class="course_">语文</div>
                       <div class="course_">数学</div>
                       <div class="course_">英语</div>
                       <div class="course_">科学</div>
                       <div class="course_">美术</div>
                       <div class="course_">总分</div>
                   </div>
                   <div class="course scores">
                   <%
                   		Object obj=application.getAttribute("num");
                   		if(obj == null){
                   			return;
                   		}
                   		int num=Integer.parseInt(obj.toString());
                   		List<String> sco=new BinTree().getMsg(num);
                   		for(int i=0;i<sco.size();i++){
                   %>
                       <div class="course_ scores_"><%=sco.get(i) %></div>
                   <%
                    }
                   %>
                   </div>
                   <div class="course rank"></div>
                </li>
             <li class="content history_">
             <div class="graph">选择查看折线图：</div>
             <ul id="navigation"> 
				<li onmouseover="displaySubMenu(this)" onmouseout="hideSubMenu(this)"> 
					<a href="#">成绩查询</a> 
					<ul> 
						<li><a href="grade_chart?subject=g_chi">语文</a></li> 
						<li><a href="grade_chart?subject=g_math">数学</a></li> 
						<li><a href="grade_chart?subject=g_eng">英语</a></li>  
						<li><a href="grade_chart?subject=g_sci">科学</a></li> 
						<li><a href="grade_chart?subject=g_art">美术</a></li> 
					</ul> 
				</li> 
			</ul> 
               <div class="box">
               		<div class="gra"></div>
               		<div class="gra">一(上)</div>
             		<div class="gra">一(下)</div>
             		<div class="gra">二(上)</div>
             		<div class="gra">二(下)</div>
             		<div class="gra">三(上)</div>
           			<div class="gra">三(下)</div>
           			<div class="gra">四(上)</div>
           			<div class="gra">四(下)</div>
           			<div class="gra">五(上)</div>
           			<div class="gra">五(下)</div>
           			<div class="gra">六(上)</div>
            		<div class="gra">六(下)</div>
            		<div class="cs">
	            		<div class="c">语文</div>
	            		<div class="c">数学</div>
	            		<div class="c">英语</div>
	            		<div class="c">科学</div>
	            		<div class="c">美术</div>
            		</div>
             <%
                 	Object obj2=application.getAttribute("num");
                 	if(obj2 == null){
                 		return;
                 	}
               		int num2=Integer.parseInt(obj2.toString());
               		List<String> his=new Person().getHis(num2);
               		String hisco[];
               		for(int i=0;i<his.size();i++){
               			hisco=his.get(i).split(",");
               			%>
               			<div class="ss">
               			<%
               			for(int j=0;j<hisco.length;j++){
               			%>
	               		<div class="score"><%=hisco[j] %></div>
						<%
               			}
               			%>
               			</div>
               			<%
                	}
             %>
               </div>

            </li>
            <li class="content message_">
                    <div class="mess_ mess1">
                        <div class="msg1"></div><a href="chat.jsp">王清老师回答了你的问题</a>
                    </div>
                    <div class="mess_ mess2">
                        <div class="msg1"></div><a href="chat.jsp">陈天昊同学向你提出了一个问题</a>
                    </div>
                    <div class="mess_ mess3">
                        <div class="msg1 msg"></div><a href="chat.jsp">苏启舟同学回答了你的问题</a>
                    </div>
                    <div class="mess_ mess4">
                        <div class="msg1 msg"></div><a href="chat.jsp">董馨阳同学回答了你的问题</a>
                    </div>
            </li>
        </ol>
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