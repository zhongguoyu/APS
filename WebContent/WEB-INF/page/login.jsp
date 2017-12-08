<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link type="text/css" rel="stylesheet" href="css/allNews.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<style>
		.bgimage{
			width: 100%;
			height: 780px;
			background-image: url(image/main/11.jpg);
			background-size: cover;
			
		}
		.login{
			margin-left: 460px;
			padding-top: 30px;
			width: 500px;
			height: 600px;
			border: 5px solid #A6A6A6;
		}
		.useranme{
			margin-top: 30px;
			margin-left: 60px;
		}
	
	</style>
<body>
<div class="bgimage">
	<div class="login">
		<form action="login.do" method="post">
			<div class="useranme">请输入用户名<input name="userName" placeholder="userName"></div>
			<div class="useranme">输入用户密码<input name="password" type="password" placeholder="password"></div>
			<div id="v_container" style="width: 200px;height: 50px;"></div>
			<input type="text" id="code_input" value="" placeholder="请输入验证码"/><button id="my_button">验证</button>
			<div class="useranme">登录<input type="submit" value="Login"></div>
		</form>
	</div>
</div>
</body>
<script src="js/gVerify.js"></script>
	<script>
		var verifyCode = new GVerify("v_container");

		document.getElementById("my_button").onclick = function(){
			var res = verifyCode.validate(document.getElementById("code_input").value);
			if(res){
				alert("验证正确");
			}else{
				alert("验证码错误");
			}
		}
	</script>


</html>