<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<style>
	*{
		margin:0px;
	}	
</style>
<body style="background-image: url(image/volunteer/skip.jpg);background-size:cover;">
<div style="width: 500px; margin: auto; text-align: center;margin-top: 100px;" >
	<h4>操作成功</h4>
	<p><b id="second">5</b>秒后回到主页<a href="javascript:goBack();">返回</a> </p>
</div>
<script type="text/javascript"> 
  
  var sec = document.getElementById("second");
  var i = 5;
  var timer = setInterval(function(){
    i--;
    sec.innerHTML = i;
    if(i==1){
      window.location.href = "index.jsp";
    }
  },1000);
    
 function goBack(){ 
  window.history.go(-1);
 } 
 </script>
</body>
</html>