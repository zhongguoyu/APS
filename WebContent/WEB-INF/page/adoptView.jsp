<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link type="text/css" rel="stylesheet" href="css/adoptView.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>领养窗口</title>
</head>
<body>
	<!-- 页头 -->
	<div><%@include file="head.jsp"%></div>
	<!-- 大图片 -->
	<div class="adoptViewPicture"></div>
	<!-- 内容 -->
	<div class="adoptView-body">
		<div class="allNews-title">
			<div class="allNews-title1">领养窗口</div>
			<div class="allNews-title1 font-size">中国小动物保护协会流浪动物救助基地流浪动物领养窗口</div>
		</div>
		<div class="avTitleContent">
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;坐落于北京昌平区的“中小保”流浪动物救助基地，收容、保护过上千只流浪小动物，而现在还有700多只流浪狗狗们居住在这里。
			我们一直在尽力让这些流浪动物可以在基地找到家的感觉，不再忍饥受冻，幸福、快乐的在这里生活着。
			但我们更愿意看到它们都能再次回归家庭，有专属于自己的小家以及独爱自己的家人。
			所以，我们协会经过了前期精心、细致的策划，秉承着严肃、认真的态度，制定了严格、合理的程序，现面向社会公开领养啦！
			大家快快行动起来，爱上原本就可爱的它，给TA一个完整的家吧!
		</div>
		<div class="adoptView-button" onclick="window.location.href='goLoveAdopt.do'">领养&nbsp;&nbsp;ADOPT</div>
		<div class="boderBottom"></div>
		<!-- 本年份本月份领养动物推荐 -->
		<div class="av-recommend">
			<span class="av-spanTitle"><fmt:formatDate value="${nowDate }" pattern="yyyy年MM月"/>待领养动物推荐</span>
			<c:if test="${dogListLength!=0 }">
				<c:forEach items="${dogList }" var="list" varStatus="n">
					<div class="recommend-div">
						<table width="100%" height="100%" style="border-collapse: collapse;">
							<tr>
								<td height="10%" width="50%">
									<div class="rDogName">${list.name }</div>
								</td>
								<td rowspan="5" width="50%">
									<div class="recommend-image" style="background-image: url('image/animal/${list.picture}');"></div>
								</td>
							</tr>
							<tr>
								<td height="10%">
									<span style="font-size: 12px;">领养编号：</span>
									<span style="color:#967E5A;font-weight: bold;">${list.animalId }</span>
								</td>
							</tr>
							<tr>
								<td height="10%">
									<span style="color:#967E5A;font-weight: bold;font-size: 16px;">${list.age }岁&nbsp;&nbsp;${list.sex}</span>
								</td>
							</tr>
							<tr>
								<td height="10%">
									<span style="color:#967E5A;font-weight: bold;">${dogVarietyList[n.index] }</span>
								</td>
							</tr>
							<tr>
								<td style="color: #C5CBCA;">
									${list.introduction }
								</td>
							</tr>
							<tr>
								<td colspan="2" height="15%">
									<div class="adoptView-button extraBack" onclick="window.location.href='goLoveAdopt.do?animalId=${list.animalId}'">领养&nbsp;&nbsp;ADOPT</div>
								</td>
							</tr>
						</table>
					</div>
				</c:forEach>
			</c:if>
			<c:if test="${dogListLength==0 }">
				<div class="recommend-div av-error">
					目前没有可爱的狗狗推荐哦！
				</div>
			</c:if>
			
			<!-- 猫的推荐 -->
			<c:if test="${catListLength!=0 }">
				<c:forEach items="${catList }" var="list" varStatus="n">
					<div class="recommend-div">
						<table width="100%" height="100%" style="border-collapse: collapse;">
							<tr>
								<td rowspan="5" width="50%">
									<div class="recommend-image" style="background-image: url('image/animal/${list.picture}');"></div>
								</td>
								<td height="10%" width="50%">
									<div class="rDogName">${list.name }</div>
								</td>
								
							</tr>
							<tr>
								<td height="10%">
									<span style="font-size: 12px;">领养编号：</span>
									<span style="color:#967E5A;font-weight: bold;">${list.animalId }</span>
								</td>
							</tr>
							<tr>
								<td height="10%">
									<span style="color:#967E5A;font-weight: bold;font-size: 16px;">${list.age }岁&nbsp;&nbsp;${list.sex}</span>
								</td>
							</tr>
							<tr>
								<td height="10%">
									<span style="color:#967E5A;font-weight: bold;">${catVarietyList[n.index] }</span>
								</td>
							</tr>
							<tr>
								<td style="color: #C5CBCA;">
									${list.introduction }
								</td>
							</tr>
							<tr>
								<td colspan="2" height="15%">
									<div class="adoptView-button extraBack" onclick="window.location.href='goLoveAdopt.do?animalId=${list.animalId}'">领养&nbsp;&nbsp;ADOPT</div>
								</td>
							</tr>
						</table>
					</div>
				</c:forEach>
			</c:if>
			<c:if test="${catListLength==0 }">
				<div class="recommend-div av-error">
					目前没有可爱的猫咪推荐哦！
				</div>
			</c:if>
			<div style="text-align: left;">
				<span class="moreAdoptTitle">更多待领养的中小保儿</span>
				<p class="p1">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;下面这些汪小宝儿和喵小宝儿都在寻找着领养家庭，TA们一直在殷殷期待着主人的到来，给TA们一个家，TA们还你终生的爱！</p>
			</div>
			<a href="goLoveAdopt.do" class="adoptViewA">↓↓↓ 更多找家宝贝，请记住TA们的编号，填写领养申请表↓↓↓</a>
			<div class="haveOwnerAnimal clear">
				<c:forEach items="${sixDogList }" var="dog">
					<div class="hoa-Image" style="background-image: url('image/animal/${dog.picture}');"></div>
				</c:forEach>
				<c:forEach items="${sixCatList }" var="cat">
					<div class="hoa-Image" style="background-image: url('image/animal/${cat.picture}');"></div>
				</c:forEach>
				<div class="hr"></div>
			</div>
			<div style="text-align: left;margin-bottom: 40px;">
				<span class="moreAdoptTitle">已回归家庭的中小保儿</span>
				<p class="p1">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-------这些幸运的小家伙，都已经找到了幸福的家，拥有了属于TA们自己的家人~~</p>
			</div>
			<div class="haveOwnerAnimal clear">
				<c:forEach items="${hoaList }" var="animal">
					<div class="hoa-Image2" style="background-image: url('image/animal/${animal.picture}');"></div>
				</c:forEach>
				<div class="hr"></div>
			</div>
			<div class="adopt-word">我们相信每个毛孩子都有一个专属于TA的幸福</div>
			<div class="adopt-word">现在，TA就在这里，等待着你的到来~~~</div>
			<div class="adopt-word" style="margin-top: 60px;color: #549BE0;">请持续关注CSAPA基地动物领养活动</div>
			<div class="adopt-word" style="color: #549BE0;">11月期待领养动物即将上线，等您来爱！</div>
		</div>
	
	</div>
	<!-- 页尾 -->
	<div>
		<%@include file="bottom.jsp"%>
	</div>
</body>
</html>