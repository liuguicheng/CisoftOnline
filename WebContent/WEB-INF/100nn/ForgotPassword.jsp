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
<link href="100nn/css/coretext1.css" type="text/css" rel="stylesheet" />
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

<div id="MianRight">
<div id="MianRightM">
<form action="" method="post" id="formid">
<div class="MianRight_mianTitlesNavBJ">找回密码</div>
<div class="MianRight_mianTitlesNavzc">
     <div class="MianRight_yx">
     <div class="MianRight_mianTitlesNavBJn_mianLeft">邮箱</div>
     <div class="MianRight_mianTitlesNavBJn_mianZongT"><input id="emailid" type="text" value="" name="name" onblur="onemail();"/></div>
      <div class="yxtp1" id="emailerrid"></div>
                        
     </div>
      <div class="MianRight_yhm">
     <div class="MianRight_mianTitlesNavBJn_mianLeft">验证码</div>
     <div class="MianRight_mianTitlesNavBJn_mianZongTT"><input type="text" value="" id="code1" name="code2" /></div>
      <div class="MianRight_xz1"><img id="image1" src="${pageContext.request.contextPath}/image.jsp" alt="暂无图片"  width="62" height="32"  onClick="change();"/></div>
       <div class="yxtp1h" onClick="change();"style="cursor:pointer;">看不清楚？换一张</div>
       </div>
       <div class="MianRight_yhmz">
         <div class="MianRight_xz1z"  style="cursor:pointer;" onclick="onadd();">发送邮件</div>
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
</script>
<script>
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
</script>
<script>
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
	
//验证码	
function  change(){	
	document.getElementById("image1").src="${pageContext.request.contextPath}/image.jsp?"+Date.parse(new Date());	
}

function onemail(){ 
	var emai=$("#emailid").val();
	var szReg=/^([a-zA-Z0-9]+[_|_|.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|_|.]?)*[a-zA-Z0-9]+.[a-zA-Z]{2,4}$/;
	var bChk=szReg.test(emai); 
	if(bChk){
		
		$
		.ajax({
			type : "POST",
			url : "qtuser_checkcuname",
			data:"name="+emai,
			success : function(msgs) {
					if(msgs==2){
						var str=" <div class=\"yxtp1\">"+
				    	"<div class=\"MianRight_mianN_td3Left1\"></div>"+
				        "</div>";
				        $("#emailerrid").attr("class","");
				        $("#emailerrid").html(str);
					}else if(msgs==1){
						var str=" <div class=\"yxtp1\">"+
					      "<div class=\"yxtp1c\"></div>"+
					      "<div class=\"yxtp1k\">该邮箱未注册</div>"+
					      "</div>";
					      $("#emailerrid").attr("class","");
					      $("#emailerrid").html(str);
					}
			}
		});
		
        
	}else{
		var str=" <div class=\"yxtp1\">"+
	      "<div class=\"yxtp1c\"></div>"+
	      "<div class=\"yxtp1k\">邮箱格式不对</div>"+
	      "</div>";
	      $("#emailerrid").attr("class","");
	      $("#emailerrid").html(str);
	}
	} 
	
	
	function onadd(){
		var email=$("#emailid").val();
		var code1=$("#code1").val();
		if(email!=""&&code1!=""){
		$.ajax({
            cache: true,
            type: "POST",
            url:"qtuser_forgotpassword",
            data:$('#formid').serialize(),// 你的formid
            async: false,
            success: function(data) {
            	if(data==1){
            		var str="<div class=\"coreMian\">"+
            		"<div class=\"coreMian_telValidation_hqTitle\"><span>操作成功!</span></div>"+
                   " <div class=\"coreMian_telValidation_hqText\">请到<span>lily@163.com</span>查阅来自100南宁的邮件,</div>"+
                  " <div class=\"coreMian_telValidation_hqText1\">点击邮件中的链接重设您的密码。</div>"+
                   " <div class=\"coreMian_qdButton\">"+
                    	"<div class=\"coreMian_qdButton_left2\"><a href=\"#\">去邮箱收信</a></div>"+
                  "  </div>";
                  $("#MianRightM").html(str);
            		
            	}else{
            		layer.msg(data);
            	}
            }
        });
		}else{
			layer.msg("请填写邮箱或验证码");	
			
		}
	}
});
</script>

</html>