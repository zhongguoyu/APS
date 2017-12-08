<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="include/tag.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript" src="js/jquery-1.8.0.js"></script>
<style>
	*{
		margin: 0px;
	}
	.top{
		width:100%;
		height:50px;
		background: #444444;
		color:white;
		text-align: center;
		line-height: 50px;
		font-size: 18px;
	}
	.clear:after{
		content:"";
		display:block;
		clear: both;
	}
	.menu{
		float:left;
		width:13%;
		height:800px;
		background-color: gray;
		color:white;
	}
	.menu ul{
		list-style: none;
		margin-top: 50px;
	}
	.menu ul li{
		height:50px;
		line-height: 50px;
		margin-left: -75px;
		padding-left: 50px;
	}
	.menu ul li:hover{
		background-color:#ccc;
		cursor: pointer;
	}
	#content{
		float:left;
		width:87%;
		height:800px;
		text-align: center;
	}
	#content div{
		background: url("image/main/welcome.jpg");
		background-size:cover;
		height:800px;
		line-height:500px;
		width:100%;
		font-size: 28px;
		color: gray;
	}

</style>
<body>
	<div class="top">管理页面</div>
	<div class="clear">
		<div class="menu">
			<ul>
				<li id="menu1">领养申请管理</li>
				<li id="menu2">志愿者申请管理</li>
				<li id="menu7">查看留言</li>
				<li id="menu3">新闻添加</li>
				<li id="menu4">协会动态添加</li>
				<li id="menu8">志愿者活动添加</li>
				<li id="menu5">志愿者活动新闻添加</li>
				<li id="menu6">流浪动物添加</li>
			</ul>
		</div>
		<div id="content">
			<c:if test="${success == null}">
				<div>欢迎${loginUser.userName}登录!!</div>
			</c:if>
			<c:if test="${success != null}">
				<div>${success }</div>
			</c:if>
		</div>
	</div>
</body>
<script>
	$("#menu1").click(function(){
		$.ajax({
			type:"post",
			url:"changeMenu1.do",
			success:function(data){
				$("#content").html(data);
			}
		})
	})
	
	$("#menu2").click(function(){
		$.ajax({
			type:"post",
			url:"changeMenu2.do",
			success:function(data){
				$("#content").html(data);
			}
		})
	})
	
	$("#menu3").click(function(){
		$.ajax({
			type:"post",
			url:"changeMenu3.do",
			success:function(data){
				$("#content").html(data);
			}
		})
	})
	
	$("#menu4").click(function(){
		$.ajax({
			type:"post",
			url:"changeMenu4.do",
			success:function(data){
				$("#content").html(data);
			}
		})
	})
	
	$("#menu5").click(function(){
		$.ajax({
			type:"post",
			url:"changeMenu5.do",
			success:function(data){
				$("#content").html(data);
			}
		})
	})
	
	$("#menu6").click(function(){
		$.ajax({
			type:"post",
			url:"changeMenu6.do",
			success:function(data){
				$("#content").html(data);
			}
		})
	})
	
	$("#menu7").click(function(){
		$.ajax({
			type:"post",
			url:"changeMenu7.do",
			success:function(data){
				$("#content").html(data);
			}
		})
	})
	
	$("#menu8").click(function(){
		$.ajax({
			type:"post",
			url:"changeMenu8.do",
			success:function(data){
				$("#content").html(data);
			}
		})
	})
</script>
</html>