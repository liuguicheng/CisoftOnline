<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="s" uri="/struts-tags"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>100南宁－快递超市</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="100nn/css/base.css" rel="stylesheet" type="text/css" />
<link href="100nn/css/foot_style.css" rel="stylesheet" type="text/css" />
<link href="100nn/Supermarket/css/AuthenticationManagement.css" rel="stylesheet" type="text/css" />
<link href="100nn/Supermarket/css/jiaofei.css" rel="stylesheet" type="text/css" />
<link href="100nn/css/nav_style.css" rel="stylesheet" type="text/css" />
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

<div id="MianRight">
  <div id="MianRight_z">
      <div id="MianRight_wt">用户中心</div>
      <div id="MianRight_wz">
       <div class="MianRight_mianTitle_userNav">
                    	<div class="MianRight_mianTitle_userNavTitle"><a href="order_qtorders" title="我的订单" target="_self">我的订单</a></div>
                    	 <div class="MianRight_mianTitle_userNavK"></div>
                        <div class="MianRight_mianTitle_userNavTitle"><a href="shoppingcar_querygwclist" title="购物车" target="_self">购物车<span id="gwcid"></span>  件</a></div>
                        <div class="MianRight_mianTitle_userNavK"></div>
                        <div class="MianRight_mianTitle_userNavTitle"><a href="useraddress_qtqueryuseraddress" title="地址管理" target="_self">地址管理</a></div>
                        <div class="MianRight_mianTitle_userNavK"></div>
                        <div class="MianRight_mianTitle_userNavTitle"><a href="Supermarket_SecurityCenter" title="安全中心" target="_self">安全中心</a></div>
                        <div class="MianRight_mianTitle_userNavK"></div>
                        <!-- <div class="MianRight_mianTitle_userNavTitle">认证信息</div> -->
         </div>
         </div>
      <div class="MianRight_mianTitlesNavBJn">
                	<div class="MianRight_mianTitlesNavBJn_mian"></div>
                    <div class="MianRight_mianTitlesNavBJn_mian"><span class="MianRight_mianTitlesNavBJn_mianSpantitle">基本信息</span></div>
                    <div class="MianRight_mianTitlesNavBJn_mian">姓名：${usersession.u_zsName }<!-- <img src="100nn/Supermarket/images/ico.gif" width="58" height="14" /> --></div>
                    <div class="MianRight_mianTitlesNavBJn_mian">手机号码：${usersession.u_lxdh }<span class="MianRight_mianTitlesNavBJn_mianSpangh"><a id="ele9" href="#" title="更换手机号码" target="_self">更换</a></span></div>
                    <div class="MianRight_mianTitlesNavBJn_mian">所属小区：${usersession.u_address }</div>
                </div>
            </div>
      
       
   </div>
 </div>
	
<!--[if !IE]> 内容|主内容开始 <![endif]-->
</div>
<!--[if !IE]> 内容|结束 <![endif]-->
<!--[if !IE]> 版权|开始 <![endif]-->
<div id="Foot">
 Copyright ©2013-2014 CISOFT Corporation, All Rights Reserved.&nbsp;&nbsp;桂ICP备12002922号-1&nbsp;&nbsp;增值电信业务经营许可证：桂B2-20140021&nbsp;&nbsp;版权所有：<a href="http://www.cisoft.cn/"  target="_blank">广西南宁市熙软循环信息科技有限公司</a>
</div>
<!--[if !IE]> 版权|结束 <![endif]-->
</body>
<script type="text/jscript" src="100nn/js/popup_layer.js"></script>
<script language="javascript">
		$(document).ready(function() {
			var t9 = new PopupLayer({trigger:"#ele9",popupBlk:"#blk9",closeBtn:"#close9",useOverlay:true,useFx:true,isResizeFollowTigger:false,
				offsets:{
					x:0,
					y:-41
				}
			});
			t9.doEffects = function(way){
				if(way == "open"){
					this.popupLayer.css({opacity:0.3}).show(1,function(){
						this.popupLayer.animate({
							left:($(document).width() - this.popupLayer.width())/2,
							top:(document.documentElement.clientHeight - this.popupLayer.height())/2 + $(document).scrollTop(),
							opacity:0.8
						},1,function(){this.popupLayer.css("opacity",1)}.binding(this));
					}.binding(this));
				}
				else{
					this.popupLayer.animate({
						left:this.trigger.offset().left,
						top:this.trigger.offset().top,
						opacity:0.1
					},{duration:5,complete:function(){this.popupLayer.css("opacity",1);this.popupLayer.hide()}.binding(this)});
				}
			}
		});
</script>
<script type="text/javascript">
$(document).ready(function(){
  $(".left_nav_mian_tz1").hide();
  $(".nav_button").click(function(){
	$(".left_nav_mian_tz1").hide();
    $(this).next(".left_nav_mian_tz1").slideDown(100);
  });
  $(".left_nav_mian_tz").click(function(){
    //var p_html = $(".left_nav_mian_tz").html();
    var p_html = $(this).html();
	$(".nav_button").html(p_html);
    $(".left_nav_mian_tz1").slideUp(100); 
  });
  $(document).mouseup(function(event){
	if($(event.target).parents("#birthday_type_ul").length==0){
	$("#birthday_type_ul").slideUp(100);
	}
	});
});
</script>
<script type="text/javascript">
$(document).ready(function(){
  $(".left_nav_mian_tz2").hide();
  $(".nav_button1").click(function(){
	$(".left_nav_mian_tz2").hide();
    $(this).next(".left_nav_mian_tz2").slideDown(100);
  });
  $(".left_nav_mian_tz3").click(function(){
    //var p_html = $(".left_nav_mian_tz").html();
    var p_html = $(this).html();
	$(".nav_button1").html(p_html);
    $(".left_nav_mian_tz2").slideUp(100); 
  });
  $(document).mouseup(function(event){
	if($(event.target).parents("#birthday_type_ul1").length==0){
	$("#birthday_type_ul1").slideUp(100);
	}
	});
});
</script>

<script type="text/javascript">
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
</script>

</html>