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
<link href="100nn/Supermarket/css/AddressManagement.css" type="text/css" rel="stylesheet" />
<link href="100nn/Supermarket/css/jiaofei.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/100nn/cj/alert/jquery.prompt.css">

</head>



<body>
<!--[if !IE]> 头部|开始 <![endif]-->
<%@ include file="/WEB-INF/100nn/top.jsp"%>
<!--[if !IE]> 头部|结束 <![endif]-->
<!--[if !IE]> 内容|开始 <![endif]-->
<div id="Mian">
<form method="psot" id="fromid" action="">
<input type="hidden" name="sortid" value="1">
<!--[if !IE]> 内容|导航开始 <![endif]-->
<div id="MianLeft">
<%@ include file="/WEB-INF/100nn/scmenu.jsp"%>
</div>
<!--[if !IE]> 内容|导航结束 <![endif]-->
<!--[if !IE]> 内容|主内容开始 <![endif]-->

<div id="MianRight">
   <div id="MianRight_zp">
      <div id="MianRight_wt">用户中心</div>
      <div class="MianRight_mianTitle_userNav">
                    	<div class="MianRight_mianTitle_userNavTitle_wdtd"><a href="order_qtorders" title="我的订单" target="_self">我的订单</a></div>
                        <div class="MianRight_mianTitle_userNavTitle"><a href="shoppingcar_querygwclist" title="购物车" target="_self">购物车 <span id="gwcid"></span> 件</a></div>
                        <div class="MianRight_mianTitle_userNavK"></div>
                        <div class="MianRight_mianTitle_userNavTitle"><a href="useraddress_qtqueryuseraddress" title="认证中心" target="_self">地址管理</a></div>
                        <div class="MianRight_mianTitle_userNavK"></div>
                        <div class="MianRight_mianTitle_userNavTitle"><a href="Supermarket_SecurityCenter" title="安全中心" target="_self">安全中心</a></div>
                        <div class="MianRight_mianTitle_userNavK"></div>
                        <!-- <div class="MianRight_mianTitle_userNavTitle"><a href="Supermarket_AuthenticationManagement" title="认证信息" target="_self">认证信息</a></div> -->
                </div>
         <div id="wsd">
            <div id="wsd1qr"></div>
             <div id="wsd22">
             <div id="wsd221">拍下商品</div>
             <div id="wsd22100">付款</div>
             <div id="wsd2215">商家送货</div>
             <div id="wsd2211">收货评价</div>
            </div>
            
         </div>
      <div id="xzshdzwp1">选择送货地址</div>
        <div id="shdzM">
        <!-- 商品明细编号 -->
        <input type="hidden" id="ddbh" name="id" value="${c_id }"/>
         <input type="hidden" id="spmxid" name="result" value="${g_id }"/>
         <!--  -->
        <input type="hidden" id="zfjg" name="zfje" value=""/>
         <s:if test="#useraddress.size()>0">
        <s:iterator value="#useraddress" var="ua" status="ids">
        
        <s:if test="#useraddress.size()==1">
         <!-- 收货地址 -->
        <input type="hidden" id="shdzs"  name="shdz" value="<s:property value="#ua.ua_id"/>"/>
        <div class="shdzM1" style="margin-bottom: 13px;" id="zt<s:property value="#ua.ua_id"/>"  onclick="onzj('<s:property value="#ua.ua_id"/>');">
        
        <input type="hidden" id="dz<s:property value="#ua.ua_id"/>" value='<s:property value="#ua.ua_id"/>' />
         <div id="shdzM1t">(<s:property value="#ua.ua_shName"/>  收)</div>
         <div id="shdzM1f"><s:property value="#ua.ua_address"/>   <s:property value="#ua.ua_shDh"/></div>
        </div>
        </s:if>
        <s:else>
            <s:if test="#ua.ua_status==1">
        <!-- 收货地址 -->
        <input type="hidden" id="shdz"  name="shdz" value="<s:property value="#ua.ua_id"/>"/>
        <div class="shdzM1" style="margin-bottom: 13px;" id="zt<s:property value="#ua.ua_id"/>"  onclick="onzj('<s:property value="#ua.ua_id"/>');">
        <input type="hidden" id="dz<s:property value="#ua.ua_id"/>" value='<s:property value="#ua.ua_id"/>' />
         <div id="shdzM1t"><div style="float: left;">(<s:property value="#ua.ua_shName"/>  收)</div><div style="color: #4a7500;font-size: 12px;margin-left: 88px;float: left;">默认地址</div></div>
         <div id="shdzM1f"><s:property value="#ua.ua_address"/>   <s:property value="#ua.ua_shDh"/></div>
        </div>
        </s:if>
        <s:else>
        	 <div class="shdzM2"  style="margin-bottom: 13px;" id="zt<s:property value="#ua.ua_id"/>" onclick="onzj('<s:property value="#ua.ua_id"/>');">
       		 <input type="hidden" id="dz<s:property value="#ua.ua_id"/>" value='<s:property value="#ua.ua_id"/>' />
        	 <div id="shdzM1t">(<s:property value="#ua.ua_shName"/>  收)</div>
       		 <div id="shdzM1f"><s:property value="#ua.ua_address"/>   <s:property value="#ua.ua_shDh"/></div>
       		 </div>
       		 </s:else>
        </s:else>
       		
        
        </s:iterator>
         
        <div id="xsqbM" style="clear: both; margin-bottom: 0px;">
          <div id="xsqbML"><a href="javascript:void(0);" class="shdz" style="color: #4a7500;font-size: 12px;">使用新地址</a></div>
          <div id="xsqbMR"><a href="useraddress_qtqueryuseraddress" target="_blank" style="color: #4a7500;font-size: 12px;">管理送货地址</a></div>
      </div> 
        </s:if>
        <s:else>
        <a href="javascript:void(0);" class="shdz" style="color: #5b8400;font-family: '宋体';font-size: 12px;">暂无收货地址，点击添加？</a>
        </s:else>
        </div>
     
      <div id="xzshdzwp1" style="padding-top: 15px;">确认订单信息</div>
        
      <table width="100%" height="37" style="background:#eef4d7;" class="TableInfo">
        <tr>
        <td align="center" style="padding-right:30px;">商品</td>
		<td width="141" align="center">单价</td>
		<td width="106" align="center">数量</td>
		<td width="107" align="center">小计</td>
        </tr>
        </table>
        <div id="MianRight_wMian2" >
      <s:iterator value="#orderslist" var="o" status="ss"> 
      <s:if test="#ss.odd == true">
      <table width="100%" border="0" height="74" class="bg222">
      </s:if>
      <s:else>
            <table width="100%" border="0" height="74" class="bg220">
      </s:else>
 	 <tr>
    <td width="50" style="padding-left:40px;"><a href="qtcommodity_querycommodityinfo?c_id=<s:property value="#o.commodity.c_id"/>" target="_blank"><img src="imgss.jsp?file=<s:property value="#o.commodity.c_sltimg"/>" width="36" height="58" /></a></td>
    <td class="dami"><a style="color: #7c7c7c;" href="qtcommodity_querycommodityinfo?c_id=<s:property value="#o.commodity.c_id"/>" target="_blank"><s:property value="#o.commodity.c_name"/></a> </td>
    <td width="141" align="center" >￥<s:property value="#o.commodity.c_jg"/> </td>
    <td width="106" align="center" ><s:property value="#o.o_num"/></td>
    <td width="107" align="center" class="jq">￥<s:property value="#o.o_zjg"/> </td>
  	</tr>
