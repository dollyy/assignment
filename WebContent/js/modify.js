var xmlHttpRequest;
//姓名文本框onchange事件
function nach(){
	document.getElementById("na").setAttribute("class","namewarn");
	document.getElementById("nn").setAttribute("class","namewarn");
}
//学号文本框onchange事件
function nuch(){
	document.getElementById("nu").setAttribute("class","numwarn");
}
//密码文本框onchange事件
function pwch(){
	document.getElementById("pw").setAttribute("class","pwdwarn");
}
//密码文本框onblur事件
function cal1(){
	var pwd=document.getElementById("pwd").value;
	if(pwd.length == 0){		//密码为空提示
		document.getElementById("pw0").setAttribute("class","pwdwarn");
		document.getElementById("pw").setAttribute("class","pwdwarn error");
	}else if(pwd.length > 0 && pwd.length < 6){
		document.getElementById("pw").setAttribute("class","pwdwarn");
		document.getElementById("pw0").setAttribute("class","pwdwarn error");
	}else if(pwd.length > 5){
		document.getElementById("pw0").setAttribute("class","pwdwarn");
	}
}
//再次输入密码文本框onchange事件
function pw2ch(){
	document.getElementById("pw2").setAttribute("class","pwd2warn");
	document.getElementById("pw3").setAttribute("class","pwd2warn");
}
//提交按钮事件
function sub(){
	var name=document.getElementById("name").value;
	var num=document.getElementById("num").value;
	var pwd=document.getElementById("pwd").value;
	var pwd2=document.getElementById("pwd2").value;
	if(name.length == 0){		//姓名为空提示
		document.getElementById("na").setAttribute("class","namewarn error");
	}
	if(num.length == 0){		//学号为空提示
		document.getElementById("nu").setAttribute("class","numwarn error");
	}
	if(pwd.length == 0){		//密码为空提示
		document.getElementById("pw").setAttribute("class","pwdwarn error");
	}
	if(pwd2.length == 0){		//密码2为空提示
		document.getElementById("pw2").setAttribute("class","pwd2warn error");
	}
	
	if(name.length != 0 && num.length != 0 && pwd.length > 5 && pwd2.length != 0){
		if(window.ActiveXObject){		//IE浏览器
			xmlHttpRequest=new ActiveXObject("Microsoft XMLHTTP");
		}else if(window.XMLHttpRequest){	//FireFox浏览器
			xmlHttpRequest=new XMLHttpRequest();
		}
		xmlHttpRequest.open("POST","mod",true);
		xmlHttpRequest.onreadystatechange=Callback;
		xmlHttpRequest.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
		var name=encodeURI(encodeURI(name));
		xmlHttpRequest.send("name="+name+"&num="+num+"&pwd="+pwd+"&pwd2="+pwd2);
	}
}
function Callback(){
	if(xmlHttpRequest.readyState  == 4){
		if(xmlHttpRequest.status == 200){
			var res=xmlHttpRequest.responseText;
			switch(res){
			case "0":document.form1.action="log.jsp";		//匹配成功
			document.form1.submit();						//跳转到登陆页面
			break;
			case "-1":document.getElementById("pw3").setAttribute("class","pwd2warn error");	//两次密码不一致
			document.getElementById("pwd").value="";
			document.getElementById("pwd2").value="";
			break;
			case "-2":document.getElementById("nn").setAttribute("class","namewarn error");	//学号与姓名不符
			document.getElementById("name").value="";
			document.getElementById("num").value="";
			document.getElementById("pwd").value="";
			document.getElementById("pwd2").value="";
			break;
			}
		}
	}
}