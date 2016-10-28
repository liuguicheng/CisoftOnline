<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="Keywords" content="南宁同城快递超市、网上超市、快递超市、水果网上超市、日用品网上超市、南宁居民便民社区">
<meta name="description" content="南宁同城快递超市、网上超市、快递超市、水果网上超市、日用品网上超市、南宁居民便民社区">
<title>100南宁－快递超市</title>
<link href="${pageContext.request.contextPath }/100nn/css/base.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath }/100nn/css/nav_style.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath }/100nn/css/foot_style.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath }/100nn/css/index.css" rel="stylesheet" type="text/css" />
</head>
<body>

	<!--[if !IE]> 头部|开始 <![endif]-->
	<%@ include file="/WEB-INF/100nn/top1.jsp"%>
	<!--[if !IE]> 头部|结束 <![endif]-->
	<!--[if !IE]> 内容|开始 <![endif]-->
	<div id="Mian">
		<!--[if !IE]> 内容|导航开始 <![endif]-->
		<div id="MianLeft">
			<%@ include file="/WEB-INF/100nn/menu.jsp"%>
		</div>
		<!--[if !IE]> 内容|导航结束 <![endif]-->
		<!--[if !IE]> 内容|导航结束 <![endif]-->
		<!--[if !IE]> 内容|主内容开始 <![endif]-->
		<div id="MianRights">
    		<div id="MianRightMs">
     		 <div id="MianRightM_nav">
      		<%--  <div class="MianRightM_navButton"><img src="${pageContext.request.contextPath }/100nn/images/1.1.gif" width="194" height="189" /></div> --%>
       		 <div class="MianRightM_navButton"><a href="qtcommodity_querycommdityList?commodityStatus.cs_id=4" title="快递超市" target="_blank"><img src="${pageContext.request.contextPath }/100nn/images/2.gif" width="194" height="189" /></a></div>
       		 <div class="MianRightM_navButton"><img src="${pageContext.request.contextPath }/100nn/images/3.gif" width="194" height="189" /></div>
       		 <div class="MianRightM_navButton"><img src="${pageContext.request.contextPath }/100nn/images/4.2.gif" width="194" height="189" /></div>
      	</div>
      <div id="MianRightM_img"></div>
    </div>
  </div>
		<div class="clear"></div>
		<!--[if !IE]> 内容|主内容开始 <![endif]-->
	</div>
	<!--[if !IE]> 内容|结束 <![endif]-->
	<!--[if !IE]> 版权|开始 <![endif]-->
	<div id="Foot">
	Copyright ©2013-2014 CISOFT Corporation, All Rights Reserved.&nbsp;&nbsp;桂ICP备12002922号-1&nbsp;&nbsp;增值电信业务经营许可证：桂B2-20140021&nbsp;&nbsp;版权所有：<a href="http://www.cisoft.cn/"  target="_blank">广西南宁市熙软循环信息科技有限公司</a>
	</div>
	<!--[if !IE]> 版权|结束 <![endif]-->
