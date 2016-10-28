<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ page import="com.cisoft.model.User"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="content-type" content="text/html;charset=gbk" />
		<meta name="author" content="www.frebsite.nl" />
		<meta name="viewport" content="width=device-width initial-scale=1.0 maximum-scale=1.0 user-scalable=yes" />

		<title>100NN同城快递超市</title>
		<link href="img/favicon.ico" rel="shortcut icon" type="image/x-icon">

		<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath }/100nnwx/css/css/flexslider.css" />
		<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath }/100nnwx/css/css/jquery.mmenu.all.css" />
		<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath }/100nnwx/css/css/style.css" />
        <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath }/100nnwx/css/css/index_style.css">
        <link href="${pageContext.request.contextPath }/100nnwx/css/SecurityCenter.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/100nnwx/css/default.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/100nnwx/css/component.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/100nnwx/css/normalize.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/100nnwx/css/swipe.css" />
		  <script type="text/javascript" src="${pageContext.request.contextPath }/100nnwx/js/js/iscroll-4.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath }/100nnwx/js/js/jquery.min.js"></script>
		 <script type="text/javascript" src="${pageContext.request.contextPath }/100nnwx/js/js/yd_3.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath }/100nnwx/js/js/jquery.mmenu.min.all.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath }/100nnwx/js/js/jquery.flexslider.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath }/100nnwx/js/js/o-script.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath }/100nnwx/js/js/index_t.js"></script>
        
        <style type="text/css">
        ::-webkit-input-placeholder { /* WebKit browsers */
    color:    #FFFFFF;
}
:-moz-placeholder { /* Mozilla Firefox 4 to 18 */
    color:    #FFFFFF;
}
::-moz-placeholder { /* Mozilla Firefox 19+ */
    color:    #FFFFFF;
}
:-ms-input-placeholder { /* Internet Explorer 10+ */
    color:    #FFFFFF;
}
        </style>
        <style>
	
	#wrapper>*>*{
		float:left;
		background-size:100% 100%;
	}
	#wrapper>*>*:nth-child(1){
		background-image:url(100nnwx/images/guodu1.jpg);
	}
	#wrapper>*>*:nth-child(2){
		background-image:url(100nnwx/images/guodu2.jpg);
	}
	#wrapper>*>*:nth-child(3){
		background-image:url(100nnwx/images/guodu3.jpg);
	}
	li{
		display: block;
	}
	</style>
	</head>
	<body class="o-page">
	 <%
 	User user = (User) request.getSession().getAttribute("usersession");
	 int bsid=0;
 	if (user != null) {
 		bsid=user.getUwx_gzbs();
 	}
    %>
   <input type="hidden" id="bsidsss" value="<%=bsid%>">
   <div id="wrapper" style="display:none;">
	<ul>
		<li></li>
		<li></li>
		<li></li>

	</ul>