</table>
</s:iterator>

<div style="float: right;color: black;font-size: 16px;line-height: 37px;float: right;text-align: center;font-weight: bold;margin-right: 35px;">运费：包邮</div>
</div>

<div style="margin-top: 10px;margin-bottom: 3px;">
<div id="xzshdzwp1" style="float: left;">选择支付方式</div>
<div style="clear: both;">
<!-- <div style="float: left;">
  <input type="radio" value="1" checked="checked" name="s" >
  </div>
   <div style="float: left;">
 <img src="100nn/Supermarket/images/yl_ico.jpg" width="126" height="40" />
 </div>-->
 <div style="float: left;margin-left: 10px;">
 <input type="radio" value="2" checked="checked" name="s">
 </div>
 <div style="float: left;">
 <img src="100nn/Supermarket/images/zfb_ico.jpg" width="126" height="40" />
 </div>
 </div>
</div>
<div id="MianRight_WfMM" >
        <div id="MianRight_WflO"><a href="javascript:history.go(-1);">返回修改订单</a></div>
       <div id="MianRight_Wfr">
         <div id="MianRight_Wfr2p">总价(含运费)：<span class="bignum2" id="zj"></span></div>
        <div id="tjdd" style="width: 130px;"><a onclick="tjdd();" style="cursor:pointer;">提交订单</a></div>
       </div>
    </div>
   </div>
   
 </div>
	
