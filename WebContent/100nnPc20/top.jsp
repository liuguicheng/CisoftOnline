<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.cisoft.model.User"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>100南宁快递超市</title>
<link href="${pageContext.request.contextPath }/100nnPc20/css/base.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath }/100nnPc20/css/top.css" rel="stylesheet" type="text/css"/>
<link href="${pageContext.request.contextPath}/100nn/css/core.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/100nn/css/100nnzc.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${pageContext.request.contextPath }/100nnPc20/js/jquery-2.1.1.min.js"></script>
<script type="text/javascript">
	$(function() {
		var nologin = "${nologinmessage}";
		if (nologin != null && $.trim(nologin).length != 0) {
			$(".sr4").text(nologin);
			$(".sr4").show();
		}
		var error = "${error}";
		if (error != null && $.trim(error).length != 0) {
			$(".sr4").text(error);
			$(".sr4").show();
		}
		 var loginlayer;//登录弹出
		 var zclayer;//注册弹出
		 var zcsuccesslayer ;//注册成功
		 var zhmmlayer;//找回密码
		 var zhmmsuccesslayer;//找回密码成功
		 var jhlayer;//激活
		 var jhsuccesslayer;//激活成功
		 
		
		//验证session回话过期
		$
				.ajax({
					type : "POST",
					url : "qtuser_loginyz",
					success : function(msgs) {
						if (msgs == "0") {
							//购物车按钮
							
							//div emample9
							$("#ele9").click(function(){
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
								
								
							});
						}else{
							$("#gwc").find("a").attr("href","${pageContext.request.contextPath }/shoppingcar_querygwclist");
							$("#gw").find("a").attr("href","${pageContext.request.contextPath }/shoppingcar_querygwclist");
						}
					}
				});
		 
		
		 //注册
		$("#zhucebutton").click(function(){
			$("#nameerrid").html("");
			$("#emailerrid").html("");
			$("#pwderrid").html("");
			$("#pwderrid2").html("");
			$("#code3333").html("看不清楚？换一张");
			$("#nameid").val("");
			$("#emailid").val("");
			$("#pwdid").val("");
			$("#pwdid2").val("");
			$("#code1").val("");
								   $("#emample10").attr("display","block");
								   zclayer=  $.layer({
										    type: 1,
										    title: "注册",
										    area: ['408px', '376px'],
										    shade: [0.5, '#000'],
										    shift: 'top', //从左动画弹出
										    page: {
										        dom: '#emample10'
										    },
										   
										});
								
								   
							});
		 
		//注册跳 登录
		  $("#zc_to_login").click(function(){
			  layer.close(layer.index);
			  						   $("#emample10").attr("display","none");
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
									
		 }); 
		 
		 //跳转控制 登录跳转注册
		  $("#loing_to_zc").click(function(){
			  layer.close(layer.index);
			  $("#emample9").attr("display","none");
			  $("#nameerrid").html("");
				$("#emailerrid").html("");
				$("#pwderrid").html("");
				$("#pwderrid2").html("");
				$("#code3333").html("看不清楚？换一张");
				$("#nameid").val("");
				$("#emailid").val("");
				$("#pwdid").val("");
				$("#pwdid2").val("");
				$("#code1").val("");
									   $("#emample10").attr("display","block");
									   zclayer=  $.layer({
											    type: 1,
											    title: "注册",
											    area: ['408px', '376px'],
											    shade: [0.5, '#000'],
											    shift: 'top', //从左动画弹出
											    page: {
											        dom: '#emample10'
											    },
											   
											});
									
		 });
		 
		 //登录跳 找回密码
		  $("#login_to_zhmm").click(function(){
			  layer.close(layer.index);
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
									
		 });
		 
		//找回密码跳 登录
		  $("#zhmm_to_login").click(function(){
			  layer.close(layer.index);
			  $("#emample15").attr("display","none");
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
									
		 });
		  
		//找回密码跳 注册
		  $("#zhmm_to_zc").click(function(){
			  layer.close(layer.index);
			  $("#emample15").attr("display","none");
			  $("#nameerrid").html("");
				$("#emailerrid").html("");
				$("#pwderrid").html("");
				$("#pwderrid2").html("");
				$("#code3333").html("看不清楚？换一张");
				$("#nameid").val("");
				$("#emailid").val("");
				$("#pwdid").val("");
				$("#pwdid2").val("");
				$("#code1").val("");
									   $("#emample10").attr("display","block");
									   zclayer=  $.layer({
										    type: 1,
										    title: "注册",
										    area: ['408px', '376px'],
										    shade: [0.5, '#000'],
										    shift: 'top', //从左动画弹出
										    page: {
										        dom: '#emample10'
										    },
										   
										});
									
		 });
		
		
		 
		
	
		
		
		
		
		
		
		//添加收货地址－弹出
		$(".shdz").click(function(){
			   $("#emample16").attr("display","block");
			   zcsuccesslayer=  $.layer({
					    type: 1,
					    title: "添加收货地址",
					    area: ['700px', '436px'],
					    shade: [0.5, '#000'],
					    shift: 'top', //从左动画弹出
					    page: {
					        dom: '#emample16'
					    },
					   
					});
			
			
		});
		
		
		

		//登录函数
		function login() {
			var u_email = $("#u_email").val();
			var password = $("#password").val();
			var code = $("#code").val();
			var flag1 = true;
			var flag2 = true;
			var flag3 = true;
			var warning1 = "";
			var warning2 = "";
			var warning3 = "";
			if ($.trim(u_email).length == 0) {
				flag1 = false;
				warning1 = "邮箱不能为空";
			} else {
			}
			if ($.trim(password).length == 0) {
				flag2 = false;
				warning2 = "密码不能为空";
			} else {
			}
			if ($.trim(code).length == 0) {
				flag3 = false;
				warning3 = "验证码不能为空";
			} else {
			}
			if (flag1 == false || flag2 == false || flag3 == false) {
				var w = "";
				if (warning1 != "") {
					w = warning1;
				}
				if (warning2 != "") {
					if (w == "") {
						w = warning2;
					}
				}
				if (warning3 != "") {
					if (w == "") {
						w = warning3;
					}
				}
				$(".coreMian_jgk").css("display", "block");
				$(".coreMian_jgkText").text(w);
				$(".coreMian_jgkText").show();
				return false;
			}
			
			$("#loginid").addClass("loginload");
			$
					.ajax({
						type : "POST",
						url : "qtuser_qtlogin",
						async : true,
						data : "u_email=" + u_email + "&u_pwd=" + password
								+ "&code=" + code,
						success : function(msgs) {
							var msg = msgs.split(",");
							if (msg[0] == "1") {
								//location.reload(); 

								var str = "<ul><li><a  href=\"${pageContext.request.contextPath}/100nnPc20/index.jsp\" target=\"_blank\" >100南宁首页</a>　|</li>"
							         +"<li><a title=\"\" href=\"${pageContext.request.contextPath}/order_qtorders\" target=\"_blank\">"+msg[1]+" </a> |</li>"
							         +"<li><a title=\"我的订单\" href=\"${pageContext.request.contextPath}/order_qtorders\" target=\"_blank\">我的订单</a> |</li>"
							         +"<li><a id=\"btnexit\" title=\"注销\" href=\"javascript:qtexit();\" target=\"_blank\">注销</a> </li>"
							         +"</ul>";
									
								$("#top2_right").html(str);
								
								$("#gwc").find("a").attr("href","${pageContext.request.contextPath }/shoppingcar_querygwclist");
								$("#gw").find("a").attr("href","${pageContext.request.contextPath }/shoppingcar_querygwclist");
								//关闭登录弹出
								layer.close(layer.index);
								
								$.ajax({
									type : "POST",
									url : "shoppingcar_querygwccount",
									success : function(msgs) {
										if (msgs != "登录超时,请重新登录") {
											$("#gwcnum").html(msgs);
										}
									}
								});
								

							} else {
								$("#loginid").removeClass("loginload");
								$(".coreMian_jgk").css("display", "block");
								if(msg[1]=="邮箱账号未激活！"){
									
									 var str=msg[1]+"<a  href=\"javascript:onjh();\" id=\"jhid\">马上激活 </a>";
									$(".coreMian_jgkText").html(str);
									$(".coreMian_jgkText").show();
									
									
								}else{
									$(".coreMian_jgkText").text(msg[1]);
									$(".coreMian_jgkText").show();
								}
								
							}
						}
					});

		}
		
		//登录
		$(".sr5").click(function() {
			
			login();

		});
		$.ajax({
			type : "POST",
			url : "shoppingcar_querygwccount",
			success : function(msgs) {
				if (msgs != "登录超时,请重新登录") {
					$("#gwcnum").html(msgs);
				}
			}
		});

		

	});

	//登录验证码
	function change() {
		document.getElementById("image").src = "${pageContext.request.contextPath}/image.jsp?"
				+ Date.parse(new Date());
	}
	//注册验证码	
	function change2() {
		document.getElementById("image2").src = "${pageContext.request.contextPath}/image.jsp?"
				+ Date.parse(new Date());
	}
	//找回密码验证码
	function change3() {
		document.getElementById("image3").src = "${pageContext.request.contextPath}/image.jsp?"
				+ Date.parse(new Date());
	}
	
	//激活验证码
	function change4(){
		document.getElementById("image4").src = "${pageContext.request.contextPath}/image.jsp?"
			+ Date.parse(new Date());
	}
	//激活弹出
	function onjh(){
		layer.close(layer.index);
		   $("#emample9").attr("display","none");
		   $("#emample14").attr("display","block");
		   $("#jh_email").val("");
		   $("#code4").val("");
		     $.layer({
				    type: 1,
				    title: "账号激活",
				    area: ['408px', '300px'],
				    shade: [0.5, '#000'],
				    shift: 'top', //从左动画弹出
				    page: {
				        dom: '#emample14'
				    },
				   
				});
	}
	//注销
	function qtexit() {
		$.ajax({
			type : "POST",
			url : "qtuser_qtexit",
			async : false,
			success : function(msgs) {
				location.reload();
			}
		});
	}
	//
