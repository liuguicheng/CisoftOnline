<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>100南宁－快递超市－ ${c_name }</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link href="${pageContext.request.contextPath }/100nn/css/base.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath }/100nn/Supermarket/css/news.css" type="text/css"
	rel="stylesheet" />
	<link href="${pageContext.request.contextPath }/100nn/Supermarket/css/list.css" type="text/css"
	rel="stylesheet" />
<link href="${pageContext.request.contextPath }/100nn/css/nav_style.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath }/100nn/css/foot_style.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/100nn/cj/qh/sliderPlay-2.0.min.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/100nn/cj/alert/jquery.prompt.css">
<link href="${pageContext.request.contextPath }/100nn/cj/gwc/css/select.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath }/100nn/css/core.css" rel="stylesheet" type="text/css" />


<style type="text/css">
.butoons {
	background: url(100nn/Supermarket/images/lj_button.png);
	width: 173px;
	height: 41px;
	border: 0px;
}
</style>

</head>

<body>
<div id="nf" style="cursor:pointer"></div>
<div id="nt" style="cursor:pointer"></div>
	<!--[if !IE]> 头部|开始 <![endif]-->
	<%@ include file="/WEB-INF/100nn/top.jsp"%>
	<!--[if !IE]> 头部|结束 <![endif]-->
	<!--[if !IE]> 内容|开始 <![endif]-->
	<div id="Mian">
		<!--[if !IE]> 内容|导航开始 <![endif]-->
		<div id="MianLeft" style="display: none;">
			<%@ include file="/WEB-INF/100nn/scmenu.jsp"%>
		</div>
		<!--[if !IE]> 内容|导航结束 <![endif]-->
		<!--[if !IE]> 内容|主内容开始 <![endif]-->
		<div id="MianRight">
			<div id="MianRight_mian">
				<div class="MianRight_mianT">
					<div class="MianRight_mianTitle">
						<!-- <div class="MianRight_mianTitleLeft">所有商品分类</div> -->
						<div class="MianRight_mianTitleRight"></div>
					</div>
					<div class="MianRight_mianfTitle">
						<span id="dh"><a href="qtcommodity_querycommdityList?commodityStatus.cs_id=4"
							title="快递超市" target="_blank">快递超市</a> > <a 
							 href="qtcommodity_querycommdityList?commoditySort.cs_id=${commoditySort.cs_id}" title="${ commoditySort.cs_name}" target="_blank">${ commoditySort.cs_name} </a>
							> ${c_name }</span>
					</div>
					<div class="MianRight_mianN">
						<div class="MianRight_mianN_left">
							<div class="MianRight_mianN_leftLogo">
								<img src="${pageContext.request.contextPath}/100nn/Supermarket/images/logo_1.gif" width="196"
									height="86" />
							</div>
							<div class="MianRight_mianN_leftSpfl">
								<div class="MianRight_mianN_leftSpfl_top">商品分类</div>
								<div class="MianRight_mianN_leftSpfl_mian">
									<div class="MianRight_mianN_leftSpfl_mianCpYu">
										<a  title="粮油副食"
											target="_blank"  href="qtcommodity_querycommdityList?commoditySort.cs_id=2"></a>
									</div>
									<div class="MianRight_mianN_leftSpfl_mianCpRy">
										<a  href="qtcommodity_querycommdityList?commoditySort.cs_id=5" title="居家日用"
											target="_blank"></a>
									</div>
									<div class="MianRight_mianN_leftSpfl_mianCpSg">
										<a  href="qtcommodity_querycommdityList?commoditySort.cs_id=4" title="生鲜果蔬"
											target="_blank"></a>
									</div>
									<div class="MianRight_mianN_leftSpfl_mianCpLy">
										<a  href="qtcommodity_querycommdityList?commoditySort.cs_id=6" title="进口啤酒"
											target="_blank"></a>
									</div>
								</div>
							</div>
							<!-- <div class="MianRight_mianN_leftSpf2">
								<div class="MianRight_mianN_leftSpfl_top">热销商品推荐</div>
								<div class="MianRight_mianN_leftSpfl_mian" id="rexiaoid">
								</div>
								 <div class="MianRight_mianN_leftSpf2">
									<div class="MianRight_mianN_leftSpfl_top">最近浏览过的商品</div>
									<div class="MianRight_mianN_leftSpfl_mian"></div>
								</div> 
							</div> -->
						</div>
						<div class="MianRight_mianN_right">
						<p id="back-to-top" style="display: block;"><a href="#top"><span></span>回到顶部</a></p>
							<!--[if !IE]> 内容|主内容|缴费框内容开始 <![endif]-->
							 <form action="shoppingcar_save" method="post">
                            <input type="hidden" value="${c_id }" name="commodity.c_id" id="c_id"/>
                             <input type="hidden" value="2" name="type" id="type"/>
							<div class="MianRight_mianN_right_bt">
								<div class="MianRight_mianN_right_btImg">
								<s:if test="#imglist.size()==1">
								<img src="imgss.jsp?file=<s:property value="#imglist[0]"/>" width="404" height="492" />
								</s:if>
								<s:else>
									<div id='sliderPlay' style='visibility: hidden'>
	<s:iterator value="#imglist" var="imgs" id="number" status="d">
	<img src="imgss.jsp?file=<s:property value="#imglist[#d.index]"/>" width="404" height="492" />
	</s:iterator>