</div>
</from>
<!--[if !IE]> 内容|主内容开始 <![endif]-->
<!--[if !IE]> 内容|结束 <![endif]-->
<!--[if !IE]> 版权|开始 <![endif]-->
<div id="Foot">
 Copyright ©2013-2014 CISOFT Corporation, All Rights Reserved.&nbsp;&nbsp;桂ICP备12002922号-1&nbsp;&nbsp;增值电信业务经营许可证：桂B2-20140021&nbsp;&nbsp;版权所有：<a  target="_blank" href="http://www.cisoft.cn/">广西南宁市熙软循环信息科技有限公司</a>
</div>
<!--[if !IE]> 版权|结束 <![endif]-->
</body>
<script type="text/jscript" src="100nn/js/popup_layer.js"></script>
<!-- 提示框 -->
<script type="text/javascript" src="${pageContext.request.contextPath }/100nn/cj/alert/jquery.prompt.min.js"></script>
<script>
$(function(){
	var num="";
	var yfnum="";
	var zj="";
	    $(".yf").each(function() {
		   var n=String($(this).val());
		   yfnum=Number(n)+Number(yfnum);
	    });
		$(".jq").each(function() {
		   var n=String($(this).text());
		   var nn=n.substring(1);
	       num=Number(nn)+Number(num);
	    });
		
		zj=	Number(yfnum)+Number(num);
		zj=zj.toFixed(2);
	if(zj==""){
		num="0.00";
	}
	$("#zj").html("¥"+zj);
	 $
		.ajax({
			type : "POST",
			url : "shoppingcar_querygwccount",
			success : function(msgs) {
					$("#gwcid").html(msgs);
			}
		});
});
function onzj(ids){

	if($("#zt"+ids).attr("class")=="shdzM1"){
	}else{
		var zid=$(".shdzM1").attr("id");
    $("#zt"+ids).removeClass();
	$("#zt"+ids).addClass("shdzM1");
	
	$("#"+zid).removeClass();
	$("#"+zid).addClass("shdzM2"); 
	}
	$("#shdz").val(ids);
}

function tjdd(){
	var id=$("#ddbh").val();//商品明细编号
	var shdz=$("#shdz").val();//收货地址
	var shdz1=$("#shdzs").val();
	var yfjg=$("#zj").html();//应付价格
	var shmxid=$("#spmxid").val();//商品明细id
	if(shdz==null&&shdz1==null){
		$("#emample16").attr("display","block");
		$("#erridsss").attr("display","block");
		    $.layer({
				    type: 1,
				    title: "添加收货地址",
				    area: ['700px', '436px'],
				    shade: [0.5, '#000'],
				    shift: 'top', //从左动画弹出
				    page: {
				        dom: '#emample16'
				    },
				   
				});
	}else if(id==null){
		layer.msg("确认订单发生错误");
	}else if(yfjg==null){
		layer.msg("确认订单发生错误");
	}else if(shmxid==null){
		layer.msg("确认订单发生错误");
	}else{
	var insuranceTypeVar = $("input[name='s']:checked").val();
	$("#zfjg").val(yfjg.substring(1));
	var url="";
	if(insuranceTypeVar==1){
		url="paymentrecords_paymentService";
	}else if(insuranceTypeVar==2){
		url="paymentrecords_zfbzf";
	}
	
	$("#fromid").attr("action", url);
	$("#fromid").submit();
	}
}
</script>

</html>