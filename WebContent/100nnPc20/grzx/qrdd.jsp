<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>100南宁快递超市</title>
<link href="${pageContext.request.contextPath }/100nn/Supermarket/css/AddressManagement.css" type="text/css" rel="stylesheet" />
<link href="${pageContext.request.contextPath }/100nn/Supermarket/css/jiaofei.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/100nn/cj/alert/jquery.prompt.css">

</head>



<body>
<!--[if !IE]> 头部|开始 <![endif]-->
<%@ include file="top_orders.jsp"%>
<!--[if !IE]> 头部|结束 <![endif]-->
<!--[if !IE]> 内容|开始 <![endif]-->
 <div style="margin: 0 auto; width: 1002px;">
<div id="Mian">
<form method="psot" id="fromid" action="">
<input type="hidden" name="sortid" value="1">
<!--[if !IE]> 内容|主内容开始 <![endif]-->

<div id="MianRight" style="overflow-x:hidden; height: auto;">
   <div id="MianRight_zp" style="height:auto;">
         <div id="wsd" style="height: auto;margin-bottom: 5px;">
            <div id="wsd1qr" style="background: url(100nnPc20/images/lc_03.png) no-repeat;height: 120px; width: 1002px;margin-top: 0px;margin-left: 0px;"></div>
            <!--  <div id="wsd22" >
             <div id="wsd221" style="color: #E78C3D;">拍下商品</div>
             <div id="wsd22100" style="color: #E78C3D;">付款</div>
             <div id="wsd2215" style="color: #E78C3D;">商家送货</div>
             <div id="wsd2211" style="color: #E78C3D;">收货评价</div>
            </div> -->
            
         </div>
      <div id="xzshdzwp1" style="margin-top: 20px;">选择送货地址</div>
        <div id="shdzM" style="width: 1002px;">
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
          <div id="xsqbML"><a href="javascript:void(0);" class="shdz" style="color:#E78C3D;font-size: 12px;">使用新地址</a></div>
          <div id="xsqbMR" style="margin-right: 90px;"><a href="useraddress_qtqueryuseraddress" target="_blank" style="color: #E78C3D;font-size: 12px;">管理送货地址</a></div>
      </div> 
        </s:if>
        <s:else>
        <a href="javascript:void(0);" class="shdz" style="color: #E78C3D;font-family: '宋体';font-size: 12px;">暂无收货地址，点击添加？</a>
        </s:else>
        </div>
     
      <div id="xzshdzwp1" style="padding-top: 15px;">确认订单信息</div>
        
      <table width="100%" height="37" style="background: #f0e9e3; border-top: 1px solid #bd0200;margin-bottom: 10px;" class="TableInfo">
        <tr>
        <td align="center" style="padding-right:30px;">商品</td>
		<td width="141" align="center">单价</td>
		<td width="106" align="center">数量</td>
		<td width="107" align="center">小计</td>
        </tr>
        </table>
        <div id="MianRight_wMian2" style="border-bottom:0px;padding-right: 5px;">
      <s:iterator value="#orderslist" var="o" status="ss"> 
      <s:if test="#ss.odd == true">
      <table style="margin-right: 5px;"width="98.7%" border="0" height="74" class="bg222" >
      </s:if>
      <s:else>
            <table width="98.7%" border="0" height="74" class="bg220">
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
<div id="MianRight_WfMM" style="border: 1px solid #ff9c01;height: 36px;margin-top:70px;margin-bottom: 20px;">
        <div id="MianRight_WflO" ><a href="javascript:history.go(-1);" style="color: #E78C3D;">返回修改订单</a></div>
       <div id="MianRight_Wfr">
         <div id="MianRight_Wfr2p">总价(含运费)：<span class="bignum2" id="zj"></span></div>
        <div id="tjdd" style="width: 130px;background:#ff9c00;"><a onclick="tjdd();" style="cursor:pointer;">提交订单</a></div>
         
       </div>
    </div>
   </div>
   
 </div>
	</div>
</div>
</from>
<!--[if !IE]> 内容|主内容开始 <![endif]-->
<!--[if !IE]> 内容|结束 <![endif]-->
<!--[if !IE]> 版权|开始 <![endif]-->
<%@ include file="../foot.jsp"%>
<!--[if !IE]> 版权|结束 <![endif]-->
</body>
<script type="text/jscript" src="${pageContext.request.contextPath }/100nn/js/popup_layer.js"></script>
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