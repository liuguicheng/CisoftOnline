<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- <meta name="viewport" content="width=device-width, initial-scale=1"> -->
<meta charset="utf-8">
<meta
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0;"
	name="viewport" />
<title>100NN同城快递超市</title>
		<link href="img/favicon.ico" rel="shortcut icon" type="image/x-icon">
<!--<link href="js/jquerymobile/jquery.mobile-1.4.0.min.css" rel="stylesheet" type="text/css" />-->
<link
	href="${pageContext.request.contextPath }/100nnwx/js/jquerymobile/zt/jquery.mobile-1.4.0.min.css"
	rel="stylesheet" type="text/css" />
<link
	href="${pageContext.request.contextPath }/100nnwx/css/SecurityCenter.css"
	rel="stylesheet" type="text/css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/100nnwx/css/style.css" />
<style type="text/css">
#zwid a {
	text-decoration: none;
	color: rgb(123, 123, 123);
}

#zwid a:hover {
	text-decoration: none;
	color: #333;
}
</style>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/100nnwx/js/jquery-1.8.3.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/100nnwx/js/jquerymobile/jquery.mobile-1.4.0.min.js"></script>

</head>
<body>
	<div data-role="page" style="background: #f0f0f0;">
		<div data-role="header" class="Top"
			style="background: #8bc563; color: #FFF; text-shadow: 0 0 0 #eee;">
			<div class="Top_return">
				<a href="javascript:history.go(-1);" target="_self"><img
					src="${pageContext.request.contextPath }/100nnwx/img/return_button.gif"
					width="57" height="24"></a>
			</div>
			我的订单
			<div class="Top_user_center">
				<a href="wxshoppingcar_getList" target="_self"><img
					src="${pageContext.request.contextPath }/100nnwx/img/user_center.gif"
					width="32" height="30"></a>
			</div>
		</div>
		<div class="orderMian_t">
			<s:iterator value="orderlist" var="ord">
			  <% int i=0;%>
				<div class="orderMian">
					<div class="orderMian_m">
						<a href="wxorders_qtorderinfo?orders.o_id=<s:property value="#ord.o_id"/>" target="_self" style="text-decoration: none;color: #000;">
						<div class="orderMian_mTitle">
							<div class="orderMian_mTitle_st1">订单编号：<s:property value="#ord.o_bh"/></div>
							<div class="orderMian_mTitle_st">订单日期：<s:property value="#ord.o_startTime"/></div>

						</div>
						</a>
						<div class="orderMian_mTitle_button"></div>
						<div class="orderMian_mNr">
						   <s:iterator value="ocd" var="rr">
        	  				<s:iterator value="rr" var="r" status="ss">
        	  				  <s:if test="#r.order.o_id==#ord.o_id">
						    <% i++; %>
						    <a href="${pageContext.request.contextPath }/wxcommodity_querycommodityinfo?commodity.c_id=<s:property value="#r.commodity.c_id"/>&bsid=1"  target="_self" style="text-decoration: none;color: #000;">
							<div class="orderMian_mNr_m">
								<div class="orderMian_mNr_mImg">
									<img src="${pageContext.request.contextPath }/imgss.jsp?file=<s:property value='#r.commodity.c_sltimg'/>">
								</div>
								<div class="orderMian_mNr_mTs1" style="text-overflow: ellipsis;overflow: hidden;white-space: nowrap;width: 180px;font-size: 14px;"><s:property value="#r.commodity.c_name"/></div>
								<div class="orderMian_mNr_mTs">
									数量：<s:property value="#r.o_num"/> &nbsp;价格：<span>￥<s:property value="#r.o_zjg"/> </span>
								</div>
							</div>
							</a>
							</s:if>
							</s:iterator>
							</s:iterator>
						</div>
						<div class="orderMian_mFoot">
							<div class="orderMian_mFoot_up">
								<span class="orderMian_mFoot_upLeft">共<%=i %>件商品 合计：<span>￥<s:property value="#ord.o_zjg"/></span></span>
								<span class="orderMian_mFoot_upRight">
								<s:if test="#ord.o_status==8">
								未付款
								</s:if>
								<s:elseif test="#ord.o_status==0">
								未发货
								</s:elseif>
								<s:elseif test="#ord.o_status==1">
								未收货
								</s:elseif>
								<s:else>
								订单结束
								</s:else>
								
								</span>
							</div>
							<div class="orderMian_mFoot_down">
								<div class="orderMian_mFoot_down_title">
									<a href="wxorders_qtorderinfo?orders.o_id=<s:property value="#ord.o_id"/>" target="_self">查看详情</a>
								</div>
								<s:if test="#ord.o_status==8">
								<div class="orderMian_mFoot_down_fK" style="cursor:pointer;" onclick="tojs(<s:property value="#ord.o_id"/>);"></div>
								<div class="orderMian_mFoot_down_qxdd" style="cursor:pointer;" onclick="toqx(<s:property value="#ord.o_id"/>);"></div>
								</s:if>
								<s:elseif test="#ord.o_status==0">
								</s:elseif>
								<s:elseif test="#ord.o_status==1">
								<div class="orderMian_mFoot_down_wlt" style="cursor:pointer;" onclick="tosh(<s:property value="#ord.o_id"/>);"></div>
       						 <div class="orderMian_mFoot_down_pj" style="cursor:pointer;"></div>
								</s:elseif>
								
							</div>
						</div>
					</div>
				</div>

				<%-- <a href="wxorders_qtorderinfo?orders.o_id=<s:property value="#ord.o_id"/>" target="_self" style="text-decoration: none;color: #000;">
			<div role="main" class="ui-content ck" style="  padding:0 10px 15px; background:#FFF; border-bottom:#d9d9d9 solid 1px; border-top:#d9d9d9 solid 1px; margin:10px 0;">
        		<div class="Mian_wddd" style="padding-left: 10px;"><s:property value="#ord.o_title"/> </div>
				<div class="Mian_dzgl_mtk">
               	 	<div class="Mian_wddd_font">
               	 	<div ><div style="float: left;">订单编号：</div><div style="text-overflow: ellipsis;overflow: hidden;white-space: nowrap;width: 200px;float: left;"><s:property value="#ord.o_bh"/></div></div>
                    <div style="clear: both;">订单日期：<s:property value="#ord.o_startTime"/> </div>
                     <% int i=0;%>
                     <s:iterator value="ocd" var="rr">
        	  <s:iterator value="rr" var="r" status="ss">
        	   <s:if test="#r.order.o_id==#ord.o_id">
        	   <% i++; %>
        	   </s:if>
        	   </s:iterator>
        	   </s:iterator>
                    <div><span >总&nbsp;&nbsp;金&nbsp;&nbsp;额：</span><span class="Mian_wddd_fontSpan">￥<s:property value="#ord.o_zjg"/> </span>  |   共<%=i %>件商品</div>
                </div>
				</div>
			</div>
			</a> --%>
				<%-- <s:iterator value="ocd" var="rr">
        	  <s:iterator value="rr" var="r" status="ss">
        	   <s:if test="#r.order.o_id==#ord.o_id">
