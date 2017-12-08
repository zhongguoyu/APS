<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link type="text/css" rel="stylesheet" href="css/detailAssociationNews.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 页头 -->
	<div><%@include file="head.jsp"%></div>
	<!-- 大图片 -->
	<div class="danPicture"></div>
	<div class="allNews-title">
		<div class="allNews-title1">动态详情</div>
		<div class="dan-title"></div>
	</div>
	<!-- 内容 -->
	<div class="dan-body">
		${association.a_content }
	
	</div>
	<!-- 页尾 -->
	<div>
		<%@include file="bottom.jsp"%>
	</div>
</body>
<script>
	$(".dan-body").children(":first").css("font-size","28px");
	$(".dan-body").children(":first").css("margin-bottom","40px");
	$(".dan-body").children(":first").css("margin-top","60px");
	$(".dan-body").children(":last").css("margin-bottom","80px");
	
</script>


</html>