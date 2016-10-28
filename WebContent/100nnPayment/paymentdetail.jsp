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
	缴费订单详细
	</div>
				<form id="form1" method="post">
					<table style="margin: 0 auto;width: 95%;margin-top:5px; margin-bottom:5px;  font-size: 14px;" cellspacing="0" cellpadding="10" border="solid 1px #ccc;">
						
						<tr>
						    <td class="">缴费项目名称</td>
							<td class=""> <s:property value="payment.paymentName"/> </td>
							<td class="">缴费项目类型</td>
							<td  class="" colspan="3">
							<s:if test="payment.paymentType==1">水费</s:if>
							  <s:elseif test="payment.paymentType==2">电费</s:elseif>
							  <s:elseif test="payment.paymentType==3">煤气费</s:elseif>
							  <s:elseif test="payment.paymentType==4">其他费用</s:elseif>
							</td>
						</tr>
						<tr>
							<td class="">缴费订单编号</td>
							<td class="" ><s:property value="payment.paymentBh"/></td>
							<td class="">缴费订单交易号</td>
							<td class="" ><s:property value="payment.paymentjyh"/></td>
							<td class="">缴费订单状态</td>
							<td class="" >
							  <s:if test="payment.paymentZt==1">支付成功</s:if>
							  <s:elseif test="payment.paymentZt==2">支付失败</s:elseif>
							  <s:elseif test="payment.paymentZt==3">支付正在验证</s:elseif>
							  <s:elseif test="payment.paymentZt==4">交易未成功</s:elseif>
							  <s:elseif test="payment.paymentZt==5">未收货</s:elseif>
							  <s:elseif test="payment.paymentZt==6">交易成功</s:elseif>
							</td>
						</tr>
						<tr>
						    <td class="">缴费金额</td>
							<td class="">¥ <s:property value="payment.paymentPrice"/></td>
							<td class="">村医姓名</td>
							<td  class=""><s:property value="payment.paymentXingMin"/></td>
							<td class="">手机号码</td>
							<td  class=""><s:property value="payment.paymentZhanghao"/></td>
						</tr>
						<tr>
							<td class="">缴费时间</td>
							<td class=""><s:date name="payment.paymentDate" format="yyyy-MM-dd HH:mm:ss"/> </td>
							<td class="">缴费方式</td>
							<td  class=""  colspan="3">
							<s:if test="payment.paymentFs==1">支付宝</s:if>
							  <s:elseif test="payment.paymentFs==2">银联</s:elseif>
							</td>
						</tr>
						
						<tr>
							<td class="">备注</td>
							<td class="" colspan="5"><s:property value="payment.bz"/> </td>
						</tr>
						
						
					</table>
				
	
	<div style="margin-top:20px;width: 94%;padding-left:10px;padding-top:10px; border: solid 1px #ccc; background-color: #f7f7f7;height: 30px;margin: 0 auto;font-size: 14px;margin-top: 10px;">
	流水记录
	</div>
	<table style="margin: 0 auto;width: 95%;margin-top:5px;   font-size: 14px;" cellspacing="0" cellpadding="10" border="solid 1px #ccc;">
						    <tr>
						    <td class="">交易流水号</td>
							<td class="">付款方式</td>
							<td class="">付款状态</td>
							<td  class="" >操作时间</td>
							</tr>
							<s:if test="precords.size()==0">
							<tr>
								<td colspan="4" style="text-align: center;" >暂无相关信息</td>
							</tr>
							</s:if>
							<s:else>
							<s:iterator value="precords" var="pr">
							<tr>
							<td><s:property value="qid"/> </td>
							<td><s:if test="pr_ddlx==1">银联支付</s:if><s:else>支付宝支付</s:else> </td>
							<td><s:if test="pr_status==0">未付款</s:if><s:elseif test="pr_status==1">付款成功</s:elseif><s:else>付款失败</s:else> </td>
							<td><s:date name="pr_startTime" format="yyyy-MM-dd HH:mm:ss"/> </td>
							</tr>
							</s:iterator>
							</s:else>
							</table>
				</form>
	</div>
</body>
</html>