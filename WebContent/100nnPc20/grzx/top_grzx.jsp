<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
<link href="${pageContext.request.contextPath }/100nnPc20/css/base_grzx.css" rel="stylesheet" type="text/css" />

</head>

<body>
 <!--头部开始-->
 <div class="top1">
 <div class="top2_bg">
  <div class="top2">
   <div class="top2_left">
    <div class="wjx"></div>
    <div class="welcome"><a title="收藏100南宁" href="javascript:alert('暂未开放');" target="_blank">收藏100南宁</a>   您好，欢迎来到快递超市！</div>
   </div>
  <!-- 头部 按钮 -->
  <%@ include file="top_caidan.jsp"%>
  </div>
  </div>
  <div class="top3">
   <div class="top3_bg">
    <div class="logo_1"></div>
    <div class="search">
    <div class="search_t">
     <div class="s1" style="margin: 0px auto;"><input name="" type="text" /></div>
     <div class="s2"><input name="" type="button" /></div>
    </div>
    <div class="hot">
     <!--<ul>
      <li><a>热搜：</a></li>
      <li><a title="金枕头" href="#" target="_blank">金枕头</a> |</li>
      <li><a title="资生堂" href="#" target="_blank">资生堂</a> |</li>
      <li><a title="鲁花" href="#" target="_blank">鲁花</a> |</li>
      <li><a title="红提" href="#" target="_blank">红提</a></li>
     </ul>-->
    </div>
   </div>
   <!--<div class="gwc"><a href="#">购物车有<span class="hz">2</span>件商品</a></div>-->
  </div>
  </div>
  <div class="nav">
   <div class="nav_t">
    <!--<div class="sp">商品服务分类</div>-->
    <div class="ly">
     <ul>
     <li  class="tp4_1"><a title="我的订单" href="${pageContext.request.contextPath}/order_qtorders" target="_balnk">我的订单</a></li>
      <li class="tp2_1" ><a title="购物车" href="${pageContext.request.contextPath }/shoppingcar_querygwclist" target="_blank">购物车</a></li>
      <li class="tp3_1" ><a title="地址管理" href="${pageContext.request.contextPath }/useraddress_qtqueryuseraddress" target="_blank">地址管理</a></li>
      <li class="tp1_1" style="background:#930807;"><a title="个人中心" href="${pageContext.request.contextPath }/qtuser_queryUserInfo" target="_blank">个人中心</a></li>
      <li class="tp1_1" ><a title="安全中心" href="${pageContext.request.contextPath }/Supermarket1_aqzx" target="_blank">安全中心</a></li>
     <!--  <li class="tp6_1"><a title="认证信息" href="top5.jsp" target="_top">认证信息</a></li> -->
     </ul>
    </div>
   </div>
  </div>
  
 </div>
 <!--头部结束-->

</body>
</html>
