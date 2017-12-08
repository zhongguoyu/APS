<%@page import="com.aps.util.Token"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<link rel="stylesheet" type="text/css" href="css/volunteer/lq.datetimepick.css" />
<script src="js/volunteer/jquery.min.js"></script>
<script src="js/volunteer/gVerify.js"></script>
<script src="js/volunteer/jquery-1.11.3.min.js"></script>
<script src="js/volunteer/Popt.js"></script>
<script src="js/volunteer/cityJson.js"></script>
<script src="js/volunteer/citySet.js"></script>
</head>
<style>
	*{
		margin:0px;
	}
	.clear{
		content:"";
		clear: both;
		display: block;
	}
	#tab span{
		color: darkgrey;
		font-weight: bold;
	}
._citys {
	width: 450px;
	display: inline-block;
	border: 2px solid #eee;
	padding: 5px;
	position: relative;
	background-color:white;
}
._citys span {
	color: #56b4f8;
	height: 15px;
	width: 15px;
	line-height: 15px;
	text-align: center;
	border-radius: 3px;
	position: absolute;
	right: 10px;
	top: 10px;
	border: 1px solid #56b4f8;
	cursor: pointer;
}
._citys0 {
	width: 100%;
	height: 34px;
	display: inline-block;
	border-bottom: 2px solid #56b4f8;
	padding: 0;
	margin: 0;
}
._citys0 li {
	display: inline-block;
	line-height: 34px;
	font-size: 15px;
	color: #888;
	width: 80px;
	text-align: center;
	cursor: pointer;
}
.citySel {
	background-color: #56b4f8;
	color: #fff !important;
}
._citys1 {
	width: 100%;
	display: inline-block;
	padding: 10px 0;
}
._citys1 a {
	width: 83px;
	height: 35px;
	display: inline-block;
	background-color: #f5f5f5;
	color: #666;
	margin-left: 6px;
	margin-top: 3px;
	line-height: 35px;
	text-align: center;
	cursor: pointer;
	font-size: 13px;
	overflow: hidden;
}
._citys1 a:hover {
	color: #fff;
	background-color: #56b4f8;
}
.AreaS {
	background-color: #56b4f8 !important;
	color: #fff !important;
}
input{
	border:0.5px solid lightgray;
}
</style>
<body>
	<!-- 页头 -->
	<div><%@include file="head.jsp"%></div>
	<div>
		<img src="image/volunteer/v1.jpg" width="100%">
	</div>
	<div style="width:1200px;height: 50px;margin: auto;"></div>
	<div style="width:1200px;height: 900px;margin: auto;">
		<div style="text-align: center;">
			<span style="font-size: 28px; color: rgb(255, 98, 0); background-color: transparent;">志愿者报名</span>
		</div>
		<div style="text-align: center; ">
			<font style="color: rgb(102, 102, 102);" color="#666666">
            	<span style="font-size: 15px;">始终维护动物的生存权利和不受虐待的权利</span>
            </font>
		</div>
		<div>
			<img src="image/volunteer/v2.png">
		</div>
		<div>
			<font style="color: rgb(255,101,55);" color="#ff65337">
				<span style="font-size: 20px;">请认真填写以下内容</span>
			</font>
		</div>
		<div class="clear" style="width:1200px;">
			<div style="width:737px;height: 839px;float: left">
				<div style="height: 20px;width: 730px;"></div>
				<form action="skip.do" method="post" onsubmit="return sumbit()" accept-charset="UTF-8">
					<table id="tab" border="0" cellpadding="0" cellspacing="0" width="730">
						<tr>
							<td height="25"><span style="color: red">*</span><span>您的姓名：</span></td>
						</tr>
						<tr>
							<td height="35">
								<input id="name" name="name" onBlur="nameCheck()" type="text" size="60"  style="height: 25px;background-color:#F6F6F6">
								<span id="nameError" style="font-size: 15px;font-weight:normal;"></span>
							</td>
						</tr>
						<tr>
							<td height="25"><span style="color: red">*</span><span>您的生日：</span></td>
						</tr>
						<tr>
							<td height="35">
								<input type="text" size="60" style="height: 25px;background-color:#F6F6F6"  name="datepicker" id="datetimepicker3" class="form-control" value=" " />
							</td>
						</tr>
						<tr>
							<td height="45" rowspan="1">
								<span style="color: red">*</span><span>您的性别：</span>
								<input id="sex1" type="radio" name="sex" value="男">男&nbsp;&nbsp;&nbsp;<input id="sex2" type="radio" name="sex" value="女" >女	
							</td>
						</tr>
						<tr>
							<td height="25"><span style="color: red">*</span><span>您的手机号：</span></td>
						</tr>
						<tr>
							<td height="35">
								<input type="text" id="phone" name="phone" size="60"  style="height: 25px;background-color:#F6F6F6" onBlur="phoneCheck()"><span id="phoneError" style="font-size: 15px;font-weight:normal;color: red;"></span>
							</td>
						</tr>
						<tr>
							<td height="25"><span style="color: red">*</span><span>您的邮箱：</span></td>
						</tr>
						<tr>
							<td height="35">
								<input id="email" name="email" onBlur="emlCheck()" type="text" size="60"  style="height: 25px;background-color:#F6F6F6">
								<span id="emailError" style="font-size: 15px;font-weight:normal;"></span>
							</td>
						</tr>
						<tr>
							<td height="25"><span style="color: red">*</span><span>您的地址：</span></td>
						</tr>
						<tr>
							<td height="35">
								<input type="text" name="address"  style="height: 25px;background-color:#F6F6F6" size="60" id="city"  />
								<span id="cityError" style="font-size: 15px;font-weight:normal;"></span>
							</td>
						</tr>
						<tr>
							<td height="25"><span>您的学历：</span></td>
						</tr>
						<tr>
							<td height="35">
								<input id="education" name="education" type="text" size="60"  style="height: 25px;background-color:#F6F6F6">
							</td>
						</tr>
						<tr>
							<td height="25"><span>您希望从事的工作：</span></td>
						</tr>
						<tr>
							<td height="35">
								<input id="work" name="exceptWork" type="text" size="60"  style="height: 25px;background-color:#F6F6F6">
							</td>
						</tr>
						<tr>
							<td height="25"><span style="color: red">*</span><span>验证码：</span></td>
						</tr>
						<tr>
							<td height="35">
								<table width="730" border="0" cellpadding="0" cellspacing="0">
									<tr>
										<td width="400"><input type="text" size="60" style="height: 25px;background-color:#F6F6F6" id="code_input"/></td>
										<td><div id="v_container" style="width: 200px;height: 50px;"></div></td>
									</tr>
								</table>
							</td>
						</tr>
						<tr>
							<td height="60">
								<input type="submit" style="box-shadow:10px; background-color:#FF4747 ;color: white;width: 200px;height: 40px;border: 0px; outline: none; cursor: pointer;box-shadow:1px 1px 1px black ;" value="提交">
							</td>
						</tr>
					</table>
					<input type="hidden" name="token" value="<%=Token.createToken(session)%>">
				</form>
			</div>
			<div style="width: 463px;height: 600px;background-image:url(image/volunteer/v3.jpg);float: left"></div>
		</div>
	</div>
	<!-- 页尾 -->
	<div>
		<%@include file="bottom.jsp"%>
	</div>
