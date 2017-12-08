<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../include/tag.jsp" %>
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
	input{
		width:80px;
		height:30px;
		margin-left: 10px;
		border-radius:5px;
		outline: none;
		cursor: pointer;
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
	.btn{
		width:80px;
		height:30px;
		display:inline-block;
		margin-left: 10px;
		border-radius:5px;
		outline: none;
		text-decoration: none;
		background-color: gray;
		color: white;
		line-height: 30px;
		text-align: center;
	}
</style>
<span class="span">志愿者申请管理</span>
<table>
	<tr>
		<td width="10%">申请人姓名</td>
		<td width="20%">申请人地址</td>
		<td width="20%">手机号</td>
		<td width="20%">申请人邮箱</td>
		<td width="10%">期望职位</td>
		<td width="20%"></td>
	</tr>
	<c:forEach items="${volunteerList }" var="volunteer">
		<tr>
			<td>${volunteer.volunteerName }</td>
			<td>${volunteer.address }</td>
			<td>${volunteer.phone }</td>
			<td>${volunteer.email }</td>
			<td>${volunteer.exceptWork }</td>
			<td><a href="send2.do?volunteerId=${volunteer.volunteerId}&phone=${volunteer.phone }&flag=1" class="btn">同意</a><a href="send2.do?volunteerId=${volunteer.volunteerId}&phone=${volunteer.phone }&flag=2" class="btn">不同意</a></td>
		</tr>
	</c:forEach>
</table>