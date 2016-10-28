<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="s" uri="/struts-tags"%>   
 <%@ page import="com.cisoft.model.User"%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>100南宁－快递超市</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="100nn/css/base.css" rel="stylesheet" type="text/css" />
<link href="100nn/css/foot_style.css" rel="stylesheet" type="text/css" />
<link href="100nn/Supermarket/css/SecurityCenter.css" rel="stylesheet" type="text/css" />
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
                        <div class="MianRight_mianTitle_userNavTitle">安全中心</div>
                        <div class="MianRight_mianTitle_userNavK"></div>
                       <!--  <div class="MianRight_mianTitle_userNavTitle"><a href="Supermarket_AuthenticationManagement" title="认证信息" target="_self">认证信息</a></div> -->
         </div>
         </div>
       <div class="MianRight_mianN">
       <% 
       User users = (User) request.getSession().getAttribute("usersession");
       int ids=0;
 			if (users != null) {
 				ids=users.getU_id();
 			}
 		%>
 	
       <input id="idss" type="hidden" value="<%=ids %>"/>
       				<form method="post" action="">
                	<table cellpadding="0" cellspacing="0">
                	
                	<tr>
                        	<td width="124" class="MianRight_mianN_td1" style="padding-right:10px;">原密码</td>
                            <td width="305"><div class="MianRight_mianN_td2"><input id="oldpsd" type="password" name="" value="" onblur="checkoldpwd();"/></div></td>
                            <td width="140" id="oldid"></td>
                        </tr>
                        <tr>
                        	<td width="124" class="MianRight_mianN_td1" style="padding-right:10px;">设置登录密码</td>
                            <td width="305"><div class="MianRight_mianN_td2"><input id="newpsd" type="password" name="" value="" /></div></td>
                            <td width="140" id="newpwdid1"></td>
                        </tr>
                        <tr>
                        	<td width="124" class="MianRight_mianN_td1" style="padding-right:10px;">再输入一次密码</td>
                            <td width="305"><div class="MianRight_mianN_td2"><input id="newpsd2" type="password" name="" value=""/></div></td>
                            <td width="140" id="newpwdid">
                            </td>
                        </tr>
                        <tr>
                        	<td width="124" class="MianRight_mianN_td1" style="padding-right:10px;"></td>
                            <td width="305"><img src="100nn/Supermarket/images/bc_button.jpg" width="73" height="31" onclick="uppwd();" style="cursor:pointer;" /></td>
                            <td width="140"></td>
                        </tr>
                    </table>
                    </form>
                </div>
      
       
   </div>
 </div>
	
<!--[if !IE]> 内容|主内容开始 <![endif]-->
</div>
<!--[if !IE]> 内容|结束 <![endif]-->
<!--[if !IE]> 版权|开始 <![endif]-->
<div id="Foot">
 Copyright ©2013-2014 CISOFT Corporation, All Rights Reserved.&nbsp;&nbsp;桂ICP备12002922号-1&nbsp;&nbsp;增值电信业务经营许可证：桂B2-20140021&nbsp;&nbsp;版权所有：<a target="_blank" href="http://www.cisoft.cn/">广西南宁市熙软循环信息科技有限公司</a>
</div>
<!--[if !IE]> 版权|结束 <![endif]-->
</body>
<script type="text/javascript">
$(document).ready(function(){
	var loginid=$("#idss").val();
	if(loginid=="0"){
		//未登录
		   $("#emample9").attr("display","block");
		   $(".coreMian_jgk").css("display","block");
		   $(".coreMian_jgkText").html("登录超时，请重新登录");
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
});


		//检查原密码
		function checkoldpwd(){
			var id=$("#oldpsd").val();
			 $
				.ajax({
					type : "POST",
					url : "qtuser_checkoldpwd?msg="+id,
					success : function(msgs) {
						if(msgs=="1"){
							var str=" <div class=\"MianRight_mianN_td3\">"+
	                    	"<div class=\"MianRight_mianN_td3Left1\"></div>"+
	                        "</div>";
							$("#oldid").html(str);
						}else{
							var str=" <div class=\"MianRight_mianN_td3\">"+
	                    	"<div class=\"\"style=\"color:red;\">原密码错误</div>"+
	                        "</div>";
							$("#oldid").html(str);
						}
					}
				});
		}
		function uppwd(){
			var id=$("#oldpsd").val();
			var pwd=$("#newpsd").val();
			var pwd2=$("#newpsd2").val();
			if(id==""){
				var str=" <div class=\"MianRight_mianN_td3\">"+
            	"<div class=\"\"style=\"color:red;\">原密码错误</div>"+
                "</div>";
				$("#oldid").html(str);
			}
			else if(pwd!=pwd2){
			 var str=" <div class=\"MianRight_mianN_td3\">"+
         	"<div class=\"\"style=\"color:red;\">新密码两次输入不一致</div>"+
             "</div>";
				$("#newpwdid").html(str);
			}else{
				var str=" <div class=\"MianRight_mianN_td3\">"+
            	"<div class=\"MianRight_mianN_td3Left1\"></div>"+
                "</div>";
				$("#oldid").html(str);
				$("#newpwdid").html(str);
				$("#newpwdid1").html(str);
			 $
				.ajax({
					type : "POST",
					url : "qtuser_uppwd?msg="+id+"&pwd="+pwd+"&pwd2="+pwd2,
					success : function(msgs) {
						if(msgs=="1"){
							$("#oldid").html("");
							$("#newpwdid").html("");
							$("#newpwdid1").html("");
							$("#oldpsd").val("");
							$("#newpsd2").val("");
							$("#newpsd").val("");
							layer.msg('修改成功',2,1,"100px");
							
						}else if(msgs=="2"){
							var str=" <div class=\"MianRight_mianN_td3\">"+
			            	"<div class=\"\"style=\"color:red;\">原密码错误</div>"+
			                "</div>";
							$("#oldid").html(str);
						}else{
							layer.msg("修改失败");
						}
					}
				});
			}
		}
</script>

</html>