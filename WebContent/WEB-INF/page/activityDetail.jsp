<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link type="text/css" rel="stylesheet" href="css/allNews.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 页头 -->
	<div><%@include file="head.jsp"%></div>
	<!-- 大图片 -->
	<div class="detailPicture" style="background-image: url('image/volunteer/dogandcat.jpg');"></div>
	<!-- 内容 -->
	<div class="detailBody">
		${activity.content }
	</div>
	<!-- 页尾 -->
	<div>
		<%@include file="bottom.jsp"%>
	</div>
</body>
<script>
	$(".detailBody").children(":first").css("font-size","28px");
	$(".detailBody").children(":first").css("margin-bottom","40px");
</script>
</html>