</div>
	</s:else>
								</div>
								<div class="MianRight_mianN_right_btMian">
									<div class="MianRight_mianN_right_btMianTop">
										<span>${c_name }(限广西)</span>
									</div>
									<div class="MianRight_mianN_right_btMianTB">
										<div class="MianRight_mianN_right_btMianTBR"></div>
										<div class="MianRight_mianN_right_btMianTBjq">
											<span class="MianRight_mianN_right_btMianTBjq_spanTitle">￥${c_jg}<input type="hidden" id="jg" value="${c_jg }"/> </span>
											<span class="MianRight_mianN_right_btMianTBjq_spanMj">参考价：￥<s:property value="c_scjg"/> </span>
											<span class="MianRight_mianN_right_btMianTBjq_spanMj">
												<!-- 缺少单价-->
											</span>
										</div>
										<div class="MianRight_mianN_right_btMianTBsl">
											<div class="MianRight_mianN_right_btMianTBsl_left">数量：</div>
											<div class="MianRight_mianN_right_btMianTBsl_topK">
												<div class="MianRight_mianN_right_btMianTBsl_topKleft">
													<input type="text" id="num" name="num" value="1" onblur="onjs(0);" />
												</div>
												<div class="MianRight_mianN_right_btMianTBsl_topKright">
													<div class="MianRight_mianN_right_btMianTBsl_topKrights">
														<img src="${pageContext.request.contextPath}/100nn/Supermarket/images/s_ico.gif" width="20"
															height="16"  onclick="onjs(1);" style="cursor:pointer;"/>
													</div>
													<div class="MianRight_mianN_right_btMianTBsl_topKrightx">
														<img src="${pageContext.request.contextPath}/100nn/Supermarket/images/x_ico.gif" width="20"
															height="16" onclick="onjs(-1);" style="cursor:pointer;"/>
													</div>
													
												</div>
											</div>
											<div class="MianRight_mianN_right_btMianTBsl_topR">件</div>
											<div class="MianRight_mianN_right_btMianTBsl_leftKc">库存${c_ck }件</div>
											<div class="MianRight_mianN_right_btMianTBsl_leftKcinput">
											<input type="hidden" id="psjg" value="0"/>
												全场包邮<!-- ${c_psjg }元-->
											</div>
											<div class="MianRight_mianN_right_btMianTBsl_leftJs">结算价</div>
											<div class="MianRight_mianN_right_btMianTBsl_leftJs1">￥${c_jg}</div>
										</div>
									</div>
									<div class="MianRight_mianN_right_btMianTs">
										<div class="MianRight_mianN_right_btMianTs_zl">
											<div class="MianRight_mianN_right_btMianTs_zlt">
												<div class="MianRight_mianN_right_btMianTs_zlTLeft">
													<img src="${pageContext.request.contextPath}/100nn/Supermarket/images/jr_button.png"
														width="173" height="41" style="cursor:pointer;" class="tcdiv" id="jrgwcid"/>
												</div>
												<div class="MianRight_mianN_right_btMianTs_zlTRight">
													 <div class="MianRight_mianN_right_btMianTs_zlTRight"><button value="" id="jsid" type="button" class="butoons tcdiv" style="cursor:pointer;"></button></div>
												</div>
												<div class="sys">
                        <ul id="sddm">
                          <li><a href="#" onmouseover="mopen('m1');" onmouseout="mclosetime();">扫码关注</a>
		                    <div id="m1" onmouseover="mcancelclosetime()" onmouseout="mclosetime()" style="visibility: hidden;">
                              <a class="sys_1" href="#"><img src="100nn/images/qrcode_for_gh_1e1c145c2809_430.jpg" width="136px" height="136px;"></a>
		                      <a class="sys_2"><img src="100nn/images/sys3_09.jpg"></a>
		                    </div>
	                      </li>
                        </ul>
                      </div>
											</div>
										</div>
										<div class="MianRight_mianN_right_btMianTs_zt">
											<%-- <table>
												<tr>
													<td>商品品牌：${commodityBrand.cb_name }</td>
													<td>商品规格：${c_jldw }</td>
													<td>商品等级：${c_dj }</td>
												</tr>
												<tr>
													<td>配&nbsp; 料&nbsp; 表：${c_pl }</td>
													<td>系&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 列：${c_xl }</td>
													<td>商品产地：${c_cd }</td>
												</tr>
												<tr>
													<td>保&nbsp; 质&nbsp; 期：${c_bzq }个月</td>
													<td>种植方式：${c_zzfs }</td>
													<td>贮存方法：${c_ccfs }</td>
												</tr>
											</table> --%>
											${c_spsxms }
										</div>
										<div class="MianRight_mianN_right_btMianTs_tjts">
											<span>配送承诺：<br /> 南宁市用户每日17：00前下单，第二天配送到门<br />
												广西区用户每日15：00前下单，第二天配送到门<br/>配送范围：广西全区
											</span> 
											<div class="MianRight_mianN_right_btMianTs_tjtsIco"></div>
										</div>
										<div class="MianRight_mianN_right_btMianTs_zfyys">
											<div class="MianRight_mianN_right_btMianTs_zfyysTitle">支持支付方式</div>
											<!-- <div class="MianRight_mianN_right_btMianTs_zfyysfk">
												<div class="MianRight_mianN_right_btMianTs_zfyysfkL">
												</div>
												 <div class="MianRight_mianN_right_btMianTs_zfyysfkR">
													<img src="100nn/Supermarket/images/yl_ico.jpg" width="126"
														height="40" />
												</div>
											</div>-->
											<div class="MianRight_mianN_right_btMianTs_zfyysfk">
												<div class="MianRight_mianN_right_btMianTs_zfyysfkL">
												</div>
												 <div class="MianRight_mianN_right_btMianTs_zfyysfkR">
													<img src="100nn/Supermarket/images/zfb_ico.jpg" width="126"
														height="40" />
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
							</form>
							<!--[if !IE]> 内容|主内容|缴费框内容结束 <![endif]-->
							<!--[if !IE]> 内容|主内容|商品详情、用户评价、售后服务内容开始 <![endif]-->
							<div class="MianRight_mianN_right_xqk">
								<div class="MianRight_mianN_right_xqk_top">
								<a href="#a1" style="color: black;">	<div class="MianRight_mianN_right_xqk_topT" id="s1">商品详情</div></a>
								<a href="#a2" style="color: black;">	<div class="MianRight_mianN_right_xqk_topT" id="s2">用户评价</div></a>
									<a href="#a3" style="color: black;"><div class="MianRight_mianN_right_xqk_topT" id="s3">售后服务</div></a>
								</div>
								<div class="MianRight_mianN_right_xqk_M" id="a1" >
									${c_spms }
								</div>
								<div class="MianRight_mianN_right_xqk_M" id="a2"
									style="padding: 0;">
									<div class="MianRight_mianN_right_xqk_Mpj">
										<div class="MianRight_mianN_right_xqk_MpjLeft">
											<div class="MianRight_mianN_right_xqk_MpjLeft_top">与描述相符</div>
											<div class="MianRight_mianN_right_xqk_MpjLeft_mian">3.6</div>
											<div class="MianRight_mianN_right_xqk_MpjLeft_foot">
												<span style="width: 90%;"></span>
											</div>
										</div>
										<div class="MianRight_mianN_right_xqk_MpjK">大家都写到</div>
										<div class="MianRight_mianN_right_xqk_MpjM">
											<div class="MianRight_mianN_right_xqk_MpjMian">性价比一般（820）</div>
											<div class="MianRight_mianN_right_xqk_MpjMian">性价比很高（966）</div>
											<div class="MianRight_mianN_right_xqk_MpjMian">性价比很高（966）</div>
											<div class="MianRight_mianN_right_xqk_MpjMian">性价比一般（800）</div>
											<div class="MianRight_mianN_right_xqk_MpjMian">性价比很高（966）</div>
											<div class="MianRight_mianN_right_xqk_MpjMian">性价比很高（966）</div>
											<div class="MianRight_mianN_right_xqk_MpjMian1">性价比一般（750）</div>
										</div>
									</div>
									<!--[if !IE]> 内容|主内容|评价内容开始 <![endif]-->
									<div class="MianRight_mianN_right_xqk_MpjNR">
										<div class="MianRight_mianN_right_xqk_MpjNRLeft">
											东西到了，不过由于温度低，凝固了，貌似提过，不是质量问题。还没用。包装完好，油没漏，给个好评吧。<br /> <span>今天</span>
										</div>
										<div class="MianRight_mianN_right_xqk_MpjNRRight">
											<div class="MianRight_mianN_right_xqk_MpjNRRight_top">会员：heyu3668</div>
											<div class="MianRight_mianN_right_xqk_MpjNRRight_bottom">
												<div class="MianRight_mianN_right_xqk_MpjNRRight_bottomBT">等级：</div>
												<div class="MianRight_mianN_right_xqk_MpjNRRight_bottomXx"
													style="width: 20%;"></div>
											</div>
										</div>
										<div class="clear"></div>
									</div>
									<!--[if !IE]> 内容|主内容|评价内容结束 <![endif]-->
									<!--[if !IE]> 内容|主内容|评价内容开始 <![endif]-->
									<div class="MianRight_mianN_right_xqk_MpjNR">
										<div class="MianRight_mianN_right_xqk_MpjNRLeft">
											油好，正品，绝对是山东的大花生做的，没想到商家还送了礼物，也非常好的正品，包装负责，快递很快<br /> <span>今天</span>
										</div>
										<div class="MianRight_mianN_right_xqk_MpjNRRight">
											<div class="MianRight_mianN_right_xqk_MpjNRRight_top">会员：heyu3668</div>
											<div class="MianRight_mianN_right_xqk_MpjNRRight_bottom">
												<div class="MianRight_mianN_right_xqk_MpjNRRight_bottomBT">等级：</div>
												<div class="MianRight_mianN_right_xqk_MpjNRRight_bottomXx"
													style="width: 20%;"></div>
											</div>
										</div>
										<div class="clear"></div>
									</div>
									<!--[if !IE]> 内容|主内容|评价内容结束 <![endif]-->
									<!--[if !IE]> 内容|主内容|评价内容开始 <![endif]-->
									<div class="MianRight_mianN_right_xqk_MpjNR">
										<div class="MianRight_mianN_right_xqk_MpjNRLeft">
											油好，正品，绝对是山东的大花生做的，没想到商家还送了礼物，也非常好的正品<br /> <span>今天</span>
										</div>
										<div class="MianRight_mianN_right_xqk_MpjNRRight">
											<div class="MianRight_mianN_right_xqk_MpjNRRight_top">会员：heyu3668</div>
											<div class="MianRight_mianN_right_xqk_MpjNRRight_bottom">
												<div class="MianRight_mianN_right_xqk_MpjNRRight_bottomBT">等级：</div>
												<div class="MianRight_mianN_right_xqk_MpjNRRight_bottomXx"
													style="width: 20%;"></div>
											</div>
										</div>
										<div class="clear"></div>
									</div>
									<!--[if !IE]> 内容|主内容|评价内容结束 <![endif]-->
									<!--[if !IE]> 内容|主内容|评价内容开始 <![endif]-->
									<div class="MianRight_mianN_right_xqk_MpjNR">
										<div class="MianRight_mianN_right_xqk_MpjNRLeft">
											油好，正品，绝对是山东的大花生做的，没想到商家还送了礼物，也非常好的正品<br /> <span>今天</span>
										</div>
										<div class="MianRight_mianN_right_xqk_MpjNRRight">
											<div class="MianRight_mianN_right_xqk_MpjNRRight_top">会员：heyu3668</div>
											<div class="MianRight_mianN_right_xqk_MpjNRRight_bottom">
												<div class="MianRight_mianN_right_xqk_MpjNRRight_bottomBT">等级：</div>
												<div class="MianRight_mianN_right_xqk_MpjNRRight_bottomXx"
													style="width: 20%;"></div>
											</div>
										</div>
										<div class="clear"></div>
									</div>
									<!--[if !IE]> 内容|主内容|评价内容结束 <![endif]-->
									<!--[if !IE]> 内容|主内容|评价内容开始 <![endif]-->
									<div class="MianRight_mianN_right_xqk_MpjNR">
										<div class="MianRight_mianN_right_xqk_MpjNRLeft">
											油好，正品，绝对是山东的大花生做的，没想到商家还送了礼物，也非常好的正品<br /> <span>今天</span>
										</div>
										<div class="MianRight_mianN_right_xqk_MpjNRRight">
											<div class="MianRight_mianN_right_xqk_MpjNRRight_top">会员：heyu3668</div>
											<div class="MianRight_mianN_right_xqk_MpjNRRight_bottom">
												<div class="MianRight_mianN_right_xqk_MpjNRRight_bottomBT">等级：</div>
												<div class="MianRight_mianN_right_xqk_MpjNRRight_bottomXx"
													style="width: 20%;"></div>
											</div>
										</div>
										<div class="clear"></div>
									</div>
									<!--[if !IE]> 内容|主内容|评价内容结束 <![endif]-->
									<!--[if !IE]> 内容|主内容|评价内容开始 <![endif]-->
									<div class="MianRight_mianN_right_xqk_MpjNR">
										<div class="MianRight_mianN_right_xqk_MpjNRLeft">
											油好，正品，绝对是山东的大花生做的，没想到商家还送了礼物，也非常好的正品<br /> <span>今天</span>
										</div>
										<div class="MianRight_mianN_right_xqk_MpjNRRight">
											<div class="MianRight_mianN_right_xqk_MpjNRRight_top">会员：heyu3668</div>
											<div class="MianRight_mianN_right_xqk_MpjNRRight_bottom">
												<div class="MianRight_mianN_right_xqk_MpjNRRight_bottomBT">等级：</div>
												<div class="MianRight_mianN_right_xqk_MpjNRRight_bottomXx"
													style="width: 20%;"></div>
											</div>
										</div>
										<div class="clear"></div>
									</div>
									<!--[if !IE]> 内容|主内容|评价内容结束 <![endif]-->
									<!--[if !IE]> 内容|主内容|评价内容开始 <![endif]-->
									<div class="MianRight_mianN_right_xqk_MpjNR">
										<div class="MianRight_mianN_right_xqk_MpjNRLeft">
											油好，正品，绝对是山东的大花生做的，没想到商家还送了礼物，也非常好的正品<br /> <span>今天</span>
										</div>
										<div class="MianRight_mianN_right_xqk_MpjNRRight">
											<div class="MianRight_mianN_right_xqk_MpjNRRight_top">会员：heyu3668</div>
											<div class="MianRight_mianN_right_xqk_MpjNRRight_bottom">
												<div class="MianRight_mianN_right_xqk_MpjNRRight_bottomBT">等级：</div>
												<div class="MianRight_mianN_right_xqk_MpjNRRight_bottomXx"
													style="width: 20%;"></div>
											</div>
										</div>
										<div class="clear"></div>
									</div>
									<!--[if !IE]> 内容|主内容|评价内容结束 <![endif]-->
								</div>
								<div class="MianRight_mianN_right_xqk_sh a3" id="a3" >
									<div class="MianRight_mianN_right_xqk_shL">
										<div class="MianRight_mianN_right_xqk_shL_ico">
											<img src="100nn/Supermarket/images/shzp_ico.jpg" width="92"
												height="92" />
										</div>
										<div class="MianRight_mianN_right_xqk_shL_font">外卖超市出售均为正品，承诺提供“正品保障”服务。</div>
									</div>
									<div class="MianRight_mianN_right_xqk_shL">
										<div class="MianRight_mianN_right_xqk_shL_ico"
											style="border-left: #dbdbdb solid 1px;">
											<img src="100nn/Supermarket/images/shth_ico.jpg" width="92"
												height="92" />
										</div>
										<div class="MianRight_mianN_right_xqk_shL_font">对于在外卖超市购物的买家提供“7天无理由退货”保障服务。</div>
									</div>
								</div>
							</div>
							<div class="MianRight_mianN_right_xqk a3" >
								<div class="MianRight_mianN_right_xqk_sh1">
									<img src="${pageContext.request.contextPath}/100nn/Supermarket/images/cn_bt.gif" width="144"
										height="19" /><br />
									外卖超市承诺所有商品均来自有品牌授权的供货商以及正规厂家，均是符合国家相关行业标准与规定的正品，所有商品都经过严格审核与挑选，请您放心购买。
								</div>
								<div class="MianRight_mianN_right_xqk_sh1">
									<img src="${pageContext.request.contextPath}/100nn/Supermarket/images/shnr_img.jpg" width="895"
										height="254" />
								</div>
								<div class="MianRight_mianN_right_xqk_sh1">
									<div class="MianRight_mianN_right_xqk_sh1_bt"></div>
									<div class="MianRight_mianN_right_xqk_sh1_span">
										食品类商品如无质量问题，用户签收后，将不能进行退换货。 <br /> <b>特别说明，存在以下情形之一的，外卖超市不承担退换货责任</b><br />
										1.任何非购自外卖超市的商品。<br /> 2.任何因客户使用或保管不当导致出现质量问题的商品。<br />
										3.任何因客户原因导致超过保质期的商品。<br /> 4.仅赠品存在问题，且不影响主要商品使用或食用的。<br />
										注：<br /> 1.用户在退货时不再享有商品的相关优惠政策。<br />
										2.为了保证您的食用安全，凡经退换的商品一律不再上架。为避免造成不必要的浪费，请您在购物时细心挑选您所需要的商品。<br />
										<br /> <span style="color: #60830f;">*温馨提示*</span><br />
										为了您的利益，请收到货物后仔细清点检查您订购的商品。如商品配送有误、包装破损、产品腐烂、数量不对等问题，请当面及时向配送人员提出，以便我们能尽快的为您处理。<br />
										<b>客服电话：400-8061-026</b><br />

									</div>
								</div>
							</div>
							<!--[if !IE]> 内容|主内容|商品详情、用户评价、售后服务内容结束 <![endif]-->
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="clear"></div>
		<!--[if !IE]> 内容|主内容开始 <![endif]-->
		<!--[if !IE]> 内容|主内容开始 <![endif]-->
	</div>
	<!--[if !IE]> 内容|结束 <![endif]-->
	<!--[if !IE]> 版权|开始 <![endif]-->
	<%-- <!--J-shoping-->
