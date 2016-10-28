<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>广西100南宁商家订单系统</title>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-1.8.3.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/easyui/easyui-lang-zh_CN.js"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/js/easyui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/js/easyui/themes/icon.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/panel.css">
</head>
<body class="easyui-layout">	
	<div region="center" style="padding-top: 10px;">
	<div style="margin-top:10px;width: 94%;padding-left:10px;padding-top:10px; border: solid 1px #ccc; background-color: #f7f7f7;height: 30px;margin: 0 auto;font-size: 14px;">
	请填写发货信息
	</div>
		<form action="paymentrecords_zfbqrfh" method="post">
		<input type="hidden" name="WIDtrade_no" value="<%=request.getParameter("jyh") %>">
		<input type="hidden" name="ddbh" value="<%=request.getParameter("ddbh") %>">
		<input type="hidden" name="WIDtransport_type" value="EXPRESS">
		<table>
		 <tr>
		  <td>物流公司</td>
		   <td><input type="text" name="WIDlogistics_name" value="申通快递"> </td>
		 </tr>
		 <tr>
		  <td>物流发货号</td>
		   <td><input type="text" name="WIDinvoice_no" value="123456789"></td>
		 </tr>
		 <tr>
		  <td colspan="2"><input type="submit"  value="确认发货"></td>
		 </tr>
		</table>
		</form>
	</div>
</body>
</html>