</div>
       <div id="wk">
          <div class="wk_1 t1"><img src="${pageContext.request.contextPath }/100nnwx/images/img/wk1.jpg"></div>
          <div class="wk_2 t2"><img src="${pageContext.request.contextPath }/100nnwx/images/img/wk2.jpg"></div>
          <div class="wk_3 t3"><img src="${pageContext.request.contextPath }/100nnwx/images/img/wk3.jpg"></div>
        </div>
        <div class="zz"></div>
        <div class="zz_img"></div>
       <!--  <div class="zz_tg"></div> -->
        <div class="footer">
          <div class="footer_t"></div>
          <div class="footer_t"><img id="footer_t_font" src="${pageContext.request.contextPath }/100nnwx/images/img/index_nav/gz_img.jpg" width="42" height="42"><div class="footer_t_img"></div></div>
          <div class="footer_t"></div>
          <div class="footer_t"></div>
        </div>
		<div id="page">
			<!-- Header -->
			<div id="header">
			<!-- 	<a href="#menu"></a> -->
				<a href="#menu"><img src="${pageContext.request.contextPath }/100nnwx/images/img/fl_ico.jpg" width="40" height="40"></a>
                <div id="Search"><a href="javascript:onsel();"><img src="${pageContext.request.contextPath }/100nnwx/images/img/index/sousuo_ico.jpg"></a><input type="text" value="" id="serachname" placeholder="请输入产品名称"></div>
				<!--<span id="Logo" class="svg">
					<img src="img/logo.svg" />
				</span>-->
				<!--<a class="backBtn" href="javascript:history.back();"></a>-->
			</div>
			<!--<div class="subHeader"><i class="i-home i-small"></i>Welcome friend!</div>-->
			
			<!-- Banner -->
			<%-- <div class="bannerPane">
			  <section class="slider">
				<div class="flexslider">
				  <ul class="slides">
					<li>
						<img src="${pageContext.request.contextPath }/100nnwx/images/img/blog/1.jpg" />
						</li>
						<li>
						<img src="${pageContext.request.contextPath }/100nnwx/images/img/blog/2.jpg" />
						</li>
						<li>
						<img src="${pageContext.request.contextPath }/100nnwx/images/img/blog/3.jpg" />
						</li>
				  </ul>
				</div>
			  </section>
			</div> --%>
					<div class="banner" style="height: 104px;">
			<!-- <img src="100nnwx/img/banner.jpg" width="100%" height="170"> -->
			<div class="addWrap">
			<div class="swipe" id="mySwipe">
				<div class="swipe-wrap">
					<div>
						<a href="javascript:;"><img src="${pageContext.request.contextPath }/100nnwx/img/Banner1.jpg" height="100" width="100%" /></a>
					</div>
					<div>
						<a href="javascript:;"><img src="${pageContext.request.contextPath }/100nnwx/images/a_02.jpg" height="100" width="100%" /></a>
					</div>
					<div>
						<a href="javascript:;"><img src="${pageContext.request.contextPath }/100nnwx/images/a_03.jpg" height="100" width="100%" /></a>
					</div>
				</div>
			</div>
			<ul id="position" >
				<li class="cur"></li>
				<li class=""></li>
				<li class=""></li>
			</ul>
		</div>
		
	</div>
			<!-- End Banner -->
			
			<!-- Content -->
			<div id="content" style="padding: 0px;margin-top: 3px;">
			<input type="hidden" id="bsid" value='<s:property value="scid"/>' />
			<s:if test="commoditylist.size()>0">
		<ul class="grid effect-1" id="grid" style="padding-bottom: 10px;margin-top: -3px;">
			<s:iterator value="commoditylist" status="stuts">
				<li style="width: 50%;"><a style="text-decoration: none;"
					href="wxcommodity_querycommodityinfo?commodity.c_id=<s:property value="c_id"/>&bsid=1"
					title="" target="_self"> <img width="100%" height="100%"
						src="${pageContext.request.contextPath }/imgss.jsp?file=<s:property value="c_sltimg"/>" />
						<div style="height: 100%; background-color: #fff; border-top: 1.5px #ddd solid;">
							<label ><div
									style="text-overflow: ellipsis; overflow: hidden; white-space: nowrap; width: 140px; margin-top: 3px; margin-left: 5px;">
									<s:property value="c_name" />
								</div> 
							</label> 
							<label style="color: red; margin-top: 3px; margin-left: 5px;text-decoration: none;">¥<s:property
									value="c_jg" />
							</label>
							<a href="javascript:onbtn(1,<s:property
									value="c_id" />);" title="加入购物车" target="_self" style="float: right;margin-top: -20px;"><img src="${pageContext.request.contextPath }/100nnwx/img/AddtoCart.gif" width="70" height="19"></a>
						</div>
				</a></li>
			</s:iterator>

		</ul>
	</s:if>
	<s:else>
				<div class="Ts">
                  <div class="Ts_ico"><img src="${pageContext.request.contextPath }/100nnwx/images/ico.gif" width="90" height="80"></div>
                  <div class="Ts_font">抱歉！暂相关商品</div>
                </div>
	</s:else>
			</div>
			
			
			
			
			<!-- Menu navigation -->
			<nav id="menu">
				<ul style="padding-top:0;">
                    <li id="div_Logo"></li>
					<li id="Nav_Index" class="Selected"><a class="ca" href="wxcommodity_querycommdityList" title="" target="_self"><img src="${pageContext.request.contextPath }/100nnwx/images/img/index_nav/nav_ico.png" width="31" height="50"><span style="display:inline; background:none; color:#FFFFFF;">首页</span></a></li>
					<li id="Nav_ly" class="Selected"><a class="ca" href="wxcommodity_querycommdityList?commodity.commoditySort.cs_id=2" title="" target="_self"><img src="${pageContext.request.contextPath }/100nnwx/images/img/index_nav/ly_ico.png" width="31" height="50"><span style="display:inline; background:none; color:#FFFFFF;">粮油副食</span></a></li>
                    <li id="Nav_ly" class="Selected"><a class="ca" href="wxcommodity_querycommdityList?commodity.commoditySort.cs_id=6" title="" target="_self"><img src="${pageContext.request.contextPath }/100nnwx/images/img/index_nav/js_ico.png" width="31" height="50"><span style="display:inline; background:none; color:#FFFFFF;">进口酒水</span></a></li>
                    <li id="Nav_ly" class="Selected"><a class="ca" href="wxcommodity_querycommdityList?commodity.commoditySort.cs_id=4" title="" target="_self"><img src="${pageContext.request.contextPath }/100nnwx/images/img/index_nav/gp_ico.png" width="31" height="50"><span style="display:inline; background:none; color:#FFFFFF;">100果铺</span></a></li>
                    <li id="Nav_ly" class="Selected"><a class="ca" href="wxcommodity_querycommdityList?commodity.commoditySort.cs_id=5" title="" target="_self"><img src="${pageContext.request.contextPath }/100nnwx/images/img/index_nav/ry_ico.png" width="31" height="50"><span style="display:inline; background:none; color:#FFFFFF;">家居日用</span></a></li>
				</ul>
			</nav>
            <footer id="footer">
              <div class="footer_index"><a href="wxcommodity_querycommdityList" target="_self"></a></div>
              <div class="footer_MicroLetter"><a href="http://mp.weixin.qq.com/s?__biz=MzA3NTM1MDMzMA==&mid=200727107&idx=1&sn=c8fad1b48c1e868bcfbbba50c0eb67c4#rd" target="_self"></a></div>
              <div class="footer_ShoppingCart"><a href="${pageContext.request.contextPath }/100nnwx/wxshoppingcar_getList" target="_self"></a></div>
              <div class="footer_My100"><a href="wxuseraddress_touserinfo" target="_self"></a></div>
            </footer>
		</div>
	</body>
	
	  <script type="text/javascript"  src="${pageContext.request.contextPath }/100nnwx/js/modernizr.custom.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/100nnwx/js/masonry.pkgd.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/100nnwx/js/imagesloaded.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/100nnwx/js/classie.js"></script>
