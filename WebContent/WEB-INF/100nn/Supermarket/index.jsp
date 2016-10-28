<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>100南宁·城市居民生活社区</title>
<link href="${pageContext.request.contextPath }/100nn/css/base.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath }/100nn/Supermarket/css/index.css" type="text/css"
	rel="stylesheet" />
<link href="${pageContext.request.contextPath }/100nn/css/nav_style.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath }/100nn/css/foot_style.css" rel="stylesheet" type="text/css" />
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
		<!--[if !IE]> 内容|导航结束 <![endif]-->
		<!--[if !IE]> 内容|主内容开始 <![endif]-->
		<div id="MianRight">
			<div id="MianRight_mian">
				<div class="MianRight_mianT">
				<!--  <div class="MianRight_ss">
                    <img src="${pageContext.request.contextPath }/100nn/images/ss1_03.jpg" width="127" height="86">
                    <div class="MianRight_ss2">
                       <div class="MianRight_ss3">
                          <input style="float:left;width:368px;height:28px;lint-height:28px;border:0px;" title="text">
                          <a href="#" class="MianRight_ss4">搜索</a>
                       </div>
                       <div class="MianRight_ss5">
                           <ul>
                             <li><a href="#">金龙鱼</a></li>
                             <li class="MianRight_ss5_left">|</li>
                             <li><a href="#">莲雾</a></li>
                             <li class="MianRight_ss5_left">|</li>
                             <li><a href="#">蓝月亮</a></li>
                             <li class="MianRight_ss5_left">|</li>
                             <li><a href="#">榴莲</a></li>
                             <li class="MianRight_ss5_left">|</li>
                             <li><a href="#">沐浴露</a></li>
                             <li class="MianRight_ss5_left">|</li>
                             <li><a href="#">释迦</a></li>
                           </ul>
                       </div>
                    </div>
                </div>-->
					<div class="MianRight_mianTitle" style="height: 100%;">
						<img src="${pageContext.request.contextPath }/100nn/images/img.jpg" width="1076" height="86" />
					</div>
					<div class="MianRight_mianNav">
						<div class="MianRight_mianNav_logo"></div>
						<div class="MianRight_mianNav_M">
						<input type="hidden" id="ztid" value='<s:property value="sortid"/>'/>
							<div class="MianRight_mianNav_M_qb"
								style="background: #517500; color: #FFF; border-right: #FFF solid 1px; font-weight: bold;"
								id="select0" title="推荐商品" onclick="selectd(0,4);">推荐商品</div>
							<div id="select2" class="MianRight_mianNav_M_qb"
								style="background: #74a702; color: #FFF; border-right: #FFF solid 1px;"onclick="selectd(2,0);"
								title="粮油副食">粮油副食</div>
							<div class="MianRight_mianNav_M_qb" id="select5"
								style="background: #74a702; color: #FFF; border-right: #FFF solid 1px;"
								onclick="selectd(5,0);" title="居家日用">居家日用</div>
							<div id="select4" class="MianRight_mianNav_M_qb"
								style="background: #74a702; color: #FFF; border-right: #FFF solid 1px;"
								onclick="selectd(4,0);" title="生鲜果蔬">生鲜果蔬</div>
							<div id="select6" class="MianRight_mianNav_M_qb"
								style="background: #74a702; color: #FFF;" onclick="selectd(6,0);"
								title="进口酒饮">进口酒饮</div>
						</div>
					</div>
					<div class="MianRight_mianN">
						<!--[if !IE]> 内容|主内容|产品开始<![endif]-->
						<s:iterator value="#commditylist" var="c">
							<div class="MianRight_mianN_cp">
								<div class="MianRight_mianN_cpImg">
									<a
										href="qtcommodity_querycommodityinfo?c_id=<s:property value="#c.c_id"/>"
										title="<s:property value="#c.c_name"/>" target="_blank"> <img
										src='imgss.jsp?file=<s:property value="#c.c_sltimg"/>'
										width="199" height="242" />
										<div class="MianRight_mianN_cpImg2">
											<s:if test="#c.commodityStatus.cs_id==2">
												<img src="100nn/Supermarket/images/tp2_03.png">
											</s:if>
											<s:elseif test="#c.commodityStatus.cs_id==3">
												<img src="100nn/Supermarket/images/tp2_05.png">
											</s:elseif>
											<s:elseif test="#c.commodityStatus.cs_id==4">
											<img src="100nn/Supermarket/images/yh_05.png">
											</s:elseif>
											<s:elseif test="#c.commodityStatus.cs_id==5">
											<img src="100nn/Supermarket/images/yh_03.png">
											</s:elseif>
										</div> 
										<s:if test="#c.c_splbms!=''">
											<div class="MianRight_mianN_cpImg3">
												<s:property value="#c.c_splbms" />
											</div>
										</s:if>
									</a>
								</div>
								<div class="MianRight_mianN_cpTitle">
									<s:property value="#c.c_name" />
									(限广西)
								</div>
								<div class="MianRight_mianN_cpfTitle">
									<span>￥<s:property value="#c.c_jg" />
									</span>
									<s:property value="#c.c_jldw" />
								</div>
								<div class="MianRight_mianN_cpkTitle" style="margin-bottom:10px;">
                        	<span class="MianRight_mianN_cpkTitle_spanL" style="text-decoration:line-through">参考价：¥<s:property value="c_scjg"/></span>
                        </div>
								<div class="MianRight_mianN_cpkTitle">
									<span class="MianRight_mianN_cpkTitle_spanL">全场包邮
									</span> <span class="MianRight_mianN_cpkTitle_spanR">关注度：<s:property
											value="#c.c_djs" />
									</span>
								</div>
							</div>
						</s:iterator>
						<!--[if !IE]> 内容|主内容|产品结束<![endif]-->

					</div>
				</div>
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
	$("#MianRight").css("width",vn); 

	var wj=$("#Mian").height();
	$("#MianLeft").css("height",wj);
	var wl=$("#Mian").height();
	wl=wl-1;
	$("#MianRight").css("height",wl);

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
				if(msgs!=""){
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
				}else{
					
					htmlstr="<div class=\"zwsp\"></div>";
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