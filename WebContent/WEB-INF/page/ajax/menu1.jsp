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
		text-align:left;
		height:30px;
		line-height: 50px;
		border: 1px solid black;
		padding-left: 10px;
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
	.span{
		display:block;
		margin: auto;
		margin-top: 60px;
		font-size: 20px;
		font-family: "微软雅黑";
		width:200px;
		text-align: center;
	}
</style>
<span class="span">领养申请管理</span>
<table>
	<tr>
		<td width="10%">领养人姓名</td>
		<td width="20%">领养人地址</td>
		<td width="20%">手机号</td>
		<td width="30%">申请理由</td>
		<td width="20%"></td>
	</tr>
	<c:forEach items="${applyList }" var="apply">
		<tr>
			<td>${apply.applyName }</td>
			<td>${apply.address }</td>
			<td>${apply.applyPhone }</td>
			<td>${apply.applyReason }</td>
			<td><a href="send1.do?applyId=${apply.applyId}&applyPhone=${apply.applyPhone}&flag=1&animalId=${apply.animalId}" class="btn">同意</a><a href="send1.do?applyId=${apply.applyId}&applyPhone=${apply.applyPhone}&flag=2&animalId=${apply.animalId}" class="btn">不同意</a></td>
		</tr>
	</c:forEach>
</table>