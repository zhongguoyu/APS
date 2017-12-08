<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="include/tag.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>基地小动物</title>
</head>
<script type="text/javascript" src="js/jquery-1.8.0.js"></script>
<link href="css/baseAnimal.css" type="text/css" rel="stylesheet" >
<body>
	<%@include file="head.jsp" %>
	<div class="title"></div>
	<div class="search">
		<span>类别：</span>
		<select id="type">
			<option value="">所有</option>
			<option value="猫">猫</option>
			<option value="狗">狗</option>
		</select>
		<span>品种：</span>
		<select id="variety">
			<option value="0">所有</option>
			<c:forEach items="${varietyList}" var="variety">
				<option value="${variety.varietyId }">${variety.varietyName }</option>
			</c:forEach>
		</select>
	</div>
	<div id="change">
		<div id="info">
			<c:forEach var="animal" items="${animalList }" varStatus="i">
				<div>
					<div style="background-image: url(image/animal/${animal.picture})"></div>
					<span>类别:${animal.typeName }</span>
					<span>昵称:${animal.name }</span>
					<span>性别:${animal.sex }</span>
					<span>年龄:${animal.age }岁</span>
					<a href="goLoveAdopt.do?animalId=${animal.animalId}" class="adopt" id="${animal.animalId}">带它回家</a>
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
	</div>
	<%@include file="bottom.jsp" %>
</body>
<script>
	var variety = $("#variety");
	$("#type").change(function(){
		var typeName = $(this).val();
		var varietyId = $("#variety").val();
		initVariety(typeName);
		initAnimal(typeName,varietyId);
	})
	
	$("#variety").change(function(){
		var varietyId = $(this).val();
		var typeName = $("#type").val();
		initAnimal(typeName,varietyId);
	})
	function initVariety(typeName){
		$.ajax({
			type:"post",
			url:"initVariety.do",
			data:{"value":typeName},
			success:function(data){
				variety.html(data);
			}
		})
	}
	
	
	function initAnimal(type,varietyId){
		$.ajax({
			type:"post",
			url:"initAnimal.do",
			data:{"type":type,"variety":varietyId},
			success:function(data){
				$("#change").html(data);
			}
		})
	}
</script>
</html>