<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../include/tag.jsp" %>

<div id="info">
	<c:forEach var="animal" items="${animalList }" varStatus="i">
		<div>
			<div style="background-image: url(image/animal/${animal.picture})"></div>
			<span>类别:${animal.typeName }</span>
			<span>名字:${animal.name }</span>
			<span>性别:${animal.sex }</span>
			<span>年龄:${animal.age }岁</span>
			<a href="#" class="adopt" id="${animal.animalId}">带它回家</a>
		</div>
		<c:if test="${(i.index+1)%3 == 0 }">
			<br>
		</c:if>
	</c:forEach>
</div>
<!-- 分页 -->
<div class="pageNav">
	<c:if test="${currentPage!=1}">
		<a class="pageTurn" href="pageturn.do?page=${currentPage-1 }&variety=${variety}&type=${type}">上一页</a>
	</c:if>
	<c:if test="${currentPage>2&&totalPage>3 }">	
		<span>...</span>
	</c:if>	
	<c:forEach begin="${min }" end="${max }" step="1" varStatus="status">
		<c:if test="${status.index==currentPage }">
			<a class="page pageSelected" href="pageturn.do?page=${status.index }&variety=${variety}&type=${type}">${status.index }</a>
		</c:if>
		<c:if test="${status.index!=currentPage }">
			<a class="page" href="pageturn.do?page=${status.index }&variety=${variety}&type=${type}">${status.index }</a>
		</c:if>
	</c:forEach>
	<c:if test="${currentPage<totalPage-1&&totalPage>3 }">
		<span>...</span>
	</c:if>
	<c:if test="${currentPage!=totalPage }">
		<a class="pageTurn" href="pageturn.do?page=${currentPage+1 }&variety=${variety}&type=${type}">下一页</a>
	</c:if>
</div>
