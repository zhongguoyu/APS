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
</style>
<span class="span">查看留言</span>
<table>
	<tr>
		<td width="10%">留言人姓名</td>
		<td width="20%">留言手机</td>
		<td width="50%">留言内容</td>
		<td width="20%">留言时间</td>
	</tr>
	<c:forEach items="${messageList }" var="message">
		<tr>
			<td>${message.name }</td>
			<td>${message.phone }</td>
			<td>${message.content }</td>
			<td><fmt:formatDate pattern="yyyy-MM-dd" value="${message.messageTime }"/></td>
		</tr>
	</c:forEach>
</table>