<script type="text/javascript"  src="${pageContext.request.contextPath }/100nnwx/js/AnimOnScroll.js"></script>
<script type="text/javascript"  src="${pageContext.request.contextPath }/100nnwx/js/swipe.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/layer.min.js"> </script>
	<script type="text/javascript">
	$(document)
			.ready(
					function() {

						var bs = $("#bsid").val();
						if (bs != null) {
							if ($(".Mian_wmcs_td").attr("background") == "#8ac463") {
								$(".Mian_wmcs_td").css("background", "#FFFFFF");
								$(".Mian_wmcs_td").css("color", "#8ac463");
								$(".Mian_wmcs_td").css("font-weight", "100");
							}
							$("#cs" + bs).css("background", "#8ac463");
							$("#cs" + bs).find("a").css("color", "#FFF");
							$("#cs" + bs).css("font-weight", "bold");
						}

						

					});

	//轮播
	var bullets = document.getElementById('position').getElementsByTagName('li');
	var banner = Swipe(document.getElementById('mySwipe'), {
		auto: 6000,
		continuous: true,
		disableScroll:false,
		callback: function(pos) {
			var i = bullets.length;
			while (i--) {
			  bullets[i].className = ' ';
			}
			bullets[pos].className = 'cur';
		}
	});
	
	new AnimOnScroll(document.getElementById('grid'), {
		minDuration : 0.4,
		maxDuration : 0.7,
		viewportFactor : 0.2
	});
	function onsel(){
		var name=$("#serachname").val();
		window.location.href = "wxcommodity_querycommdityList?commodity.c_name="
				+ name;
	}
	
	function onbtn(id,c_id){
		var c_id = c_id;
		var type = id;//1标示加入购物车 
		$
				.ajax({
					type : "POST",
					url : "wxshoppingcar_save",
					data : "c_id=" + c_id 
							+ "&type="
							+ type,
					 success : function(data) {
						
						if (data == "添加购物车成功") {
							layer.msg('添加成功',2,-1);
						} else{
							layer.alert('操作失败', 8);
						}
					}
				})
	}
	function onewh(id,callback){
		
		function xy(){
			var w,h,scrollload;
			w=$(window).width();
			h=$(window).height();
			$("#"+id).css({width:w+"px",height:h+"px"})
			$("#"+id+">*>*").css({width:w+"px",height:h+"px"})
			$("#"+id+">*").css({width:w*$("#"+id+">*>*").length+"px",height:h+"px"})
		}
		$(window).resize(function(){
			xy();
			myiscroll._resize();
		})
		xy()
		var myiscroll=new iScroll(id,{
			scrollX: false,
			scrollY: true,
			fixedScrollbar: true,
			hScrollbar: false,
			vScrollbar: false,
			bounce: false,
			momentum: false,
			snap:"li",
			onScrollMove: function(){if(scrollload=this.x==this.pagesX[this.pagesX.length-1]);},
			onScrollEnd: function(){if(scrollload)callback();}
		});
		/*
			作者娃娃脾气
			AppCan交流⑧群 175614127
			并不是很完美，应该还可以声调很多代码的。但是css技术不过关。。。没办法。
		*/

	}
</script>
</html>