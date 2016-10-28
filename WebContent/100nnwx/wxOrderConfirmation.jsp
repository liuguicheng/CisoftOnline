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
<link href="${pageContext.request.contextPath }/100nnwx/css/SecurityCenter.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath }/100nnwx/js/jquerymobile/zt/jquery.mobile-1.4.0.min.css" rel="stylesheet" type="text/css" />
</head>
<body >
	<div data-role="page" style="background:#FFF;">
		<div data-role="header" class="Top" style=" background:#8bc563; color:#FFF;text-shadow: 0 0 0 #eee;">
        <div class="Top_return"><a href="javascript:history.go(-1);" target="_self"><img src="${pageContext.request.contextPath }/100nnwx/img/return_button.gif" width="57" height="24"></a></div>
        订单确认
        <div class="Top_user_center"><a href="wxshoppingcar_getList" target="_self"><img src="${pageContext.request.contextPath }/100nnwx/img/user_center.gif" width="32" height="30"></a></div>
        </div>
		<div role="main" class="ui-content" style="padding-top:0;">
			<div class="Mian_Ddqr_title">
            	<div class="Mian_Ddqr_title_t">订单详情</div>
            	<s:iterator value="orderslist">
                <table cellpadding="0" cellspacing="0" class="Mian_DdqrCpmian_font_table">
                	<tr>
                		<td width="80" height="80"><div class="Mian_DdqrCpmian_font_tableCPImg"><img src="${pageContext.request.contextPath }/imgss.jsp?file=<s:property value="commodity.c_sltimg"/>" width="80" height="80"></div></td>
                		<td valign="top" class="Mian_Ddqr_title_m">
                        	<div class="Mian_Ddqr_title_mTitle"><s:property value="commodity.c_name"/> </div>
                            <div class="Mian_Ddqr_title_mTitle">价格：￥<s:property value="commodity.c_jg"/>&nbsp;&nbsp;&nbsp;数量：<s:property value="o_num"/></div>
                            <div class="Mian_Ddqr_title_mTitle">小计：<span class="xj">￥<s:property value="o_zjg"/></span></div>
                        </td>
                	</tr>
                </table>
                </s:iterator>
            </div>
            <div class="Mian_DdqrYf">
            	<div class="Mian_DdqrYf_left">运费 (包邮)</div>
                <div class="Mian_DdqrYf_right">总金额 <span id="zjg"></span></div>
            </div>
            <div class="Mian_DdqrYf_dz" >
           
               <div style="margin: 0 auto;">
    				<s:if test="#useraddress.size()>0">
    				<s:iterator value="useraddress">
    				<a href="wxuseraddress_xzuseraddress?id=${bsid}&result=${result}" style="text-decoration: none;color:#7c7c7c; ">
    				<div style="clear: both;">
          			  <div style="float: left;"><input type="hidden" value="<s:property value="ua_id"/>" id="shdzid"></div>
            		  <div style="clear: both;font-size: 15px;margin-top: 10px;">收&nbsp;货&nbsp;人：<s:property value="ua_shName"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<s:property value="ua_shDh"/> </div>
           			  <div style="clear: both;font-size: 13px;margin-top: 10px;padding-bottom: 20px;">收货地址：<s:property value="ua_address"/></div>  
           			 </div>
           			 </a>
				    </s:iterator>
				    </s:if>
				    <s:else>
				    <p><a href="${pageContext.request.contextPath }/100nnwx/wxAddUserAddress.jsp?bs=1&numstr=${bsid}&ids=${result}" style="text-decoration: none;"  target="_self">暂无收货地址，点击添加？</a></p>
				    </s:else>
				</div>
            </div>
            <div class="Mian_Ddqrzf" style="clear: both;">
            	<div class="Mian_Ddqrzf_title">支付方式</div>
                <div class="Mian_Ddqrzf_title1">
                    	<!-- <div class="Mian_Ddqrzf_mian" style="position:absolute; left:0; top:0;"><input type="radio" checked="checked" name="Sex" value="male" /></div><div class="Mian_Ddqrzf_mian" style="position:absolute; left:35px; top:0;"><img src="img/sj_ico.jpg" width="85" height="20"></div> -->
                        <div class="Mian_Ddqrzf_mian" style="position:absolute;  top:0;"><input type="radio" name="zfid" value="3" checked="checked" /></div><div class="Mian_Ddqrzf_mian" style="position:absolute; left:30px; top:0;"><img src="${pageContext.request.contextPath }/100nnwx/img/zfb_ico.jpg" width="61" height="20"></div>
                </div>
            </div>
            <table style="width: 100%;">					
				<tr>
					<td style="padding-top:10px;">
					<form action="" id="fromid" method="post" >
					<input type="hidden" name="sortid" value="2">
					       <input type="hidden" value="${c_id }" name="id" id="ddbh" >
					       <input type="hidden" value="" name="shdz" id="shdz" >
					       <input type="hidden" value="" name="zfje" id="zj" >
					       <input type="hidden" value="${g_id }" name="result" id="spmxid" >
						<a  style="background:#8ac463; color:#FFF; font-weight:100; font-family:'黑体'; font-size:18px; font-weight:bold; text-shadow : 0 0 1px #000;" id="btnlogin" href="javascript:void(0);" data-role="button" target="_self" onclick="tjdd();" class="ui-link ui-btn ui-shadow ui-corner-all">确认支付</a> 
					</form>
					</td>
				</tr>
			</table>
		</div>

<!--        <div data-role="footer">
		</div>-->
	</div>
</body>
<script type="text/javascript" src="${pageContext.request.contextPath }/100nnwx/js/jquery-1.8.3.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	var jg="";
	$(".xj").each(function() {
		var lsjg=($(this).text()).split("￥")[1];
		jg=Number(jg)+Number(lsjg);
		$("#zj").val(jg);
		$("#zjg").html("¥"+jg);
	});
	
	
});
function tjdd(){
	$("#shdz").val($("#shdzid").val());
	var id=$("#ddbh").val();//商品明细编号
	var shdz=$("#shdz").val();//收货地址
	var yfjg=$("#zj").val();//应付价格
	var shmxid=$("#spmxid").val();//商品明细id
	if(shdz==null||shdz==""){
		alert("请选择收货地址");
		return;
	}else if(id==null||id==""){
		alert("确认订单发生错误");
		return;
	}else if(yfjg==null||yfjg==""){
		alert("确认订单发生错误");
		return;
	}else if(shmxid==null||shmxid==""){
		alert("确认订单发生错误");
		return;
	}else{
	var insuranceTypeVar = $("input[name='zfid']:checked").val();
	var url="";
	if(insuranceTypeVar==3){
		//微信版支付宝（移动版）
		url="wxpaymentrecords_zfbzf";
	
	}
	$("#fromid").attr("action", url);
	$("#fromid").submit();
	
	}
}
</script>
</html>