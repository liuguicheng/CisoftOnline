<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="utf-8" />
		<title>Cisoft电商平台－商家版</title>
		<meta name="description" content="User login page" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />
		<!-- basic styles -->
		<link href="${pageContext.request.contextPath }/ExpandingBusiness/static/css/bootstrap.min.css" rel="stylesheet" />
		<link href="${pageContext.request.contextPath }/ExpandingBusiness/static/css/bootstrap-responsive.min.css" rel="stylesheet" />
		<link rel="stylesheet" href="${pageContext.request.contextPath }/ExpandingBusiness/static/css/font-awesome.min.css" />
		<!--[if IE 7]>
		  <link rel="stylesheet" href="css/font-awesome-ie7.min.css" />
		<![endif]-->
		<!-- page specific plugin styles -->
		
		<!-- ace styles -->
		<link rel="stylesheet" href="${pageContext.request.contextPath }/ExpandingBusiness/static/css/ace.min.css" />
		<link rel="stylesheet" href="${pageContext.request.contextPath }/ExpandingBusiness/static/css/ace-responsive.min.css" />
		<!--[if lt IE 9]>
		  <link rel="stylesheet" href="css/ace-ie.min.css" />
		<![endif]-->
	</head>
	<body class="login-layout" style="background: url(${pageContext.request.contextPath }/ExpandingBusiness/static/login/images/banner_slide_01.jpg) no-repeat ;">
	
		<div class="container-fluid" id="main-container">
			<div id="main-content">
				<div class="row-fluid">
					<div class="span12">
						
<div class="login-container">
<div class="row-fluid">
	<div class="center">
		<h1><i class="icon-leaf green"></i> <span class="red">Cisoft</span> <span class="white">电商平台</span></h1>
		<h4 class="blue">&copy; 商家版</h4>
	</div>
</div>
<div class="space-6"></div>
<div class="row-fluid">
<div class="position-relative">
<input type="hidden" value="${error }" id="errorid"/>
	<div id="login-box" class="visible widget-box no-border" style="background-color:rgba(57, 69, 87, 0.28); ">
		<div class="widget-body">
		 <div class="widget-main">
			<h4 class="header lighter bigger"><i class="icon-coffee green"></i> 请填写您的信息</h4>
			
			<div class="space-6"></div>
			
			<form method="post" action="" id="loginid">
				 <fieldset>
					<label>
						<span class="block input-icon input-icon-right">
							<input type="text" class="span12" placeholder="用户名"  name="u_name" id="lonameid"/>
							<i class="icon-user"></i>
						</span>
					</label>
					<label>
						<span class="block input-icon input-icon-right">
							<input type="password" class="span12" placeholder="密码" name="u_pwd" id="lopwdid"/>
							<i class="icon-lock"></i>
						</span>
					</label>
					<div class="space"></div>
					<div class="row-fluid">
						<label class="span8">
							<input type="checkbox" id="jzwid"><span class="lbl"> 记住我</span>
						</label>
						<button type="button" onclick="onlogin();" class="span4 btn btn-small btn-primary" id="to-recover"><i class="icon-key"></i> 登陆</button>
					</div>
					
				  </fieldset>
			</form>
		 </div><!--/widget-main-->
		
		
		 <div class="toolbar clearfix">
			<div>
				<a href="#" onclick="show_box('forgot-box'); return false;" class="forgot-password-link"><i class="icon-arrow-left"></i> 忘记密码？</a>
			</div>
			<div>
				<a href="#" onclick="show_box('signup-box'); return false;" class="user-signup-link">马上注册 <i class="icon-arrow-right"></i></a>
			</div>
		 </div>
		</div><!--/widget-body-->
	</div><!--/login-box-->
	
	
	
	
	
	
	<div id="forgot-box" class="widget-box no-border" style="background-color:rgba(57, 69, 87, 0.28); ">
		<div class="widget-body">
		 <div class="widget-main">
			<h4 class="header red lighter bigger"><i class="icon-key"></i> 找回密码</h4>
			
			<div class="space-6"></div>
			
			<p>
				请输入您注册时的邮箱
			</p>
			<form method="post" action="user_sjzhmm" id="zhmmid">
				 <fieldset>
					<label>
						<span class="block input-icon input-icon-right" id="zhmm_email_id">
							<input type="email" class="span12" placeholder="邮箱地址"  name="u_email" id="zhmm_email"/>
							<i class="icon-envelope"></i>
						</span>
					</label>
	
					<div class="row-fluid">
						<button type="button" onclick="zhmm();" class="span5 offset7 btn btn-small btn-danger"><i class="icon-lightbulb"></i> 发送邮件</button>
					</div>
					
				  </fieldset>
			</form>
		 </div><!--/widget-main-->
		
		 <div class="toolbar center">
			<a href="#" onclick="show_box('login-box'); return false;" class="back-to-login-link">返回登陆 <i class="icon-arrow-right"></i></a>
		 </div>
		</div><!--/widget-body-->
	</div><!--/forgot-box-->
	
	
	
	<div id="signup-box" class="widget-box no-border" style="background-color:rgba(57, 69, 87, 0.28); ">
		<div class="widget-body">
		 <div class="widget-main">
			<h4 class="header green lighter bigger"><i class="icon-group blue"></i> 新用户注册</h4>
			<div class="space-6"></div>
			<p>
				请填写您的信息
			</p>
			
			<form method="post" action="user_sjzc" id="zcid">
				 <fieldset>
					<label>
						<span class="block input-icon input-icon-right">
							<input type="email" class="span12" placeholder="邮箱地址" name="u_email" id="emailid" />
							<i class="icon-envelope"></i>
						</span>
					</label>
					<label>
						<span class="block input-icon input-icon-right">
							<input type="text" class="span12" placeholder="用户名"  name="u_name" id="nameid"/>
							<i class="icon-user"></i>
						</span>
					</label>
					<label>
						<span class="block input-icon input-icon-right">
							<input type="password" class="span12" placeholder="密码" name="u_pwd" id="pwdid" />
							<i class="icon-lock"></i>
						</span>
					</label>
					<label>
						<span class="block input-icon input-icon-right">
							<input type="password" class="span12" placeholder="确认密码"  name="pwd2" id="pwd2id"/>
							<i class="icon-retweet"></i>
						</span>
					</label>
					
					<label>
						<input type="checkbox" id="zcyhxy"><span class="lbl">我同意<a href="#">用户协议</a></span>
					</label>
					
					<div class="space-24"></div>
					
					<div class="row-fluid">
						<button type="reset" class="span6 btn btn-small"><i class="icon-refresh"></i> 重置</button>
						<button type="button" onclick="zcid();" class="span6 btn btn-small btn-success">提交<i class="icon-arrow-right icon-on-right"></i></button>
					</div>
					
				  </fieldset>
			</form>
		</div>
		
		<div class="toolbar center">
			<a href="#" onclick="show_box('login-box'); return false;" class="back-to-login-link"><i class="icon-arrow-left"></i>返回登陆</a>
		</div>
	 </div><!--/widget-body-->
	</div><!--/signup-box-->
	
	
