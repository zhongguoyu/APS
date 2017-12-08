<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="js/jquery-1.8.0.js"></script>
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
	a{
		text-decoration: none;
	}
	.clear:after{
		content:"";
		clear: both;
		display: block;
	}
	.applyAdopt{
		width:100%;
		height: 360px;
		background-image:url(image/main/applyAdopt2.jpg);
		background-size: cover;
		background-position: 0px -220px;
		margin-bottom: 110px;
	}
	
	.applyAdoptTitle{
		width:100%;
		text-align: center;
		font-size: 30px;
		color: #FF6200;
	}
	.applyAdoptTitle p{
		color:#666666;
		font-size: 16px;
	}
	.applyAdoptContent{
		width: 84%;
		margin: auto;
	}
	.applyAdoptLeft{
		width:50%;
		float: left;
	}
	.applyAdoptLeft input{
		width:80%;
		height: 30px;
		background-color: #F6F6F6;
		font-size: 16px;
		line-height: 30px;
		border: 0px;
		margin-top: 10px;
		margin-bottom: 20px;
	}
	.applyAdoptLeft textarea{
		width:80%;
		height: 120px;
		font-size: 16px;
		line-height: 30px;
		background-color: #F6F6F6;
		border: 0px;
		margin-top: 10px;
		margin-bottom: 20px;
		resize:none;
	}
	.applyAdoptRight{
		width:50%;
		float:left;
		text-align: center;
	}
	.applyReal{
		font-size: 19px;
		color: #FF6200;
	}
	.applyAdoptCot{
		font-size:14px;
		color: #9999A5;
		font-weight: bold;
	}
	.promptInfo{
		font-size:14px;
		padding-left: 10px;
	}
	#aniInfo{
		width: 420px;
		height: 540px;
		position: absolute;
		left:600px;
		top:795px;
		background-color: azure;
		display: none;
	}
	#xx:HOVER {
	cursor: pointer;
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
	<!-- 中间部分 -->
	<div style="width: 100%">
		<div class="applyAdopt"></div>
		<div class="applyAdoptTitle">
			领养申请<br>
			<p>拥有一个陪你慢慢变老的家人</p>
			<img src="image/main/v2.png" style="margin: 30px auto">
		</div>
		<div class="applyAdoptContent clear">
			<div class="applyAdoptLeft">
				<span class="applyReal">请认真填写以下内容</span><br><br>
				<form method="post" onSubmit="return check()" action="addApplyAdopt.do">
					<span class="applyAdoptCot" id="applyAdoptCot">请输入姓名：</span>
					<span class="promptInfo"></span><br>
					<input type="text" name="applyName" id="applyName" onBlur="nameCheck(this)"><br>
					<span class="applyAdoptCot">您想领养哪一只动物：</span>
					<span  class="promptInfo"></span><br>
					<input type="text" name="animalId" id="animalId" value="${animalId}" onBlur="idCheck(this)"><a href="javascript:animal()" style="display: none" id="Info">查看信息</a><br>
					<span class="applyAdoptCot">请输入你的家庭地址：</span>
					<span  class="promptInfo"></span><br>
					<input type="text" name="address" id="city"><br>
					<span class="applyAdoptCot">输入您的手机号码：</span>
					<span  class="promptInfo"></span><br>
					<input type="text" name="applyPhone" id="applyPhone" onBlur="checkInfo(this)"><br>
					<span class="applyAdoptCot">申诉你的申请理由：</span>
					<span  class="promptInfo"></span><br>
					<textarea name="applyReason" id="applyReason"></textarea><br>
					<span class="applyAdoptCot">请输入验证码：</span>
					<span  class="promptInfo"></span><br>
					<input type="text" name="checkCode" id="checkCode" onBlur="codeCheck()">
					<div id="v_container" style="width: 200px;height: 50px;"></div><br>
					<input type="submit" value="提交">
				</form>
			</div>
			<div class="applyAdoptRight">
				<img src="image/main/applyAdopt.jpeg" style="margin: 45px auto">
			</div>
		</div>
	</div>
	<div id="aniInfo">
		<div style="width: 100%;font-size: 24px;margin-left: 380px;margin-top: 10px" onClick="closeAbs()" id="xx">X</div>
		<div id="animal"></div>
		<div style="width: 100%;margin-left: 360px"><input type="button" value="确认" onClick="closeAbs()"></div>
	</div>
	<!-- 页尾 -->
	<div>
		<%@include file="bottom.jsp"%>
	</div>
