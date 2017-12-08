<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>">
    
    <title>支付测试</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<style>
  *{font-size: 13px}
  </style>
<body>
	 <div style=" width:800px; margin: auto; margin-top: 50px">
  	<form action="pay.do?donateMoney=${donateForm.donateMoney}&donateName=${donateForm.donateName}&email=${donateForm.email}&phone=${donateForm.phone}&${donateForm.message}" method="post">
  		<table border="1" align="center" cellpadding="0" cellspacing="0" width="600" height="200">
  			<tr>
  				<td colspan="4" align="center">
  				订单编号：<input type="text" name="p2_Order">
  				交易金额：<input type="text" name="p3_Amt">&nbsp; &yen;
  				</td>
  			</tr>
  			<tr>
  				<td colspan="4" style="padding-left: 5px">
  				请选择银行：
  				</td>
  			</tr>
  			<tr>
  				<td><input type="radio" name="pd_FrpId" value="ICBC-NET">工商银行</td>
  				<td><input type="radio" name="pd_FrpId" value="CMBCHINA-NET">招商银行</td>
  				<td><input type="radio" name="pd_FrpId" value="ABC-NET">农业银行</td>
  				<td><input type="radio" name="pd_FrpId" value="CCB-NET">建设银行</td>
  			</tr>
  			<tr>
  				<td><input type="radio" name="pd_FrpId" value="CEB-NET">光大银行</td>
  				<td><input type="radio" name="pd_FrpId" value="BOCO-NET">交通银行</td>
  				<td><input type="radio" name="pd_FrpId" value="CMBC-NET">民生银行</td>
  				<td><input type="radio" name="pd_FrpId" value="SDB-NET">深圳发展银行</td>
  			</tr>
  			<tr>
  				<td><input type="radio" name="pd_FrpId" value="BCCB-NET">北京银行</td>
  				<td><input type="radio" name="pd_FrpId" value="CIB-NET">兴业银行</td>
  				<td><input type="radio" name="pd_FrpId" value="ECITIC-NET">中信银行</td>
  				<td><input type="radio" name="pd_FrpId" value="SPDB-NET">浦东发展银行</td>
  			</tr>
  			<tr>
  				<td colspan="4" align="center">
  					<input type="submit" value="确认支付">
  				</td>
  			</tr>
  		</table>
  	</form>
  </div>
</body>
</html>