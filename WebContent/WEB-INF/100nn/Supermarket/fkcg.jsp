<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="s" uri="/struts-tags"%>     
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>100南宁－快递超市</title>
<link href="100nn/css/base.css" rel="stylesheet" type="text/css" />
<link href="100nn/css/nav_style.css" rel="stylesheet" type="text/css" />
<link href="100nn/css/foot_style.css" rel="stylesheet" type="text/css" />
<link href="100nn/Supermarket/css/jiaofei.css" rel="stylesheet" type="text/css" />
</head>



<body>
<!--[if !IE]> 头部|开始 <![endif]-->
<%@ include file="/WEB-INF/100nn/top.jsp"%>
<!--[if !IE]> 头部|结束 <![endif]-->
<!--[if !IE]> 内容|开始 <![endif]-->
<div id="Mian">
<!--[if !IE]> 内容|导航开始 <![endif]-->
<div id="MianLeft">
  <%@ include file="/WEB-INF/100nn/scmenu.jsp"%>
  </div>
<!--[if !IE]> 内容|导航结束 <![endif]-->
<!--[if !IE]> 内容|主内容开始 <![endif]-->

<div id="MianRight">
   <div id="MianRight_z22">
     <div id="MianRight_z22M">
       <div id="MianRight_z22ML"></div>
       <div id="MianRight_z22MR"><s:property value="#result"/> 付款成功！</div>
     </div>
     <div id="gusp">
     
     <div id="gusp1">商品名称:</div>
     <s:iterator value="#orderlist" var="o">
     <div id="gusp2"><s:property value="#o.o_spname"/> </div>
     </s:iterator> 
     </div>
     <div id="sjh">商家会24小时内送货上门</div>
     <div id="sjh1">
       <div id="sjh1L"><a href="order_qtorderinfo?o_id=${id}">查看订单详情</a></div>
        <div id="sjh1R"><a href="Supermarket_index">继续购物</a></div>
 </div>
     
   </div>
   
 </div>
	
</div>
<!--[if !IE]> 内容|主内容开始 <![endif]-->
</div>
<!--[if !IE]> 内容|结束 <![endif]-->
<!--[if !IE]> 版权|开始 <![endif]-->
<div id="Foot">
 Copyright ©2013-2014 CISOFT Corporation, All Rights Reserved.&nbsp;&nbsp;桂ICP备12002922号-1&nbsp;&nbsp;增值电信业务经营许可证：桂B2-20140021&nbsp;&nbsp;版权所有：<a  target="_blank" href="http://www.cisoft.cn/">广西南宁市熙软循环信息科技有限公司</a>
</div>
<!--[if !IE]> 版权|结束 <![endif]-->
</body>


</html>