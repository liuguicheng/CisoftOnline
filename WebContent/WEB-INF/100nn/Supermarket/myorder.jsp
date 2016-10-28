<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="s" uri="/struts-tags"%> 
    <%@ taglib prefix="pg" uri="http://jsptags.com/tags/navigation/pager" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>100南宁－快递超市</title>
<link href="100nn/css/base.css" rel="stylesheet" type="text/css" />
<link href="100nn/Supermarket/css/UserCenter_MyOrder.css" type="text/css" rel="stylesheet" />
<link href="100nn/css/nav_style.css" rel="stylesheet" type="text/css" />
<link href="100nn/css/foot_style.css" rel="stylesheet" type="text/css" />
<link href="100nn/Supermarket/css/jiaofei.css" rel="stylesheet" type="text/css" />
<style type="text/css">
.pages{ width:100.5%; text-align:center; padding:10px 0; clear:both;}
.pages span,.pages a,.pages b{ font-size:12px; font-family:Arial, Helvetica, sans-serif; margin:0 2px;}
.pages span font{ color:#f00; font-size:12px;}
.pages a,.pages b{ border:1px solid #5FA623; background:#fff; padding:2px 6px; text-decoration:none}
.pages span { padding-right:10px }
.pages b,.pages a:hover{ background:#7AB63F; color:#fff;}
</style>
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
    <div id="MianRight" style="width: 1200px;">
       <div id="MianRight_zp">
      <div id="MianRight_wt">用户中心</div>
      <div id="MianRight_wz">
      <div class="MianRight_mianTitle_userNav">
                    	<div class="MianRight_mianTitle_userNavTitle_wdtd"><a href="order_qtorders" title="我的订单" target="_self">我的订单</a></div>
                        <div class="MianRight_mianTitle_userNavTitle"><a href="shoppingcar_querygwclist" title="购物车" target="_self">购物车<span id="gwcid"></span>  件</a></div>
                        <div class="MianRight_mianTitle_userNavK"></div>
                        <div class="MianRight_mianTitle_userNavTitle"><a href="useraddress_qtqueryuseraddress" title="认证中心" target="_self">地址管理</a></div>
                        <div class="MianRight_mianTitle_userNavK"></div>
                        <div class="MianRight_mianTitle_userNavTitle"><a href="Supermarket_SecurityCenter" title="安全中心" target="_self">安全中心</a></div>
                        <div class="MianRight_mianTitle_userNavK"></div>
                       <!--  <div class="MianRight_mianTitle_userNavTitle"><a href="Supermarket_AuthenticationManagement" title="认证信息" target="_self">认证信息</a></div> -->
                </div>
                
                <table class="MianRight_mianTitlesNavBJnTb" cellspacing="0" cellpadding="0">
                    	<tr>
                        	<td>购买商品</td>
                            <td width="100">数量</td>
                            <td width="100">金额</td>
                            <td width="124">实付款（元）</td>
                            <td width="124">订单状态</td>
                            <td width="124">操作</td>
                        </tr>
                    </table>
                    
                     <%-- <s:if test="#orderlist.size()>0"> --%>
                     <s:if test="#pm.datas.size()>0">
                   <%--  <s:iterator value="#orderlist" var="o"> --%>
                   <s:iterator value="#pm.datas" var="o">
                    <table class="MianRight_mianTitlesNavBJnTb1" cellspacing="0" cellpadding="0">
                    	<tr style="height:36px;">
                        	<td style="background:#f8f8f8; text-align:left;border-bottom:#dfdfdf solid 1px;" colspan="10"><span style=" margin-left:10px;">订单编号：<s:property value="#o.o_bh"/> &nbsp; 成交时间:<s:property value="#o.o_endTime"/> </span></td>
                        </tr>
                        <s:iterator value="#ordlist" var="rr">
                        <s:iterator value="rr" var="r" status="ss">
                        <s:if test="#r.order.o_id==#o.o_id">
                        <tr >
                        	<td style="border-bottom:#dfdfdf dotted 1px;height:63px; line-height:63px;">
                            	<table>
                                	<tr>
                                    	<td width="105" style="padding-left:5px;"><a href="qtcommodity_querycommodityinfo?c_id=<s:property value="#r.commodity.c_id"/>" target="_blank"><img src='imgss.jsp?file=<s:property value="#r.commodity.c_sltimg"/>' width="40" height="58" /></a></td>
                                        <td style="color:#7c7c7c;"><span style="margin-left:5px;"><a href="qtcommodity_querycommodityinfo?c_id=<s:property value="#r.commodity.c_id"/>" target="_blank"><s:property value="#r.commodity.c_name"/></a> </span></td>
                                    </tr>
                                </table>
                            </td>
                            <td width="100" style="border-bottom:#dfdfdf dotted 1px; height:63px; line-height:63px;"><s:property value="#r.o_num"/> </td>
                            <td width="100" style="border-bottom:#dfdfdf dotted 1px; height:63px; line-height:63px;"><span class="MianRight_mianTitlesNavBJnTb1_span">￥<s:property value="#r.commodity.c_jg"/></span></td>
                           <s:if test="(#r.order.o_bh==#r.order.o_bh)&&(#ss.index==0)">
                        	<td width="122" style="border-left:#dfdfdf solid 1px; border-right:#dfdfdf solid 1px;" rowspan="<s:property value="#rr.size()"/>">￥<s:property value="#o.o_zjg"/></td>
                            <td width="123" style="border-right:#dfdfdf solid 1px;" rowspan='<s:property value="#rr.size()"/>'>
                            	<s:if test="#o.o_status==0">
                            	商家未发货
                            	</s:if>
                            	<s:elseif test="#o.o_status==1">
                            	<a onclick="qrsh(<s:property value="#o.o_id"/>,2);" title="查看详情" target="_blank">确认收货</a>
                            	</s:elseif>
                            	<s:elseif test="#o.o_status==3">
                            	订单结束
                            	</s:elseif>
                            	<s:elseif test="#o.o_status==6">
                                  未付款
                            	</s:elseif>
                            	<s:elseif test="#o.o_status==8">
                                  未付款
                            	</s:elseif>
                            	<s:else>交易结束</s:else>
                            	<br /><a href="order_qtorderinfo?o_id=<s:property value='#o.o_id'/>" title="查看详情" target="_blank">查看详情</a>
                            </td>
                            <td width="124" rowspan="<s:property value="#rr.size()"/>">
                            	<s:if test="#o.o_status==6||#o.o_status==8">
                            	<a href="javascript:tofk(<s:property value="#o.o_id"/>);">去付款</a><br /><a href="javascript:toqx(<s:property value="#o.o_id"/>);">取消订单</a><br />
                            	</s:if>
                            	申请退换货请拨打<br />400-8061-026
                            </td>
                       </s:if>
                       <s:else>
                           
                       </s:else>
                        </tr>
                        </s:if>
                         </s:iterator>
                        </s:iterator>
                    </table>
                    </s:iterator>
                        </s:if>
                        <s:else>
                         <table class="MianRight_mianTitlesNavBJnTb1" cellspacing="0" cellpadding="0">
                        <tr >
                         <td colspan="6" align="center">暂无订单</td>
                        </tr>
                        </table>
                        </s:else>
                        <div class="pages">
                        <pg:pager url="${pageContext.request.contextPath}/order_qtorders" items="${pm.total}" export="currentPageNumber=pageNumber" maxPageItems="10">   
 <span>共<font>${pm.total }</font>条/<font>${pm.totalpage }</font>页</span>
  <span>当前第<font>${currentPageNumber}</font>页</span>
  <pg:first >   
    <a href="${pageUrl}">首页</a>   
  </pg:first>   
  <pg:prev>   
    <a href="${pageUrl }">上一页</a>   
  </pg:prev>   
  <pg:pages>   
      <s:if test="#currentPageNumber==#pageNumber">   
        <font color="red">${pageNumber }</font>   
      </s:if>   
      <s:else>   
        <a href="${pageUrl }">${pageNumber }</a>   
      </s:else>   
  </pg:pages>   
  <pg:next>   
    <a href="${pageUrl }">下一页</a>   
  </pg:next>   
  <pg:last>   
    <a href="${pageUrl }">尾页</a>   
  </pg:last>   
</pg:pager>  
             </div>       
            </div>
        </div>
    </div>
    <div class="clear"></div>
    <!--[if !IE]> 内容|主内容开始 <![endif]-->
</div>
<!--[if !IE]> 内容|结束 <![endif]-->
<!--[if !IE]> 版权|开始 <![endif]-->
<div id="Foot">
 Copyright ©2013-2014 CISOFT Corporation, All Rights Reserved.&nbsp;&nbsp;桂ICP备12002922号-1&nbsp;&nbsp;增值电信业务经营许可证：桂B2-20140021&nbsp;&nbsp;版权所有：<a href="http://www.cisoft.cn/"  target="_blank">广西南宁市熙软循环信息科技有限公司</a>
</div>
<!--[if !IE]> 版权|结束 <![endif]-->
</body>
<script>
$().ready(function(){
     $
		.ajax({
			type : "POST",
			url : "shoppingcar_querygwccount",
			success : function(msgs) {
					$("#gwcid").html(msgs);
			}
		});
     
     
	});
	//确认收货
	function qrsh(id,status){
		$.ajax({
			   type: "POST",
			   url: "order_updatepwd",
			   data: "o_id="+id+"&o_status="+status,
			   success: function(msgs){
				   if(msgs=="修改成功"){
					   layer.msg('收货成功',2,1,"100px");
					   location.reload();   
				   }else{
					   layer.msg(msgs);
				   } 
			   }
		});
	}
	//去付款
	function tofk(id){
		window.location.href="order_tojspage?id="+id;
	}
	
	//取消订单
	function toqx(id){
		$.ajax({
			   type: "POST",
			   url: "order_updatepwd",
			   data: "o_id="+id+"&o_status="+7,
			   success: function(msgs){
				   if(msgs=="修改成功"){
					   layer.msg('取消成功',2,1,"100px");
					   location.reload();   
				   }else{
					   layer.msg(msgs);
				   } 
			   }
		});
	}
</script>
</body>
</html>