<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>首页</title>
<link href="css/index.css" type="text/css" rel="stylesheet">
<script src="http://www.jq22.com/jquery/jquery-1.10.2.js"></script>
<script src="js/jquery-1.8.0.js"></script>
</head>
<body>
	<!-- 页头 -->
	<div><%@include file="head.jsp"%></div>
	<!-- 内容 -->
	<div class="body">
		<!-- box轮播盒子 -->
		<div class='banner-box'>
			<ul class='img'>
				<li><img src="image/main/trim1.jpg" /></li>
				<li><img src="image/main/trim2.jpg" /></li>
				<li><img src="image/main/trim3.jpg" /></li>
			</ul>
			<ul class='li'></ul>
			<div class='but but-left'>&lt;</div>
			<div class='but but-right'>&gt;</div>
			<div class='bar'></div>
		</div>
		<!-- 关于我们 -->
		<div class="AboutUs">
			<div class="AboutUsCtn clear">
				<div class="AboutUsLeft">
					<div class="AboutUsLeftTitle">
						<span style="font-size: 32px"> 关于我们 </span><br> <br> <br>
						<p>
							小动物保护协会由流浪动物收容所负责人和一批爱心人士于2004年7月开始筹备，2005年3月正式向市农业局提出申请。于2005年9月份在市农业局，民政局的具体指导下和社会各界爱心人士支持下成立的。
							我们的宗旨是：以宣传，保护，救助，领养，珍爱生命......</p>
						<a href="introduce.do" class="AboutUsLefta">了解详情</a>
					</div>
				</div>
				<div class="AboutUsRight">
					<img src="image/main/AboutUs.png">
				</div>
			</div>
		</div>
	</div>
	<!-- 拯救流浪动物 -->
	<div style="width: 100%">
		<div class="saveAnimal">
			<div class="saveFirst">流浪动物救治，伤势治疗</div>
			<hr style="width: 90px; height: 1px; background-color: #FFFFFF">
			<div class="saveSecond">协会日常的主要工作之一就是救助流浪的小动物。我们的救助对象为病残的流浪猫狗，特别是不给于救助便会危及生命的小动物，我们会竭尽所能给与救助。被救助的流浪动物都被带到协会基地暂养，治疗伤势、
				等待被新主人领养。每周末协会会组织义工去基地劳动，任何人都可报名参加。劳动日里，工义们打可以帮忙扫狗舍、为小动物修建毛发、或者只是单纯的陪它们玩耍。</div>
			<div class="clear saveThird">
				<div class="st">
					<div class="st1">${allCount}</div>
					<hr style="width: 25px">
					<div class="st2">救助治疗流浪动物</div>
				</div>
				<div class="st" style="margin-left: 170px;">
					<div class="st1">${haveCount }</div>
					<hr style="width: 25px">
					<div class="st2">被领养的流浪动物</div>
				</div>
				<div class="st" style="margin-left: 170px;">
					<div class="st1">${noCount }</div>
					<hr style="width: 25px">
					<div class="st2">健康待领养的动物</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 我们的工作 -->
	<div style="width: 100%">
		<div align="center"
			style="color: #FF6637; font-size: 30px; margin-top: 80px">
			我们的工作</div>
		<div align="center" style="margin-top: 15px">
			想掌握最新情况，先了解我们做了哪些幕后工作吧！</div>
		<div style="background-image: url(image/main/v2.png)" class="title2"></div>
		<div style="width: 100%; margin-top: 90px;" class="clear">
			<div style="float: left; margin-left: 120px">
				<div class="ourWork"></div>
				<div align="center" style="margin-top: 15px; color: #666666">
					每天定时发放流浪犬狗粮</div>
			</div>
			<div style="float: left; margin-left: 25px">
				<div class="ourWork1"></div>
				<div align="center" style="margin-top: 15px; color: #666666">
					给外面特殊的流浪动物狗粮</div>
			</div>
			<div style="float: left; margin-left: 25px">
				<div class="ourWork2"></div>
				<div align="center" style="margin-top: 15px; color: #666666">
					定时清理打扫流浪犬狗舍</div>
			</div>
		</div>
	</div>
	<!-- 购买代替领养 -->
	<div style="width: 100%; margin-top: 110px;">
		<div id="adopt">
			<div id="adopt1" style="padding-top: 50px;">以领养代替购买，助养流浪小动物</div>
			<div id="adopt2">
				我们提供一个完善和谐的伴侣动物领养平台，主要目的是推广“领养代替购买，<br>
				用爱终止流浪”的理念，提高流浪动物被领养率。我们每月举办的领养日活动，通过网络宣传和媒体等手段，<br>
				帮助被救助的流浪猫狗更快更好地被领养，在这个平台上，领养都是免费的。<br>
			</div>
			<a href="goLoveAdopt.do" id="adopt3">
				了解更多
			</a>
		</div>
	</div>
	<div style="width: 100%; height: 620px;">
		<div align="center"
			style="color: #FF6637; font-size: 30px; margin-top: 150px">
			协会资讯</div>
		<div align="center" style="margin-top: 15px">
			爱心同城，无主动物免费绝育公益活动专栏</div>
		<div style="background-image: url(image/main/v2.png)" class="title2"></div>
		<div class="clear" style="width: 86%; margin-top: 75px;">
			<div style="width: 40%; float: left; margin-left: 40px">
				<a href="detailAssociationNews.do?a_Id=${assId}"><img src="${assImage }" width="440px" height="180px"></a><br>
				<a href="detailAssociationNews.do?a_Id=${assId}" class="newsLeft1">${assTitle }</a><br>
			</div>
			<div class="newsRight">
				<c:forEach items="${newList }" var="list">
					<div class="clear" style="border-bottom: 1px dashed #666666"><a href="detailNews.do?newsId=${list.newsId }" class="newsRight1"><span>${list.newsTitle}</span><span style="float: right"><fmt:formatDate value="${list.newsTime}" pattern="yyyy/MM/dd"/></span></a></div>
				</c:forEach>
			</div>
		</div>
	</div>
	<!-- 页尾 -->
	<div>
		<%@include file="bottom.jsp"%>
	</div>
</body>
<script src="js/index.js"></script>
</html>