</body>
<script src="js/volunteer/jquery.js"></script>
<script src="js/volunteer/lq.datetimepick.js"></script>
<script src="js/volunteer/selectUi.js"></script>
<script>
	var verifyCode = new GVerify("v_container");
	function sumbit(){
		var userName = $("#name").val();
		if(userName==""){
			alert("请输入姓名");
			return false;
		}
		else{
			var birthday = $("#datetimepicker3").val();
			if(birthday==""){
				alert("请输入生日");
				return false;
			}
			else{
				var sex1=document.getElementById("sex1");
				var sex2=document.getElementById("sex2");
				if(sex1.checked!=true&&sex2.checked!=true){
					alert("请选择性别");
					return false;
				}
				else{
					var phone = $("#phone").val();
					var rule = /^1\d{10}$/;
					$.ajax({
						type:"post",
						url:"checkphone.do",
						data:{"phone":phone},
						success:function(data){
							if(data=="error"){
								alert("该手机号已申请");
								return false;
							}
							
						}
					})
					if(phone==""){
						alert("请输入手机号");
						return false;
					}
					else if(!rule.test(phone)){
						alert("手机号格式错误");
						return false;
					}
					else{
						var rule2 = /^\w+@\w+\.(com|cn|org)$/;
						var email = $("#email").val();
						if(email==""){
							alert("请输入邮箱")
							return false;
						}
						else if(!rule2.test(email)){
							alert("邮箱格式错误")
							return false;
						}
						else{
							var city = $("#city").val();
							if(city==""){
								alert("请输入地址")
								return false;
							}
							else{
								var res = verifyCode.validate(document.getElementById("code_input").value);
								if(res){
									return true;
								}
								else{
									alert("验证码错误");
									return false;
								}
							}
						}
					}
				}
			}
		}
	}
	$("#city").click(function (e) {
		SelCity(this,e);
		console.log("inout",$(this).val(),new Date())
	});
	
	$(function() {
		$("#datetimepicker3").on("click", function(e) {
			e.stopPropagation();
			$(this).lqdatetimepicker({
				css : 'datetime-day',
				dateType : 'D',
				selectback : function() {
					
				}
			});
		});
	});
	function nameCheck(){
		//获取文本框的值
		var userName = $("#name").val();
		//将文本框下一个相邻标签（错误提示的span）内容清空
		$("#name+").html("");
		var rule = /^\w{1,8}$/;
		if(userName==""){
			var sp=$("#name+").get(0);
			sp.style.color="red"
			$(event.srcElement).next().html("请输入姓名");
		}
	}
	function phoneCheck(){
		//获取文本框的值
		var phone = $("#phone").val();
		//将文本框下一个相邻标签（错误提示的span）内容清空
		$("#phone+").html("");
		var rule = /^1\d{10}$/;
		if(phone==""){
			var sp=$("#phone+").get(0);
			sp.style.color="red"
			$(event.srcElement).next().html("请输入手机号");
			return false;
		}
		if(!rule.test(phone)){
			var sp=$("#phone+").get(0);
			sp.style.color="red"
			//呈现错误信息
			$(event.srcElement).next().html("手机号格式错误");
			return false;
		}
		checkP(phone);

	}
	function checkP(phone){
		$.ajax({
			type:"post",
			url:"checkphone.do",
			data:{"phone":phone},
			success:function(data){
				if(data=="error"){
					$("#phoneError").html("该手机号已申请");
					return false;
				}
			}
		})
	}
	function emlCheck(){
		//获取文本框的值
		var email = $("#email").val();
		//将文本框下一个相邻标签（错误提示的span）内容清空
		$("#email+").html("");
		var rule = /^\w+@\w+\.(com|cn|org)$/;
		if(email==""){
			var sp=$("#email+").get(0);
			sp.style.color="red"
			$(event.srcElement).next().html("请输入邮箱");
		}
		else if(!rule.test(email)){
			var sp=$("#email+").get(0);
			sp.style.color="red"
			//呈现错误信息
			$(event.srcElement).next().html("邮箱格式错误");
		}
	}
</script>
</html>