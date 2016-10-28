<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>     
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- <meta name="viewport" content="width=device-width, initial-scale=1"> -->
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0;" name="viewport" />
<title>100NN同城快递超市</title>
		<link href="img/favicon.ico" rel="shortcut icon" type="image/x-icon">
<!--<link href="js/jquerymobile/jquery.mobile-1.4.0.min.css" rel="stylesheet" type="text/css" />-->
<link href="${pageContext.request.contextPath }/100nnwx/js/jquerymobile/zt/jquery.mobile-1.4.0.min.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath }/100nnwx/css/SecurityCenter.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${pageContext.request.contextPath }/100nnwx/js/jquery-1.8.3.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/100nnwx/js/jquerymobile/jquery.mobile-1.4.0.min.js"></script>

</head>
<body>
	<div data-role="page" style="background:#FFF;">
		<div data-role="header" class="Top" style=" background:#8bc563; color:#FFF;text-shadow: 0 0 0 #eee;">
        <div class="Top_return"><a href="javascript:history.go(-1);" target="_self"><img src="${pageContext.request.contextPath }/100nnwx/img/return_button.gif" width="57" height="24"></a></div>
        订单详情
        <div class="Top_user_center"><a href="wxshoppingcar_getList" target="_self"><img src="${pageContext.request.contextPath }/100nnwx/img/user_center.gif" width="32" height="30"></a></div>
        </div>
		<div role="main" class="ui-content" style="padding-top:0;">
			<div class="Mian_Ddqr_title">
                <div class="Mian_DdqrYf">订单状态 <span style="color:#F00">
 					 <s:if test="o_status==0">未发货</s:if>
                <s:elseif test="o_status==1">已送货</s:elseif>
                <s:elseif test="o_status==8">未付款</s:elseif>
                <s:elseif test="o_status==3">订单已取消</s:elseif>
                <s:else>订单结束</s:else>
				</span></div>
                <div class="Mian_DdqrYf">送货信息 <span style="color:#F00">
                <s:if test="o_status==0">未发货</s:if>
                <s:elseif test="o_status==1">未收货</s:elseif>
                <s:else>未发货</s:else>
                </span></div>     
            	<div class="Mian_Ddqr_title_t">商品详情</div>
                <s:iterator value="ocdetaillist">
                <table cellpadding="0" cellspacing="0" class="Mian_DdqrCpmian_font_table">
                	<tr>
                		<td width="80" height="80"><div class="Mian_DdqrCpmian_font_tableCPImg"><img src="${pageContext.request.contextPath }/imgss.jsp?file=<s:property value="commodity.c_sltimg"/>" width="80" height="80"></div></td>
                		<td valign="top" class="Mian_Ddqr_title_m">
                        	<div class="Mian_Ddqr_title_mTitle"><s:property value="commodity.c_name"/></div>
                            <div class="Mian_Ddqr_title_mTitle">价格：￥<s:property value="o_zjg"/> 数量：<s:property value="o_num"/></div>
                            <div class="Mian_Ddqr_title_mTitle">小计：<span>￥<s:property value="o_zjg"/> </span></div>
                        </td>
                	</tr>
                </table>
                </s:iterator>
                
            </div>
            <div class="Mian_DdqrYf">总 &nbsp;金 &nbsp;额 <span style="color:#F00">￥${o_zjg}</span></div>     
            <div class="Mian_DdqrYf_dz2">
            	<table cellpadding="0" cellspacing="0">
                	<tr>
                    	<td width="70" valign="top">收货地址</td>
                        <td valign="top" class="Mian_DdqrYf_dz_tdR">${useraddress.ua_address } ${useraddress.ua_shName } ${useraddress.ua_shDh }</td>
                    </tr>
                </table>
            </div>
            <div class="Mian_DdqrYf_dz1">
            	<table cellpadding="0" cellspacing="0" >
                	<tr>
                        <td valign="top" class="Mian_DdqrYf_dz_tdR" colspan="2" style="width: 100%;height:100%;font-size: 13px; ">订单编号：${o_bh }<br>
                        下单时间：${o_startTime }<br/>
                        <s:if test="fhtime!=null">
                        发货时间：${fhtime}<br/>
                        </s:if>
                         <s:if test="shtime!=null">
                        收货时间：${shtime }<br/>
                        </s:if>
                        <s:if test="o_endTime!=null">
                        结束时间：${o_endTime}
                        </s:if>
                        </td>
                    </tr>
                </table>
            </div>
		</div>

<!--        <div data-role="footer">
		</div>-->
	</div>
</body>
</html>