<div class="J-shoping J-shoping-small">
	<div class="J-shoping-item">
        <div class="baseBg J-L-ico J-shoping-pos"></div>
        <div class="J-shoping-main">
            <div class="J-shoping-title">
                <a href="#" title="" class="J-go"><em class="baseBg"></em>购物车</a>
                <span class="baseBg J-shoping-num">0</span>
            </div>
            <div class="baseBg J-shoping-mx"></div>
            <div class="J-shoping-px"></div>
            <div class="J-shoping-body">
                <div class="J-shoping-buy"><span>最多显示最新<strong>5</strong>条</span><a class="baseBg" href="http://www.chinacoder.cn/" title="去购物车结算"></a></div>
            </div>
        </div>
    </div>
</div> --%>
	
	<div id="Foot">
		 Copyright ©2013-2014 CISOFT Corporation, All Rights Reserved.&nbsp;&nbsp;桂ICP备12002922号-1&nbsp;&nbsp;增值电信业务经营许可证：桂B2-20140021&nbsp;&nbsp;版权所有：<a  href="http://www.cisoft.cn/"  target="_blank">广西南宁市熙软循环信息科技有限公司</a>
	</div>
	<!--[if !IE]> 版权|结束 <![endif]-->
	
	
</body>
<!-- 图片切换 -->
<script type="text/jscript" src="${pageContext.request.contextPath }/100nn/cj/qh/jquery-SliderPlay-2.0.min.js"></script>
<!-- 提示框 -->
<script type="text/javascript" src="${pageContext.request.contextPath }/100nn/cj/alert/jquery.prompt.min.js"></script>
<!-- 购物车 -->
<script type="text/javascript" src="${pageContext.request.contextPath }/100nn/cj/gwc/js/jQuery-shopping.js"></script>
<script type="text/jscript" src="${pageContext.request.contextPath }/100nn/js/popup_layer.js"></script>
 <script type="text/javascript">
	$(document).ready(function(){
	//首先将#back-to-top隐藏
	$("#back-to-top").hide();
	//当滚动条的位置处于距顶部100像素以下时，跳转链接出现，否则消失
	$(function () {
		$("#MianRight_mian").scroll(function(){
		if ($("#MianRight_mian").scrollTop()>100){
		$("#back-to-top").fadeIn(500);
		}
		else
		{
		$("#back-to-top").fadeOut(500);
		}
		});
		//当点击跳转链接后，回到页面顶部位置
		$("#back-to-top").click(function(){
		$("#MianRight_mian").animate({scrollTop:0},100);
		return false;
		});
		});
		});
  </script>
