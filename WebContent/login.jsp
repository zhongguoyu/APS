<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link type="text/css" rel="stylesheet" href="css/allNews.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript" src="js/jquery-1.8.0.js"></script>
<style>
.bgimage {
	width: 100%;
	height: 780px;
	background-image: url(image/main/11.jpg);
	background-size: cover;
}

.login {
	margin:auto;
	padding-top: 30px;
	width: 500px;
	height: 400px;
	
}

.useranme {
	margin-top: 30px;
	margin-left: 60px;
}
#my_button{
	width: 90px;
	height: 30px;
	background-color:#F8BA68;
	color: white; 
	font-size: 14px;
	line-height: 28px;
	border-radius: 10px 10px 10px 10px;
	cursor: pointer;
	margin-top:20px;
	margin-bottom: 40px;
	margin-left: 100px;
	outline: none;
}
form{
	width:500px;
	margin: auto;
	border: 5px solid #A6A6A6;
	margin-top: 80px;
}
span{
	display: inline-block;
	width: 80px;
	text-align: right;
	color: gray;
	font-size: 13px;
}
.error{
	text-align: left;
	color: red; 
	margin-left: 5px;
}
input{
	margin-left: 20px;
}
</style>
<body>
	<div class="bgimage">
		<div class="login">
			<form action="login.do" method="post" onsubmit="return check()">
				<div class="useranme">
					<span>用户名:</span>
					<input name="userName" id="userName" placeholder="userName" onblur="checkName()" value="">
					<span class="error">${usernameerror}</span>
				</div>
				<div class="useranme">
					<span>用户密码:</span>
					<input name="password" type="password" id="password" placeholder="password" value="" onblur="checkPwd()">
					<span class="error">${pwderror}</span>
				</div>
				<div id="v_container"
					style="width: 175px; height: 35px; margin-top: 30px; margin-left: 160px;"></div>
				<div class="useranme">
					<span>验证码:</span>
					<input type="text" id="code_input" value="" placeholder="请输入验证码" onblur="checkCode()" />
					<span class="error"></span>
				</div>
				<div class="useranme">
					<input id="my_button" type="submit" value="登录">
				</div>
			</form>
		</div>
	</div>
</body>
<script src="js/volunteer/gVerify.js"></script>
<script>
	var verifyCode = new GVerify("v_container");
	function checkCode() {
		$("#code_input").next("span").html("");
		var res = verifyCode.validate(document.getElementById("code_input").value);
		if($("#code_input").val()==""){
			$("#code_input").next("span").html("请输入验证码");
			return false;
		}
		if (!res) {
			$("#code_input").next("span").html("验证码错误");
			return false;
		}
		return true;
	}
	function checkName(){
		$("#userName").next("span").html("");
		var userName = $("#userName").val();
		if (userName=="") {
			$("#userName").next("span").html("请输入用户名");
			return false;
		}
		return true;
	}
	function checkPwd(){
		$("#password").next("span").html("");
		var password = $("#password").val();
		if (password=="") {
			$("#password").next("span").html("请输入密码");
			return false;
		}
		return true;
	}
	function check(){
		if(!checkCode()||!checkName()||!checkPwd()){
			return false;
		}
	}
</script>

</html>