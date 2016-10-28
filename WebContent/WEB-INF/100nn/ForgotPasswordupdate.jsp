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
<span class="tcdiv"></span>
<div id="MianRight">
<div id="MianRightM">
<form action="qtuser_forgotuppassword" method="post" id="uppasswordform" onsubmit="return onpwd33();">
<input type="hidden" name="code" value="<%= request.getParameter("code")%>">
<input type="hidden" name="u_email" value="<%= request.getParameter("u_email")%>">
<div class="MianRight_mianTitlesNavBJ">修改密码</div>
<div class="MianRight_mianTitlesNavzc" style="margin-left: 65px;margin-top: 20px;">
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
        <button class="MianRight_xz1z_01" type="submit">确认修改 </button>
        <!--  <div class="yxtpf">返回</div> -->
       </div>
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
function autowidth(){
var wh=$(window).height();
wh=wh-126;
$("#Mian").css("height",wh);

var wj=$("#Mian").height();
$("#MianLeft").css("height",wj);
var wl=$("#Mian").height();
wl=wl-1;
$("#MianRight").css("height",wl);

var wk=$(window).width();
wk=wk-101;
$("#MianRight").css("width",wk);
}
function bg(k){
	for(i=1;i<=2;i++){
		document.getElementById("kg"+i).style.display="none";
		//document.getElementById("bt_t"+i).style.color="#7f9bb1";
		document.getElementById("bt_t"+i).className="MianRight_mianYcontentList_MianTitlets";
		//document.getElementById("xz"+i).className="N_mianJh_xzjc_miantitleR_span";
		}
	document.getElementById("kg"+k).style.display="block";
	//document.getElementById("bt_t"+k).style.color="#ff7534";
	document.getElementById("bt_t"+k).className="MianRight_mianYcontentList_MianTitletsk";
	//document.getElementById("xz"+i).className="N_mianJh_xzjc_miantitleR_span1";
	}
function yr(k){
	for(i=1;i<=4;i++){
		document.getElementById("zhxxd"+i).style.display="none";
		//document.getElementById("bt_t"+i).style.color="#7f9bb1";
		document.getElementById("yhxx"+i).className="MianRight_mianYcontentList_MianTitletszhxx";
		//document.getElementById("xz"+i).className="N_mianJh_xzjc_miantitleR_span";
		}
	document.getElementById("zhxxd"+k).style.display="block";
	//document.getElementById("bt_t"+k).style.color="#ff7534";
	document.getElementById("yhxx"+k).className="MianRight_mianYcontentList_MianTitletyzxx";
	//document.getElementById("xz"+i).className="N_mianJh_xzjc_miantitleR_span1";
	}
	

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