<script>
	function autowidth() {

		var wh = $(window).height();
		wh = wh - 126;
		$("#Mian").css("height", wh);

		

		var wj = $("#Mian").height();
		$("#MianLeft").css("height", wj);
		var wl = $("#Mian").height();
		wl = wl - 1;
		$("#MianRight").css("height", wl);

		var tc = $("#Mian").height();
		tc = tc - 5;
		$("#MianRight_mian").css("height", tc);

		var tk = $("#Mian").height();
		$("#MianLeft").css("height", tk);

		var tx = $(".MianRight_mianN").width();
		tx = tx - 218;
		$(".MianRight_mianN_right").css("width", tx);

		var tt = $(".MianRight_mianN_right_bt").width();
		tt = tt - 404;
		$(".MianRight_mianN_right_btMian").css("width", tt);

		var tq = $(".MianRight_mianN_right_btMian").width();
		tq = tq - 20;
		$(".MianRight_mianN_right_btMianTs").css("width", tq);

		var ta = $(".MianRight_mianN_right").width();
		ta = ta - 2;
		$(".MianRight_mianN_right_xqk").css("width", ta);

		var te = $(".MianRight_mianN_right_xqk_sh1").width();
		te = te - 54;
		$(".MianRight_mianN_right_xqk_sh1_span").css("width", te);

	}
	
	$().ready(function() {
		autowidth();
		$(window).resize(function() {
			autowidth();
		});
		//图片切换
		$('#sliderPlay').sliderPlay({
			speed: 500, 		//动画效果持续时间
			timeout: 5000,		//幻灯间隔时间
			moveType: 'opacity',  // randomMove: 随机运动，moveTo: 切换运动 ，opacity: 淡入淡出
			mouseEvent: 'click', //事件类型，默认是 click ,mouseover
			isShowTitle: false,	//是否开始标题,开启则采用img标签alt的文字
			isShowBtn:  true    //是否显示按钮
		});
		
	});