</div><!--/position-relative-->
	
</div>
</div>
					</div><!--/span-->
				</div><!--/row-->
			</div>
		</div><!--/.fluid-container-->
		<!-- basic scripts -->
		<script src="${pageContext.request.contextPath }/ExpandingBusiness/static/1.9.1/jquery.min.js"></script>
		<script type="text/javascript">
		window.jQuery || document.write("<script src='${pageContext.request.contextPath }/ExpandingBusiness/static/js/jquery-1.9.1.min.js'>\x3C/script>");
		</script>
		
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/layer.min.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath }/ExpandingBusiness/static/js/jquery.tips.js"></script>
		
	<script type="text/javascript" src="${pageContext.request.contextPath }/ExpandingBusiness/static/js/jquery.cookie.js"></script>
		<!-- page specific plugin scripts -->
		
		<!-- inline scripts related to this page -->
		
		<script type="text/javascript">
		
function show_box(id) {
 $('.widget-box.visible').removeClass('visible');
 $('#'+id).addClass('visible');
}
/**
 * 找回密码
 */
function zhmm(){
	if(zhmmyz()){
	$.ajax({
		   type: "POST",
		   url: "user_sjzhmm",
		   data:$('#zhmmid').serialize(),// 你的formid
		   success: function(msgs){
			   if(msgs=="发送成功"){
				   
				   $("#forgot-box").tips({
						side : 1,
						msg : msgs,
						bg : '#00CD66',
						time : 5
					});
				   window.setTimeout("window.location.href='${pageContext.request.contextPath}/ExpandingBusiness/jsp/login.jsp'", "3000");
				   
			   }else{
				   
					$("#forgot-box").tips({
						side : 1,
						msg : msgs,
						bg : '#FF4040',
						time : 3
					});
			   } 
		   }
	});
	}
}
/**
 * 找回密码验证
 */
 function zhmmyz(){
	var bl= true;
	var zhmm_email=$("#zhmm_email").val();
	if(zhmm_email==""){
		 layer.tips('邮件地址不能空', '#forgot-box', {
			    tips: [1, '#5FB878'],
			    time: 3
			});
		 $("#zhmm_email").focus();
		 bl=false;
	}
	var reg=/[_a-z\d\-\./]+@[_a-z\d\-]+(\.[_a-z\d\-]+)*(\.(info|biz|com|edu|gov|net|am|bz|cn|cx|hk|jp|tw|vc|vn))$/;
	if(!reg.test(zhmm_email)){
		layer.tips('邮件地址格式错误', '#forgot-box', {
		    tips: [3, '#5FB878'],
		    time: 3
		});
		$("#zhmm_email").focus();
		 bl=false;
	}
	
	return bl;
}

