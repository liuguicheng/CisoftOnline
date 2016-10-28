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
<link href="100nn/css/100nnzc.css" rel="stylesheet" type="text/css" />
<link href="100nn/css/core.css" rel="stylesheet" type="text/css" />
<link href="100nn/css/Untitled-2.css" rel="stylesheet" type="text/css" />

</head>

<body onload="number();">
<!--[if !IE]> 头部|开始 <![endif]-->
<%@ include file="/WEB-INF/100nn/top.jsp"%>
<!--[if !IE]> 头部|结束 <![endif]-->
<!--[if !IE]> 内容|开始 <![endif]-->
<!--[if !IE]> 登录框|DIV结束 <![endif]-->
<!--[if !IE]> 内容|导航开始 <![endif]-->
<div id="MianLeft">
  <%@ include file="/WEB-INF/100nn/scmenu.jsp"%>
</div>
<!--[if !IE]> 内容|导航结束 <![endif]-->
<!--[if !IE]> 内容|主内容开始 <![endif]-->
<div id="Mian" >

<div id="MianRight">
<div id="MianRight_jh_success">
<s:if test="#error!='激活成功'">
<!-- <div class="MianRight_mianTitlesNavBJ">注册-激活失败</div> -->
<div class="MianRight_mianTitlesNavzc" >
   <div style="height: 144px;float: left;">
   <img alt="" src="100nn/images/cha_1.png" width="144px" height="144px;"> 
   </div> 
   <div style="float: left;line-height: 144px;margin-left: 3%;" class="errid">
   <a href="javascript:void(0);" class="tcdiv" style="color: #4C946E;">${error }</a>
   </div>
</div>
</s:if>
<s:else>

<div class="MianRight_mianTitlesNavzc" style="margin-left: 65px;font-size: 16px;">
 <div style="height: 144px;float: left;">
<img alt="" src="100nn/images/gou.gif"> 
</div>
<div style="float: left;line-height: 144px;margin-left: 3%;" class="errid">
<a href="javascript:void(0);" class="tcdiv" style="color: #4C946E;"></a>
</div>
</div>
</s:else>
 </div>
 </div>
 </div>
<!--[if !IE]> 内容|主内容开始 <![endif]-->
<!--[if !IE]> 内容|结束 <![endif]-->
<!--[if !IE]> 版权|开始 <![endif]-->
<div id="Foot">
 Copyright ©2013-2014 CISOFT Corporation, All Rights Reserved.&nbsp;&nbsp;桂ICP备12002922号-1&nbsp;&nbsp;增值电信业务经营许可证：桂B2-20140021&nbsp;&nbsp;版权所有：<a href="http://www.cisoft.cn/"  target="_blank">广西南宁市熙软循环信息科技有限公司</a>
</div>
<!--[if !IE]> 版权|结束 <![endif]-->
</body>
<script type="text/javascript">
$(document).ready(function(){
  $(".left_nav_mian_tz1").hide();
  $(".nav_button").click(function(){
	$(".left_nav_mian_tz1").hide();
    $(this).next(".left_nav_mian_tz1").show();
  });
  $(".left_nav_mian_tz").click(function(){
    //var p_html = $(".left_nav_mian_tz").html();
    var p_html = $(this).html();
	$(".nav_button").html(p_html);
    $(".left_nav_mian_tz1").hide();
  });
  
 
});
</script>
<script type="text/javascript">
var time = 3;  
function number(){  
      window.setTimeout("number()",1000);  
      if(time >0){  
         var obj = $(".errid");  
         obj.html("");  
         obj.html("<a href=\"javascript:void(0);\" class=\"tcdiv\" style=\"color: #4C946E;\">激活成功！页面在"+time+"秒后自动跳转至首页</a>");  
         time--;  
      }else{
      	window.location.href="index.jsp";
      }  
}     
function onlogin(){
		   $("#emample9").attr("display","block");
		   $(".coreMian_jgk").css("display","none");
			$("#u_email").val("");
			$("#password").val("");
			$("#code").val("");
		   loginlayer=  $.layer({
				    type: 1,
				    title: "登录",
				    area: ['408px', '410px'],
				    shade: [0.5, '#000'],
				    shift: 'top', //从左动画弹出
				    page: {
				        dom: '#emample9'
				    },
				   
				});
		
		
}
   
</script>

</html>