</script>
<script>
	$(document)
			.ready(
					function() {
						
						
						
						$(".MianRight_mianN_right_xqk_topT:first")
								.css("background",
										"url(100nn/Supermarket/images/tb_bj.gif) repeat-x");
						$(".MianRight_mianN_right_xqk_topT:first").css("color",
								"#8bb401");
						$(".MianRight_mianN_right_xqk_topT")
								.click(
										function() {
											$(".MianRight_mianN_right_xqk_topT")
													.css("background", "none");
											$(".MianRight_mianN_right_xqk_topT")
													.css("color", "#000");
											$(this)
													.css("background",
															"url(100nn/Supermarket/images/tb_bj.gif) repeat-x");
											$(this).css("color", "#8bb401");
										});
						$("#a2").hide();
						$(".a3").hide();
						$("#s1").click(function() {
							
							$("#a2").hide();
							$(".a3").hide();
							$("#a1").show();
						});
						$("#s2").click(function() {
							$("#a1").hide();
							$(".a3").hide();
							$("#a2").show();
						});
						$("#s3").click(function() {
							$("#a2").hide();
							$("#a1").hide();
							$(".a3").show();
						});
						$
						.ajax({
							type : "POST",
							url : "shoppingcar_querygwccount",
							success : function(msgs) {
								var hm="";
								if(msgs=="登录超时,请重新登录"){
									layer.msg(msgs);
									hm="我的快递超市购物车"+0+"件";
								}else{
									if(msgs==0){
										hm="我的快递超市购物车"+0+"件";
									}else{
									hm="<a href='shoppingcar_querygwclist' class='tcdiv'  style='color: #FFF;' target='_blank'>我的快递超市购物车"+msgs+"件</a>";
									}
									$(".cumu").html(msgs);
								}
								$(".MianRight_mianTitleRight").html(hm);
							}
						});
						$(".MianRight_mianN_right_btMianTs_zlTLeft")
								.click(
										function() {
											var c_id = $("#c_id").val();
											var num = $("#num").val();
											var type = "1";//1标示加入购物车
											if(num>0){
											$
													.ajax({
														type : "POST",
														url : "shoppingcar_save",
														data : "c_id=" + c_id
																+ "&num=" + num
																+ "&type="
																+ type,
														success : function(msgs) {
															if (msgs == "1") {
																$
																.ajax({
																	type : "POST",
																	url : "shoppingcar_querygwccount",
																	success : function(msgs) {
																		var hm="";
																		if(msgs=="登录超时,请重新登录"){
																			hm="我的快递超市购物车"+0+"件";
																		}else{
																			if(msgs==0){
																				hm="我的快递超市购物车"+0+"件";
																			}else{
																			hm="<a href='shoppingcar_querygwclist' class='tcdiv'  style='color: #FFF;' target='_blank'>我的快递超市购物车"+msgs+"件</a>";
																			}
																			$(".cumu").html(msgs);
																		}
																		$(".MianRight_mianTitleRight").html(hm);
																		
																	}
																});
																
																 layer.msg('添加购物车成功',2,1,"100px");

															} else if (msgs == "2") {
																location.href = "${pageContext.request.contextPath}/shoppingcar_querygwclist";
															
															}else{
																//未登录
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
											}else{
												layer.msg("请输入购买数量");
												
											}
										});
										

						$("#jsid")
								.click(
										function() {
											var c_id = $("#c_id").val();
											var num = $("#num").val();
											var type = "2";//1标示结算
											if(num>0){
											$
													.ajax({
														type : "POST",
														url : "shoppingcar_save",
														data : "c_id=" + c_id
																+ "&num=" + num
																+ "&type="
																+ type,
														 success : function(msgs) {
															if (msgs == "1") {
															} else if (msgs == "2") {
																$(".cumu").html(msgs);
																location.href = "${pageContext.request.contextPath}/shoppingcar_querygwclist";
															}else{
																//未登录
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
													
													
													
										}else{
											layer.msg("请输入购买数量");
											
										}
										});
						
						/**
						 * 自动结算
						 */
						//var num=$("#num").val();
						//var  jg=$("#jg").val();
						//var psjg=$("#psjg").val();
						//var zj=Number(num)*Number(psjg)+Number(jg);
						//$(".MianRight_mianN_right_btMianTBsl_leftJs1").html("¥ "+jg.toFixed(2));
						
						//查询畅销
						$
						.ajax({
							type : "POST",
							url : "qtcommodity_houtcommodity",
							success : function(msgs) {
								var htmlstr = "";
						     	for ( var o in msgs) {
						     		
						     		htmlstr+="<div class=\"MianRight_mianN_leftSpf2_nr\">"+
									"<div class=\"MianRight_mianN_leftSpf2_nrImg\">"+
									"<a href=\"qtcommodity_querycommodityinfo?c_id="+msgs[o].c_id+"\">"+
										"<img src=\"imgss.jsp?file="+msgs[o].c_sltimg+"\" width=\"78\" height=\"73\" />"+
												"</a>"+
									"</div>"+
									"<div class=\"MianRight_mianN_leftSpf2_nrFont\">"+
									"	<div class=\"MianRight_mianN_leftSpf2_nrFont_title\"><a href=\"commodity_querycommodityinfo?c_id="+msgs[o].c_id+"\">"+msgs[o].c_name+"</a></div>"+
									"	<div class=\"MianRight_mianN_leftSpf2_nrFont_qb\">￥"+msgs[o].c_jg+"</div>"+
									"</div>"+
								"</div>";
						     	}
								$("#rexiaoid").html(htmlstr);
								
							}
						});
						
					})
function onjs(ids){
		var num=$("#num").val();
		
		if(ids==0){
			
		}else if(ids==1){
			num=Number(num)+1;
			$("#num").val(num);
			
		}else{
			if(num==1){
			}else{
			num=Number(num)-1;
			$("#num").val(num);
			}
		}
		
		if(num<1){
			$("#num").val(1);
			num=1;
		}
		
		var  jg=$("#jg").val();
		var psjg=$("#psjg").val();
		var zj=Number(num)*Number(jg)+Number(psjg);
		if(num!=0){
		$(".MianRight_mianN_right_btMianTBsl_leftJs1").html("¥"+zj.toFixed(2));
		}else{
			$(".MianRight_mianN_right_btMianTBsl_leftJs1").html("¥0");
		}
	}
	 function selectd(id){
		 
		 var cs_id=id;
			var url="";
			if(cs_id==0){
				url="commoditySort="+null;
			}else{
				url="commoditySort.cs_id="+cs_id;
			}
			window.location.href="qtcommodity_querycommdityList?"+url;
		}
	 // 验证收入数量
	 function onnum(){
		 var num=$("#num").val();
		 if(num<1){
			 $("#num").val(1);
		 }
	 }
	
	 
</script>
<script type="text/javascript">
var timeout         = 500;
var closetimer		= 0;
var ddmenuitem      = 0;
//分享链接开始
var timeout         = 500;
var closetimer		= 0;
var ddmenuitem      = 0;

// open hidden layer
function mopen(id)
{	
	// cancel close timer
	mcancelclosetime();

	// close old layer
	if(ddmenuitem) ddmenuitem.style.visibility = 'hidden';

	// get new layer and show it
	ddmenuitem = document.getElementById(id);
	ddmenuitem.style.visibility = 'visible';

}
// close showed layer
function mclose()
{
	if(ddmenuitem) ddmenuitem.style.visibility = 'hidden';
}

// go close timer
function mclosetime()
{
	closetimer = window.setTimeout(mclose, timeout);
}

// cancel close timer
function mcancelclosetime()
{
	if(closetimer)
	{
		window.clearTimeout(closetimer);
		closetimer = null;
	}
}

// close layer when click-out
document.onclick = mclose; 
//分享链接结束


//导航隐藏
$("#nf").click(function(){
	    $("#nf").hide();
		$("#nt").show();
		$("#MianLeft").show();
		var vn=$("#Mian").width();
        vn=vn-101;
        $("#MianRight").css("width",vn);
		var tx=$(".MianRight_mianN").width();
        tx=tx-218;
        $(".MianRight_mianN_right").css("width",tx);
		var tx=$(".MianRight_mianN").width();
tx=tx-218;
$(".MianRight_mianN_right").css("width",tx);


var tt=$(".MianRight_mianN_right_bt").width();
tt=tt-404;
$(".MianRight_mianN_right_btMian").css("width",tt);

var tq=$(".MianRight_mianN_right_btMian").width();
tq=tq-20;
$(".MianRight_mianN_right_btMianTs").css("width",tq);

var ta=$(".MianRight_mianN_right").width();
ta=ta-2;
$(".MianRight_mianN_right_xqk").css("width",ta);

var te=$(".MianRight_mianN_right_xqk_sh1").width();
te=te-54;
$(".MianRight_mianN_right_xqk_sh1_span").css("width",te);
	});
	
	
$("#nt").click(function(){
	    $("#nt").hide();
		$("#nf").show();
		$("#MianLeft").hide();
		var vn=$("#Mian").width();
        vn=vn;
        $("#MianRight").css("width",vn);
		var tx=$(".MianRight_mianN").width();
        tx=tx-218;
        $(".MianRight_mianN_right").css("width",tx);
		var tx=$(".MianRight_mianN").width();
tx=tx-218;
$(".MianRight_mianN_right").css("width",tx);


var tt=$(".MianRight_mianN_right_bt").width();
tt=tt-404;
$(".MianRight_mianN_right_btMian").css("width",tt);

var tq=$(".MianRight_mianN_right_btMian").width();
tq=tq-20;
$(".MianRight_mianN_right_btMianTs").css("width",tq);

var ta=$(".MianRight_mianN_right").width();
ta=ta-2;
$(".MianRight_mianN_right_xqk").css("width",ta);

var te=$(".MianRight_mianN_right_xqk_sh1").width();
te=te-54;
$(".MianRight_mianN_right_xqk_sh1_span").css("width",te);
	});
</script>
</body>
</html>
