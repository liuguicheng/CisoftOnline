<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width initial-scale=1.0 maximum-scale=1.0 user-scalable=yes" />
<title>100NN同城快递超市</title>
<link href="img/favicon.ico" rel="shortcut icon" type="image/x-icon">
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath }/100nnwx/css/news_style.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/100nnwx/css/swipe.css" />
<script type="text/javascript" src="${pageContext.request.contextPath }/100nnwx/js/jquery-1.8.3.js"></script>
<%-- <script type="text/javascript" src="${pageContext.request.contextPath }/100nnwx/js/js/yd_other.js"></script> --%>
<script type="text/javascript"  src="${pageContext.request.contextPath }/100nnwx/js/swipe.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/100nnwx/js/msgbox.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/layer.min.js"> </script>
<style type="text/css">
.imgsr{
height: expression(this.width > 230 ? this.height = this.height * 230 / this.width : "auto");
width: expression(this.width > 230 ? "230px" : "auto");
max-width:230px;
}
</style>
</head>

<body style="margin: 0px 0px; padding: 0px 0px;">
<div class="zz"></div>
        <div class="zz_img"></div>
        <div class="zz_tg"></div>
<header>
  <a class="left_nav" href="javascript:history.go(-1);" target="_self"><img src="${pageContext.request.contextPath }/100nnwx/img/a_left.jpg" width="38" height="40"></a>
  商品详情
  <a class="right_ShoppingCart" href="${pageContext.request.contextPath }/wxshoppingcar_getList" target="_self"><img src="${pageContext.request.contextPath }/100nnwx/img/right_ShoppingCart.jpg" width="40" height="40"></a>
</header>
<div id="Go_index"><a href="${pageContext.request.contextPath }/wxcommodity_querycommdityList" target="_self"><img src="${pageContext.request.contextPath }/100nnwx/img/go_index.png" width="50" height="60"></a></div>
 <%-- <div id="banner">
<div class="bannerPane">
			  <section class="slider">
				<div class="flexslider">
				  <ul class="slides">
					<li>
						<img src="${pageContext.request.contextPath }/imgss.jsp?file=${imglist[0]}" height="240px;" />
						</li>
						<li>
						<img src="${pageContext.request.contextPath }/imgss.jsp?file=${imglist[0]}"height="240px;"  />
						</li>
						<li>
						<img src="${pageContext.request.contextPath }/imgss.jsp?file=${imglist[0]}"height="240px;"  />
						</li>
				  </ul>
				</div>
			  </section>
			</div>
			</div> --%>
<%-- <img src="${pageContext.request.contextPath }/imgss.jsp?file=${imglist[0]}" width="100%">
</div> --%>
<div class="banner" style="vertical-align:middle;text-align:center;">
			<!-- <img src="100nnwx/img/banner.jpg" width="100%" height="170"> -->
			<div class="addWrap">
			<div class="swipe" id="mySwipe" style="height: 100%">
				<div class="swipe-wrap">
				<s:iterator value="#imglist" id='number'>
					<div>
						<a href="javascript:;"><img src="${pageContext.request.contextPath }/imgss.jsp?file=<s:property value="number"/>" class="imgsr" /></a>
					</div>
				</s:iterator>	
				</div>
			</div>
			<ul id="position" style="margin-left:45%;">
			 	<s:iterator value="#imglist" id='number' status="st">
			 	<s:if test="#st.index==0">
				<li class="cur"></li>
				</s:if>
				<s:else>
				<li ></li>
				</s:else>
				</s:iterator>
			</ul>
		</div>
		
	</div>
<input type="hidden" id="c_id" value="${commodity.c_id}">
<div id="PriceTitle">
  <div class="PriceTitle_title"><s:property value="commodity.c_name"/></div>
  <div class="PriceTitle_jg">￥<s:property value="commodity.c_jg"/>/<s:property value="commodity.c_jldw"/></div>
  <div class="PriceTitle_fb"><span>配送到家：￥0</span><span>库存：<s:property value="commodity.c_ck"/> </span></div>