</body>
<script>
function autowidth(){
	
	var wh=$(window).height();
	wh=wh-126;
	$("#Mian").css("height",wh);

	var vn=$("#Mian").width();
	vn=vn-101;
	$("#MianRights").css("width",vn);

	var wj=$("#Mian").height();
	$("#MianLeft").css("height",wj);
	var wl=$("#Mian").height();
	wl=wl-1;
	$("#MianRights").css("height",wl);

	var tc=$("#Mian").height();
	tc=tc-5;
	$("#MianRight_mian").css("height",tc);

	var tk=$("#Mian").height();
	$("#MianLeft").css("height",tk);

	var tmm=$(".MianRight_mianT").width();
	tmm=tmm-263;
	$(".MianRight_mianTitlesNav_font").css("width",tmm);

	var tdm=$(".MianRight_mianT").width();
	tdm=tdm-263;
	$(".MianRight_mianYcontentNR").css("width",tdm);

	var tdk=$(".MianRight_mianYcontentNR_div").width();
	tdk=tdk-225;
	$(".MianRight_mianYcontentNR_divMian").css("width",tdk);

	var tdu=$(".MianRight_mianTitlesNav").width();
	tdu=tdu-314;
	$(".MianRight_mianTitlesNavRight").css("width",tdu);

	var tr=$("#MianLeft").height();
	tr=tr-6;
	$("#MianLeft_Mian").css("height",tr);
		}


	$().ready(function(){
	autowidth();
	     $(window).resize(function() {
	                autowidth();
	            });
		});
	$(document)
			.ready(
					function() {
                         var ztid=$("#ztid").val();
                         if(ztid!=""){
                        	 $(".MianRight_mianNav_M_qb:first").css("background",
								"#74a702");
						     $(".MianRight_mianNav_M_qb:first").css("color", "#FFF");
						     $(".MianRight_mianNav_M_qb:first").css("font-weight",
								"100");
                        	 
                        	 $("#select"+ztid).css("background",
								"#517500");
                        	 $("#select"+ztid).css("color", "#FFF");
                        	 $("#select"+ztid).css("font-weight",
     								"bold");
                        	 
                        	 
                         }else{
						$(".MianRight_mianNav_M_qb:first").css("background",
								"#517500");
						$(".MianRight_mianNav_M_qb:first").css("color", "#FFF");
						$(".MianRight_mianNav_M_qb:first").css("font-weight",
								"bold");
                         }
						$(".MianRight_mianNav_M_qb").click(
								function() {
									$(".MianRight_mianNav_M_qb").css(
											"background", "#74a702");
									$(".MianRight_mianNav_M_qb").css("color",
											"#FFF");
									$(".MianRight_mianNav_M_qb").css(
											"font-weight", "100");
									$(this).css("background", "#517500");
									$(this).css("color", "#FFF");
									$(this).css("font-weight", "bold");
								});
						
						
					});
	function selectd(id,ids){
		var csid=id;
		var cosid=ids;
		var url="";
		if(csid==0&&cosid!=0){
			url="commodityStatus.cs_id="+cosid;
		}else{
			url="commoditySort.cs_id="+csid;
		}
		$
		.ajax({
			type : "POST",
			url : "qtcommodity_querycommdityListajax",
			data : url,
			success : function(msgs) {
				var htmlstr = "";
				for ( var o in msgs) {
					htmlstr += "<div class=\"MianRight_mianN_cp\">"
							+ "<div class=\"MianRight_mianN_cpImg\">"
							+ "<a href=\"qtcommodity_querycommodityinfo?c_id="
							+ msgs[o].c_id
							+ "\" title=\""
							+ msgs[o].c_name
							+ "\" target=\"_blank\">"
							+ "<img src=\"imgss.jsp?file="
							+ msgs[o].c_sltimg
							+ "\" width=\"199\" height=\"242\" />"
							+ "<div class=\"MianRight_mianN_cpImg2\">";
							if (msgs[o].commodityStatus.cs_id == 2) {
								htmlstr += "<img src=\"100nn/Supermarket/images/tp2_03.png\">";
							} else if (msgs[o].commodityStatus.cs_id == 3) {
								htmlstr += "<img src=\"100nn/Supermarket/images/tp2_05.png\">";
							} else if (msgs[o].commodityStatus.cs_id == 4) {
								htmlstr += "<img src=\"100nn/Supermarket/images/yh_05.png\">";
							} else if (msgs[o].commodityStatus.cs_id == 5) {
								htmlstr += "<img src=\"100nn/Supermarket/images/yh_03.png\">";
							}
					htmlstr+= "</div>";
					if ( msgs[o].c_splbms != "") {
						htmlstr += "<div class=\"MianRight_mianN_cpImg3\">"
								+ msgs[o].c_splbms+"</div>";
					}
					htmlstr += " </a>"
							+ "</div>"
							+ " <div class=\"MianRight_mianN_cpTitle\">"
							+ msgs[o].c_name
							+ "(限广西)</div>"
							+ " <div class=\"MianRight_mianN_cpfTitle\"><span>￥"
							+ msgs[o].c_jg
							+ " </span>"
							+ msgs[o].c_jldw
							+ "</div>"
							+ "<div class=\"MianRight_mianN_cpkTitle\">"
							+ "	<span class=\"MianRight_mianN_cpkTitle_spanL\">全场包邮"
							+ "\</span>"
							+ "  <span class=\"MianRight_mianN_cpkTitle_spanR\">关注度："
							+ msgs[o].c_djs
							+ " </span>"
							+ " </div>"
							+ "</div>";
				}
				$(
						".MianRight_mianN")
						.html(
								htmlstr);
			}
		})
		
	}
 
</script>
</body>
</html>