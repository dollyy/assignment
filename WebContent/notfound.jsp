<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>askedProblums</title>
<link rel="stylesheet" href="css/notfound.css" type="text/css">
<script type="text/javascript">
   var duration = 5000;
   var timer = null;
   var endTime = new Date().getTime() + duration;
   function interval() {
	   var n = (endTime - new Date().getTime()) / 1000;
	   if (n < 0) return;
	   document.getElementById("timeout").innerHTML = n.toFixed(0);
	   setTimeout(interval, 10);
   }
   function stopJump() {
	   clearTimeout(timer);
	   document.getElementById("jumphint").style.display = "none";
   }
   window.onload = function() {
	   timer = setTimeout("window.location.href='chat.jsp'", duration);
	   interval();
   }
</script>
</head>
<body>
	<header>
		<div class="img1"></div>
		<div class="logo">学校LOGO</div>
		<div class="link_index">
			<a href=""><b>首页</b></a>
		</div>
		<div class="link_homework">
			<a href=""><b>作业区</b></a>
		</div>
		<div class="link_person">
			<a href=""><b>个人中心</b></a>
		</div>
		<div class="head_portrait"></div>
	</header>
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
            <div class="msg">该问题还没有人提问过，小主可以去提问哦~</div>
            <div class="countdown">
            	<span id="jumphint">系统在 <span id="timeout"></span> 秒后 将自动跳转</span>
            </div>
        </div>
	</article>
</body>
</html>