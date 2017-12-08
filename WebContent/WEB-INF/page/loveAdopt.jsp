<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<style>
.class{
	background-image: url(image/main/loveAdopt.jpg);
	height: 450px;
	width: 100%;
}
.title{
	margin-top: 125px;
	text-align: center;
	color: #FF6200;
	font-size: 30px;
}
.title1{
	text-align: center;
	color:#666666;
	margin-top: 15px;
}
.title2{
	width: 1200px;
	height: 39px;
	margin-top: 30px;
	margin-left:100px;
	
}
.clear:after{
	content: "";
	clear: both;
	display: block;
}
#kj{
	margin-top: 130px;
	margin-left: 160px;
}
.qualification{
	float: left;
}
.qualification1{
	float: left;
	margin-left: 145px;
	background-image: url(image/main/loveAdopt1.jpg);
	width: 430px;
	height: 260px;
	margin-top: 50px;
	background-size: cover;
}
.qualification2{
	float: left;
	margin-left: 165px;
	background-image: url(image/main/loveAdopt2.jpg);
	width: 430px;
	height: 260px;
	margin-top: 100px;
	background-size: cover;
}
.qualification3{
	float: left;
	padding-top: 100px;
	margin-left: 165px;
}
.qualification4{
	float: left;
	margin-left: 145px;
	background-image:url(image/main/loveAdopt3.jpg);
	width: 430px;
	height: 260px;
	margin-top: 130px;
	background-size: cover;
}
.commit{
	text-align: center;
	margin-top: 50px;
}
</style>
<body>
	<div><%@include file="head.jsp"%></div>
	<!-- 中间开始 -->
	<div class="class"></div>
	<div class="title">
		爱心领养
	</div>
	<div class="title1">
		想掌握最新情况，先了解我们做了哪些幕后工作吧！
	</div>
	<div style="background-image: url(image/main/v2.png)" class="title2"></div>
	<div class="clear" id="kj">
		<div class="qualification">
			<p style="color: #FF7D37">领养资格</p>
			<p style="margin-top:45px;font-size: 13px;">领养前，领养家庭必须认真考虑清楚是否有能力和条件领养动物，和负责任一生。</p>
			<p style="color: #667495; margin-top:40px;font-size: 13px;">1.有固定住所和稳定收入者，能为被领养动物提供安全、稳定的生存的环境。</p>
			<p style="color: #667495; margin-top:15px;font-size: 13px;">2.家人愿意接受被领养动物，并一同照顾。</p>
			<p style="color: #667495; margin-top:15px;font-size: 13px;">3.定期体内外驱虫，每年按时打疫苗。</p>
			<p style="color: #667495; margin-top:15px;font-size: 13px;">4.添加领养回访QQ，能配合我们对领养动物的定期回访工作。</p>
			<p style="color: #667495; margin-top:15px;font-size: 13px;">5.同意给被领养的动物采取必要的节育措施，避免其过度繁殖。</p>
			<p style="color: #667495; margin-top:15px;font-size: 13px;">6.谢绝未成年人、学生和猫狗贩。</p>
		</div>
		<div class="qualification1">
			
		</div>
	</div>
	<div class="clear" >
		<div class="qualification2">
			
		</div>
		<div class="qualification3">
			<p style="color: #FF7D37">领养步骤</p>
			<p style="margin-top:45px;font-size: 13px;">我们的领养是免费的！</p>
			<p style="color: #667495; margin-top:40px;font-size: 13px;">1.检查自己是否符合领养资格，与家人沟通，做好准备一同照顾被领养动物。</p>
			<p style="color: #667495; margin-top:15px;font-size: 13px;">2.下载并填写：领养申请表</p>
			<p style="color: #667495; margin-top:15px;font-size: 13px;">3.联系协会（电话：020-0000000）预约办理领养手续，直接去现场进行领养。</p>
			<p style="color: #667495; margin-top:15px;font-size: 13px;">4.携带身份证到协会或领养日现场，接受协会审核、办理手续，挑选动物，带它回家。</p>
			
		</div>
		
	</div>
	<div class="clear" >
		<div class="qualification3">
			<p style="color: #FF7D37">领养须知</p>
			<p style="color: #667495; margin-top:40px;font-size: 13px;">1.请做到科学喂养、支持绝育、定期疫苗和驱虫，生病及时就医，不散养不笼养，<br>出门牵绳和清理大小便。</p>
			<p style="color: #667495; margin-top:15px;font-size: 13px;">2.希望你能像家人一样看待被领养的小动物，一辈子不离不弃，不要因工作、怀孕<br>和其他原因放弃领养。</p>
			<p style="color: #667495; margin-top:15px;font-size: 13px;">3.协会会对您进行定期回访工作，领养后请主人配合我们的工作。</p>
			<p style="color: #667495; margin-top:15px;font-size: 13px;">4.如果在您是无能力继续养下去时，请将它们送回协会，决不允许没有经过我们的<br>同意私自将领养的动物转让他人。</p>
			
		</div>
		<div class="qualification4">
			
		</div>
	</div>
	<div >
		<div class="commit" style="margin-bottom: 120px">
			我已阅读以上流程
			<input type="checkbox" id="ck" onClick="change()"><br><br>
			<a href="goApplyAdopt.do?animalId=${animalId}">
			<input type="button" value="申请领养" disabled="disable" id="apply" style="font-size: 16px;margin-left: 140px">
			</a>
		</div>
	</div>	
	<!-- 中间结束 -->
	<div>
		<%@include file="bottom.jsp"%>
	</div>
</body>
<script type="text/javascript">
var ck =document.getElementById("ck");
var apply = document.getElementById("apply");
function change(){
	if(ck.checked){
		apply.disabled=false;
	}else{
		apply.disabled=true;
}
}
</script>
</html>