//注册
function zcid(){
	if(zcyz()){
		
	
	$.ajax({
		   type: "POST",
		   url: "user_sjzc",
		   data:$('#zcid').serialize(),// 你的formid
		   success: function(msgs){
			   if(msgs=="注册成功"){
				  
				   $("#signup-box").tips({
						side : 1,
						msg : msgs,
						bg : '#00CD66',
						time : 5
					});
				   window.setTimeout("window.location.href='${pageContext.request.contextPath}/ExpandingBusiness/jsp/login.jsp'", "3000");
				   
			   }else{
				   $("#signup-box").tips({
						side : 1,
						msg : msgs,
						bg : '#FF4040',
						time : 3
					});
			   } 
		   }
	});
	}
}
/**
 * 注册验证
 */
 function zcyz(){
	var s=true;
	var emailid=$("#emailid").val();
	var nameid=$("#nameid").val();
	var pwdid=$("#pwdid").val();
	var pwd2id=$("#pwd2id").val();
	if(document.getElementById("zcyhxy").checked==false){
		layer.tips('请同意用户协议', '#signup-box', {
		    tips: [3, '#5FB878'],
		    time: 3
		});
		s=false;
	}
	if(pwdid!=pwd2id){
		layer.tips('两次密码输入不一致', '#signup-box', {
		    tips: [3, '#5FB878'],
		    time: 3
		});
		$("#pwd2id").focus();
		s=false;
	}
	if(pwd2id==""){
		layer.tips('确认密码不能为空', '#signup-box', {
		    tips: [3, '#5FB878'],
		    time: 3
		});
		$("#pwd2id").focus();
		s=false;
	}
	if(pwdid==""){
		layer.tips('登陆密码不能为空', '#signup-box', {
		    tips: [3, '#5FB878'],
		    time: 3
		});
		$("#pwdid").focus();
		s=false;
	}
	if(nameid==""){
		layer.tips('用户名不能为空', '#signup-box', {
		    tips: [3, '#5FB878'],
		    time: 3
		});
		s=false;
	}
	var reg=/[_a-z\d\-\./]+@[_a-z\d\-]+(\.[_a-z\d\-]+)*(\.(info|biz|com|edu|gov|net|am|bz|cn|cx|hk|jp|tw|vc|vn))$/;
	if(!reg.test(emailid)){
		layer.tips('邮件地址格式错误', '#signup-box', {
		    tips: [3, '#5FB878'],
		    time: 3
		});
		$("#emailid").focus();
		 s=false;
	}
	if(emailid==""){
		layer.tips('邮件地址不能为空', '#signup-box', {
		    tips: [3, '#5FB878'],
		    time: 3
		});
		$("#emailid").focus();
		s=false;
	}
	 
	
	
	
	return s;
}
//登陆验证 
 function loginyz(){
	 var s=true;
	 var nameid=$("#lonameid").val();
	 var pwdid=$("#lopwdid").val();
	 if(pwdid==""){
			layer.tips('登陆密码不能为空', '#login-box', {
			    tips: [3, '#5FB878'],
			    time: 3
			});
			$("#lonameid").focus();
			s=false;
		}
		if(nameid==""){
			layer.tips('用户名不能为空', '#login-box', {
			    tips: [3, '#5FB878'],
			    time: 3
			});
			$("#lopwdid").focus();
			s=false;
		}
	 return s;
 }
 //记住我 存入cookie
 function saveCookie() {
		if (document.getElementById("jzwid").checked==true) {
			$.cookie('loginname', $("#lonameid").val(), {
				expires : 7
			});
			$.cookie('password', $("#lopwdid").val(), {
				expires : 7
			});
		}
	}
 //登陆
 function onlogin(){
	 if(loginyz()){
	 
	 $.ajax({
		   type: "POST",
		   url: "user_sjlogin",
		   data:$('#loginid').serialize(),// 你的formid
		   success: function(msgs){
			   if(msgs=="登陆成功"){
				   saveCookie();
				  window.location.href="${pageContext.request.contextPath}/user_sjindex";
			   }else{
				   layer.tips("用户名或密码错误", '#login-box', {
					    tips: [3, '#5FB878'],
					    time: 3
					});	
					$("#lonameid").focus(); 
			   }
		   }
	 });
	 }
 }
 $(document).keyup(function(event) {
		if (event.keyCode == 13) {
			$("#to-recover").trigger("click");
		}
	});
 
 $(document).ready(function() {
		var loginname = $.cookie('loginname');
		var password = $.cookie('password');
		if (typeof(loginname) != "undefined"
				&& typeof(password) != "undefined") {
			$("#lonameid").val(loginname);
			$("#lopwdid").val(password);
			$("#jzwid").attr("checked", true);
		}
 });
		</script>
	</body>
</html>
