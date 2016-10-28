<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.cisoft.model.User"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="${pageContext.request.contextPath}/100nn/css/top_style.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/100nn/css/BusinessServices_style.css" rel="stylesheet"
	type="text/css" />
<link href="${pageContext.request.contextPath}/100nn/css/core.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/100nn/css/100nnzc.css" rel="stylesheet" type="text/css" />
<script type="text/jscript" src="${pageContext.request.contextPath}/100nn/js/jquery-1.8.0.min.js"></script>
<script type="text/jscript" src="${pageContext.request.contextPath}/100nn/js/popup_layer.js"></script>

<title>100南宁</title>
<script type="text/javascript">
	function autowidth() {
		var wh = $(window).height();
		wh = wh - 126;
		$("#Mian").css("height", wh);

		var wj = $("#Mian").height();
		$("#MianLeft").css("height", wj);
		var wl = $("#Mian").height();
		wl = wl - 1;
		$("#MianRight").css("height", wl);

		var wk = $(window).width();
		wk = wk - 101;
		$("#MianRight").css("width", wk);
	}
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
		
		//验证session回话过期
		$
				.ajax({
					type : "POST",
					url : "qtuser_loginyz",
					success : function(msgs) {
						if (msgs == "0") {
							var t9 = new PopupLayer({
								trigger : ".tcdiv",
								popupBlk : "#blk9",
								closeBtn : ".close9",
								useOverlay : true,
								useFx : true,
								isResizeFollowTigger : false,
								offsets : {
									x : 0,
									y : -3000
								}
							});
							t9.doEffects = function(way) {
								if (way == "open") {

									this.popupLayer
											.css({
												opacity : 0.3
											})
											.show(
													1,
													function() {
														this.popupLayer
																.animate(
																		{
																			left : ($(
																					document)
																					.width() - this.popupLayer
																					.width()) / 2,
																			top : (document.documentElement.clientHeight - this.popupLayer
																					.height())
																					/ 2
																					+ $(
																							document)
																							.scrollTop(),
																			opacity : 0.8
																		},
																		1,
																		function() {
																			this.popupLayer
																					.css(
																							"opacity",
																							1)
																		}
																				.binding(this));
													}.binding(this));
								} else {
									//清除数据
									$(".coreMian_jgk").css("display","none");
									$(".coreMian_jgkText").text("");
									$(".coreMian_jgkText").hide();
									$("#u_email").val("");
									$("#password").val("");
									$("#code").val("");
									this.popupLayer.animate({
										left : this.trigger.offset().left,
										top : this.trigger.offset().top,
										opacity : 0.1
									}, {
										duration : 5,
										complete : function() {
											this.popupLayer.css("opacity", 1);
											this.popupLayer.hide()
										}.binding(this)
									});
								}
							}
						}
					}
				});

		//注册弹出
		var t10 = new PopupLayer({
			trigger : ".zhucebutton",
			popupBlk : "#zhuceid",
			closeBtn : ".zhuceclose",
			useOverlay : true,
			useFx : true,
			isResizeFollowTigger : false,
			offsets : {
				x : 0,
				y : -3000
			}
		});
		t10.doEffects = function(way) {

			if (way == "open") {
				this.popupLayer
						.css({
							opacity : 0.3
						})
						.show(
								1,
								function() {
									this.popupLayer
											.animate(
													{
														left : ($(document)
																.width() - this.popupLayer
																.width()) / 2,
														top : (document.documentElement.clientHeight - this.popupLayer
																.height())
																/ 2
																+ $(document)
																		.scrollTop(),
														opacity : 0.8
													}, 1, function() {
														this.popupLayer.css(
																"opacity", 1)
													}.binding(this));
								}.binding(this));

			} else {

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
				this.popupLayer.animate({
					left : this.trigger.offset().left,
					top : this.trigger.offset().top,
					opacity : 0.1
				}, {
					duration : 5,
					complete : function() {
						this.popupLayer.css("opacity", 1);
						this.popupLayer.hide()
					}.binding(this)
				});
			}
		}
		//注册成功－弹出
		var t11 = new PopupLayer({
			trigger : "#zhcg",
			popupBlk : "#zhucesuccessid",
			closeBtn : ".zccg",
			useOverlay : true,
			useFx : true,
			isResizeFollowTigger : false,
			offsets : {
				x : 0,
				y : -3000
			}
		});
		t11.doEffects = function(way) {

			if (way == "open") {
				this.popupLayer
						.css({
							opacity : 0.3
						})
						.show(
								1,
								function() {
									this.popupLayer
											.animate(
													{
														left : ($(document)
																.width() - this.popupLayer
																.width()) / 2,
														top : (document.documentElement.clientHeight - this.popupLayer
																.height())
																/ 2
																+ $(document)
																		.scrollTop(),
														opacity : 0.8
													}, 1, function() {
														this.popupLayer.css(
																"opacity", 1)
													}.binding(this));
								}.binding(this));

			} else {
				this.popupLayer.animate({
					left : this.trigger.offset().left,
					top : this.trigger.offset().top,
					opacity : 0.1
				}, {
					duration : 5,
					complete : function() {
						this.popupLayer.css("opacity", 1);
						this.popupLayer.hide()
					}.binding(this)
				});
			}
		}

		//找回密码－弹出
		var t12 = new PopupLayer({
			trigger : ".zhmm",
			popupBlk : "#zhmmid",
			closeBtn : ".zhmmclose",
			useOverlay : true,
			useFx : true,
			isResizeFollowTigger : false,
			offsets : {
				x : 0,
				y : -3000
			}
		});
		t12.doEffects = function(way) {

			if (way == "open") {
				this.popupLayer
						.css({
							opacity : 0.3
						})
						.show(
								1,
								function() {
									this.popupLayer
											.animate(
													{
														left : ($(document)
																.width() - this.popupLayer
																.width()) / 2,
														top : (document.documentElement.clientHeight - this.popupLayer
																.height())
																/ 2
																+ $(document)
																		.scrollTop(),
														opacity : 0.8
													}, 1, function() {
														this.popupLayer.css(
																"opacity", 1)
													}.binding(this));
								}.binding(this));

			} else {
				$("#zh_nameerrid").html("");
				$("#zh_emailerrid").html("");
				$("#code2222").html("看不清楚？换一张");
				$("#zh_name").val("");
				$("#zh_email").val("");
				$("#code3").val("");
				this.popupLayer.animate({
					left : this.trigger.offset().left,
					top : this.trigger.offset().top,
					opacity : 0.1
				}, {
					duration : 5,
					complete : function() {
						this.popupLayer.css("opacity", 1);
						this.popupLayer.hide()
					}.binding(this)
				});
			}
		}
		//找回密码成功－弹出
		var t13 = new PopupLayer({
			trigger : ".zhmmcg",
			popupBlk : "#zhmmcgid",
			closeBtn : ".zhmmcgclose",
			useOverlay : true,
			useFx : true,
			isResizeFollowTigger : false,
			offsets : {
				x : 0,
				y : -3000
			}
		});
		t13.doEffects = function(way) {

			if (way == "open") {
				this.popupLayer
						.css({
							opacity : 0.3
						})
						.show(
								1,
								function() {
									this.popupLayer
											.animate(
													{
														left : ($(document)
																.width() - this.popupLayer
																.width()) / 2,
														top : (document.documentElement.clientHeight - this.popupLayer
																.height())
																/ 2
																+ $(document)
																		.scrollTop(),
														opacity : 0.8
													}, 1, function() {
														this.popupLayer.css(
																"opacity", 1)
													}.binding(this));
								}.binding(this));

			} else {
				this.popupLayer.animate({
					left : this.trigger.offset().left,
					top : this.trigger.offset().top,
					opacity : 0.1
				}, {
					duration : 5,
					complete : function() {
						this.popupLayer.css("opacity", 1);
						this.popupLayer.hide()
					}.binding(this)
				});
			}
		}
		//激活账号－弹出
		var t13 = new PopupLayer({
			trigger : ".jh",
			popupBlk : "#jhdivid",
			closeBtn : ".jhdividclose",
			useOverlay : true,
			useFx : true,
			isResizeFollowTigger : false,
			offsets : {
				x : 0,
				y : -3000
			}
		});
		t13.doEffects = function(way) {

			if (way == "open") {
				this.popupLayer
						.css({
							opacity : 0.3
						})
						.show(
								1,
								function() {
									this.popupLayer
											.animate(
													{
														left : ($(document)
																.width() - this.popupLayer
																.width()) / 2,
														top : (document.documentElement.clientHeight - this.popupLayer
																.height())
																/ 2
																+ $(document)
																		.scrollTop(),
														opacity : 0.8
													}, 1, function() {
														this.popupLayer.css(
																"opacity", 1)
													}.binding(this));
								}.binding(this));

			} else {
				this.popupLayer.animate({
					left : this.trigger.offset().left,
					top : this.trigger.offset().top,
					opacity : 0.1
				}, {
					duration : 5,
					complete : function() {
						this.popupLayer.css("opacity", 1);
						this.popupLayer.hide()
					}.binding(this)
				});
			}
		}
		
		//添加收货地址－弹出
		var t14 = new PopupLayer({
			trigger : ".shdz",
			popupBlk : "#addshdz",
			closeBtn : ".addshdzclose",
			useOverlay : true,
			useFx : true,
			isResizeFollowTigger : false,
			offsets : {
				x : 0,
				y : -3000
			}
		});
		t14.doEffects = function(way) {

			if (way == "open") {
				this.popupLayer
						.css({
							opacity : 0.3
						})
						.show(
								1,
								function() {
									this.popupLayer
											.animate(
													{
														left : ($(document)
																.width() - this.popupLayer
																.width()) / 2,
														top : (document.documentElement.clientHeight - this.popupLayer
																.height())
																/ 2
																+ $(document)
																		.scrollTop(),
														opacity : 0.8
													}, 1, function() {
														this.popupLayer.css(
																"opacity", 1)
													}.binding(this));
								}.binding(this));

			} else {
				
				
				
				this.popupLayer.animate({
					left : this.trigger.offset().left,
					top : this.trigger.offset().top,
					opacity : 0.1
				}, {
					duration : 5,
					complete : function() {
						this.popupLayer.css("opacity", 1);
						this.popupLayer.hide()
					}.binding(this)
				});
			}
		}
		function qtexit() {
			$.ajax({
				type : "POST",
				url : "qtuser_qtexit",
				async : false,
				success : function(msgs) {
					/* location.href="${pageContext.request.contextPath}/index.jsp"; */
					location.reload();
					//$.Prompt("退出登录成功");
					/* var str="<div id=\"Logo\"></div>"
					 +"<div class=\"topUser\">"
					 +" <span><a href=\"index.jsp\">首页</a></span> <span>欢迎来到100南宁</span>  "
					 +"	<span class=\"ele9 tcdiv\">"
					 +"	<a href=\"javascript:void(0);\" target=\"_self\" title=\"请登录\" class=\"tcdiv\" >请登录</a>&nbsp;&nbsp;&nbsp; "
					 +"	</span>"
					 +"	<a style=\"color: #858585;\" href=\"javascript:void(0);\" class=\"zhucebutton\" target=\"_blank\" title=\"马上注册\">免费注册</a>"
					 +"</div>";
					$("#top").html(str); */

				}
			});
		}

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

								var str = "<div id=\"Logo\"></div>"
										+ "<div class=\"topUser\">"
										+ " <span><a href=\"index.jsp\">首页</a></span> <span>欢迎来到100南宁</span>  "
										+ "<span class='ele9 tcdiv'>"
										+ "<img src=\"100nn/images/gwc.png\" width=\"17\" height=\"17\" /><span><a id='' href=\"shoppingcar_querygwclist\" target=\"_blank\" title=\"购物车\">购物车<label  class=\"cumu\">0</label>件</a></span>"
										+ "<img src=\"100nn/images/order.png\" width=\"17\" height=\"17\" /><span><a id='' href=\"order_qtorders\" target=\"_blank\" title=\"我的订单\">我的订单</a></span>"
										+ "<img src=\"100nn/images/user_ico.gif\" width=\"13\" height=\"14\" /><span><a id='' href=\"order_qtorders\" target=\"_blank\" title=\"用户中心\">用户中心</a></span>"
										+ "您好！"
										+ msg[1]
										+ "<a id=\"btnexit\" target=\"_blank\" href=\"javascript:void(0);\" >[注销]</a>"
										+ "</span>" + "</div>";
								$("#top").html(str);
								$.ajax({
									type : "POST",
									url : "shoppingcar_querygwccount",
									success : function(msgs) {
										if (msgs != "登录超时,请重新登录") {
											$(".cumu").html(msgs);
										}
									}
								});
								//使用jquery的live()函数，重写响应逻辑：
								$("#btnexit").live("click", qtexit);
								//主动触发事件
								$(".close9").trigger("click");

							} else {
								$("#loginid").removeClass("loginload");
								$(".coreMian_jgk").css("display", "block");
								if(msg[1]=="账号未激活！"){
									
									 var str=msg[1]+"<a  href=\"javascript:jhaa();\" title=\"账号激活\">账号激活 </a>";
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
		//注销
		$("#btnexit").click(function() {
			qtexit();
		});
		$.ajax({
			type : "POST",
			url : "shoppingcar_querygwccount",
			success : function(msgs) {
				if (msgs != "登录超时,请重新登录") {
					$(".cumu").html(msgs);
				}
			}
		});

		autowidth();
		$(window).resize(function() {
			autowidth();
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
	function jhaa(){
		$(".jh").trigger("click");
	}
	//
</script>
</head>

<body>

<script>window._bd_share_config={"common":{"bdSnsKey":{},"bdText":"","bdMini":"2","bdMiniList":false,"bdPic":"","bdStyle":"0","bdSize":"16"},"slide":{"type":"slide","bdImg":"2","bdPos":"right","bdTop":"100"},"image":{"viewList":["qzone","tsina","tqq","renren","weixin"],"viewText":"分享到：","viewSize":"16"},"selectShare":{"bdContainerClass":null,"bdSelectMiniList":["qzone","tsina","tqq","renren","weixin"]}};with(document)0[(getElementsByTagName('head')[0]||body).appendChild(createElement('script')).src='http://bdimg.share.baidu.com/static/api/js/share.js?v=89860593.js?cdnversion='+~(-new Date()/36e5)];</script>
	
	<div id="idsss" class="close9 "></div>
	<span id="zhcg"></span>
	<span class="zhmmcg zhmmclose jhdividclose"></span>
	<div id="top">
		<div id="Logo"></div>
		<!-- 搜索框开始 -->
		 
                  
		<!-- 搜索框结束 -->
		<div style="clear: none;"></div>
		<div class="topUser" >
			<span ><a href="index.jsp">首页</a></span> <span>欢迎来到100南宁</span>
			<span class="ele9 tcdiv"> <%
 	User user = (User) request.getSession().getAttribute("usersession");
 	if (user != null) {
 %> <img src="100nn/images/gwc.png" width="17" height="17" /><span ><a
					id="" href="shoppingcar_querygwclist" target="_blank" title="购物车">购物车<label
						class="cumu"></label>件
				</a></span> <img src="100nn/images/order.png" width="17" height="17"  /><span><a
					id="" href="order_qtorders" target="_blank" title="我的订单">我的订单</a></span> <img
				src="100nn/images/user_ico.gif" width="13" height="14" /><span><a
					id="" href="order_qtorders" target="_blank" title="用户中心">用户中心</a></span>
				您好！${usersession.u_name } <a id="btnexit" target="_blank"
				href="javascript:void(0);">[注销]</a> <%
 	} else {
 %> <a href="#"
				target="_self" title="请登录" id="ele9">请登录</a>&nbsp;&nbsp;&nbsp;

			</span> <a style="color: #858585;" href="javascript:void(0);"
				class="zhucebutton" title="马上注册">免费注册</a>
			<!-- href="100nn_Registration" -->
			<%
				}
			%>
		</div>
	</div>
	<!--[if !IE]> 登录框|DIV开始 <![endif]-->
	<div id="emample9" style="display: none;">
		<div class="clr"></div>
		<div id="blk9" class="blk" style="display: none; opacity: 0.3;">
			<div class="coreTitle">
				<span>登录</span>
				<div href="javascript:void(0)" id="close9"
					class="coreTitle_button close9" style="cursor: pointer;"></div>
			</div>
			<div class="coreMian">
				<form action="" method="post" name="lo">
					<div class="coreMian_jgk" style="display: none;">
						<div class="coreMian_jgkIco"></div>
						<div class="coreMian_jgkText"></div>
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
								href="javascript:void(0)" title="忘记登陆密码" style="font-size: 14px;">忘记登陆密码？</a></span>
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
						<a href="javascript:void(0);" class="close9  zhucebutton"
							title="马上注册"
							style="color: #79ae00; margin-left: 13%; float: left; margin-top: 4%;font-size: 14px;">免费注册</a>

					</div>
				</form>
			</div>

		</div>
	</div>
	<!--[if !IE]> 登录框|DIV结束 <![endif]-->
	<!--[if !IE]> 注册框|DIV开始 <![endif]-->
	<div id="emample10" style="display: none;">
		<div class="clr"></div>
		<div id="zhuceid" class="blk" style="display: none; opacity: 0.3;">
			<div class="coreTitle">
				<span>免费注册</span>
				<div href="javascript:void(0)" id="zhuceclose"
					class="coreTitle_button zhuceclose close9" style="cursor: pointer;"></div>
			</div>
			<div class="coreMian">
				<form action="user_adduser" method="post" id="formid">
					<div class="MianRight_mianTitlesNavzc">
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
							<div class="MianRight_mianTitlesNavBJn_mianZongTT" style="border: 0px;">
								<input type="text" value="" class="code" id="code1" name="code1"
									onblur="oncode();" />
							</div>
							<div class="MianRight_xz1">
								<img id="image2"
									src="${pageContext.request.contextPath}/image.jsp" alt="暂无图片"
									width="62" height="32" onClick="change2();" />
							</div>
							<div class="yxtp1h" onClick="change2();" style="cursor: pointer;" id="code3333">看不清楚？换一张</div>
						</div>
						<div class="MianRight_yhmz">
							<div class="MianRight_xz1z " style="cursor: pointer;"
								onclick="onadd();"  ></div>
							<a href="javascript:void(0);" class="zhuceclose  tcdiv"
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
		<div id="zhucesuccessid" class="blk"
			style="display: none; opacity: 0.3;">
			<div class="coreTitle">
				<span>免费注册－成功</span>
				<div href="javascript:void(0)"
					class="coreTitle_button close9 zccg zhuceclose"
					style="cursor: pointer;"></div>
			</div>
			<div class="coreMian">
				<div class="MianRight_mianTitlesNavzc" style="margin-left: -20px;">
					<div class="MianRight_yx">
						<div class="MianRight_mianTitlesNavBJn_mianLeft">
							<img alt="" style="margin-left: 10px; margin-top: 10px;"
								src="100nn/images/1.jpeg" width="50px" height="50px">
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
	<div id="emample14" style="display: none;">
		<div class="clr"></div>
		<div id="zhmmid" class="blk" style="display: none; opacity: 0.3;">
			<div class="coreTitle">
				<span>找回密码</span>
				<div href="javascript:void(0)" id="zhmmclose"
					class="coreTitle_button zhmmclose" style="cursor: pointer;"></div>
			</div>
			<div class="coreMian">
				<form action="qtuser_forgotpassword" method="post" id="zhformid">
					<div class="MianRight_mianTitlesNavzc" style="height: 270px;">
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
								<div style="clear: both; margin-left: 143px; padding-top: 15px;">
							<a href="javascript:void(0);" style="color: #6CB213;font-size: 14px;"
								class="zhmmclose zhucebutton " title="马上登录"  >还未有邮箱账号？马上注册</a>
						</div>
							<div class="MianRight_yhm">
								<div class="MianRight_mianTitlesNavBJn_mianLeft">验证码：</div>
								<div class="MianRight_mianTitlesNavBJn_mianZongTT">
									<input type="text" value="" tabindex=3 class="code" id="code3"
										name="code2" onblur="zh_oncode();" />
								</div>
								<div class="MianRight_xz1">
									<img id="image3"
										src="${pageContext.request.contextPath}/image.jsp" alt="暂无图片"
										width="62" height="32" onClick="change3();" />
								</div>
								<div class="yxtp1h zh_yxtp1h" onClick="change3();" id="code2222"
									style="cursor: pointer;font-size: 14px;">看不清楚？换一张</div>
							</div>
							<div class="MianRight_yhmz">
								<div class="MianRight_zhmm_1 " id="zhmmbuttonid" style="cursor: pointer;"
									onclick="dozhmm();"></div>
								<a href="javascript:void(0);" class="zhmmclose tcdiv"
									title="马上登录"
									style="color: #79ae00; margin-left: 4%; float: left; margin-top: 4%;font-size: 14px;">马上登录</a>
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
		<div id="zhmmcgid" class="blk" style="display: none; opacity: 0.3;">
			<div class="coreTitle">
				<span>找回密码－成功</span>
				<div href="javascript:void(0)" class="coreTitle_button zhmmcgclose"
					style="cursor: pointer;"></div>
			</div>
			<div class="coreMian">
				<div class="MianRight_mianTitlesNavzc" style="margin-left: -20px;">
					<div class="MianRight_yx">
						<div class="MianRight_mianTitlesNavBJn_mianLeft">
							<img alt="" style="margin-left: 10px; margin-top: 10px;"
								src="100nn/images/1.jpeg" width="50px" height="50px">
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
		<div id="jhdivid" class="blk" style="display: none; opacity: 0.3;">
			<div class="coreTitle">
				<span>账号激活</span>
				<div href="javascript:void(0)" id="jhdividclose"
					class="coreTitle_button jhdividclose" style="cursor: pointer;"></div>
			</div>
			<div class="coreMian">
				<form action="qtuser_jhzh" method="post" id="jhformid">
					<div class="MianRight_mianTitlesNavzc" style="height: 270px;">
						<div class="MianRight_yx">
							<div class="MianRight_mianTitlesNavBJn_mianLeft">用户名：</div>
							<div class="MianRight_mianTitlesNavBJn_mianZongT" style="border: 0px;">
								<input id="jh_name" type="text" tabindex=1 value=""
									name="u_name" onblur="zh_onname();" />
							</div>
							<div id="jh_nameerrid"></div>
						</div>
						<div class="MianRight_yhm" style="margin-top: 10px;">
							<div class="MianRight_mianTitlesNavBJn_mianLeft">邮箱：</div>
							<div class="MianRight_mianTitlesNavBJn_mianZongT" style="border: 0px;">
								<input id="jh_email" tabindex=2 type="text" value=""
									name="u_email" onblur="zh_onemail();" />
							</div>
							<div id="jh_emailerrid"></div>
							<div class="MianRight_yhm">
								<div class="MianRight_mianTitlesNavBJn_mianLeft">验证码：</div>
								<div class="MianRight_mianTitlesNavBJn_mianZongTT">
									<input type="text" value="" tabindex=3 class="code" id="code4"
										name="code4" onblur="jh_oncode();" />
								</div>
								<div class="MianRight_xz1">
									<img id="image4"
										src="${pageContext.request.contextPath}/image.jsp" alt="暂无图片"
										width="62" height="32" onClick="change4();" />
								</div>
								<div class="yxtp1h zh_yxtp1h" onClick="change4();"
									style="cursor: pointer;">看不清楚？换一张</div>
							</div>
							<div class="MianRight_yhmz">
								<div class="MianRight_xz1z_01 " style="cursor: pointer;"
									onclick="dojh();">激活</div>
							</div>
						</div>
					</div>
				</form>
			</div>

		</div>
	</div>
	<!--[if !IE]>激活账号|DIV结束 <![endif]-->
	
	
	
	<!--[if !IE]> 收货地址－弹出|DIV开始 <![endif]-->
	<div id="emample12" style="display: none;">
		<div class="clr"></div>
		<div id="addshdz" class="blk2" style="display: none; opacity: 0.3;">
			<div class="coreTitle" style="width: 605px;">
				<span>收货地址－添加</span>
				<div href="javascript:void(0)" class="coreTitle_button addshdzclose"
					style="cursor: pointer;"></div>
			</div>
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
                            <div class="MianRight_mianTitlesNavBJn_mianSpangh"><input type="hidden" name="ua_status" value="" id="status"/><input id="mr" type="checkbox" name="bike" />设置为默认收货地址</div>
                        </div>
                        <div class="MianRight_mianTitlesNavBJn_mian">
                        	<div class="MianRight_mianTitlesNavBJn_mianSpantitle"></div>
                            <div class="MianRight_mianTitlesNavBJn_mianSpangh">
                                <div class="MianRight_mianTitlesNavBJn_mianSpangh_text"><img src="100nn/Supermarket/images/bc_button.jpg" width="73" height="31" onclick="adduseraddress();" /></div>
                            </div>
                        </div>
                        </form>
                    </div>
                </div>

			</div>
		</div>
	</div>
	<!--[if !IE]>找回密码成功|DIV结束 <![endif]-->

</body>
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

		} else {
			str = "<div class=\"yxtp1h\" onClick=\"change2();\"style=\"cursor:pointer;\">看不清楚？换一张</div>";
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
								+ "<div class=\"yxtp1k\">该邮箱已注册</div>" + "</div>";
						$("#emailerrid").attr("class", "");
						$("#emailerrid").html(str);
							}
						}
					});
		}
		if (code1 == "") {
			var str = " <div class=\"yxtp1\" style='margin-left: 0px;' >"
					+ "<div class=\"yxtp1c\"></div>"
					+ "<div class=\"yxtp1k\">验证码不能为空</div>" + "</div>";
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
							$("#zhcg").trigger("click");
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

		} else {
			str = "<div class=\"yxtp1h\"  onClick=\"change2();\"style=\"cursor:pointer;\">看不清楚？换一张</div>";
		}

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
			$(".zh_yxtp1h").html(str);
		}
		if (emai == "") {
			f = false;
			str = " <div class=\"yxtp1\">" + "<div class=\"yxtp1c\"></div>"
					+ "<div class=\"yxtp1k\">邮箱不能为空</div>" + "</div>";
			$("#zh_emailerrid").attr("class", "");
			$("#zh_emailerrid").html(str);
		}
		/* if (zhname == "") {
			f = false;
			str = " <div class=\"yxtp1\">" + "<div class=\"yxtp1c\"></div>"
					+ "<div class=\"yxtp1k\">用户名不能为空</div>" + "</div>";
			$("#zh_nameerrid").attr("class", "");
			$("#zh_nameerrid").html(str);

		} */
		if (f == true) {
			$(".MianRight_zhmm_1").addClass("MianRight_zhmm_2");
			$("#zhmmbuttonid").attr("onclick","");
			$.ajax({
				cache : true,
				type : "POST",
				url : "qtuser_forgotpassword",
				data : $('#zhformid').serialize(),// 你的formid
				async : false,
				success : function(data) {
					var datas = data.split(",");
					if (datas[0] == 1) {
						$("#y_email_zhmm").html(datas[1]);
						$(".zhmmcg").trigger("click");
					} else {
						$(".MianRight_zhmm_1").removeClass("MianRight_zhmm_2");
						$("#y_email_zhmm").html(datas[1]);
						$(".zhmmcg").trigger("click");
						$("#zhmmbuttonid").attr("onclick","dozhmm()");

					}
				}
			});

		}
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
		if($("#mr").attr("checked")){
			$("#status").val(1);
		}else{
			$("#status").val(0);
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
              alert("添加失败");
          },
          success: function(data) {
          	location.reload(); 
          }
          
      });
			}else{
				alert("收货人电话或手机必须填写一个");
			}
		}else{
			alert("请填写收货人地址和收货人姓名");
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

		} else {
			str = "<div class=\"yxtp1h\"  onClick=\"change4();\"style=\"cursor:pointer;\">看不清楚？换一张</div>";
		}

		$(".zh_yxtp1h").html(str);
	}
	//确认激活
	function dojh(){
		var code4 = $("#code4").val();
		var emai = $("#jh_email").val();
		var zhname = $("#jh_name").val();
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
		if (zhname == "") {
			f = false;
			str = " <div class=\"yxtp1\">" + "<div class=\"yxtp1c\"></div>"
					+ "<div class=\"yxtp1k\">用户名不能为空</div>" + "</div>";
			$("#jh_nameerrid").attr("class", "");
			$("#jh_nameerrid").html(str);

		}
		if (f == true) {
			$(".MianRight_zhmm_1").addClass("MianRight_zhmm_2");
			$.ajax({
				cache : true,
				type : "POST",
				url : "qtuser_jhzh",
				data : $('#jhformid').serialize(),// 你的formid
				async : false,
				success : function(data) {
					var datas = data.split(",");
					if (datas[0] == 1) {
						$("#y_email_zhmm").html(datas[1]);
						$(".zhmmcg").trigger("click");
					} else {
						

					}
				}
			});

		}
	}
</script>

</html>