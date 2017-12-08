<%@page import="com.aps.util.Token"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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

.text {
	width: 80%;
	height: 30px;
	margin-left: 10px;
	border-radius: 5px;
	padding-left: 10px;
	outline: none;
	margin-top: 5px;
}

.news-content {
	height: 180px;
	width: 80%;
	resize: none;
	padding-left: 5px;
	margin-left: 10px;
	border-radius: 5px;
	outline: none;
}

.file {
	margin-top:10px;
	margin-left: 10px;
}

select {
	display: inline-block;
	width: 130px;
	outline: none;
	height: 30px;
	padding-left: 20px;
	line-height: 30px;
	border-radius: 5px;
	display: inline-block;
	font-size: 16px;
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

.error {
	color: red;
	font-size: 14px;
	font-family: "微软雅黑";
	vertical-align: top;
}
</style>
<span class="span">流浪动物添加</span>
<form action="upload2.do" method="post" enctype="multipart/form-data" onsubmit="return check()">
	<table>
		<tr>
			<td width="10%">昵称:</td>
			<td width="90%"><input type="text" name="name" id="name" class="text"
				onblur="nameV()"><span class="error"></span></td>
		</tr>
		<tr>
			<td>图片:</td>
			<td><input type="file" name="file" class="file" id="img" onchange="imgV()" /><span class="error"></span></td>
		</tr>
		<tr>
			<td>种类:</td>
			<td><select name="type" id="type" onchange="typeV()">
					<option value="">--请选择--</option>
					<option value="狗">狗</option>
					<option value="猫">猫</option>
			</select><span class="error"></span></</td>
		</tr>
		<tr>
			<td>品种:</td>
			<td><select name="variety" id="variety" onchange="varietyV()">
					<option value="0">--请选择--</option>
			</select><span class="error"></span></</td>
		</tr>
		<tr>
			<td>年龄:</td>
			<td><input type="text" name="age" id="age" class="text" onblur="ageV()"><span class="error"></span></</td>
		</tr>
		<tr>
			<td>性别:</td>
			<td><input type="radio" name="sex" class="sex file" onclick="sexV()" value="公">公<input
				type="radio" name="sex" class="sex" onclick="sexV()" value="母">母<span class="error"></span></</td>
		</tr>
		<tr>
			<td>动物介绍:</td>
			<td><input type="text" name="introduction" class="text" id="introduction" onblur="introV()"><span class="error"></span></</td>
		</tr>
		<tr height="40">
			<td></td>
			<td><input type="submit" value="添加" class="btn"><span class="error"></span></</td>
		</tr>
	</table>
	<input type="hidden" name="token" value="<%=Token.createToken(session)%>">
</form>
<script>
	var variety = $("#variety");
	$("#type").change(function() {
		var typeName = $(this).val();
		var varietyId = $("#variety").val();
		initVariety(typeName);
	})
	function initVariety(typeName) {
		$.ajax({
			type : "post",
			url : "manageVariety.do",
			data : {
				"value" : typeName
			},
			success : function(data) {
				variety.html(data);
			}
		})
	}
	
	function nameV(){
		var title = $("#name").val();
		$("#name").next("span").html("");
		if (title == "") {
			$("#name").next("span").html("请输入昵称");
			return false;
		}
		return true;
	}
	
	function imgV(){
		var img = $("#img").val();
		$("#img").next("span").html("");
		var suffix = img.substr(img.lastIndexOf("."));
		if(img==""){
			$("#img").next("span").html("请选择图片");
			return false;
		}
		if(suffix != ".jpg" && suffix != ".png"){
			$("#img").next("span").html("图片后缀名必须为jpg或者png");
			return false;
		}
		return true;
	}
	
	function typeV(){
		var type = $("#type").val();
		$("#type").next("span").html("");
		if (type == "") {
			$("#type").next("span").html("请选择种类");
			return false;
		}
		return true;
	}
	
	function varietyV(){
		var variety = $("#variety").val();
		$("#variety").next("span").html("");
		if (variety == 0) {
			$("#variety").next("span").html("请选择品种");
			return false;
		}
		return true;
	}
	
	function ageV(){
		var age = $("#age").val();
		$("#age").next("span").html("");
		if (age == "") {
			$("#age").next("span").html("请输入年龄");
			return false;
		}
		if(age<=0||age>=15){
			$("#age").next("span").html("年龄在1~14之间");
			return false
		}
		return true;
	}
	
	function sexV(){
		$(".sex").next("span").html("");
		var sex1 = $($(".sex")[0]).attr("checked");
		var sex2 = $($(".sex")[1]).attr("checked");
		if (sex1 != "checked" && sex2 != "checked"){
			$(".sex").next("span").html("请选择性别");
			return false;
		}
		return true;
	}
	
	function introV(){
		var sex = $("#introduction").val();
		$("#introduction").next("span").html("");
		if (sex == "") {
			$("#introduction").next("span").html("请输入介绍");
			return false;
		}
		return true;
	}

	function check(){
		if(!nameV()||!imgV()||!typeV()||!varietyV()||!ageV()||!sexV()||!introV()){
			return false;
		}
	}
</script>