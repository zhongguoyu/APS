<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link type="text/css" rel="stylesheet" href="css/page.css">
<link type="text/css" rel="stylesheet" href="css/association.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>协会动态</title>
</head>
<body>
	<!-- 页头 -->
	<div><%@include file="head.jsp"%></div>
	<!-- 大图片 -->
	<div class="associationPicture"></div>
	<!-- 内容 -->
	<div class="association-body">
		<div class="allNews-title">
			<div class="allNews-title1">协会动态</div>
			<div class="allNews-title1 font-size">爱心同城，无主动物免费绝育公益活动专栏</div>
		</div>
		<c:forEach items="${associationList }" var="list">
			<div class="as-news clear">
				<div class="as-image" onclick="window.location.href='detailAssociationNews.do?a_Id=${list.a_Id}';" style="background-image: url('image/newsImages/${list.a_Image}');"></div>
				<div class="as-newsTiltle" onclick="window.location.href='detailAssociationNews.do?a_Id=${list.a_Id}';">
					<div class="as-newsTiltle2">${list.a_Title }</div>
					<div class="as-newsTiltle3"><fmt:formatDate value="${list.a_Time }" pattern="yyyy-MM-dd"/></div>
				</div>
			</div>
		</c:forEach>
		<!-- 分页 -->
		<div class="pageNav">
			<c:if test="${currentPage!=1 }">
				<a href="allAssociation.do?page=${currentPage-1 }" class="page pageNext">上一页</a>
			</c:if>
			<c:forEach varStatus="s" begin="${min }" end="${max }" step="1">
				<c:if test="${currentPage==s.index }">
					<a href="#" class="page pageSelected">${s.index}</a>
				</c:if>
				<c:if test="${currentPage!=s.index }">
					<a href="allAssociation.do?page=${s.index }" class="page">${s.index}</a>
				</c:if>	
			</c:forEach>
			<c:if test="${currentPage!=totalPage}">
				<a href="allAssociation.do?page=${currentPage+1 }" class="page pageNext">下一页</a>
			</c:if>
		</div>
		<div></div>
	</div>
	<!-- 页尾 -->
	<div>
		<%@include file="bottom.jsp"%>
	</div>
</body>
<script>
	$(".association-body").children(":last").css("margin-bottom","80px");

</script>
</html>