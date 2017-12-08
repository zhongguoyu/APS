<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/bottom.css">
</head>
<script type="text/javascript" src="js/jquery-1.8.0.js"></script>
<body>
<div class="bottom clear">
	<div class="bottom-1">
		<span class="bottom-span1">Animal Protection Socity</span>
		
		<div class="bottom-div2">联系我们</div>
		<div>
			<div class="bottom-div3">联系QQ：771088853</div>
			<div class="bottom-div4"> 联系地址：江苏省苏州市虎丘区新区路</div>
		</div>
		<div>
			<div class="bottom-div5">手机号码：18362218921</div>
			<div class="bottom-div6">联系邮箱：zchwl123@163.com</div>
		</div>
		<div class="bottom-div7">联系电话：020-000000      400-000000</div>
		<div class="bottom-div8">©2017 网站APS组织 版权所有</div>
	</div>
	<div class="bottom-2">
		
		<div class="bottom-div9">发表您的留言：</div>
		<span class="error" id="error"></span>
		<div>
			<div class="bottom-div10">姓名：
				<input type="text" name="strangerName" class="messageText" id="name" placeholder="姓名不超过10个字" onBlur="judgeName()">
			</div>
			<div class="bottom-div11">电话：
				<input type="text" name="strangerPhone" class="messageText" id="phone" onBlur="judgePhone()">
			</div>
		</div>
		<div class="bottom-div12"><div>内容：</div>
			<textarea name="strangerMessage" id="message" cols="30" rows="10" class="messageText2" placeholder="150字以内" onBlur="judgeMessage()"></textarea>
		</div>
		<input type="button" value="提交留言" class="submit" id="submit" onclick="judgeSubmit()">
		
	</div>
</div>
</body>
<script type="text/javascript" src="js/bottom.js"></script>
</html>