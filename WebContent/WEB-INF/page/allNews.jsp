<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link type="text/css" rel="stylesheet" href="css/allNews.css">
<link type="text/css" rel="stylesheet" href="css/page.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>动保资讯</title>
</head>
<script type="text/javascript" src="js/jquery-1.8.0.js"></script>
<body>
	<!-- 页头 -->
	<div><%@include file="head.jsp"%></div>
	<!-- 大图片 -->
	<div class="titlePicture"></div>
	<!-- 内容 -->
	<div class="allNews-body">
		<div class="allNews-title">
			<div class="allNews-title1">动物保护资讯</div>
			<div class="allNews-title1 font-size">爱心同城，无主动物免费绝育公益活动专栏</div>
		</div>
		<div id="choose">
			<c:forEach var="list" items="${allNewsList }">
				<div class="allNews-Contents clear">
					<li class="allNews-A"><a href="detailNews.do?newsId=${list.newsId }" class="allNews-A2">${list.newsTitle }</a></li>
					<div class="allNews-time"><fmt:formatDate value="${list.newsTime }" pattern="yyyy-MM-dd"/></div>
				</div>
			</c:forEach>
		</div>
		<!-- 分页 -->
		<div class="pageNav">
			<c:if test="${currentPage!=1 }">
				<a href="allNews.do?page=${currentPage-1 }" class="page pageNext">上一页</a>
			</c:if>
			<c:forEach varStatus="s" begin="${min }" end="${max }" step="1">
				<c:if test="${currentPage==s.index }">
					<a href="#" class="page pageSelected">${s.index}</a>
				</c:if>
				<c:if test="${currentPage!=s.index }">
					<a href="allNews.do?page=${s.index }" class="page">${s.index}</a>
				</c:if>	
			</c:forEach>
			<c:if test="${currentPage!=totalPage}">
				<a href="allNews.do?page=${currentPage+1 }" class="page pageNext">下一页</a>
			</c:if>
		</div>
	</div>
	<!-- 页尾 -->
	<div>
		<%@include file="bottom.jsp"%>
	</div>
</body>
</html>