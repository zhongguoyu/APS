<%@page import="com.aps.util.Token"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script src="js/volunteer/jquery.js"></script>
<script src="js/volunteer/lq.datetimepick.js"></script>
<script src="js/volunteer/selectUi.js"></script>
<link rel="stylesheet" type="text/css"
	href="css/volunteer/lq.datetimepick.css" />
<style>
table {
	width: 90%;
	margin: auto;
	margin-top: 20px;
	border-collapse: collapse;
	border: 2px solid black;
}

table tr td {
	text-align: left;
	height: 30px;
	line-height: 50px;
	border: 1px solid black;
	padding-left: 10px;
}

.btn {
	width: 80px;
	height: 30px;
	margin-left: 10px;
	border-radius: 5px;
	outline: none;
	cursor: pointer;
}

.text{
	width:80%;
	height:30px;
	margin-left: 10px;
	border-radius:5px;
	padding-left:10px;
	outline: none;
	margin-top: 5px;
}
.news-content{
	height:180px;
	width:80%;
	resize:none;
	padding-left: 5px;
	margin-left: 10px;
	border-radius:5px;
	outline: none;
}

.file {
	margin-left: 10px;
}

.span {
	display: block;
	margin: auto;
	margin-top: 60px;
	font-size: 20px;
	font-family: "微软雅黑";
	width: 200px;
	text-align: center;
}

.form-control{
	width: 80px;
	height: 30px;
	border-radius: 5px;
	outline: none;
	margin-left:10px;
	padding-left: 10px;
}
.error{
	color:red;
	font-size: 14px;
	font-family: "微软雅黑";
	vertical-align: top;
}
</style>
<span class="span">志愿者活动添加</span>
<form action="addActivity.do" method="post" onsubmit="return check()">
	<table>
		<tr>
			<td width="10%">标题:</td>
			<td width="90%"><input type="text" id="title" name="title" class="text" onblur="titleV()"><span class="error"></span></td>
		</tr>
		<tr height="200">
			<td>内容:</td>
			<td><textarea name="content" id="activity" class="news-content" onblur="contentV()"></textarea><span class="error"></span></td>
		</tr>
		<tr>
			<td>活动时间</td>
			<td valign="middle">
				<input type="text" size="60"style="height: 25px; background-color: #F6F6F6" name="datepicker" id="datetimepicker3" class="form-control" value=" " onblur="dateV()"/><span class="error"></span>
			</td>
		</tr>
		<tr height="40">
			<td></td>
			<td><input type="submit" value="添加" class="btn"></td>
		</tr>
	</table>
	<input type="hidden" name="token" value="<%=Token.createToken(session)%>">
</form>
<script>
	$(function() {
		$("#datetimepicker3").on("click", function(e) {
			e.stopPropagation();
			$(this).lqdatetimepicker({
				css : 'datetime-day',
				dateType : 'D',
				selectback : function() {

				}
			});
		});
	});
	
	function titleV(){
		var title = $("#title").val();
		$("#title").next("span").html("");
		if(title==""){
			$("#title").next("span").html("请输入标题");
			return false;
		}
		return true;
	}
	function contentV(){
		var content = $("#activity").val();
		$("#activity").next("span").html("");
		if(content==""){
			$("#activity").next("span").html("请输入内容");
			return false;
		}
		return true;
	}
	function dateV(){
		var date1 = $("#datetimepicker3").val();
		$("#datetimepicker3").next("span").html("");
		if(date1==" "){
			$("#datetimepicker3").next("span").html("请输入发布时间");
			return false;
		}
		var nowDate = new Date();
		var date2 = formatDate(nowDate);
		if(date1<date2){
			$("#datetimepicker3").next("span").html("发布的活动要晚于现在时间");
			return false;
		}
		return true;
	}
	function check(){
		if(!titleV()||!contentV()||!dateV()){
			return false;
		}
	}
	
	function formatDate(nowDate){
		var y = nowDate.getFullYear();
		var m = nowDate.getMonth()+1;
		m = m<10?('0'+m):m;
		var d = nowDate.getDate();
		d = d<10?('0'+d):d;
		return y+'-'+m+'-'+d;
	};
</script>