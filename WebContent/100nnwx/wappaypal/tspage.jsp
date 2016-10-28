<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>支付提示</title>
<link rel="stylesheet" href="http://code.jquery.com/mobile/1.3.2/jquery.mobile-1.3.2.min.css">
<script src="http://code.jquery.com/jquery-1.8.3.min.js"></script>
<script src="http://code.jquery.com/mobile/1.3.2/jquery.mobile-1.3.2.min.js"></script>
</head>
<body>
<div data-role="page" id="pageone" style="text-align:center;margin:0 auto;">
  <div data-role="content"> 
  <h3>付款成功</h3>
  <p>商品名称：测试商品</p>
  <a href="${pageContext.request.contextPath }/towxpage.jsp" data-role="button" >继续购物</a>
  <a href="${pageContext.request.contextPath }/wxorders_getList?orders.user.u_id=" data-role="button">查看订单</a>
  <br>
</div> 
</div>
</body>
</html>
