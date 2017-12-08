<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="js/jquery-1.8.0.js"></script>
<script src="js/jquery-1.8.3.min.js"></script>

</head>
<style>
.clear:after{
	content: "";
	clear: both;
	display: block;
}
.title{
	width: 100%;
	height: 360px;
	background-image: url("image/animal/what.jpg");
	background-size:cover;
	background-position: 0px -400px;
}
.write{
	width: 100%;
	text-align: center;
	font-size: 40px;
	color: #F43E41;
	font-style:oblique;
	padding-top: 60px;
	padding-bottom: 40px;
}
.first{
	width: 90%;
	padding-bottom:60px;
	margin: auto;
}
.firstLeft{
	width: 45%;
	float: left;
	height: 500px;
	background-image:url("image/newsImages/5.jpg");
	background-size:cover;
	background-position: 0px -60px;
}
.firstRight{
	width: 54%;
	height: 400px;
	margin-top:80px;
	float:left;
	font-size: 16px;
	line-height: 50px;
}

.second{
	width: 90%;
	margin: auto;
}
.secondLeft{
	width: 58%;
	float: left;
	margin-bottom: 60px;
	margin-top: 30px;
}
.money{
	width:135px;
	height:35px;
	line-height:35px;
	font-size:15px;
	text-align:center;
	border:1px solid lightgrey;
	border-radius:5px;
	background-color:azure;
	margin-left:10px;
	margin-bottom: 30px;
}
.money:HOVER{
	cursor: pointer;
}
.tCount{
	font-size: 14px;
	color: #666666;
}
.otherInput{
	width: 70%;
	height: 30px;
	border:1px solid lightgrey;
	font-size: 16px;
}
.donateCot{
	font-size:14px;
	color: #9999A5;
	font-weight: bold;
	margin-top: 10px;
}
.promptInfo{
		font-size:14px;
		padding-left: 10px;
}
#message1{
	width: 70%;
	height: 150px;
	resize:none;
}
#sub{
	width: 150px;
	height: 50px;
	background-color: #F43E41;
	border:0px;
	font-size: 24px;
	color:lightgrey;
	text-align: center;
	line-height: 50px;
	margin-left: 40px;
}
#sub:HOVER {
	cursor: pointer;
}
.myscroll { width: 100%; height: 260px;border: 1px solid #ccc; line-height: 26px; font-size: 12px; overflow: hidden;margin-top: 40px;}
.myscroll li { margin-left: 25px;list-style-type: none;}
.myscroll a { color: #333; text-decoration: none;}
.myscroll a:hover { color: #ED5565; text-decoration: underline;}
.dimg{
		width: 19%;
		margin-left:10px;
		height: 100px;
		float: left;
		background-position:center;
		background-size:cover;
		margin-bottom: 40px;
	}
</style>
<body>
	<div style="width: 100%">
		<!-- 页头 -->
	<div><%@include file="head.jsp"%></div>
	<div style="width: 100%">
		<div class="title"></div>
		<div class="write">心为他，爱助力</div>
		<div class="clear first">
			<div class="firstLeft"></div>
			<div class="firstRight">
				<p>APS小动物保护协会是于1992年，在民政部注册建立的国家一级动物保护公益性</p>
				<p>社团，我们虽然没有政府资金扶持，且所有收入均来源于社会捐赠，但自建会以</p>
				<p>来就一直致力于动物保护事业的宣传推广和实践工作。目前我们在北京的流浪动</p>
				<p>物收容基地仍收容着近800只无主流浪动物。</p>
				<p>我们倡导大家奉献自己的爱心（金额多少不限），帮助基地中被收容的和社会无</p>
				<p>主流浪动物，帮助地球家园上的动物朋友们！</p>
			</div>
		</div>
	</div>
	<div class="second clear">
		<!-- 左边捐款 -->
		<div class="secondLeft">
			<div style="margin-left: 30px;font-size: 16px; color: lightred;margin-bottom: 20px">已经收到捐款：￥<span class="tCount">${mCount }</span>
			<span style="margin-left: 200px;">捐款总人数:</span>
			<span style="" class="tCount">${pCount }</span></div>
			<div style="font-size: 19px;color: #777777;padding-left: 20px;margin: 20px 10px;" id="asd"></div>
			<input type="button" class="money" value="10元" onclick="info(this)">
			<input type="button" class="money" value="50元" onclick="info(this)">
			<input type="button" class="money" value="100元" onclick="info(this)">
			<input type="button" class="money" value="200元" onclick="info(this)">
			<input type="button" class="money" value="500元" onclick="info(this)"><br>
			<span class="donateCot">其它金额：</span>
			<span  class="promptInfo" id="xxs"></span><br>
			<input type="text" class="otherInput" id="moneyCheck" onclick="disInfo()" onblur="moneyCheck(this)"><br><br>
			<form method="post" action="addDonate.do" onsubmit="return check()">
			<input type="hidden" id="hidd" name="donateMoney">
			<span class="donateCot">姓名：</span>
			<span  class="promptInfo"></span><br>
			<input type="text" class="otherInput" name="donateName" id="donateName" onblur="nameCheck(this)"><br><br>
			<span class="donateCot">邮箱：</span>
			<span  class="promptInfo"></span><br>
			<input type="text" class="otherInput" name="email" id="email" onblur="emailCheck(this)"><br><br>
			<span class="donateCot">手机号码：</span>
			<span  class="promptInfo"></span><br>
			<input type="text" class="otherInput" name="phone" id="phone" onBlur="checkInfo(this)"><br><br>
			<span class="donateCot">想说的话：</span>
			<span  class="promptInfo"></span><br>
			<textarea name="message" id="message1"></textarea><br><br>
			<input type="submit" value="提交" id="sub">
			</form>
		</div>
		<!-- 右边信息展示 -->
		<div style="width: 38%;float: left;margin-top: 30px;">
		捐款信息展示：
			<div class="myscroll">
				<ul>
					<c:forEach items="${list1}" var="list1">
						<li><span style="width: 30%;display: inline-block;">${list1.donateName}</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;捐款￥${list1.donateMoney}</li>
					</c:forEach>
				</ul>
			</div>
		留言信息展示：
			<div class="myscroll">
				<ul>
					<c:forEach items="${list2}" var="list2">
						<li>${list2.name} <fmt:formatDate value="${list2.messageTime}" pattern="yyyy-MM-dd"/></li>
						<li><span style="color: #666666">${list2.content }</span></li>
					</c:forEach>
				</ul>
			</div>
		</div>
	</div>
	<div class="write" style="text-align: left;padding-left: 60px;font-size: 24px">我们的伙伴:</div>
	<div class="clear" style="width:100%;margin: auto">
		<div class="dimg" style="background-image: url(image/2.jpg)"></div>
		<div class="dimg" style="background-image: url(image/icbc.jpg);"></div>
		<div class="dimg" style="background-image: url(image/4.jpg);"></div>
		<div class="dimg" style="background-image: url(image/timg.jpg);background-position: 0px -50px;"></div>
		<div class="dimg" style="background-image: url(image/下载.jpg);"></div>
	</div>
	<!-- 页尾 -->
	<div>
		<%@include file="bottom.jsp"%>
	</div>
	</div>
</body>
<script src="js/scroll.js"></script>
<script>
var nameFlag=false;
var telFlag=false;
var moneyFlag=false;
var emailFlag=false;
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
	}else{
		$(obj).prev().prev().html("正确");
		$(obj).prev().prev().css("color","lightgreen");
		telFlag = true;
	}
}
function emailCheck(obj){
	var str = $(obj).val();
	var rule = /^\w+@\w+\.(com|cn|org)$/;
	if(!rule.test(str)){
		$(obj).prev().prev().html("请输入正确的邮箱");
		$(obj).prev().prev().css("color","red");
		emailFlag = false;
	}else{
		$(obj).prev().prev().html("正确");
		$(obj).prev().prev().css("color","lightgreen");
		emailFlag = true;
	}
}
function info(obj){
	$(".money").css("background-color","azure");
	$(".money").css("color","black");
	$(".money").css("font-weight","normal");
	$("#moneyCheck").val("");
	$("#xxs").html("");
	$(obj).each(function(){
		$(this).css("background-color","#FE6150");
		$(this).css("color","azure");
		$(this).css("font-weight","bold");
		var str = $(this).val();
		var w = str.indexOf("元");
		var newStr = str.substring(0,w);
		$("#hidd").val(newStr);
		if(str=="10元"){
			$("#asd").html("TA的一天=有粮+有水+有人照料❤");
		}else if(str=="50元"){
			$("#asd").html("没有主人≠没有人爱❤");
		}else if(str=="100元"){
			$("#asd").html("动一动手指，就奉献了一份爱");
		}else if(str=="200元"){
			$("#asd").html("少一顿聚餐，多一份拯救！");
		}else if(str=="500元"){
			$("#asd").html("我们愿意替你给TA家的温暖!");
		}
		moneyFlag = true;
	})
}
function disInfo(){
	$(".money").css("background-color","azure");
	$(".money").css("color","black");
	$(".money").css("font-weight","normal");
	$("#asd").html("");
	$("#hidd").val("");
}
function moneyCheck(obj){
	var str = $("#moneyCheck").val();
	var rule = /^([1-9][\d]{0,7}|0)(\.[\d]{1,2})?$/;
	if(!rule.test(str)){
		$(obj).prev().prev().html("请输入正确的金额");
		$(obj).prev().prev().css("color","red");
		moneyFlag = false;
	}else{
		$(obj).prev().prev().html("正确");
		$(obj).prev().prev().css("color","lightgreen");
		$("#hidd").val(str);
		moneyFlag = true;
	}
}
function check(){
	if($("#hidd").val()==""){
		return false;
	}
	if(!nameFlag){
		return false;
	}
	if(!telFlag){
		return false;
	}
	if(!moneyFlag){
		return false;
	}
	if(!emailFlag){
		return false;
	}
}
$(function(){
	$('.myscroll').myScroll({
		speed: 40, //数值越大，速度越慢
		rowHeight: 26 //li的高度
	});
});
</script>
</html>