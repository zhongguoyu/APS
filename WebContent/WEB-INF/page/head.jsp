<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="include/tag.jsp" %>
<html>
<head>
<link type="text/css" rel="stylesheet" href="css/head.css">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<script type="text/javascript" src="js/jquery-1.8.0.js"></script>
<body>
<div class="head">
	<table id="menu">
		<tr height="120px">
			<td width="40%" class="headfirsttd">Animal Protection Society</td>
			<td width="10%"><a href="index.jsp" class="headA">首页</a></td>
			<td width="10%"><a href="introduce.do" class="headA">关于APS</a></td>
			<td width="10%">
				<div id="newsAll">
					<a href="#" class="headA" id="newsCenter">新闻中心</a>
					<div class="headul1">
						<div><a href="allAssociation.do?page=1" class="headA2">协会动态</a></div>
						<div><a href="allNews.do?page=1" class="headA2">动保资讯</a></div>
					</div>
				</div>
			</td>
			<td width="10%">
				<div id="apsAll">
					<a href="#" class="headA" id="apsLocation">APS基地</a>
					<div class="headul2">
						<div><a href="baseInfo.do" class="headA2">基地介绍</a></div>
						<div><a href="baseAnimal.do?page=1" class="headA2">基地小动物</a></div>
						<div><a href="adoptView.do" class="headA2">领养窗口</a></div>
						<div><a href="goLoveAdopt.do?animalId=" class="headA2">认养中心</a></div>
					</div>
				</div>
			</td>
			<td width="10%">
				<div id="volunteerAll">
					<a href="#" class="headA" id="volunteerCenter">志愿者中心</a>
					<div class="headul3">
						<div><a href="volunteer.do" class="headA2">招募与报名</a></div>
						<div><a href="allActivity.do?page=1" class="headA2">活动与资讯</a></div>
					</div>
				</div>	
			</td>
			<td width="10%"><a href="goDonate.do" class="headA">支持APS</a></td>
		</tr>
	</table>
</div>


</body>
<script type="text/javascript" src="js/head.js"></script>
</html>