</script>
</head>

<body>
 <!--头部开始-->
 <div id="top">
 <div id="Logo_1"></div>
 
 <div id="top2_bg">
  <div id="top2">
   <div id="top2_left">
    <div id="wjx"></div>
    <div id="welcome"><a title="收藏100南宁" href="javascript:jrsc();" target="_blank">收藏100南宁</a>     <span style="margin-left: 10px;">您好，欢迎来到快递超市！</span></div>
   </div>
   <div id="top2_right">
    <ul>
         <li><a  href="${pageContext.request.contextPath}/100nnPc20/index.jsp" target="_blank" >100南宁首页</a>　|</li>
    <%
 	User user = (User) request.getSession().getAttribute("usersession");
 	if (user == null) {
 %>
    <li><a title="登录" href="javascript:void(0);"  id="ele9">[登录]</a></li>
    <li><a title="免费注册" href="javascript:void(0);"  id="zhucebutton">[免费注册]</a>　</li>
    <%}else{ %>
    <li><a title="" href="${pageContext.request.contextPath}/order_qtorders" target="_blank">${usersession.u_name } </a> |</li>
    <li><a title="我的订单" href="${pageContext.request.contextPath}/order_qtorders" target="_blank">我的订单</a> |</li>
      <li><a  id="btnexit" title="注销" href="javascript:qtexit();" target="_blank">注销</a> </li>
    <%} %>

     <!--  <li><a  href="javascript:void(0);" target="_blank" id="zhucebutton">联系客服</a>　|</li>
      <li class="tp5"><a title="网站导航" href="#" target="_blank">网站导航</a></li>  -->
    </ul>
   </div>
  </div>
  </div>
  <div id="top3">
   <div id="top3_bg">
    <div class="logo"></div>
    <div id="search">
    <div id="search_t">
     <div id="s1" ><input name="" type="text" id="sosuoinput"/></div>
     <div id="s2"><input name="" type="button" id="sosuobutton" /></div>
    </div>
    <div id="hot">
     <ul>
      <li>热搜：</li>
      <li><a title="金枕头" href="${pageContext.request.contextPath}/qtcommoditynew_querycommodityinfo?c_id=69" target="_blank">金枕头</a> |</li>
      <li><a title="资生堂" href="${pageContext.request.contextPath}/qtcommoditynew_querycommodityinfo?c_id=36" target="_blank">资生堂</a> |</li>
      <li><a title="鲁花" href="${pageContext.request.contextPath}/qtcommoditynew_querycommodityinfo?c_id=7" target="_blank">鲁花</a> |</li>
      <li><a title="红提" href="${pageContext.request.contextPath}/qtcommoditynew_querycommodityinfo?c_id=25" target="_blank">红提</a></li>
     </ul>
    </div>
   </div>
   <div id="gwc" ><a href="javascript:void(0);" >购物车有<span class="hz" id="gwcnum">0</span>件商品</a></div>
  </div>
  </div>
  <div class="nav">
   <div class="nav_t">
    <div id="sp">商品服务分类</div>
    <div id="ly">
     <ul>
      <li class="tp1"><a title="粮油副食" href="${pageContext.request.contextPath}/qtcommoditynew_querycommdityList?commoditySort.cs_id=2" target="_blank ">粮油副食</a></li>
      <li class="tp2"><a title="居家日用" href="${pageContext.request.contextPath}/qtcommoditynew_querycommdityList?commoditySort.cs_id=5" target="_blank ">居家日用</a></li>
      <li class="tp3"><a title="生鲜果蔬" href="${pageContext.request.contextPath}/qtcommoditynew_querycommdityList?commoditySort.cs_id=4" target="_blank ">生鲜果蔬</a></li>
      <li class="tp4"><a title="进口酒饮" href="${pageContext.request.contextPath}/qtcommoditynew_querycommdityList?commoditySort.cs_id=6" target="_blank ">进口酒饮</a></li>
     </ul>
    </div>
   </div>
  </div>

 </div>
 <!--头部结束-->
 <!--[if !IE]> 登录框|DIV开始 <![endif]-->
	<div id="emample9" style="display: none;">
		<div class="clr"></div>
		<div id="blk9" class="blk"  style="padding: 0px 10px;">
			
			<div class="coreMian" style="padding: 10px 60px;">
				<form action="" method="post" >
					<div style="height: 38px;width: 268px;">
					<div class="coreMian_jgk" style="display: none;">
						<div class="coreMian_jgkIco"></div>
						<div class="coreMian_jgkText"></div>
					</div>
					</div>
					<div class="coreMian_wbk">
						<div class="coreMian_wbkTitle">
							<span class="coreMian_wbkTitle_span">邮&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;箱</span>
							
						</div>
						<div class="coreMian_wbkText">
							<input type="text" tabindex=1 id="u_email" name=u_email value="" />
						</div>
					</div>
					<div class="coreMian_wbk">
						<div class="coreMian_wbkTitle">
							<span class="coreMian_wbkTitle_span">登录密码</span><span
								class="coreMian_wbkTitle_spants"><a class="zhmm close9"
								href="javascript:void(0)"  id="login_to_zhmm" title="忘记登陆密码" style="font-size: 14px;">忘记登陆密码？</a></span>
						</div>
						<div class="coreMian_wbkText">
							<input type="password" tabindex=2 id="password" name="u_pwd"
								value="" />
						</div>
					</div>
					<!--[if !IE]> 登录框|第一次登陆所需输入框|开始 <![endif]-->
					<div class="coreMian_telValidation" style="display: none;">
						<div class="coreMian_telValidation_hq">
							<div class="coreMian_telValidation_hqTitle">
								<span>短信获取验证码</span>
							</div>
							<div class="coreMian_telValidation_hqText">
								<div class="coreMian_telValidation_hqTextLeft">
									<input type="text" value="请输入手机号" />
								</div>
								<div class="coreMian_telValidation_hqTextRight">
									<input type="button" />
								</div>
							</div>
						</div>
						<div class="coreMian_telValidation_yzm">
							<div class="coreMian_telValidation_yzmTitle">&nbsp;验证码</div>
							<div class="coreMian_telValidation_yzmText">
								<input type="text" />
							</div>
							<div class="coreMian_telValidation_yzmbutton">
								<input type="button" value="59秒重新获取" />
							</div>
						</div>
					</div>
					<!--[if !IE]> 登录框|第一次登陆所需输入框|结束 <![endif]-->
					<!--[if !IE]> 登录框|常规输入框|开始 <![endif]-->
					<div class="coreMian_wbk">
						<div class="coreMian_telValidation_hqTitle">
							<span>验证码</span>
						</div>
						<div class="coreMian_telValidation_hqText">
							<div class="coreMian_telValidation_hqTextLeft">
								<input type="text" tabindex=3 value="" class="code" id="code"
									name="code" />
							</div>
							<div class="coreMian_telValidation_hqTextRight1">
								<img id="image"
									src="${pageContext.request.contextPath}/image.jsp" alt="暂无图片"
									width="62" height="32" onClick="change();" />
							</div>
						</div>
					</div>
					<!--[if !IE]> 登录框|常规输入框|结束 <![endif]-->
					<div class="coreMian_qdButton">
						<div class="coreMian_qdButton_left">
							<input id="loginid" type="button" style="cursor: pointer;"class="sr5" value="" onkeydown="enterkey();" />
						</div>
						<a href="javascript:void(0);" id="loing_to_zc"
							title="马上注册"
							style="color: #79ae00; margin-left: 13%; float: left; margin-top: 4%;font-size: 14px;">免费注册</a>

					</div>
					<div style="height: 38px;width: 268px;">
					</div>
				</form>
			</div>

		</div>
	</div>
	<!--[if !IE]> 登录框|DIV结束 <![endif]-->
	<!--[if !IE]> 注册框|DIV开始 <![endif]-->
	<div id="emample10" style="display: none;">
		<div class="clr"></div>
		<div id="zhuceid" class="blk" style="height : 320px;" >
			<div class="coreMian" style="padding: 0px; ">
				<form action="user_adduser" method="post" id="formid">
					<div class="MianRight_mianTitlesNavzc">
					<div style="height: 13px;width: 268px;">
					</div>
						<!-- <div class="MianRight_yx">
							<div class="MianRight_mianTitlesNavBJn_mianLeft">用户名：</div>
							<div class="MianRight_mianTitlesNavBJn_mianZongT" style="border: 0px;">
								<input id="nameid" type="text" value="" name="u_name"
									onblur="onname();" />
							</div>
							<div id="nameerrid"></div>

						</div> -->
						
						<div class="MianRight_yhm">
							<div class="MianRight_mianTitlesNavBJn_mianLeft">邮箱：</div>
							<div class="MianRight_mianTitlesNavBJn_mianZongT" style="border: 0px;">
								<input id="emailid" type="text" value="" name="u_email"
									onblur="onemail();" />
							</div>
							<div id="emailerrid"></div>

						</div>
						<div class="MianRight_yhm">
							<div class="MianRight_mianTitlesNavBJn_mianLeft">创建密码：</div>
							<div class="MianRight_mianTitlesNavBJn_mianZongT"
							style="border: 0px;">
								<input id="pwdid" name="pwd" type="password" value=""
									onblur="onpwd();" />
							</div>
							<div id="pwderrid"></div>
						</div>
						<div class="MianRight_yhm">
							<div class="MianRight_mianTitlesNavBJn_mianLeft">确认密码：</div>
							<div class="MianRight_mianTitlesNavBJn_mianZongT" style="border: 0px;">
								<input id="pwdid2" name="pwd2" type="password" value=""
									onblur="onpwd();" />
							</div>
							<div id="pwderrid2"></div>
						</div>
						<div class="MianRight_yhm">
							<div class="MianRight_mianTitlesNavBJn_mianLeft">验证码：</div>
							<div class="MianRight_mianTitlesNavBJn_mianZongTT" style="border: 0px;width: 90px;">
								<input type="text" value="" class="code" id="code1" name="code1"
									onblur="oncode();" style="width: 80px;" />
							</div>
							<div class="MianRight_xz1" style="margin-left: 9px;">
								<img id="image2"
									src="${pageContext.request.contextPath}/image.jsp" alt="暂无图片"
									width="62" height="32" onClick="change2();" />
							</div>
							<div class="yxtp1h" onClick="change2();" style="cursor: pointer;margin-left: 0px;font-size: 14px;" id="code3333" >看不清楚？换一张</div>
						</div>
						<div class="MianRight_yhmz">
							<div class="MianRight_xz1z " style="cursor: pointer;"
								onclick="onadd();"  ></div>
							<a href="javascript:void(0);" id="zhmm_to_login"
								title="马上登录"
								style="color: #79ae00; margin-left: 5%; float: left; margin-top: 2%;font-size: 14px;">马上登录</a>
							<!--  <div class="yxtpf">返回</div> -->
						</div>
					</div>
				</form>
			</div>

		</div>
	</div>
	<!--[if !IE]> 注册框|DIV结束 <![endif]-->
	<!--[if !IE]> 注册框成功|DIV开始 <![endif]-->
	<div id="emample11" style="display: none;">
		<div class="clr"></div>
		<div id="zhucesuccessid" class="blk">
			<div class="coreMian">
				<div class="MianRight_mianTitlesNavzc" style="margin-left: -20px;height: 270px;">
					<div class="MianRight_yx">
						<div class="MianRight_mianTitlesNavBJn_mianLeft">
							<img alt="" style="margin-left: 10px; margin-top: 10px;"
								src="${pageContext.request.contextPath}/100nn/images/1.jpeg" width="50px" height="50px">
						</div>
						<div class="MianRight_mianTitlesNavBJn_mianZongT"
							style="line-height: 90px; font-size: 18px; color: #3FBB20; margin-left: -20px; margin-bottom: 30px;">注册成功</div>
					</div>
					<div class="MianRight_yhm">
						<div class="MianRight_mianTitlesNavBJn_mianLeft">您的邮箱:</div>
						<div class="MianRight_mianTitlesNavBJn_mianZongT" id="y_email"
							style="line-height: 33px; margin-left: 18px; font-size: 16px;"></div>

					</div>
					<div class="MianRight_yhmz">
						<a href="http://mail.qq.com/" class="MianRight_xz1z_01 zccg"
							style="cursor: pointer;" target="_blank">马上激活</a>
					</div>
				</div>

			</div>
		</div>
	</div>
	<!--[if !IE]> 注册框成功|DIV结束 <![endif]-->
	<!--[if !IE]> 找回密码|DIV开始 <![endif]-->
	<div id="emample15" style="display: none;">
		<div class="clr"></div>
		<div id="zhmmid" class="blk" >
			<div class="coreMian" style="padding: 20px 0px 0px 0px;">
				<form action="qtuser_forgotpassword" method="post" id="zhformid">
					<div class="MianRight_mianTitlesNavzc" style="height: 240px;">
						<!-- <div class="MianRight_yx">
							<div class="MianRight_mianTitlesNavBJn_mianLeft">用户名：</div>
							<div class="MianRight_mianTitlesNavBJn_mianZongT" style="border: 0px;">
								<input id="zh_name" type="text" tabindex=1 value=""
									name="u_name" onblur="zh_onname();" />
							</div>
							<div id="zh_nameerrid"></div>
						</div> -->
					
						<div class="MianRight_yhm" style="margin-top: 10px;">
							<div class="MianRight_mianTitlesNavBJn_mianLeft">邮箱：</div>
							<div class="MianRight_mianTitlesNavBJn_mianZongT" style="border: 0px;">
								<input id="zh_email" tabindex=2 type="text" value=""
									name="u_email" onblur="zh_onemail();" />
							</div>
							<div id="zh_emailerrid"></div>
								<div style="clear: both; margin-left: 100px; padding-top: 15px;">
							<a href="javascript:void(0);" style="color: #6CB213;font-size: 14px;"
								id="zhmm_to_zc" title="马上注册"  >还未有邮箱账号？马上注册</a>
						</div>
							<div class="MianRight_yhm" >
								<div class="MianRight_mianTitlesNavBJn_mianLeft">验证码：</div>
								<div class="MianRight_mianTitlesNavBJn_mianZongTT" style="width: 90px;">
									<input type="text" value="" tabindex=3 class="code" id="code3"
										name="code2" onblur="zh_oncode();" style="width: 80px;"/>
								</div>
								<div class="MianRight_xz1" style="margin-left: 9px;">
									<img id="image3"
										src="${pageContext.request.contextPath}/image.jsp" alt="暂无图片"
										width="62" height="32" onClick="change3();" />
								</div>
							<div class="zhmmerr" style="float: left;margin-left:10px;font-size: 12px;"></div>
							</div>
							
							<div class="yxtp1h zh_yxtp1h" onClick="change3();" id="code2222" 
									style="cursor: pointer;font-size: 14px;margin-left: 100px;">看不清楚？换一张</div>
							<div class="MianRight_yhmz">
								<div class="MianRight_zhmm_1 " id="zhmmbuttonid" style="cursor: pointer;"
									onclick="dozhmm();"></div>
								<a href="javascript:void(0);" id="zc_to_login"
									title="马上登录"
									style="color: #79ae00; margin-left: 4%; float: left; line-height:39px;  font-size: 14px;">马上登录</a>
								<!--  <div class="yxtpf">返回</div> -->
							</div>
						</div>
					</div>
				</form>
			</div>

		</div>
	</div>
	<!--[if !IE]>找回密码|DIV结束 <![endif]-->
	<!--[if !IE]> 找回密码成功|DIV开始 <![endif]-->
	<div id="emample12" style="display: none;">
		<div class="clr"></div>
		<div id="zhmmcgid" class="blk"  style="height:  200px;">
			<div class="coreMian" style="height: 200px;padding: 20px 50px;">
				<div class="MianRight_mianTitlesNavzc" style="margin-left: -20px;">
					<div class="MianRight_yx">
						<div class="MianRight_mianTitlesNavBJn_mianLeft">
							<img alt="" style="margin-left: 10px; margin-top: 10px;"
								src="${pageContext.request.contextPath}/100nn/images/1.jpeg" width="50px" height="50px">
						</div>
						<div class="MianRight_mianTitlesNavBJn_mianZongT"
							style="width: 220px; line-height: 90px; font-size: 18px; color: #3FBB20; margin-left: -2px; margin-bottom: 30px;border: 0px;">找回密码邮件发送成功</div>
					</div>
					<div class="MianRight_yhm">
						<div class="MianRight_mianTitlesNavBJn_mianLeft">您的邮箱:</div>
						<div class="MianRight_mianTitlesNavBJn_mianZongT"
							id="y_email_zhmm"
							style="line-height: 33px; margin-left: 18px; font-size: 16px;"></div>

					</div>
					<div class="MianRight_yhmz">
						<a href="http://mail.qq.com/" class="MianRight_zhmm_3"
							style="cursor: pointer;" target="_blank"></a>
					</div>
				</div>

			</div>
		</div>
	</div>
	<!--[if !IE]>找回密码成功|DIV结束 <![endif]-->
		<!--[if !IE]> 激活账号|DIV开始 <![endif]-->
	<div id="emample14" style="display: none;">
		<div class="clr"></div>
		<div id="jhdivid" class="blk" >
			<div class="coreMian" style="padding:20px 0px;">
				<form action="qtuser_jhzh" method="post" id="jhformid">
					<div class="MianRight_mianTitlesNavzc" style="height: 200px;">
						<!-- <div class="MianRight_yx">
							<div class="MianRight_mianTitlesNavBJn_mianLeft">用户名：</div>
							<div class="MianRight_mianTitlesNavBJn_mianZongT" style="border: 0px;">
								<input id="jh_name" type="text" tabindex=1 value=""
									name="u_name" onblur="zh_onname();" />
							</div>
							<div id="jh_nameerrid"></div>
						</div> -->
						<div class="MianRight_yhm" style="margin-top: 10px;">
							<div class="MianRight_mianTitlesNavBJn_mianLeft">邮箱：</div>
							<div class="MianRight_mianTitlesNavBJn_mianZongT" style="border: 0px;">
								<input id="jh_email" tabindex=2 type="text" value=""
									name="u_email" onblur="zh_onemail();" />
							</div>
							<div id="jh_emailerrid"></div>
							<div class="MianRight_yhm">
								<div class="MianRight_mianTitlesNavBJn_mianLeft">验证码：</div>
								<div class="MianRight_mianTitlesNavBJn_mianZongTT" style="width: 90px;">
									<input type="text" value="" tabindex=3 class="code" id="code4"
										name="code4" onblur="jh_oncode();" style="width: 80px;"/>
								</div>
								<div class="MianRight_xz1" style="margin-left:11px;">
									<img id="image4"
										src="${pageContext.request.contextPath}/image.jsp" alt="暂无图片"
										width="62" height="32" onClick="change4();" />
								</div>
								<div class="yxtp1h zh_yxtp1h" onClick="change4();"
									style="cursor: pointer;margin-left: 5px;">看不清楚？换一张</div>
							</div>
							<div class="MianRight_yhmz">
								<div class="MianRight_xz1z_01 " id="jhbuttonid" style="cursor: pointer;"
									onclick="dojh();">激活</div>
							</div>
						</div>
					</div>
				</form>
			</div>

		</div>
	</div>
	<!--[if !IE]>激活账号|DIV结束 <![endif]-->
	<!--[if !IE]> 激活账号成功|DIV开始 <![endif]-->
	<div id="emample17" style="display: none;">
		<div class="clr"></div>
		<div id="zhmmcgid" class="blk"  style="height:  200px;">
			<div class="coreMian" style="height: 200px;padding: 20px 50px;">
				<div class="MianRight_mianTitlesNavzc" style="margin-left: -20px;">
					<div class="MianRight_yx">
						<div class="MianRight_mianTitlesNavBJn_mianLeft">
							<img alt="" style="margin-left: 10px; margin-top: 10px;"
								src="${pageContext.request.contextPath}/100nn/images/1.jpeg" width="50px" height="50px">
						</div>
						<div class="MianRight_mianTitlesNavBJn_mianZongT"
							style="width: 220px; line-height: 90px; font-size: 18px; color: #3FBB20; margin-left: -2px; margin-bottom: 30px;border: 0px;">激活邮件发送成功</div>
					</div>
					<div class="MianRight_yhm">
						<div class="MianRight_mianTitlesNavBJn_mianLeft">您的邮箱:</div>
						<div class="MianRight_mianTitlesNavBJn_mianZongT"
							id="y_email_xgmm"
							style="line-height: 33px; margin-left: 18px; font-size: 16px;"></div>

					</div>
					<div class="MianRight_yhmz">
						<a href="http://mail.qq.com/" class="MianRight_zhmm_3"
							style="cursor: pointer;" target="_blank"></a>
					</div>
				</div>

			</div>
		</div>
	</div>
	<!--[if !IE]>激活账号成功|DIV结束 <![endif]-->
	
	
	
	<!--[if !IE]> 收货地址－弹出|DIV开始 <![endif]-->
	<div id="emample16" style="display: none;">
		<div class="clr"></div>
		<div id="addshdz" class="blk2" >
			<div class="coreMian" style="padding: 20px 5px;width: 595px;">
				<div class="MianRight_mianTitlesNav">
                    <div class="MianRight_mianTitlesNavBJn1">
                    <form action="" id="useraddressformid" method="post">
                    	<div class="MianRight_mianTitlesNavBJn_mian">
                        	<div class="MianRight_mianTitlesNavBJn_mianSpantitle">所在地区</div>
                        	<input type="hidden" id="useraddress" name="ua_address" value=""/>
                        	<input type="hidden" id="useraddress_qu"  value=""/>
                        	<input type="hidden"  id="ua_scbs" name="ua_scbs" value="1"/>
                        	<input type="hidden" id="user_id" name="user.u_id" value="${ usersession.u_id}"/>
                        	
                        	<input type="hidden" id="u_id" name="ua_id" value="${ua_id }"/>
                            <div class="MianRight_mianTitlesNavBJn_mianSpangh">
                                <div class="MianRight_mianTitlesNavBJn_mianSpangh_cs">南宁市</div>
                                <div class="MianRight_mianTitlesNavBJn_mianSpangh_cs nav_button1">青秀区</div>
                                <ul id="birthday_type_ul1" class="left_nav_mian_tz2">
                                    <li id="birthday_0" value="青秀区" class="left_nav_mian_tz3">青秀区</li>
                                    <li id="birthday_1" value="兴宁区" class="left_nav_mian_tz3">兴宁区</li>
                                    <li id="birthday_2" value="江南区" class="left_nav_mian_tz3">江南区</li>
                                    <li id="birthday_3" value="西乡塘区" class="left_nav_mian_tz3">西乡塘区</li>
                                    <li id="birthday_4" value="邕宁区" class="left_nav_mian_tz3">邕宁区</li>
                                    <li id="birthday_5" value="良庆区" class="left_nav_mian_tz3">良庆区</li>
                            	</ul>
                            </div>
                        </div>
                        <div class="MianRight_mianTitlesNavBJn_mian1">
                        	<div class="MianRight_mianTitlesNavBJn_mianSpantitle1">街道地址</div>
                            <div class="MianRight_mianTitlesNavBJn_mianSpangh">
                            	<div class="MianRight_mianTitlesNavBJn_mianSpangh_dq1"><textarea id="jd" name="" rows="10" cols="30"  placeholder="不需要重复填写省份"></textarea></div>
                            </div>
                        </div>
                        <div class="MianRight_mianTitlesNavBJn_mian">
                        	<div class="MianRight_mianTitlesNavBJn_mianSpantitle">收货人姓名</div>
                            <div class="MianRight_mianTitlesNavBJn_mianSpangh">
                            	<div class="MianRight_mianTitlesNavBJn_mianSpangh_dq"><input id="shname" type="text" name="ua_shName" value="" value="${ useraddressinfo.ua_shName}"/></div>
                            </div>
                        </div>
                        <div class="MianRight_mianTitlesNavBJn_mian">
                        	<div class="MianRight_mianTitlesNavBJn_mianSpantitle">手机号码</div>
                            <div class="MianRight_mianTitlesNavBJn_mianSpangh">
                            	<div class="MianRight_mianTitlesNavBJn_mianSpangh_dq"><input id="sjhm" type="text" name="ua_shDh" value="" value="${ ua_shDh}"/></div>
                            </div>
                        </div>
                        <div class="MianRight_mianTitlesNavBJn_mian">
                        	<div class="MianRight_mianTitlesNavBJn_mianSpantitle">固定电话</div>
                        	<input type="hidden" name="ua_shGddh" value="" id="gddh"/>
                            <div class="MianRight_mianTitlesNavBJn_mianSpangh">
                            	<div class="MianRight_mianTitlesNavBJn_mianSpangh_dq2" style="width: 40px;"><input type="text" id="qh" value="" style="width: 31px;" /></div>
                                <div class="MianRight_mianTitlesNavBJn_mianSpangh_dq2" style="width: 95px;"><input type="text" id="dh" value="" style="width: 86px;"/></div>
                               <!--  <div class="MianRight_mianTitlesNavBJn_mianSpangh_dq2"><input type="text" value="分机" /></div> -->
                            </div>
                        </div>
                        <div class="MianRight_mianTitlesNavBJn_mian">
                        	<div class="MianRight_mianTitlesNavBJn_mianSpantitle"></div>
                            <div class="MianRight_mianTitlesNavBJn_mianSpangh"><input type="hidden" name="ua_status" value="0" id="addstatus"/><input id="mrcheckbox" type="checkbox" name="addbike"  />设置为默认收货地址</div>
                        </div>
                        <div class="MianRight_mianTitlesNavBJn_mian">
                        	<div class="MianRight_mianTitlesNavBJn_mianSpantitle"></div>
                            <div class="MianRight_mianTitlesNavBJn_mianSpangh">
                                <div class="MianRight_mianTitlesNavBJn_mianSpangh_text"><img src="${pageContext.request.contextPath}/100nn/Supermarket/images/bc_button.jpg" width="73" height="31" onclick="adduseraddress();" /></div>
                            </div>
                        </div>
                        </form>
                    </div>
                </div>

			</div>
		</div>
	</div>
	<!--[if !IE]>找回密码成功|DIV结束 <![endif]-->
 <script >
 	function jrsc(){
 		alert("当前浏览器不支持，请手动收藏，谢谢！");
 	}
 </script>
 <script type="text/javascript" src="${pageContext.request.contextPath}/js/layer.min.js"></script>
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
	    $("#useraddress_qu").val(p_html);
	  });
	  $(document).mouseup(function(event){
		if($(event.target).parents("#birthday_type_ul1").length==0){
		$("#birthday_type_ul1").slideUp(100);
		}
		});
	  //-隔行,滑动,点击 变色
	  $('#tbs table tr').hover(
	   function() {$(this).addClass('highlight');},
	   function() {$(this).removeClass('highlight');}
	  );
	  $('#tbs table   tr').click(
	   function() {
		 
	   });
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
	function onemail() {
		var emai = $("#emailid").val();
		var szReg = /^([a-zA-Z0-9]+[_|_|.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|_|.]?)*[a-zA-Z0-9]+.[a-zA-Z]{2,4}$/;
		var bChk = szReg.test(emai);
		if (bChk) {
			//验证邮箱是否存在
			$
					.ajax({
						type : "POST",
						url : "qtuser_checkcemail",
						data : "name=" +emai,
						success : function(msgs) {
							if (msgs == 1) {
								var str = " <div class=\"yxtp1\">"
									+ "<div class=\"MianRight_mianN_td3Left1\"></div>"
									+ "</div>";
							$("#emailerrid").attr("class", "");
							$("#emailerrid").html(str);
							} else {
								var str = " <div class=\"yxtp1\">" + "<div class=\"yxtp1c\"></div>"
								+ "<div class=\"yxtp1k\">该邮箱已注册</div>" + "</div>";
						$("#emailerrid").attr("class", "");
						$("#emailerrid").html(str);
							}
						}
					});
			

		} else {
			var str = " <div class=\"yxtp1\">" + "<div class=\"yxtp1c\"></div>"
					+ "<div class=\"yxtp1k\">邮箱格式不对</div>" + "</div>";
			$("#emailerrid").attr("class", "");
			$("#emailerrid").html(str);
		}
	}
	function onpwd() {
		var n = $("#pwdid").val();
		var pwd2 = $("#pwdid2").val();
		if (n != "") {
			var str = " <div class=\"yxtp1\">"
					+ "<div class=\"MianRight_mianN_td3Left1\"></div>"
					+ "</div>";

			$("#pwderrid").attr("class", "");
			$("#pwderrid").html(str);
		} else {
			var str = " <div class=\"yxtp1\">" + "<div class=\"yxtp1c\"></div>"
					+ "<div class=\"yxtp1k\">密码不能为空</div>" + "</div>";
			$("#pwderrid").attr("class", "");
			$("#pwderrid").html(str);
		}
		if (pwd2 != "") {

			if (pwd2 == n) {
				var str = " <div class=\"yxtp1\">"
						+ "<div class=\"MianRight_mianN_td3Left1\"></div>"
						+ "</div>";
				$("#pwderrid2").attr("class", "");
				$("#pwderrid2").html(str);
			} else {
				var str = " <div class=\"yxtp1\">"
						+ "<div class=\"yxtp1c\"></div>"
						+ "<div class=\"yxtp1k\">两次密码输入不一致</div>" + "</div>";
				$("#pwderrid2").attr("class", "");
				$("#pwderrid2").html(str);
			}
		} else {
			var str = " <div class=\"yxtp1\">" + "<div class=\"yxtp1c\"></div>"
					+ "<div class=\"yxtp1k\">密码不能为空</div>" + "</div>";
			$("#pwderrid2").attr("class", "");
			$("#pwderrid2").html(str);
		}
	}
	function onname() {
		var n = $("#nameid").val();
		if (n != "") {
			//验证用户名是否存在
			$
					.ajax({
						type : "POST",
						url : "qtuser_checkcuname",
						data : "name=" + n,
						success : function(msgs) {
							if (msgs == 1) {
								var str = " <div class=\"yxtp1\">"
										+ "<div class=\"MianRight_mianN_td3Left1\"></div>"
										+ "</div>";
								$("#nameerrid").attr("class", "");
								$("#nameerrid").html(str);
							} else {
								var str = " <div class=\"yxtp1\">"
										+ "<div class=\"yxtp1c\"></div>"
										+ "<div class=\"yxtp1k\">该用户名已存在</div>"
										+ "</div>";
								$("#nameerrid").attr("class", "");
								$("#nameerrid").html(str);
							}
						}
					});

		} else {
			var str = " <div class=\"yxtp1\">" + "<div class=\"yxtp1c\"></div>"
					+ "<div class=\"yxtp1k\">用户名不能为空</div>" + "</div>";
			$("#nameerrid").attr("class", "");
			$("#nameerrid").html(str);
		}
	}
	function oncode() {
		var n = $("#code1").val();
		var str = "";
		if (n == "") {
			str = " <div class=\"yxtp1\" style='margin-left: 0px;' >"
					+ "<div class=\"yxtp1c\"></div>"
					+ "<div class=\"yxtp1k\">验证码不能为空</div>" + "</div>";

		} 
		$(".yxtp1h").html(str);
	}
	//注册
	function onadd() {
		
		/* var nameid = $("#nameid").val(); */
		var n = $("#pwdid").val();
		var pwd2 = $("#pwdid2").val();
		var emai = $("#emailid").val();
		var code1 = $("#code1").val();
		var f = true;
		/* if (nameid == "") {
			f = false;
			var str = " <div class=\"yxtp1\">" + "<div class=\"yxtp1c\"></div>"
					+ "<div class=\"yxtp1k\">用户名不能为空</div>" + "</div>";
			$("#nameerrid").attr("class", "");
			$("#nameerrid").html(str);

		} */
		var szReg = /^([a-zA-Z0-9]+[_|_|.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|_|.]?)*[a-zA-Z0-9]+.[a-zA-Z]{2,4}$/;
		var bChk = szReg.test(emai);
		if(!bChk){
			f = false;
			var str = " <div class=\"yxtp1\">" + "<div class=\"yxtp1c\"></div>"
					+ "<div class=\"yxtp1k\">邮箱格式错误</div>" + "</div>";
			$("#emailerrid").attr("class", "");
			$("#emailerrid").html(str);
		}
		if (n == "") {
			f = false;
			var str = " <div class=\"yxtp1\">" + "<div class=\"yxtp1c\"></div>"
					+ "<div class=\"yxtp1k\">密码不能为空</div>" + "</div>";
			$("#pwderrid").attr("class", "");
			$("#pwderrid").html(str);
		}
		if (pwd2 == "") {
			f = false;
			var str = " <div class=\"yxtp1\">" + "<div class=\"yxtp1c\"></div>"
					+ "<div class=\"yxtp1k\">密码不能为空</div>" + "</div>";
			$("#pwderrid2").attr("class", "");
			$("#pwderrid2").html(str);
		}
		if(n!=pwd2){
			f = false;
			var str = " <div class=\"yxtp1\">" + "<div class=\"yxtp1c\"></div>"
					+ "<div class=\"yxtp1k\">两次密码不一致</div>" + "</div>";
			$("#pwderrid2").attr("class", "");
			$("#pwderrid2").html(str);	
		}
		if (emai == "") {
			f = false;
			var str = " <div class=\"yxtp1\">" + "<div class=\"yxtp1c\"></div>"
					+ "<div class=\"yxtp1k\">邮箱不能为空</div>" + "</div>";
			$("#emailerrid").attr("class", "");
			$("#emailerrid").html(str);
		}else{
			//验证邮箱是否存在
			$.ajax({
						type : "POST",
						url : "qtuser_checkcemail",
						data : "name=" +emai,
						success : function(msgs) {
							if (msgs == 1) {
							
								var str = " <div class=\"yxtp1\">"
									+ "<div class=\"MianRight_mianN_td3Left1\"></div>"
									+ "</div>";
							$("#emailerrid").attr("class", "");
							$("#emailerrid").html(str);
							} else {
								f=false;
								var str = " <div class=\"yxtp1\">" + "<div class=\"yxtp1c\"></div>"
								+ "<div class=\"yxtp1k\" >该邮箱已注册</div>" + "</div>";
						$("#emailerrid").attr("class", "");
						$("#emailerrid").html(str);
							}
						}
					});
		}
		if (code1 == "") {
			var str = " <div class=\"yxtp1\" style=\"margin-left:9px;\" >"
					+ "<div class=\"yxtp1c\"></div>"
					+ "<div class=\"yxtp1k\" style=\"font-size: 12px;\">验证码不能为空</div>" + "</div>";
			$(".yxtp1h").html(str);
			f = false;
		}

		if (f == true) {
 			$(".MianRight_xz1z").addClass("MianRight_xz1z_loding"); 
 			adduser();
		}
	}
	function adduser() {
		$(".MianRight_xz1z").attr("onclick","");
		$.ajax({
					type : "POST",
					url : "qtuser_adduser",
					data : $('#formid').serialize(),// 你的formid
					success : function(data) {
						var datas = data.split(",");
						if (datas[0] == 1) {
							$(".MianRight_xz1z").removeClass("MianRight_xz1z_loding");
							$("#y_email").html(datas[1]);
							
							//弹出 注册成功  关闭  注册
							//注册成功－弹出
							       layer.close(layer.index);
						           $("#emample10").attr("display","none");
								   $("#emample11").attr("display","block");
								   zcsuccesslayer=  $.layer({
										    type: 1,
										    title: "注册提示",
										    area: ['408px', '376px'],
										    shade: [0.5, '#000'],
										    shift: 'top', //从左动画弹出
										    page: {
										        dom: '#emample11'
										    },
										   
										});
								
								
							
							
						} else {
							$(".MianRight_xz1z").removeClass("MianRight_xz1z_loding");
							var str = " <div class=\"yxtp1\" style='margin-left: 0px;' >"
									+ "<div class=\"yxtp1c\"></div>"
									+ "<div class=\"yxtp1k\">"
									+ datas[1]
									+ "</div>" + "</div>";
							$(".yxtp1h").html(str);
							$(".MianRight_xz1z").attr("onclick","onadd()");
						}
					}
				});
	}
	//
	function zh_onname() {
		var n = $("#zh_name").val();
		if (n != "") {

			var str = " <div class=\"yxtp1\">"
					+ "<div class=\"MianRight_mianN_td3Left1\"></div>"
					+ "</div>";
			$("#zh_nameerrid").attr("class", "");
			$("#zh_nameerrid").html(str);
		} else {
			var str = " <div class=\"yxtp1\">" + "<div class=\"yxtp1c\"></div>"
					+ "<div class=\"yxtp1k\">用户名不能为空</div>" + "</div>";
			$("#zh_nameerrid").attr("class", "");
			$("#zh_nameerrid").html(str);
		}
	}

	function zh_onemail() {
		var emai = $("#zh_email").val();
		var szReg = /^([a-zA-Z0-9]+[_|_|.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|_|.]?)*[a-zA-Z0-9]+.[a-zA-Z]{2,4}$/;
		var bChk = szReg.test(emai);
		if (emai != "") {
			if (bChk) {
				var str = " <div class=\"yxtp1\">"
						+ "<div class=\"MianRight_mianN_td3Left1\"></div>"
						+ "</div>";
				$("#zh_emailerrid").attr("class", "");
				$("#zh_emailerrid").html(str);

			} else {
				var str = " <div class=\"yxtp1\">"
						+ "<div class=\"yxtp1c\"></div>"
						+ "<div class=\"yxtp1k\">邮箱格式不对</div>" + "</div>";
				$("#zh_emailerrid").attr("class", "");
				$("#zh_emailerrid").html(str);

			}

		} else {
			var str = " <div class=\"yxtp1\">" + "<div class=\"yxtp1c\"></div>"
					+ "<div class=\"yxtp1k\">邮箱不能为空</div>" + "</div>";
			$("#zh_emailerrid").attr("class", "");
			$("#zh_emailerrid").html(str);
		}

	}

	function zh_oncode() {
		var n = $("#code3").val();
		var str = "";
		if (n == "") {
			str = " <div class=\"yxtp1\" style='margin-left: 0px;' >"
					+ "<div class=\"yxtp1c\"></div>"
					+ "<div class=\"yxtp1k\">验证码不能为空</div>" + "</div>";

		}/*  else {
			str = "<div class=\"yxtp1h\" style='margin-left: 0px;'  onClick=\"change2();\"style=\"cursor:pointer;\">看不清楚？换一张</div>";
		} */

		$(".zh_yxtp1h").html(str);
	}
	//找回密码
	function dozhmm() {
		
		var code3 = $("#code3").val();
		var emai = $("#zh_email").val();
		/* var zhname = $("#zh_name").val(); */
		var f = true;
		var str = "";
		if (code3 == "") {
			f = false;
			str = " <div class=\"yxtp1\" style='margin-left: 0px;' >"
					+ "<div class=\"yxtp1c\"></div>"
					+ "<div class=\"yxtp1k\">验证码不能为空</div>" + "</div>";
			$(".zhmmerr").html(str);
		}else{
			f=true;
		}
		if (emai == "") {
			f = false;
			str = " <div class=\"yxtp1\">" + "<div class=\"yxtp1c\"></div>"
					+ "<div class=\"yxtp1k\">邮箱不能为空</div>" + "</div>";
			$("#zh_emailerrid").attr("class", "");
			$("#zh_emailerrid").html(str);
		}else{
			f=true;
		}
		/* if (zhname == "") {
			f = false;
			str = " <div class=\"yxtp1\">" + "<div class=\"yxtp1c\"></div>"
					+ "<div class=\"yxtp1k\">用户名不能为空</div>" + "</div>";
			$("#zh_nameerrid").attr("class", "");
			$("#zh_nameerrid").html(str);

		} */
		if(f==false){
			return false;
		}
		
	        $("#zhmmbuttonid").addClass("MianRight_zhmm_2");
			$("#zhmmbuttonid").attr("onclick","");
			
			$.ajax({
				type : "POST",
				url : "qtuser_forgotpassword",
				data : $('#zhformid').serialize(),// 你的formid
				success : function(data) {
					var datas = data.split(",");
					if (datas[0] == 1) {
						$("#y_email_zhmm").html(datas[1]);
						
						var str = " <div class=\"yxtp1\">"
							+ "<div class=\"MianRight_mianN_td3Left1\"></div>"
							+ "</div>";
					       $("#zh_emailerrid").attr("class", "");
					       $("#zh_emailerrid").html(str);
						   layer.close(layer.index);
				           $("#emample15").attr("display","none");
						   $("#emample12").attr("display","block");
						   zcsuccesslayer=  $.layer({
								    type: 1,
								    title: "找回密码提示",
								    area: ['408px', '376px'],
								    shade: [0.5, '#000'],
								    shift: 'top', //从左动画弹出
								    page: {
								        dom: '#emample12'
								    },
								   
								});
						
						
					} else {
						$("#zhmmbuttonid").removeClass("MianRight_zhmm_2");
						$("#zhmmbuttonid").addClass("MianRight_zhmm_1");
						str = " <div class=\"yxtp1\">" + "<div class=\"yxtp1c\"></div>"
						+ "<div class=\"yxtp1k\">"+datas[1]+"</div>" + "</div>";
						$("#zh_emailerrid").attr("class", "");
						$("#zh_emailerrid").html(str);
						$("#zhmmbuttonid").attr("onclick","dozhmm()");

					}
				}
			});

		
	}
	function adduseraddress(){
		  var p_html = $(".left_nav_mian_tz3").html();
		 var qu= $("#useraddress_qu").val();//区
		 if(qu==""){
			 $("#useraddress_qu").val(p_html);
			 qu= $("#useraddress_qu").val();
		 }
		 var jd=$("#jd").val();//街道
		 
		var ajaxCallUrl="useraddress_save";
		var useraddresshtml="南宁市"+" "+qu+" "+jd;
	    $("#useraddress").val(useraddresshtml);
		var qh=$("#qh").val();
		var dh=$("#dh").val();
		if(qh!=""&&dh!=""){
		$("#gddh").val(qh+"-"+dh);
		}
		
		var dh= $("#gddh").val();//电话
		var shname=$("#shname").val();//收货人
		var sjhm=$("#sjhm").val();//手机号码
		if(qu!=""&&jd!=""&&shname!=""){
			if(dh!=""||sjhm!=""){
		$.ajax({
          cache: true,
          type: "POST",
          url:ajaxCallUrl,
          data:$('#useraddressformid').serialize(),// 你的formid
          async: false,
          error: function(request) {
              layer.msg("添加失败");
          },
          success: function(data) {
        	  layer.msg("添加成功",5,1,"100px");
          	location.reload(); 
          }
          
      });
			}else{
				 layer.msg("收货人电话或手机必须填写一个");
			}
		}else{
			layer.msg("请填写收货人地址和收货人姓名");
		}
	}
	
	
	//激活－验证码
	function jh_oncode(){
		var n = $("#code4").val();
		var str = "";
		if (n == "") {
			str = " <div class=\"yxtp1\" style='margin-left: 0px;' >"
					+ "<div class=\"yxtp1c\"></div>"
					+ "<div class=\"yxtp1k\">验证码不能为空</div>" + "</div>";

		} 
		$(".zh_yxtp1h").html(str);
	}
	//确认激活
	function dojh(){
		var code4 = $("#code4").val();
		var emai = $("#jh_email").val();
		var f = true;
		var str = "";
		if (code4 == "") {
			f = false;
			str = " <div class=\"yxtp1\" style='margin-left: 0px;' >"
					+ "<div class=\"yxtp1c\"></div>"
					+ "<div class=\"yxtp1k\">验证码不能为空</div>" + "</div>";
			$(".jh_yxtp1h").html(str);
		}
		if (emai == "") {
			f = false;
			str = " <div class=\"yxtp1\">" + "<div class=\"yxtp1c\"></div>"
					+ "<div class=\"yxtp1k\">邮箱不能为空</div>" + "</div>";
			$("#jh_emailerrid").attr("class", "");
			$("#jh_emailerrid").html(str);
		}
		if (f == true) {
			$("#jhbuttonid").html("");
			$("#jhbuttonid").addClass("MianRight_xz1z_loding"); 
			$("#jhbuttonid").attr("onclick","");
			$.ajax({
				type : "POST",
				url : "qtuser_jhzh",
				data : $('#jhformid').serialize(),// 你的formid
				success : function(data) {
					var datas = data.split(",");
					if (datas[0] == 1) {
						$("#y_email_xgmm").html(datas[1]);
						$("#jhbuttonid").attr("onclick","dojh()");
						  layer.close(layer.index);
				           $("#emample14").attr("display","none");
						   $("#emample17").attr("display","block");
						   zcsuccesslayer=  $.layer({
								    type: 1,
								    title: "激活提示",
								    area: ['408px', '376px'],
								    shade: [0.5, '#000'],
								    shift: 'top', //从左动画弹出
								    page: {
								        dom: '#emample17'
								    },
								   
								});
						
					} else {
						$("#jhbuttonid").attr("onclick","dojh()");
						str = " <div class=\"yxtp1\">" + "<div class=\"yxtp1c\"></div>"
						+ "<div class=\"yxtp1k\">"+datas[1]+"</div>" + "</div>";
						$("#jh_emailerrid").attr("class", "");
						$("#jh_emailerrid").html(str);
						

					}
				}
			});

		}else{
			$("#jhbuttonid").addClass("MianRight_xz1z_01"); 
			$("#jhbuttonid").html("激活");
			$("#jhbuttonid").attr("onclick","dojh()");
		}
	}
	var i=1;
$("#mrcheckbox").click(function(){
	if(undefined==$(this).attr("checked")){
		$(this).attr("checked",true);
	}else{
		$(this).attr("checked",false);
	}
	if($(this).attr("checked")){
		$("#addstatus").val("1");
	}else{
		$("#addstatus").val("0");	
	}
});

//搜索功能
/* $("#sosuobutton").click(function(){
	var spsuovalue=$("#sosuoinput").val();
	window.location.href="${pageContext.request.contextPath}/qtcommoditynew_querycommdityList?result="+spsuovalue;
	
}); */
/* var is=0;
//购物车
$("#gwc").click(function(){
	if(is==0){
		//验证session回话过期
		$
				.ajax({
					type : "POST",
					url : "qtuser_loginyz",
					success : function(msgs) {
						if (msgs == "0") {
							if(is==0){
							$("#gwc").find("a").trigger("click");
	                         is=1;
	                         if(is==1){
	                       
	                         }
							}
						}else{
							
						}
					}
				});
	}else{
		
	}
	
}); */
$("#gwc").find("a").click(function(){
	$
	.ajax({
		type : "POST",
		url : "qtuser_loginyz",
		success : function(msgs) {
			if (msgs == "0") {
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
	}
});
});



</script>
 
</body>
</html>
