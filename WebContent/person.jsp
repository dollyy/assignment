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
<title>��������</title>
</head>
<body>

 <div class="bg"><a name="top"></a></div>
        <div class="logo"><a href="index.jsp">�Ͼ���ׯѧԺ����Сѧ</a></div>
        <div class="link_person"><a href="person.jsp">��������</a></div>  
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
                   <div class="semester">һ</div>
			        <c:forEach var="s" items="${requestScope.msg }">
	                    <div class="grades names">${s.sname }</div>
	                    <div class="grades classnum">${s.sclass }</div>
	                    <div class="grades nums">${s.snum }</div>
			        </c:forEach>
                   <div class="course">
                       <div class="course_">����</div>
                       <div class="course_">��ѧ</div>
                       <div class="course_">Ӣ��</div>
                       <div class="course_">��ѧ</div>
                       <div class="course_">����</div>
                       <div class="course_">�ܷ�</div>
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
             <div class="graph">ѡ��鿴����ͼ��</div>
             <ul id="navigation"> 
				<li onmouseover="displaySubMenu(this)" onmouseout="hideSubMenu(this)"> 
					<a href="#">�ɼ���ѯ</a> 
					<ul> 
						<li><a href="grade_chart?subject=g_chi">����</a></li> 
						<li><a href="grade_chart?subject=g_math">��ѧ</a></li> 
						<li><a href="grade_chart?subject=g_eng">Ӣ��</a></li>  
						<li><a href="grade_chart?subject=g_sci">��ѧ</a></li> 
						<li><a href="grade_chart?subject=g_art">����</a></li> 
					</ul> 
				</li> 
			</ul> 
               <div class="box">
               		<div class="gra"></div>
               		<div class="gra">һ(��)</div>
             		<div class="gra">һ(��)</div>
             		<div class="gra">��(��)</div>
             		<div class="gra">��(��)</div>
             		<div class="gra">��(��)</div>
           			<div class="gra">��(��)</div>
           			<div class="gra">��(��)</div>
           			<div class="gra">��(��)</div>
           			<div class="gra">��(��)</div>
           			<div class="gra">��(��)</div>
           			<div class="gra">��(��)</div>
            		<div class="gra">��(��)</div>
            		<div class="cs">
	            		<div class="c">����</div>
	            		<div class="c">��ѧ</div>
	            		<div class="c">Ӣ��</div>
	            		<div class="c">��ѧ</div>
	            		<div class="c">����</div>
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
                        <div class="msg1"></div><a href="chat.jsp">������ʦ�ش����������</a>
                    </div>
                    <div class="mess_ mess2">
                        <div class="msg1"></div><a href="chat.jsp">�����ͬѧ���������һ������</a>
                    </div>
                    <div class="mess_ mess3">
                        <div class="msg1 msg"></div><a href="chat.jsp">������ͬѧ�ش����������</a>
                    </div>
                    <div class="mess_ mess4">
                        <div class="msg1 msg"></div><a href="chat.jsp">��ܰ��ͬѧ�ش����������</a>
                    </div>
            </li>
        </ol>
    </div>
    <div class="footer">
        <div class="back">
    		<a href="#top"><img src="imgs/top.png"></a>
    	</div>
    	<div class="f1">
    		<a>�������</a>
    		<a>��ϵ����</a>
    	</div>
    	<div class="f2">
    		Copyright&nbsp;&copy;2016&nbsp;&nbsp;ѧ����ҵϵͳ
    	</div>
    </div>
</body>
</html>