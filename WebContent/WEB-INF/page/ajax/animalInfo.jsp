<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div>
		<div style="width: 350px;height: 280px;background-size:cover;background-image: url(${picture});"></div>
		<div style="margin-top: 15px;">姓名：${name}</div>
		<div>性别：${sex}</div>
		<div>种类：${type}</div>
		<div>年龄：${age}</div>
		<div>具体描述:${content}</div>
	</div>
</body>
</html>