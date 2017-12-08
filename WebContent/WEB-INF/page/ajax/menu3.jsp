<%@page import="com.aps.util.Token"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
	table{
		width:90%;
		margin: auto;
		margin-top:20px;
		border-collapse: collapse;
		border: 2px solid black;
	}
	table tr td{
		text-align: left;
		height:30px;
		line-height: 50px;
		border: 1px solid black;
		padding-left: 10px;
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
	.btn{
		width:80px;
		height:30px;
		margin-left: 10px;
		border-radius:5px;
		outline: none;
		cursor: pointer;
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
	.span{
		display:block;
		margin: auto;
		margin-top: 60px;
		font-size: 20px;
		font-family: "微软雅黑";
		width:200px;
		text-align: center;
	}
	.error{
		color:red;
		font-size: 14px;
		font-family: "微软雅黑";
		vertical-align: top;
	}
</style>
<span class="span">新闻添加</span>
<form action="addNews.do" method="post" onsubmit="return check()">
	<table>
		<tr>
			<td width="10%">标题:</td>
			<td width="90%"><input type="text" name="title" id="title" class="text" onblur="titleV()"><span class="error"></span></td>
		</tr>
		<tr height="200">
			<td>内容:</td>
			<td><textarea name="content" id="news" class="news-content" onblur="contentV()"></textarea><span class="error"></span></td>
		</tr>
		<tr height="40">
			<td></td>
			<td><input type="submit" value="添加" class="btn"></td>
		</tr>
	</table>
	<input type="hidden" name="token" value="<%=Token.createToken(session)%>">
</form>
<script>
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
		var content = $("#news").val();
		$("#news").next("span").html("");
		if(content==""){
			$("#news").next("span").html("请输入内容");
			return false;
		}
		return true;
	}
	function check(){
		if(!titleV()||!contentV()){
			return false;
		}
	}
</script>