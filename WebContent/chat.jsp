<%@ page language="java" contentType="text/html; charset=gbk"
	pageEncoding="gbk"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Chat</title>
<link rel="stylesheet" href="css/chat.css">
</head>
<body>
	<div class="img1"></div>
  	<div class="logo"><a href="index.jsp">南京晓庄学院附属小学</a></div>
  	<div class="link_person"><a href="person">个人中心</a></div>
	<div>
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
				<div class="frame_1">问题:</div>
				<form action="modify" method="post">
					<textarea rows="6" cols="25" class="problum_1" name="question1">公园的路旁有一排树,每棵树之间相隔3米,请问第一棵树和第六棵树之间相隔多少米？</textarea>
					<input type="text" class="comment_tea1" value="Tom:" name="answer1">
					<input type="submit" value="评论" class="submit_tea1">
				</form>
			</div>

			<div class="frame2">
				<img src="imgs/g.jpg" alt="" class="com_head2">
				<div class="name1">
					三年级3班<br>王大大
				</div>
				<div class="frame_1">问题:</div>

				<form action="modify" method="post">
					<textarea rows="6" cols="25" class="problum_1" name="question1">甲、乙两人同时合打一份7000字的稿件，甲每小时打600字，乙比甲每小时多打200字，经过几小时可以完成任务？</textarea>
					<input type="text" class="comment_tea2" value="Jack:" name="answer1">
					<input type="submit" value="评论" class="submit_tea2">
				</form>

			</div>

			<div class="frame3">
				<img src="imgs/d.jpg" alt="" class="com_head3">
				<div class="name3">
					五年级2班<br>唐笑笑
				</div>
				<div class="frame_3">搜索问题</div>
				<form action="similar" method="post">
					<textarea cols="6" rows="25" wrap="hard" class="problum_sub" name="ask">
              	    </textarea>
					<input type="submit" value="提  交" class="sub"> 
				</form>
				<a href="Problums.jsp" class="prob"><b>我已问过的问题</b></a>
			</div>
		</div>
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