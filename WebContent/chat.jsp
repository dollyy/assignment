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
  	<div class="logo"><a href="index.jsp">�Ͼ���ׯѧԺ����Сѧ</a></div>
  	<div class="link_person"><a href="person">��������</a></div>
	<div>
		<div>
			<img src="imgs/e.jpg" class="img2"> <img src="imgs/11.png"
				class="img3">
			<div class="introduce">
				<b>ͬѧ�����κε����ⶼ���������Ŷ~<br> �������׳��������и��õ�����Ŷ
				</b>
			</div>
		</div>
		<div class="problums">
			<div class="frame1">
				<img src="imgs/f.jpg" alt="" class="com_head1">
				<div class="name1">
					���꼶2��<br>������
				</div>
				<div class="frame_1">����:</div>
				<form action="modify" method="post">
					<textarea rows="6" cols="25" class="problum_1" name="question1">��԰��·����һ����,ÿ����֮�����3��,���ʵ�һ�����͵�������֮����������ף�</textarea>
					<input type="text" class="comment_tea1" value="Tom:" name="answer1">
					<input type="submit" value="����" class="submit_tea1">
				</form>
			</div>

			<div class="frame2">
				<img src="imgs/g.jpg" alt="" class="com_head2">
				<div class="name1">
					���꼶3��<br>�����
				</div>
				<div class="frame_1">����:</div>

				<form action="modify" method="post">
					<textarea rows="6" cols="25" class="problum_1" name="question1">�ס�������ͬʱ�ϴ�һ��7000�ֵĸ������ÿСʱ��600�֣��ұȼ�ÿСʱ���200�֣�������Сʱ�����������</textarea>
					<input type="text" class="comment_tea2" value="Jack:" name="answer1">
					<input type="submit" value="����" class="submit_tea2">
				</form>

			</div>

			<div class="frame3">
				<img src="imgs/d.jpg" alt="" class="com_head3">
				<div class="name3">
					���꼶2��<br>��ЦЦ
				</div>
				<div class="frame_3">��������</div>
				<form action="similar" method="post">
					<textarea cols="6" rows="25" wrap="hard" class="problum_sub" name="ask">
              	    </textarea>
					<input type="submit" value="��  ��" class="sub"> 
				</form>
				<a href="Problums.jsp" class="prob"><b>�����ʹ�������</b></a>
			</div>
		</div>
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