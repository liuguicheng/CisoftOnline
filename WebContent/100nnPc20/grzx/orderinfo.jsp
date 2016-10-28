<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>100南宁－快递超市</title>
<link href="${pageContext.request.contextPath}/100nn/Supermarket/css/jiaofei.css" rel="stylesheet"
	type="text/css" />
</head>



<body>
	<!--[if !IE]> 头部|开始 <![endif]-->
	<%@ include file="top_orders.jsp"%>
	<!--[if !IE]> 头部|结束 <![endif]-->
	<!--[if !IE]> 内容|开始 <![endif]-->
		<div style="margin: 0 auto; width: 1002px;">
	<div id="Mian">
		<!--[if !IE]> 内容|主内容开始 <![endif]-->

		<div id="MianRight" style="overflow-x:hidden; height: auto;">
			<div id="MianRight_z2"  style="height:auto;">
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
					<div id="wsd22" >
						<div id="wsd221" style="color: rgb(123,61,0)">拍下商品</div>
						<div id="wsd22100" style="color: rgb(123,61,0)">付款</div>
						<div id="wsd2215" style="color: rgb(123,61,0)">商家送货</div>
						<div id="wsd2211" style="color: rgb(123,61,0)">收货评价</div>
					</div>
					</s:if>
				</div>
</s:else>
				<div id="xzshdzw">交易详情</div>
				<div id="ddzt" style="border: 0px;">
					<div id="dddz" style="border: 1px solid #dbdbdb;">
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
						<div id="dddzrr" >
							<div id="dddzll1">订单编号：${o_bh }</div>
							<div id="dddzll1">订单时间：${o_startTime }</div>
						</div>

					</div>
					<div id="dddzr" style="width: 740px;border-left:0px;border-bottom: 1px solid #dbdbdb; border-right: 1px solid #dbdbdb;border-top: 1px solid #dbdbdb;margin-bottom: 40px; ">

						<table width="720px" border="0" style="background: #f0e9e3;border-right: 1px solid #dbdbdb;">
							<tr>
								<td width="141" height="40"
									style="padding-left: 46px; font-weight: bold;">商品</td>
								<td width="43" align="center" style="font-weight: bold;">单价</td>
								<td width="44" align="center" style="font-weight: bold;">数量</td>
								<td width="45" align="center" style="font-weight: bold;">状态</td>
								<td width="42" align="center" style="font-weight: bold;">配送费</td>

							</tr>
						</table>
						   <s:iterator value="#ocdetaillist" var="oc">
						   <s:if test="#ocdetaillist.size()==1">
						   <table width="720px" border="0" style="border-bottom: #dfdfdf dotted 1px;min-height: 150px;border-right: 1px solid #dbdbdb;">
						   </s:if>
						   <s:else>
						   <table width="720px" border="0" style="border-bottom: #dfdfdf dotted 1px;min-height: 40px;border-right: 1px solid #dbdbdb;">
						   </s:else>
							
								<tr>
									<td width="80" height="70" style="padding-left: 20px;"><img
										src="imgss.jsp?file=<s:property value="#oc.commodity.c_sltimg"/>" width="36"
										height="58" /></td>
									<td width="79"><span class="dami"><s:property value="#oc.commodity.c_name"/></span></td>
									<td width="43" align="center">￥<s:property value="#oc.commodity.c_jg"/></td>
									<td width="44" align="center"><s:property value="#oc.o_num"/></td>
									<td width="45" align="center" style="font-size: 12px;">交易成功</td>
									<td width="42" align="center"><%-- ￥<s:property value="#oc.commodity.c_psjg"/> --%>包邮</td>
								</tr>
							</table>
							</s:iterator>
							<table width="720px" border="0" style="background: #f6f6f6;border-right: 1px solid #dbdbdb;">
								<tr>
									<td width="100%" height="40" >
										<div id="MianRight_Wfr2w" style="width: 120px;">
											实付款： <span class="bignum2">￥${o_zjg } </span>
										</div></td>
								</tr>
							</table>
                           


					</div>
				</div>

			</div>

		</div>
</div>
	</div>
	<!--[if !IE]> 内容|主内容开始 <![endif]-->
	<!--[if !IE]> 内容|结束 <![endif]-->
	<!--[if !IE]> 版权|开始 <![endif]-->
	<%@ include file="../foot.jsp"%>
	<!--[if !IE]> 版权|结束 <![endif]-->
</body>
<script type="text/jscript" src="${pageContext.request.contextPath}/100nn/js/popup_layer.js"></script>
<script>

	$().ready(function() {
		
		var s= $("#dddzr").height();
		$("#dddz").css("height",s);
		
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