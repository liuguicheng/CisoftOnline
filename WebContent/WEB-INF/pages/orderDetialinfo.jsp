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
<script type="text/javascript">
	$(function(){		
		
		//下拉框回显
		var commodity="${commodity.c_id}";
		$("#commodity").val(commodity);
		/* $.ajax({
			   type: "POST",
			   url: "order_select",
			   success: function(msg){
				 
					}
		}); */
		
		$("#save").click(function(){
			$("#form1").form('submit',{
				url:'${pageContext.request.contextPath}/htorder_save',
				onSubmit:function(){
					var unitname=$("#unitname").val();
					if($.trim(unitname).length==0){
						$("#spanunitname").show();
						return false;
					}else{
						$("#spanunitname").hide();
					}
				},
				success:function(data){
					$.messager.alert("提示",eval("("+data+")"),"info");
				}
			});
		});
	})
</script>
</head>
<body class="easyui-layout">	
	<div region="center" style="padding-top: 10px;">
	<div style="margin-top:10px;width: 94%;padding-left:10px;padding-top:10px; border: solid 1px #ccc; background-color: #f7f7f7;height: 30px;margin: 0 auto;font-size: 14px;">
	订单详细
	</div>
				<form id="form1" method="post">
					<table style="margin: 0 auto;width: 95%;margin-top:5px; margin-bottom:5px;  font-size: 14px;" cellspacing="0" cellpadding="10" border="solid 1px #ccc;">
						<tr>
							<td class="">订单编号</td>
							<td class="" >${o_bh }</td>
							<td class="">订单交易号</td>
							<td class="" >${o_jyh }</td>
							<td class="">订单状态</td>
							<td class="" >
							  <s:if test="o_status==0">已付款、未发货</s:if>
							  <s:elseif test="o_status==1">已发货、未收货</s:elseif>
							  <s:elseif test="o_status==2">买家已收货</s:elseif>
							  <s:elseif test="o_status==3">订单结束</s:elseif>
							  <s:elseif test="o_status==8">未付款</s:elseif>
							</td>
						</tr>
						<tr>
						    <td class="">订单总价</td>
							<td class="">¥ ${o_zjg }</td>
							<td class="">订单运费</td>
							<td  class="">¥ ${o_yf }</td>
							<td class="">是否开发票</td>
							<td  class="">无</td>
						</tr>
						<tr>
							<td class="">下单时间</td>
							<td class="">${o_startTime }</td>
							<td class="">发货时间</td>
							<td  class="">${fhtime }</td>
							<td class="">收货时间</td>
							<td class="">${shtime }</td>
						</tr>
						<tr>
						    <td class="">是否付款</td>
							<td  class="" >
								<s:if test="o_status==0||o_status==1||o_status==2">已付款</s:if> 
								<s:elseif test="o_status==8||o_status==3" >未付款</s:elseif>
								
							</td>
							<td>付款时间</td>
							<td>${fktime }</td>
							<td class="" >付款方式</td>
							<td >
							<s:if test="o_fkfs==1">
							银联支付
							</s:if>
							<s:elseif test="o_fkfs==2">
							支付宝支付
							</s:elseif>
							</td>
							
						</tr>
						<tr>
							<td class="" colspan="6">收货人信息</td>
						</tr>
						<tr>
							<td class="">收货人姓名</td>
							<td class="">${useraddress.ua_shName }</td>
							<td class="">收货人地址</td>
							<td  class="">${useraddress.ua_address}</td>
							<td class="">收货人电话</td>
							<td class="">${useraddress.ua_shDh }</td>
						</tr>
						<tr>
							<td class="">备注</td>
							<td class="" colspan="5">${o_bz }</td>
						</tr>
						
						
					</table>
					<div style="margin-top:20px;width: 94%;padding-left:10px;padding-top:10px; border: solid 1px #ccc; background-color: #f7f7f7;height: 30px;margin: 0 auto;font-size: 14px;">
	订单商品信息
	</div>
	<table style="margin: 0 auto;width: 95%;margin-top:5px;   font-size: 14px;" cellspacing="0" cellpadding="10" border="solid 1px #ccc;">
						    <tr>
							<td class="">商品名称</td>
							<td  class="" >商品数量</td>
							<td class="">商品单价</td>
							</tr>
							<s:iterator value="#ocdlists" var="orr">
							<tr>
							<td><s:property value="#orr.commodity.c_name"/> </td>
							<td><s:property value="#orr.o_num"/> </td>
							<td><s:property value="#orr.commodity.c_jg"/> </td>
							</tr>
							</s:iterator>
							</table>
	<div style="margin-top:20px;width: 94%;padding-left:10px;padding-top:10px; border: solid 1px #ccc; background-color: #f7f7f7;height: 30px;margin: 0 auto;font-size: 14px;margin-top: 10px;">
	订单流程
	</div>
	<table style="margin: 0 auto;width: 95%;margin-top:5px;   font-size: 14px;" cellspacing="0" cellpadding="10" border="solid 1px #ccc;">
						    <tr>
							<td class="">操作内容</td>
							<td  class="" >时间</td>
							</tr>
							<s:iterator value="#orecords" var="or">
							<tr>
							<td>
								<s:if test="or_step==0">用户付款</s:if>
								<s:elseif test="or_step==1">卖家发货</s:elseif>
								<s:elseif test="or_step==2">买家收货</s:elseif>
								<s:elseif test="or_step==3">订单结束</s:elseif>
								<s:elseif test="or_step==7">用户下单，未付款</s:elseif>
							</td>
							<td><s:date name="or_szsj" format="yyyy-MM-dd HH:mm:ss"/> </td>
							</tr>
							</s:iterator>
							</table>
	<div style="margin-top:20px;width: 94%;padding-left:10px;padding-top:10px; border: solid 1px #ccc; background-color: #f7f7f7;height: 30px;margin: 0 auto;font-size: 14px;margin-top: 10px;">
	付款记录
	</div>
	<table style="margin: 0 auto;width: 95%;margin-top:5px;   font-size: 14px;" cellspacing="0" cellpadding="10" border="solid 1px #ccc;">
						    <tr>
						    <td class="">交易流水号</td>
							<td class="">付款方式</td>
							<td class="">付款状态</td>
							<td  class="" >操作时间</td>
							</tr>
							<s:iterator value="#precords" var="pr">
							<tr>
							<td><s:property value="qid"/> </td>
							<td><s:if test="pr_ddlx==1">银联支付</s:if><s:else>支付宝支付</s:else> </td>
							<td><s:if test="pr_status==0">未付款</s:if><s:elseif test="pr_status==1">付款成功</s:elseif><s:else>付款失败</s:else> </td>
							<td><s:date name="pr_startTime" format="yyyy-MM-dd HH:mm:ss"/> </td>
							</tr>
							</s:iterator>
							</table>
				</form>
	</div>
</body>
</html>