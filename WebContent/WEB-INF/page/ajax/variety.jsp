<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../include/tag.jsp" %>


<option value="0">所有</option>

<c:forEach items="${cartVarietyList}" var="variety">
	<option value="${variety.varietyId }">${variety.varietyName }</option>
</c:forEach>
<c:forEach items="${dogtVarietyList}" var="variety">
	<option value="${variety.varietyId }">${variety.varietyName }</option>
</c:forEach>
<c:forEach items="${varietyList}" var="variety">
	<option value="${variety.varietyId }">${variety.varietyName }</option>
</c:forEach>
