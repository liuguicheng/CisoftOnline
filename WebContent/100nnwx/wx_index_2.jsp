<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- <meta name="viewport" content="width=device-width, initial-scale=1"> -->
<meta charset="utf-8">
<meta
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0;"
	name="viewport" />
<title>快递超市</title>
<link href="${pageContext.request.contextPath }/100nnwx/css/SecurityCenter.css" rel="stylesheet"
	type="text/css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/100nnwx/css/default.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/100nnwx/css/component.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/100nnwx/css/normalize.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/100nnwx/css/swipe.css" />
</head>

<body style="margin: 0;">
	<div style="background: #f0f0f0;padding-bottom:50px;">
		<div class="Top"
			style="background: #8bc563; color: #FFF; text-shadow: 0 0 0 #eee;">
			<div class="Top_logo">
				<a href="wxcommodity_querycommdityList" target="_self"><img
					src="${pageContext.request.contextPath }/100nnwx/img/logo.gif" width="140" height="40"></a>
			</div>
			<div class="Top_user_search">
				<div class="Top_user_search_text">
					<input type="text" value="" id="serachname">
				</div>
				<div class="Top_user_search_button">
					<input type="button" id="serachbutton">
				</div>
			</div>
		</div>
		<table class="Mian_wmcs" cellpadding="0" cellspacing="0">
			<input type="hidden" id="bsid" value='<s:property value="scid"/>' />
			<tr>
				<td class="Mian_wmcs_td" style="border-right: #74a702 solid 1px;"
					id="cs2"><a
					href="wxcommodity_querycommdityList?commodity.commoditySort.cs_id=2"
					target="_self">粮油副食</a></td>
				<td class="Mian_wmcs_td" style="border-right: #74a702 solid 1px;"
					id="cs5"><a
					href="wxcommodity_querycommdityList?commodity.commoditySort.cs_id=5"
					target="_self">居家日用</a></td>
				<td class="Mian_wmcs_td" style="border-right: #74a702 solid 1px;"
					id="cs4"><a
					href="wxcommodity_querycommdityList?commodity.commoditySort.cs_id=4"
					target="_self">生鲜果蔬</a></td>
				<td class="Mian_wmcs_td" id="cs6"><a
					href="wxcommodity_querycommdityList?commodity.commoditySort.cs_id=6"
					target="_self">进口酒饮</a></td>
			</tr>
		</table>
		<div class="banner">
			<!-- <img src="100nnwx/img/banner.jpg" width="100%" height="170"> -->
			<div class="addWrap">
			<div class="swipe" id="mySwipe">
				<div class="swipe-wrap">
					<div>
						<a href="javascript:;"><img src="${pageContext.request.contextPath }/100nnwx/img/banner.jpg" height="130" width="100%" /></a>
					</div>
					<div>
						<a href="javascript:;"><img src="${pageContext.request.contextPath }/100nnwx/images/a_02.jpg" height="130" width="100%" /></a>
					</div>
					<div>
						<a href="javascript:;"><img src="${pageContext.request.contextPath }/100nnwx/images/a_03.jpg" height="130" width="100%" /></a>
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

	<s:if test="commoditylist.size()>0">
		<ul class="grid effect-7" id="grid" style="padding-bottom: 10px;margin-top: -3px;">
			<s:iterator value="commoditylist" status="stuts">
				<li style="width: 50%;"><a
					href="wxcommodity_querycommodityinfo?commodity.c_id=<s:property value="c_id"/>&bsid=1"
					title="" target="_self"> <img width="100%" height="100%"
						src="${pageContext.request.contextPath }/imgss.jsp?file=<s:property value="c_sltimg"/>" />
						<div
							style="height: 100%; background-color: #fff; border-top: 1.5px #ddd solid;">
							<label><div
									style="text-overflow: ellipsis; overflow: hidden; white-space: nowrap; width: 140px; margin-top: 3px; margin-left: 5px;">
									<s:property value="c_name" />
								</div> </label> <label style="color: red; margin-top: 3px; margin-left: 5px;">¥<s:property
									value="c_jg" />
							</label>
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
	<div class="foot_nav" style="margin-top: 10px;">
		<a class="foot_navT" href="wxcommodity_querycommdityList"
			target="_self"></a> <a class="foot_navT1"
			href="http://mp.weixin.qq.com/s?

__biz=MzA5NjY0ODcwOA==&mid=200215673&idx=1&sn=f97d1e93e3b7b29aed1f148e966dba2a#rd"
			target="_self"></a> <a class="foot_navT2"
			href="${pageContext.request.contextPath }/100nnwx/wxshoppingcar_getList"
			target="_self"></a> <a class="foot_navT3"
			href="wxuseraddress_touserinfo" target="_self"></a>
	</div>
</body>
<script type="text/javascript" src="${pageContext.request.contextPath }/100nnwx/js/jquery-1.8.3.js"></script>
<script type="text/javascript"  src="${pageContext.request.contextPath }/100nnwx/js/modernizr.custom.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/100nnwx/js/masonry.pkgd.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/100nnwx/js/imagesloaded.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/100nnwx/js/classie.js"></script>
<script type="text/javascript"  src="${pageContext.request.contextPath }/100nnwx/js/AnimOnScroll.js"></script>
<script type="text/javascript"  src="${pageContext.request.contextPath }/100nnwx/js/swipe.min.js"></script>
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

						$("#serachbutton")
								.click(
										function() {
											var name=$("#serachname").val();
											window.location.href = "wxcommodity_querycommdityList?commodity.c_name="
													+ name;
										});

					});

	//轮播
	var bullets = document.getElementById('position').getElementsByTagName('li');
	var banner = Swipe(document.getElementById('mySwipe'), {
		auto: 2000,
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
	
</script>


</html>