<a href="wxorders_qtorderinfo?orders.o_id=<s:property value="#r.order.o_id"/>" target="_self" style="text-decoration: none;color: #000;">
			<div role="main" class="ui-content ck" style="  padding:0 10px 15px; background:#FFF; border-bottom:#d9d9d9 solid 1px; border-top:#d9d9d9 solid 1px; margin:10px 0;">
        		<div class="Mian_wddd" style="padding-left: 10px;"><s:property value="#r.commodity.c_name"/> </div>
				<div class="Mian_dzgl_mtk">
              	  <div class="Mian_wddd_img"><a href="" target="_self"><img src="${pageContext.request.contextPath }/imgss.jsp?file=<s:property value='#r.commodity.c_sltimg'/> " width="58" height="58"></a></div>
               	 	<div class="Mian_wddd_font">
                	<div>订单编号：<s:property value="#r.order.o_bh"/> </div>
                    <div>订单日期：<s:property value="#r.order.o_startTime"/> </div>
                    <div><span class="Mian_wddd_fontSpan1">价格：</span><span class="Mian_wddd_fontSpan">￥<s:property value="#r.order.o_zjg"/> </span>  |   共<s:property value="#r.size();"/>件商品</div>
                </div>
				</div>
			</div>
			</a>
			</s:if>
			</s:iterator>
        </s:iterator> --%>
			</s:iterator>
		</div>
		<s:if test="orderlist.size()==0">
			<div
				style="text-align: center; margin-top: 45px; margin-bottom: 20px;"
				id="zwid">
				<a href="${pageContext.request.contextPath }/towxpage.jsp"
					target="_parent">暂无订单，马上去逛逛？</a>
			</div>
		</s:if>
		<!--        <div data-role="footer">
		</div>-->
	</div>
</body>
<script type="text/javascript" src="${pageContext.request.contextPath }/100nnwx/js/msgbox.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/layer.min.js"> </script>
<script type="text/javascript">
	$(document).ready(function() {
		//页面宽度
		var we = $(".orderMian_t").width();
		we = we - 20;
		$(".orderMian_m").css("width", we);
		//点击收起
		$(".orderMian_mNr").hide();
		$(".orderMian_mNr :first").show();
		$(".orderMian_mTitle_button").click(function() {
			$(this).next(".orderMian_mNr").slideToggle(500);
		});
		

	});
	//去付款
	function tojs(id){
		window.location.href="wxorders_tojspage?id="+id;
	}
	//取消订单
	function toqx(id){
		$
		.ajax({
			type : "POST",
			url : "wxorders_updatepwd?orders.o_id="+id+"&orders.o_status=3",
			 success : function(data) {
				if (data =="修改成功") {
					layer.alert('取消成功', 1,function(){
						window.location.reload();
					}); 
				}
			 }
		});
	}
	function tosh(id){
		
		$
		.ajax({
			type : "POST",
			url : "wxorders_doqrsh?orders.o_id="+id+"&orders.o_status=2",
			 success : function(data) {
				if (data =="1") {
					layer.alert('收货成功', 1,function(){
						window.location.reload();
					}); //风格8 错误脸
					
				}
			 }
		});
	}
	//弹出提示数量：
function clickautohide(i){
	var tip = "";
	switch(i){
		case 1:
			tip = "取消订单成功";
		break;
		case 4:
			tip = "添加成功！";
		break;
		case 2:
			tip = "收货成功";
		break;
		case 6:
			tip = "正在加载中，请稍后...";
		break;
	}
	ZENG.msgbox.show(tip, i, 2000);
}
</script>
</html>