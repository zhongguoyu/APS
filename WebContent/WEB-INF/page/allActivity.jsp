<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link type="text/css" rel="stylesheet" href="css/allNews.css">
<link type="text/css" rel="stylesheet" href="css/page.css">
<link rel="stylesheet" href="css/common.css"/>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript" src="js/jquery-1.8.0.js"></script>
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript">


var w,h,className;
function getSrceenWH(){
	w = $(window).width();
	h = $(window).height();
	$('#dialogBg').width(w).height(h);
}

window.onresize = function(){  
	getSrceenWH();
}  
$(window).resize();  

$(function(){
	getSrceenWH();
	
	//显示弹框
	$('.allNews-AA').click(function(){
		className = $(this).attr('class');
		$('#dialogBg').fadeIn(300);
		$('#dialog').removeAttr('class').addClass('animated '+className+'').fadeIn();
	});
	
	//关闭弹窗
	$('.claseDialogBtn').click(function(){
		$('#dialogBg').fadeOut(300,function(){
			$('#dialog').addClass('bounceOutUp').fadeOut();
		});
	});
});


</script>
<body>
	<!-- 页头 -->
	<div><%@include file="head.jsp"%></div>
	<!-- 大图片 -->
	<div class="titlePicture"  style="background-image: url('image/volunteer/8191544.jpg');"></div>
	<!-- 内容 -->
	<div style="text-align: center;">
		<div class="allNews-title">
			<div class="allNews-title1">志愿者活动与资讯</div>
			<div class="allNews-title1 font-size">关爱小动物，志愿者在行动</div>
		</div>
		<div id="choose">
			<c:forEach var="list" items="${allActivityList }">
				<div class="allNews-Contents clear">
					<li class="allNews-A"><a href="activityDetail.do?activityId=${list.activityId }" class="allNews-A2">${list.activityName}</a></li>
					<div class="allNews-time"><fmt:formatDate value="${list.activityTime }" pattern="yyyy-MM-dd"/></div>
				</div>
			</c:forEach>
		</div>
		<!-- 分页 -->
		<div class="pageNav">
			<c:if test="${currentPage!=1 }">
				<a href="allActivity.do?page=${currentPage-1 }" class="page pageNext">上一页</a>
			</c:if>
			<c:forEach varStatus="s" begin="${min }" end="${max }" step="1">
				<c:if test="${currentPage==s.index }">
					<a href="#" class="page pageSelected">${s.index}</a>
				</c:if>
				<c:if test="${currentPage!=s.index }">
					<a href="allActivity.do?page=${s.index }" class="page">${s.index}</a>
				</c:if>	
			</c:forEach>
			<c:if test="${currentPage!=totalPage}">
				<a href="allActivity.do?page=${currentPage+1 }" class="page pageNext">下一页</a>
			</c:if>
		</div>
	</div>
	<!-- 即将开始的活动 -->
	<div>
		<div class="allNews-title">
			<div class="allNews-title1">即将开始的活动</div>
			<div class="allNews-title1 font-size">全城雷动，等你来参加</div>
		</div>
		<div id="choose">
			<div style="width: 1050px;" class="clear">
					<div style="float: left;font-size: 20px">
						&nbsp;&nbsp;&nbsp;活动主题与内容
					</div>
					<div style="float:right;font-size: 20px"">
						时间&nbsp;&nbsp;
					</div>
			</div>
			<c:forEach var="list" items="${unhappenList }">
				<div class="allNews-Contents clear">
					<li class="allNews-A"><a id="aaa" href="javascript:;" class="allNews-AA">${list.title}</a></li>
					<div class="allNews-time"><fmt:formatDate value="${list.happenTime }" pattern="yyyy-MM-dd"/></div>
				</div>
				<div id="dialogBg"></div>
				<div id="dialog" class="animated">
					<img class="dialogIco" width="50" height="50" src="image/ico.png" alt="" />
					<div class="dialogTop">
						<a href="javascript:;" class="claseDialogBtn">关闭</a>
					</div>
					<form action="attendActivity.do" method="post" id="editForm">
						<input type="hidden" name="unhappenId" value="${list.unhappenId}">
						<input type="hidden" name="page" value="${currentPage}">
						<ul class="editInfos">
							<li><label><font color="#ff0000">* </font>姓名：<input type="text" name="name" required value="" class="ipt" /></label></li>
							<li><label><font color="#ff0000">* </font>手机：<input type="text" name="phone" required value="" class="ipt" /></label></li>
							<li><input type="submit" value="确认参加" class="submitBtn" /></li>
						</ul>
					</form>
				</div>
			</c:forEach>
		</div>
	</div>
	<!-- 页尾 -->
	<div>
		<%@include file="bottom.jsp"%>
	</div>
</body>
</html>