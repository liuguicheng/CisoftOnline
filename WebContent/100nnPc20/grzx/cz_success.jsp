<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="s" uri="/struts-tags"%>   
 <%@ page import="com.cisoft.model.User"%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>100南宁－快递超市</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="${pageContext.request.contextPath}/100nn/Supermarket/css/SecurityCenter.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/100nn/Supermarket/css/jiaofei.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/100nn/css/nav_style.css" rel="stylesheet" type="text/css" />
</head>

<body onload="number();">
<div style="margin-bottom: 3px;">
 <%@ include file="top_aqzx.jsp"%>
 </div>
  <div style="margin: 0 auto; width: 1002px;">
<!--[if !IE]> 头部|开始 <![endif]-->
<!--[if !IE]> 头部|结束 <![endif]-->
<!--[if !IE]> 内容|开始 <![endif]-->
<div id="Mian" style="min-height: 340px;">


<!--[if !IE]> 内容|导航结束 <![endif]-->
<!--[if !IE]> 内容|主内容开始 <![endif]-->

<div id="MianRight" style="border-top: 0px;overflow-y:visible;min-height: 200px;">
  <div id="MianRight_z" style="height: auto;min-height: 200px;" >
      
       <div class="MianRight_mianN">
      
 	<input type="hidden" id="bsids" value="${result }">
<s:if test="result!='修改成功'">
<div class="MianRight_mianTitlesNavzc" style="margin-left: 65px;font-size: 16px;margin-top: 20px;">
 <div style="height: 144px;float: left;">
<img alt="" src="${pageContext.request.contextPath}/100nn/images/cha_1.png" width="144px" height="144px;">
</div>
<div style="line-height: 144px;float: left;"> <a href="javascript:onforgotuppassword();" class="tcdiv" style="color: #4C946E;">${result }，点击再次发起找回密码邮件</a>
</div>
</div>
</s:if>
<s:else>
<div class="MianRight_mianTitlesNavzc" style="margin-left: 65px;font-size: 16px;margin-top: 20px;">
 <div style="height: 144px;float: left;">
<img alt="" src="${pageContext.request.contextPath}/100nn/images/gou.gif"> 
</div>
<div style="line-height: 144px;float: left;">
<a href="javascript:onlogin();" class="tcdiv" style="color: #4C946E;">修改密码成功！页面在<label id="numsid"></label>秒后跳转首页</a>
</div>
</div>
</s:else>
                </div>
      
       
   </div>
 </div>
	
<!--[if !IE]> 内容|主内容开始 <![endif]-->
</div>

 </div>
	<div >
	<%@ include file="../foot.jsp"%>
	</div>
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
  var bs=$("#bsids").val();
  if(bs=="修改成功"){
	  $("body").attr("onload","number()");
  }
});
</script>
<script type="text/javascript">
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
  
function onforgotuppassword(){
	 $("#emample9").attr("display","none");
	  $("#zh_nameerrid").html("");
		$("#zh_emailerrid").html("");
		$("#code2222").html("看不清楚？换一张");
		$("#zh_name").val("");
		$("#zh_email").val("");
		$("#code3").val("");
		$(".zhmmerr").html("");
							   $("#emample15").attr("display","block");
							   zhmmlayer=  $.layer({
									    type: 1,
									    title: "找回密码",
									    area: ['408px', '330px'],
									    shade: [0.5, '#000'],
									    shift: 'top', //从左动画弹出
									    page: {
									        dom: '#emample15'
									    },
									   
									});
}


var time = 3;  
function number(){  
      window.setTimeout("number()",1000);  
      if(time >0){  
         var obj = $("#numsid");  
         obj.html("");  
         obj.html(time);  
         time--;  
      }else{
      	window.location.href="${pageContext.request.contextPath }/100nnPc20/index.jsp";
      }  
}     
</script>

</html>