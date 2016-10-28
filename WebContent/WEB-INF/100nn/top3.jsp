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

<title>100南宁</title>
</head>

<body>

<script>window._bd_share_config={"common":{"bdSnsKey":{},"bdText":"","bdMini":"2","bdMiniList":false,"bdPic":"","bdStyle":"0","bdSize":"16"},"slide":{"type":"slide","bdImg":"2","bdPos":"right","bdTop":"100"},"image":{"viewList":["qzone","tsina","tqq","renren","weixin"],"viewText":"分享到：","viewSize":"16"},"selectShare":{"bdContainerClass":null,"bdSelectMiniList":["qzone","tsina","tqq","renren","weixin"]}};with(document)0[(getElementsByTagName('head')[0]||body).appendChild(createElement('script')).src='http://bdimg.share.baidu.com/static/api/js/share.js?v=89860593.js?cdnversion='+~(-new Date()/36e5)];</script>
	
	<div id="top">
		<div id="Logo_1"></div>
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
				target="_self" title="请登录" id="loginid">请登录</a>&nbsp;&nbsp;&nbsp;

			</span> <a style="color: #858585;" href="javascript:void(0);"
				class="zhucebutton" title="马上注册">免费注册</a>
			<!-- href="100nn_Registration" -->
			<%
				}
			%>
		</div>
	</div>
	<div class="divid" style="display: none; ">
		<div id="emample9" >
		<div class="clr"></div>
		<div id="blk9" class="blk" >
			<!-- <div class="coreTitle">
				<span>登录</span>
			</div> -->
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
	</div>

</body>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/jq1.9.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/layer.min.js"></script>
<script type="text/javascript">


$(document).ready(function() {
	
		   $("#loginid").click(function(){
			   $(".divid").attr("display","block");
			  var loginlayer= $.layer({
				    type: 1,
				    title: "登录",
				    area: ['408px', '376px'],
				    shade: [0.5, '#000'],
				    shift: 'left', //从左动画弹出
				    page: {
				        dom: '.divid'
				    },
				    moveEnd: function(){
				    	//托拽
				    	//关闭
				    	layer.close(loginlayer);
				    }
				});
			  
		   });
		});
</script>

</html>