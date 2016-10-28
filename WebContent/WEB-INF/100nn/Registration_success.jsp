<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
</head>

<body>
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
<div id="Mian">

<div id="MianRight">
<div id="MianRightM">
<form action="user_adduser" method="post" id="formid">
<div class="MianRight_mianTitlesNavBJ">注册-成功</div>
<div class="MianRight_mianTitlesNavzc">
<img alt="" style="margin-left: 100px;margin-top: 10px;" src="100nn/images/1.jpeg" width="100px" height="100px"><a  style="font-size: 16px;margin-left: 10px;color: #A3C51A;" target="_blank" href="http://mail.qq.com/">注册成功，马上去激活？</a>
</div>
</form>
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

</html>