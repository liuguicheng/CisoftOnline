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
  <div id="MianRight_z" >
      <s:if test="#error!='激活成功'">
<!-- <div class="MianRight_mianTitlesNavBJ">注册-激活失败</div> -->
<div class="MianRight_mianTitlesNavzc" >
   <div style="height: 144px;float: left;">
   <img alt="" src="${pageContext.request.contextPath }/100nn/images/cha_1.png" width="144px" height="144px;"> 
   </div> 
   <div style="float: left;line-height: 144px;margin-left: 3%;" class="errid">
   <a href="javascript:void(0);" class="tcdiv" style="color: #4C946E;">${error }</a>
   </div>
</div>
</s:if>
<s:else>

<div class="MianRight_mianTitlesNavzc" style="margin-left: 65px;font-size: 16px;">
 <div style="height: 144px;float: left;">
<img alt="" src="${pageContext.request.contextPath }/100nn/images/gou.gif"> 
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
</div>

 </div>
	<div >
	<%@ include file="../foot.jsp"%>
	</div>
</body>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/jq1.9.js"></script>
<script type="text/javascript">

var time = 3;  
function number(){  
      window.setTimeout("number()",1000);  
      if(time >0){  
         var obj = $(".errid");  
         obj.html("");  
         obj.html("<a href=\"javascript:void(0);\" class=\"tcdiv\" style=\"color: #4C946E;font-size:14px;\">激活成功！页面在"+time+"秒后自动跳转至首页</a>");  
         time--;  
      }else{
      	window.location.href="${pageContext.request.contextPath }/100nnPc20/index.jsp";
      }  
}  
</script>
</html>
