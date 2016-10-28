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

<style type="text/css">

.bcbutton{
	background:url(100nnPc20/images/gg_14.png) no-repeat;
	width:120px; 
	height: 38px;
	border: 0px;
     margin-left: 100px;
}

</style>
</head>

<body>
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
      
 	
       				<form action="qtuser_forgotuppassword2" method="post" id="uppasswordform" onsubmit="return onpwd33();">
<input type="hidden" name="code" value="<%= request.getParameter("code")%>">
<input type="hidden" name="u_email" value="<%= request.getParameter("u_email")%>">
<div class="MianRight_mianTitlesNavzc" style="margin-left: 65px;margin-top: 20px;height: auto;">
     <div class="MianRight_yx">
     <div class="MianRight_mianTitlesNavBJn_mianLeft">新密码</div>
     <div class="MianRight_mianTitlesNavBJn_mianZongT"><input id="pwdids" name="pwd" type="password" value="" onblur="onpwd33();"/></div>
      <div class="yxtp1" id="pwderridss"></div>
                        
     </div>
      <div class="MianRight_yhm">
     <div class="MianRight_mianTitlesNavBJn_mianLeft">确认密码</div>
     <div class="MianRight_mianTitlesNavBJn_mianZongT"><input id="pwdids2s" name="pwd2" type="password" value="" onblur="onpwd33();"/></div>
       <div class="yxtp1" id="pwderrid2ss"></div>
       </div>
       <div class="MianRight_yhmz">
        <button  type="submit" class="bcbutton"></button>
        <!--  <div class="yxtpf">返回</div> -->
       </div>
</div>
</form>
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
function onpwd33(){
	var n=$("#pwdids").val();
	var pwd2=$("#pwdids2s").val();
	if(n!=""){
		var str=" <div class=\"yxtp1\">"+
    	"<div class=\"MianRight_mianN_td3Left1\"></div>"+
        "</div>";
        
        $("#pwderridss").attr("class","");
        $("#pwderridss").html(str);
	}else
	{
		var str=" <div class=\"yxtp1\">"+
	      "<div class=\"yxtp1c\"></div>"+
	      "<div class=\"yxtp1k\">密码不能为空</div>"+
	      "</div>";
	      $("#pwderridss").attr("class","");
	      $("#pwderridss").html(str);
	}
	if(pwd2!=""){
		
		if(pwd2==n){
			var str=" <div class=\"yxtp1\">"+
	    	"<div class=\"MianRight_mianN_td3Left1\"></div>"+
	        "</div>";
	        $("#pwderrid2ss").attr("class","");
	        $("#pwderrid2ss").html(str);
		}else{
			var str=" <div class=\"yxtp1\">"+
		      "<div class=\"yxtp1c\"></div>"+
		      "<div class=\"yxtp1k\">两次密码输入不一致</div>"+
		      "</div>";
		      $("#pwderrid2ss").attr("class","");
		      $("#pwderrid2ss").html(str);
		}
	}else{
		var str=" <div class=\"yxtp1\">"+
	      "<div class=\"yxtp1c\"></div>"+
	      "<div class=\"yxtp1k\">密码不能为空</div>"+
	      "</div>";
	      $("#pwderrid2ss").attr("class","");
	      $("#pwderrid2ss").html(str);
	}
			if(n!=""&&pwd2!=""){
			return true;
	 		 }
			return false;

}

</script>

</html>