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
<title>¸öÈËÖÐÐÄ</title>
</head>
<body>

 <div class="bg"><a name="top"></a></div>
        <div class="logo"><a href="index.jsp">ÄÏ¾©Ïþ×¯Ñ§Ôº¸½ÊôÐ¡Ñ§</a></div>
        <div class="link_person"><a href="person.jsp">¸öÈËÖÐÐÄ</a></div>  
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
                       <div class="course_">ÓïÎÄ</div>
                       <div class="course_">ÊýÑ§</div>
                       <div class="course_">Ó¢Óï</div>
                       <div class="course_">¿ÆÑ§</div>
                       <div class="course_">ÃÀÊõ</div>
                       <div class="course_">×Ü·Ö</div>
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
             <div class="graph">Ñ¡Ôñ²é¿´ÕÛÏßÍ¼£º</div>
             <ul id="navigation"> 
				<li onmouseover="displaySubMenu(this)" onmouseout="hideSubMenu(this)"> 
					<a href="#">³É¼¨²éÑ¯</a> 
					<ul> 
						<li><a href="grade_chart?subject=g_chi">ÓïÎÄ</a></li> 
						<li><a href="grade_chart?subject=g_math">ÊýÑ§</a></li> 
						<li><a href="grade_chart?subject=g_eng">Ó¢Óï</a></li>  
						<li><a href="grade_chart?subject=g_sci">¿ÆÑ§</a></li> 
						<li><a href="grade_chart?subject=g_art">ÃÀÊõ</a></li> 
					</ul> 
				</li> 
			</ul> 
               <div class="box">
               		<div class="gra"></div>
               		<div class="gra">Ò»(ÉÏ)</div>
             		<div class="gra">Ò»(ÏÂ)</div>
             		<div class="gra">¶þ(ÉÏ)</div>
             		<div class="gra">¶þ(ÏÂ)</div>
             		<div class="gra">Èý(ÉÏ)</div>
           			<div class="gra">Èý(ÏÂ)</div>
           			<div class="gra">ËÄ(ÉÏ)</div>
           			<div class="gra">ËÄ(ÏÂ)</div>
           			<div class="gra">Îå(ÉÏ)</div>
           			<div class="gra">Îå(ÏÂ)</div>
           			<div class="gra">Áù(ÉÏ)</div>
            		<div class="gra">Áù(ÏÂ)</div>
            		<div class="cs">
	            		<div class="c">ÓïÎÄ</div>
	            		<div class="c">ÊýÑ§</div>
	            		<div class="c">Ó¢Óï</div>
	            		<div class="c">¿ÆÑ§</div>
	            		<div class="c">ÃÀÊõ</div>
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
                        <div class="msg1"></div><a href="chat.jsp">ÍõÇåÀÏÊ¦»Ø´ðÁËÄãµÄÎÊÌâ</a>
                    </div>
                    <div class="mess_ mess2">
                        <div class="msg1"></div><a href="chat.jsp">³ÂÌìê»Í¬Ñ§ÏòÄãÌá³öÁËÒ»¸öÎÊÌâ</a>
                    </div>
                    <div class="mess_ mess3">
                        <div class="msg1 msg"></div><a href="chat.jsp">ËÕÆôÖÛÍ¬Ñ§»Ø´ðÁËÄãµÄÎÊÌâ</a>
                    </div>
                    <div class="mess_ mess4">
                        <div class="msg1 msg"></div><a href="chat.jsp">¶­Ü°ÑôÍ¬Ñ§»Ø´ðÁËÄãµÄÎÊÌâ</a>
                    </div>
            </li>
        </ol>
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