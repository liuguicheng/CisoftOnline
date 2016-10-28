<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>100南宁－快递超市</title>
<link href="100nn/css/base.css" rel="stylesheet" type="text/css" />
<link href="100nn/css/top_style.css" rel="stylesheet" type="text/css" />
<link href="100nn/css/nav_style.css" rel="stylesheet" type="text/css" />
<link href="100nn/css/foot_style.css" rel="stylesheet" type="text/css" />
<link href="100nn/Supermarket/css/jiaofei.css" rel="stylesheet"
	type="text/css" />
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
			<div id="MianRight_z2" >
				<div id="MianRight_wt">用户中心</div>
				<div class="MianRight_mianTitle_userNav">
					<div class="MianRight_mianTitle_userNavTitle_wdtd">
						<a href="order_qtorders" title="" target="_self">我的订单</a>
					</div>
					<div class="MianRight_mianTitle_userNavTitle">
						<a href="shoppingcar_querygwclist" title="购物车" target="_self">购物车
							<span id="gwcid"></span>件</a>
					</div>
					<div class="MianRight_mianTitle_userNavK"></div>
					<div class="MianRight_mianTitle_userNavTitle">
						<a href="useraddress_qtqueryuseraddress" title="地址管理"
							target="_self">地址管理</a>
					</div>
					<div class="MianRight_mianTitle_userNavK"></div>
					<div class="MianRight_mianTitle_userNavTitle">
						<a href="Supermarket_SecurityCenter" title="安全中心" target="_self">安全中心</a>
					</div>
					<div class="MianRight_mianTitle_userNavK"></div>
					<!-- <div class="MianRight_mianTitle_userNavTitle">
						<a href="Supermarket_AuthenticationManagement" title="认证信息"
							target="_self">认证信息</a>
					</div> -->
				</div>
				<s:if test="o_status==7">
					<div id="wsd" style="height:120px;;"> 
				   <div id="wsd23"></div>
				   </div>
				</s:if>
				<s:else>
				<div id="wsd">
				   <s:if test="o_status==0">
				   <div id="wsd1"></div>
				   </s:if>
				   <s:elseif test="o_status==1">
				   <div id="wsd2"></div>
				   </s:elseif>
				   <s:elseif test="o_status==2">
				   <div id="wsd21"></div>
				   </s:elseif>
				   <s:elseif test="o_status==3">
				   <div id="wsd21"></div>
				   </s:elseif>
				   <s:elseif test="o_status==8">
				   <div id="wsd1qr"></div>
				   </s:elseif>
					<s:if test="o_status!=7">
					<div id="wsd22">
						<div id="wsd221">拍下商品</div>
						<div id="wsd22100">付款</div>
						<div id="wsd2215">商家送货</div>
						<div id="wsd2211">收货评价</div>
					</div>
					</s:if>
				</div>
</s:else>
				<div id="xzshdzw">交易详情</div>
				<div id="ddzt">
					<div id="dddz">
						<div id="dddzll">
							<div id="dddzll1">订单状态：
							<s:if test="o_status==8">买家未付款</s:if>
							<s:elseif test="o_status==0">买家已付款</s:elseif>
							<s:elseif test="o_status==7">订单已取消</s:elseif>
							<s:elseif test="o_status==1">已发货</s:elseif>
							<s:elseif test="o_status==2">已收货</s:elseif>
							<s:elseif test="o_status==3">订单结束</s:elseif>
							</div>
							<div id="dddzll1">送货信息：<s:if test="o_status==1">商家送货中</s:if><s:elseif test="o_status==2">订单结束</s:elseif><s:else>暂未发货</s:else> </div>
							<div id="dddzll2">收货地址：</div>
							<div id="dddzll3">${useraddress.ua_address } ${useraddress.ua_shDh } ${useraddress.ua_shName }(收)</div>
						</div>
						<div id="dddzrr">
							<div id="dddzll1">订单编号：${o_bh }</div>
							<div id="dddzll1">订单时间：${o_startTime }</div>
						</div>

					</div>
					<div id="dddzr">

						<table width="100%" border="0" style="background: #eef4d8;">
							<tr>
								<td width="341" height="40"
									style="padding-left: 46px; font-weight: bold;">商品</td>
								<td width="93" align="center" style="font-weight: bold;">单价</td>
								<td width="124" align="center" style="font-weight: bold;">数量</td>
								<td width="145" align="center" style="font-weight: bold;">状态</td>
								<td width="132" align="center" style="font-weight: bold;">配送费</td>

							</tr>
						</table>
						   <s:iterator value="#ocdetaillist" var="oc">
							<table width="100%" border="0" style="border-bottom: #dfdfdf dotted 1px;">
								<tr>
									<td width="97" height="70 style="padding-left: 20px;"><img
										src="imgss.jsp?file=<s:property value="#oc.commodity.c_sltimg"/>" width="36"
										height="58" /></td>
									<td width="269"><span class="dami"><s:property value="#oc.commodity.c_name"/></span></td>
									<td width="93" align="center">￥<s:property value="#oc.commodity.c_jg"/></td>
									<td width="124" align="center"><s:property value="#oc.o_num"/></td>
									<td width="145" align="center" style="font-size: 12px;">交易成功</td>
									<td width="132" align="center"><%-- ￥<s:property value="#oc.commodity.c_psjg"/> --%>包邮</td>
								</tr>
							</table>
							</s:iterator>
							<table width="100%" border="0" style="background: #f6f6f6;">
								<tr>
									<td width="100%" height="39"><div id="MianRight_Wfr2w">
											实付款： <span class="bignum2">￥${o_zjg } </span>
										</div></td>
								</tr>
							</table>



					</div>
					    <div class="clear"></div>
				</div>

			</div>

		</div>

	</div>
	<!--[if !IE]> 内容|主内容开始 <![endif]-->
	<!--[if !IE]> 内容|结束 <![endif]-->
	<!--[if !IE]> 版权|开始 <![endif]-->
	<div id="Foot">
	 Copyright ©2013-2014 CISOFT Corporation, All Rights Reserved.&nbsp;&nbsp;桂ICP备12002922号-1&nbsp;&nbsp;增值电信业务经营许可证：桂B2-20140021&nbsp;&nbsp;版权所有：<a  target="_blank" href="http://www.cisoft.cn/">广西南宁市熙软循环信息科技有限公司</a>
	</div>
	<!--[if !IE]> 版权|结束 <![endif]-->
</body>
<script type="text/jscript" src="100nn/js/popup_layer.js"></script>
<script>

	$().ready(function() {
		 $
			.ajax({
				type : "POST",
				url : "shoppingcar_querygwccount",
				success : function(msgs) {
						$("#gwcid").html(msgs);
				}
			});
	});
</script>

</html>