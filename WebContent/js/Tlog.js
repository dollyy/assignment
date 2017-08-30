var xmlHttpRequest;
//学号文本框onchange事件
function numch(){
	document.getElementById("nw").setAttribute("class","numwarn");
	document.getElementById("nw2").setAttribute("class","numwarn");
}
//密码文本框onchange事件
function pwdch(){
	document.getElementById("pw").setAttribute("class","numwarn");
	document.getElementById("pw2").setAttribute("class","numwarn");
}
//登录按钮的onclick事件
function log(){
	var num=document.getElementById("num").value;
	var pwd=document.getElementById("pwd").value;
	if(num.length == 0){		//学号为空提示
		document.getElementById("nw2").setAttribute("class","numwarn error");
	}
	if(pwd.length == 0){		//密码为空提示
		document.getElementById("pw2").setAttribute("class","pwdwarn error");
	}
	if(num.length != 0 && pwd.length != 0){
		if(window.ActiveXObject){		//IE浏览器
			xmlHttpRequest=new ActiveXObject("Microsoft XMLHTTP");
		}else if(window.XMLHttpRequest){	//FireFox浏览器
			xmlHttpRequest=new XMLHttpRequest();
		}
		xmlHttpRequest.open("POST","Tlogin",true);
		xmlHttpRequest.onreadystatechange=Callback;
		xmlHttpRequest.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
		xmlHttpRequest.send("num="+num+"&pwd="+pwd);
	}
}
function Callback(){
	if(xmlHttpRequest.readyState  == 4){
		if(xmlHttpRequest.status == 200){
			var res=xmlHttpRequest.responseText;
			switch(res){
			case "0":document.form1.action="release.jsp";		//匹配成功
			document.form1.submit();			//跳转到首页
			break;
			case "-1":document.getElementById("pw").setAttribute("class","pwdwarn error");	//密码错误
			document.getElementById("pwd").value="";
			break;
			case "-2":alert(-2);document.getElementById("nw").setAttribute("class","numwarn error");	//用户名不存在
			document.getElementById("num").value="";
			document.getElementById("pwd").value="";
			break;
			}
		}
	}
}