</body>
<script>
var verifyCode = new GVerify("v_container");
$("#city").click(function (e) {
SelCity(this,e);
console.log("inout",$(this).val(),new Date())
});
var nameFlag;
var telFlag;
var dogId;
var codeInput;
function nameCheck(obj){
	var str = $(obj).val();
	var rule = /^[\u4E00-\u9FA5]{2,4}$/;
	if(!rule.test(str)){
		$(obj).prev().prev().html("姓名填写不正确");
		$(obj).prev().prev().css("color","red");
		nameFlag = false;
	}else{
		$(obj).prev().prev().html("正确");
		$(obj).prev().prev().css("color","lightgreen");
		nameFlag = true;
	}
}
function checkInfo(obj){
	var str = $(obj).val();
	var rule =/^[1][3,4,5,7,8][0-9]{9}$/; 
	if(!rule.test(str)){
		$(obj).prev().prev().html("手机号码错误");
		$(obj).prev().prev().css("color","red");
		telFlag = false;
	}
	else{
		$.ajax({
			type:"post",
			url:"checkTel.do",
			data:{"applyPhone":str},
			success:function(data){
				if(data=='"error"'){
					$(obj).prev().prev().html("该手机号码已经被注册");
					$(obj).prev().prev().css("color","red");
					telFlag = false;
					return;
				}
			}
		})
		$(obj).prev().prev().html("正确");
		$(obj).prev().prev().css("color","lightgreen");
		telFlag = true;
	}
}
function idCheck(obj){
	var str = $(obj).val();
	var rule = /^\d+$/;
	if(!rule.test(str)){
		$(obj).prev().prev().html("芯片Id错误");
		$(obj).prev().prev().css("color","red");
		dogId = false;
	}else{
		$.ajax({
			type:"post",
			url:"judge.do",
			data:{"animalId":str},
			success: function(data){
				if(data=='"正确"'){
					$(obj).prev().prev().html(eval(data));
					$(obj).prev().prev().css("color","lightgreen");
					$(obj).next().css("display","block");
					dogId = true;
				}
				else{
					$(obj).prev().prev().html(eval(data));
					$(obj).prev().prev().css("color","red");
					dogId = false;
				}
			}
		})
	}
}
function codeCheck(){
	var res = verifyCode.validate($("#checkCode").val());
		if(res){
			$("#checkCode").prev().prev().html("验证成功");
			$("#checkCode").prev().prev().css("color","lightgreen");
			codeInput = true;
		}else{
			$("#checkCode").prev().prev().html("验证码错误");
			$("#checkCode").prev().prev().css("color","red");
			codeInput = false;
		}
}
function check(){
	if($("#address").val()==""){
		return false;
	}
	if(!nameFlag){
		return false;
	}
	if(!telFlag){
		return false;
	}
	if(!dogId){
		return false;
	}
	if(!codeInput){
		return false;
	}
}
function animal(){
	var animalId = $("#animalId").val();
	$("#aniInfo").css("display","block");
	 $.ajax({
		type:"post",
		url:"findAniInfoById.do",
		data:{"animalId":animalId},
		success:function(data){
			$("#animal").html(data);
		}
	}) 
}
function closeAbs(){
	$("#aniInfo").css("display","none");
}
</script>
</html>