</div>
<div class="mian_titile" style="border-top:#bcbcbc solid 1px;"><a href="wxcommodity_querycommodityinfo?commodity.c_id=<s:property value="commodity.c_id"/>&bsid=2" target="_self"><span>商品参数</span></a></div>
<div class="mian_titile"><a href="${pageContext.request.contextPath }/100nnwx/wxGoodsDetails_yhpj.jsp?c_id=<s:property value="commodity.c_id"/>" target="_self"><span>用户评价</span></a></div>
<div class="mian_titile"><a href="${pageContext.request.contextPath }/100nnwx/wxGoodsDetails_shfw.jsp?c_id=<s:property value="commodity.c_id"/>" target="_self"><span>售后服务</span></a></div>
<div id="Mian">
<div id="cpms">
${ commodity.c_spms}
</div>
<%-- <img class="imgss" src="${pageContext.request.contextPath }/100nnwx/img/img_1.jpg"> --%>
</div>
<div class="dd">
  <div class="dd_ljggm">
    <div class="dd_ljggm_button" onclick="onbtn(2);">立即购买</div>
  </div>
  <div class="dd_ljggm">
    <div class="dd_jrgwc_button" onclick="onbtn(1);">加入购物车</div>
  </div>
</div>
<div class="bgs"></div>
<div data-role="popup" id="popupCloseRight" class="ui-content" style="max-width:280px;">
			<p></p>
		</div>
</body>
<script type="text/javascript">
$(document).ready(function(){
	var wh=$(window).width();
	wh=wh-30;
	$("#PriceTitle").css("width",wh);
	$('#cpms').click(function(){
		$('.cpms').fadeOut(400);
	    $('.bgs').fadeIn(400);
	    $('.bgs').html("");
	    $('.bgs').html($("#cpms").html());
});

$('.bgs').click(function(){
	   $('.cpms').fadeIn(400);
       $('.bgs').fadeOut(400);
   });
//轮播
var bullets = document.getElementById('position').getElementsByTagName('li');
var banner = Swipe(document.getElementById('mySwipe'), {
	auto: 2000,
	continuous: true,
	disableScroll:false,
	callback: function(pos) {
		var i = bullets.length;
		while (i--) {
		  bullets[i].className = ' ';
		}
		bullets[pos].className = 'cur';
	}
});
});
function onbtn(id){
	var c_id = $("#c_id").val();
	var type = id;//1标示加入购物车 2 标识结算
	$
			.ajax({
				type : "POST",
				url : "wxshoppingcar_save",
				data : "c_id=" + c_id 
						+ "&type="
						+ type,
				 success : function(data) {
					
					if (data == "添加购物车成功") {
						 /* $("#popupCloseRight").find("p").html(data);
						 $("#jrgwcid").attr("href","#popupCloseRight");
						 $("#jrgwcid").removeAttr("onclick");
						//主动触发事件
							$("#jrgwcid").trigger("click"); */
						/* layer.alert('添加成功', 1); */
						layer.msg('添加成功',2,-1);
							
					}else if(data== "2"){
						window.location.href="${pageContext.request.contextPath }/100nnwx/wxshoppingcar_getList?shoppingCart.user.u_id=1";
					} else{
						layer.alert('操作失败', 8);
						
					}
					
					
				}
			})
}
//弹出提示
function clickautohide(i){
	var tip = "";
	switch(i){
		case 1:
			tip = "服务器繁忙，请稍后再试。";
		break;
		case 4:
			tip = "添加成功！";
		break;
		case 5:
			tip = "操作失败";
		break;
		case 6:
			tip = "正在加载中，请稍后...";
		break;
	}
	ZENG.msgbox.show(tip, i, 2000);
}
</script>

</html>
