<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="s" uri="/struts-tags"%>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="${pageContext.request.contextPath }/100nnPc20/css/spxx.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath }/100nnPc20/css/base.css" rel="stylesheet" type="text/css" />
<link type="text/css" href="${pageContext.request.contextPath }/100nnPc20/css/zzsc.css" rel="stylesheet" />
<link href="${pageContext.request.contextPath }/100nnPc20/css/spxx_tpck.css" rel="stylesheet" type="text/css" />
</head>
<body>
<!--[if !IE]>网页开始<![endif]-->
<div class="box">
    <!--[if !IE]>主体开始<![endif]-->
    <script>window._bd_share_config={"common":{"bdSnsKey":{},"bdText":"","bdMini":"2","bdMiniList":false,"bdPic":"","bdStyle":"0","bdSize":"16"},"slide":{"type":"slide","bdImg":"2","bdPos":"right","bdTop":"100"},"image":{"viewList":["qzone","tsina","tqq","renren","weixin"],"viewText":"分享到：","viewSize":"16"},"selectShare":{"bdContainerClass":null,"bdSelectMiniList":["qzone","tsina","tqq","renren","weixin"]}};with(document)0[(getElementsByTagName('head')[0]||body).appendChild(createElement('script')).src='http://bdimg.share.baidu.com/static/api/js/share.js?v=89860593.js?cdnversion='+~(-new Date()/36e5)];</script>
    <div class="main">
	    <!--[if !IE]>头部开始<![endif]-->
        <div class="top">
          <%@ include file="top.jsp"%>
		</div>
		<!--[if !IE]>头部结束<![endif]-->
        <!--[if !IE]>中部开始<![endif]-->
        <div class="content_spxx">
         <form action="shoppingcar_save" method="post">
            <!--[if !IE]>中部上开始<![endif]-->
            <div class="content_top">
              <div class="content_top_banner">
                <ul>
                  <li id="bi">
                   <s:if test="commoditySort.cs_id==2">
    粮油副食
    </s:if>
    <s:elseif test="commoditySort.cs_id==4">生鲜果蔬</s:elseif>
      <s:elseif test="commoditySort.cs_id==5">居家日用</s:elseif>
        <s:elseif test="commoditySort.cs_id==6">进口酒饮</s:elseif>
                  </li>
                  <li>> <a href="#"> ${c_name }</a></li>
                </ul>
              </div>
              <div class="content_top_con">
                <div class="content_top_con_l"></div>
                <div class="content_top_con_c">
                  <div class="content_top_con_tp">
                    <!-- <div class="content_top_con_tp1">
                      <img src="images/tp_08.png">
                    </div>
                    <div class="content_top_con_tp2">
                      <div class="content_top_con_dj">
                      <a><</a>
                      </div>
                      <div class="content_top_con_dc">
                        <a href="#"><img class="content_top_con_dcc" src="images/bv_09.png"/></a>
                        <a href="#"><img class="content_top_con_dcc" src="images/bv_09.png"/></a>
                        <a href="#"><img class="content_top_con_dcc" src="images/bv_09.png"/></a>
                        <a href="#"><img class="content_top_con_dcc" src="images/bv_09.png"/></a>
                      </div>
                      <div class="content_top_con_dl">
                      <a>></a>
                      </div>
                    </div> -->
                    <div class="Gpic">
	<div class="pic">
		<a ID="newPage"><img src="${pageContext.request.contextPath }/imgss.jsp?file=<s:property value='#imglist[0]'/>"  id="mainphoto" rel="${pageContext.request.contextPath }/imgss.jsp?file=<s:property value='#imglist[0]'/>" /></a>		
	</div>
	<div class="Xgt">
	
	 <input type="hidden" value="${c_id }" name="commodity.c_id" id="c_id"/>
                             <input type="hidden" value="2" name="type" id="type"/>
		<div class="Al"><img src="${pageContext.request.contextPath }/100nnPc20/images/an1L.gif" id="goleft" /></div>
		<div class="zgt">
			<div id="photos" class="zgt">
			  <div id="showArea" >
					<ul>
					<s:if test="#imglist.size()==1">
								<li><img src="${pageContext.request.contextPath }/imgss.jsp?file=<s:property value='#imglist[0]'/>" rel="${pageContext.request.contextPath }/imgss.jsp?file=<s:property value='#imglist[0]'/>"/></li>
								</s:if>
								<s:else>
	<s:iterator value="#imglist" var="imgs" id="number" status="d">
	<li><img src="${pageContext.request.contextPath }/imgss.jsp?file=<s:property value='#imglist[#d.index]'/>" rel="${pageContext.request.contextPath }/imgss.jsp?file=<s:property value='#imglist[#d.index]'/>" /></li>
	</s:iterator>
	</s:else>
						<!-- <li><img src="images/img13s.jpg" rel="images/img13.jpg" /></li> -->
						<!-- <li><img src="images/img20s.jpg" rel="images/img20.jpg" /></li>
						<li><img src="images/img13s.jpg" rel="images/img13.jpg" /></li>
						<li><img src="images/img20s.jpg" rel="images/img20.jpg" /></li>
						<li><img src="images/img13s.jpg" rel="images/img13.jpg" /></li>
						<li><img src="images/img20s.jpg" rel="images/img20.jpg" /></li>
						<li><img src="images/img13s.jpg" rel="images/img13.jpg" /></li>
						<li><img src="images/img20s.jpg" rel="images/img20.jpg" /></li> -->
					</ul>
			  </div>
			</div>
		</div>
		<div class="Ar"><img src="${pageContext.request.contextPath }/100nnPc20/images/an1R.gif"   id="goright"/></div>
	</div>
</div>
                    <div class="content_top_con_df"><img src="${pageContext.request.contextPath }/100nnPc20/images/df_16.png"></div>
                    <div class="content_top_con_fx">
                      <div class="content_top_con_fxl">
                       <!--  <a><img src="images/fx_20.png"></a>
                        <a href="#"><img src="images/fx_22.png"></a>
                        <a href="#"><img src="images/fx_24.png"></a>
                        <a href="#"><img src="images/fx_26.png"></a>
                        <a href="#"><img src="images/fx_28.png"></a> -->
                      </div>
                      <div class="content_top_con_fx2">
                        <img src="${pageContext.request.contextPath }/100nnPc20/images/fx_30.png">
                        <a href="javascript:alert('暂未开放');">收藏商品</a>
                      </div>
                    </div>
                  </div>
                  <div class="content_top_con_xx">
                    <div class="content_top_con_xt">
                  ${c_name }
                    </div>
                    <div class="content_top_con_xxx">
                      <div class="content_top_con_x1">
                        <div class="content_top_con_x11" id="dj">${c_jg}</div>
                      </div>
                      <div class="content_top_con_x2">
                        <div class="content_top_con_x21">
                          <div class="content_top_con_x211">数量：</div>
                          <div class="content_top_con_x212">
                            <div class="content_top_con_x2121">
                            <input type="text" id="num" class="num-pallets-input" value="1" onblur="onjs(0);" ></input>
                            </div>
                            <div class="content_top_con_x2122">
							  <div class="content_top_con_x2122s">
								<img id="jia" src="${pageContext.request.contextPath }/100nnPc20/images/xz2.png" width="20" height="16"  onclick="onjs(1);" style="cursor:pointer;"/>
							  </div>
							  <div class="content_top_con_x2122x">
								<img id="jian" src="${pageContext.request.contextPath }/100nnPc20/images/xz3.png" width="20"height="16" onclick="onjs(-1);" style="cursor:pointer;"/>
							  </div>					
							</div>
                          </div>
                          <div class="content_top_con_x213">件</div>
                        </div>
                        <div class="content_top_con_x22">
                          <div class="content_top_con_x221">库存：</div>
                          <div class="content_top_con_x222">${c_ck }</div>
                          <div class="content_top_con_x223">件</div>
                        </div>
                        <div class="content_top_con_x23">
                          <div class="content_top_con_x231">结算价：</div>
                          <div class="content_top_con_x232" id="jsj"></div>
                        </div>
                      </div>
                    </div>
                    <div class="content_top_con_gm">
                      <div class="content_top_con_gm1"><a href="javascript:void(0);" class="tcdiv" id="jrgwcid" ><img src="${pageContext.request.contextPath }/100nnPc20/images/gm_23.png"/></a></div>
                      <div class="content_top_con_gm2"><a href="javascript:void(0);"id="jsid"  class="butoons tcdiv" ><img src="${pageContext.request.contextPath }/100nnPc20/images/gm_25.png"/></a></div>
                    </div>
                    <div class="content_top_con_xu"><img src="${pageContext.request.contextPath }/100nnPc20/images/xu.png"/></div>
                    <div class="content_top_con_xn" style="line-height: 22px;">
                      <!-- <div class="content_top_con_xn1">
                      商品品牌：力拓农业<br/>                           
                      产品标准：绿色食品<br/>              
                      保 质 期：12个月<br/>                 
                      </div>
                      <div class="content_top_con_xn2">
                      商品规格：5kg<br/>
                      产品口味：爽口、嚼劲<br/>    
                      种植方式：绿色标准种植<br/>
                      </div>
                      <div class="content_top_con_xn2">
                      商品等级：银钻 <br/>   
                      商品产地：国内 <br/> 
                      贮存方法：阴凉储存<br/>
                      </div>  -->
                      ${c_spsxms }
                    </div>
                    <div class="content_top_con_xu"><img src="${pageContext.request.contextPath }/100nnPc20/images/xu.png"/></div>
                    <div class="content_top_con_cn">
                      <div class="content_top_con_cn1">
                      配送承诺：<br/>
                      每日凌晨00：00--21：00前下单，第二天配送。<br/>
                      配送时间为上午9:30--12:00，下午14：00--18:00。<br/>
                      </div>
                      <div class="content_top_con_cn2">
                      配送范围：南宁市区内
                      </div>
                    </div>
                    <div class="content_top_con_xu"><img src="${pageContext.request.contextPath }/100nnPc20/images/xu.png"/></div>
                    <div class="content_top_con_zf">
                      <div class="content_top_con_zf1">
                      支付方式：
                      </div>
                      <div class="content_top_con_zf2">
                      <input type="radio" value="male" checked="checked"/>
                      </div>
                      <div class="content_top_con_zf3">
                      <img src="${pageContext.request.contextPath }/100nnPc20/images/zf.png">
                      </div>
                    </div>
                  </div>
                </div>
                <div class="content_top_con_r"></div>
              </div>
            </div>    
            <!--[if !IE]>中部上结束<![endif]-->
            <div style="clear:both;"></div>
            <!--[if !IE]>中部中开始<![endif]-->
            <div class="content_con">
              <!--[if !IE]>中部中左开始<![endif]-->
              <div class="content_con_left">
                <!--[if !IE]>热销商品推荐开始<![endif]-->
                <div class="rxsp" style="padding-top: 0px;">
                  <div class="rxsp_top">
                  热销商品推荐
                  </div>
                  <div class="rxsp_con">
                   <s:iterator value="commodities" var="c" status="n">
                   <s:if test="#n.index<=4">
                    <div class="rxsp_con_tt">
                      <div class="rxsp_con_ttp">
                      <img src="${pageContext.request.contextPath }/imgss.jsp?file=<s:property value="#c.c_sltimg"/>"  width="120" height="146" style="margin-left: 20px;"/>
                      </div>
                      <div class="rxsp_con_tta" style="margin-top:30px;">
                      <a href="#"><s:property value="#c.c_name"/> </a>
                      </div>
                      <div class="rxsp_con_ttb">
                      <s:property value="#c.c_jg"/>
                      </div>
                    </div>
                    </s:if>
                   </s:iterator>
                    
                  </div>
                  <div class="rxsp_foot">
                  </div>
                </div>
                <!--[if !IE]>热销商品推荐结束<![endif]-->
              </div>
              <!--[if !IE]>中部中左结束<![endif]-->
              <!--[if !IE]>中部中左始<![endif]-->
              <div class="content_con_right">
                <!--[if !IE]>详细内容开始<![endif]-->
                    <div class="zlgg">
                        <div class="zlgg_con">
                            <div class="zlgg_con_top">
                                <ul id="tzgg01">
                                    <li id="DVtab1" class="DVTabBarActive" onclick="showDVTab(1);">商品详情</li>
                                    <li id="DVtab2" class="DVTabBarNormal" onclick="showDVTab(2);">用户评价</li>
                                    <li id="DVtab3" class="DVTabBarNormal" onclick="showDVTab(3);">售后服务</li>
                                </ul>
                                <div class="zlgg_con_top_gw">
                                  <div class="zlgg_con_top_gww content_top_con_gm1"><a href="javascript:void(0);"><img src="${pageContext.request.contextPath }/100nnPc20/images/gw.png"/></a></div>
                                </div>
                            </div>
                            <!--[if !IE]>列表区域开始<![endif]-->
                            <div class="zlgg_con_list_con">
                                <!--[if !IE]>商品详细内容开始<![endif]-->
                                <div class="DVtabcontent" id="DVtabcontent1">
                                  <div class="spxx">
                                     ${c_spms }
                                  </div>
                                </div>
                                <!--[if !IE]>商品详细内容结束<![endif]-->
                                <!--[if !IE]>用户评价内容开始<![endif]-->
                                <div class="DVtabcontent" id="DVtabcontent2" style="display:none;">                               
                                    <div class="yhpj_x">
                                      <div class="yhpj_x_top">
                                        <div class="spxx_x_top_l">
                                          <div class="spxx_x_top_l1">
                                          与描述相符
                                          </div>
                                          <div class="spxx_x_top_l2">
                                          <img src="${pageContext.request.contextPath }/100nnPc20/images/sp.png"/>
                                          </div>
                                        </div>
                                        <div class="spxx_x_top_r">
                                          <div class="spxx_x_top_rc">
                                            <span class="rc1">性价比很高(966)</span>
                                            <span class="rc1">整体感觉不错(379)</span>
                                            <span class="rc1">包装不错哦(294)</span>
                                            <span class="rc1">很新鲜(30)</span>
                                          </div>
                                          <div class="spxx_x_top_rc">
                                            <span class="rc1">口感好(21)</span>
                                            <span class="rc1">分量足(1)</span>
                                            <span class="rc2">性价比一般(1)</span>
                                            <span class="rc2">包装一般(1)</span>
                                            <span class="rc2">质量一般般(1)</span>
                                          </div>
                                        </div>
                                      </div>
                                      <div class="spxx_x_con">
                                        <ul>
                                          <li>
                                            <div class="spxx_x_con_left">
                                              <span class="spxx_x_con_left1">高端绿色大米飞入寻常百姓家。顶起！超好吃！赞！赞！！！赞！！！！</span>
                                              <span class="spxx_x_con_left2">今天</span>
                                            </div>
                                            <div class="spxx_x_con_right">
                                              <span class="spxx_x_con_right1">会员：justyou0988</span>
                                              <span class="spxx_x_con_right2">
                                                <div class="spxx_x_con_right21">等级：</div>
                                                <div class="spxx_x_con_right22"><img src="${pageContext.request.contextPath }/100nnPc20/images/sp_07.png" /></div>
                                                <div class="spxx_x_con_right22"><img src="${pageContext.request.contextPath }/100nnPc20/images/sp_07.png" /></div>
                                              </span>
                                            </div>
                                          </li>
                                          <li>
                                            <div class="spxx_x_con_left">
                                              <span class="spxx_x_con_left1">好吃。第二次购买了。不过有种上"贼船"的感觉，因为吃了你家的米都不想吃别的米了。。。。
哈哈哈。。期待多搞活动啊。</span>
                                              <span class="spxx_x_con_left2">今天</span>
                                            </div>
                                            <div class="spxx_x_con_right">
                                              <span class="spxx_x_con_right1">会员：ShaRK</span>
                                              <span class="spxx_x_con_right2">
                                                <div class="spxx_x_con_right21">等级：</div>
                                                <div class="spxx_x_con_right22"><img src="${pageContext.request.contextPath }/100nnPc20/images/sp_07.png" /></div>
                                                <div class="spxx_x_con_right22"><img src="${pageContext.request.contextPath }/100nnPc20/images/sp_07.png" /></div>
                                              </span>
                                            </div>
                                          </li>
                                          <li>
                                            <div class="spxx_x_con_left">
                                              <span class="spxx_x_con_left1">这米确实好吃，真正软糯香，希望以后多多搞活动。高端大气上档次，必须的。。</span>
                                              <span class="spxx_x_con_left2">今天</span>
                                            </div>
                                            <div class="spxx_x_con_right">
                                              <span class="spxx_x_con_right1">会员：heyu3668</span>
                                              <span class="spxx_x_con_right2">
                                                <div class="spxx_x_con_right21">等级：</div>
                                                <div class="spxx_x_con_right22"><img src="${pageContext.request.contextPath }/100nnPc20/images/sp_07.png" /></div>
                                                <div class="spxx_x_con_right22"><img src="${pageContext.request.contextPath }/100nnPc20/images/sp_07.png" /></div>
                                              </span>
                                            </div>
                                          </li>
                                          <li>
                                            <div class="spxx_x_con_left">
                                              <span class="spxx_x_con_left1">超好吃，跟卖家说的一样，软，有香糯味。全家人都喜欢吃，外甥来我家吃饭，竟然吃了一大碗。
实惠好吃，值得。5分好评</span>
                                              <span class="spxx_x_con_left2">今天</span>
                                            </div>
                                            <div class="spxx_x_con_right">
                                              <span class="spxx_x_con_right1">会员：13111112397608</span>
                                              <span class="spxx_x_con_right2">
                                                <div class="spxx_x_con_right21">等级：</div>
                                                <div class="spxx_x_con_right22"><img src="${pageContext.request.contextPath }/100nnPc20/images/sp_07.png" /></div>
                                                <div class="spxx_x_con_right22"><img src="${pageContext.request.contextPath }/100nnPc20/images/sp_07.png" /></div>
                                              </span>
                                            </div>
                                          </li>
                                          <li>
                                            <div class="spxx_x_con_left">
                                              <span class="spxx_x_con_left1">这米确实好吃，真正软糯香，希望以后多多搞活动。高端大气上档次，必须的。。</span>
                                              <span class="spxx_x_con_left2">今天</span>
                                            </div>
                                            <div class="spxx_x_con_right">
                                              <span class="spxx_x_con_right1">会员：heyu3668</span>
                                              <span class="spxx_x_con_right2">
                                                <div class="spxx_x_con_right21">等级：</div>
                                                <div class="spxx_x_con_right22"><img src="${pageContext.request.contextPath }/100nnPc20/images/sp_07.png" /></div>
                                                <div class="spxx_x_con_right22"><img src="${pageContext.request.contextPath }/100nnPc20/images/sp_07.png" /></div>
                                              </span>
                                            </div>
                                          </li>
                                          <li>
                                            <div class="spxx_x_con_left">
                                              <span class="spxx_x_con_left1">高端绿色大米飞入寻常百姓家。顶起！超好吃！赞！赞！！！赞！！！！</span>
                                              <span class="spxx_x_con_left2">今天</span>
                                            </div>
                                            <div class="spxx_x_con_right">
                                              <span class="spxx_x_con_right1">会员：justyou0988</span>
                                              <span class="spxx_x_con_right2">
                                                <div class="spxx_x_con_right21">等级：</div>
                                                <div class="spxx_x_con_right22"><img src="${pageContext.request.contextPath }/100nnPc20/images/sp_07.png" /></div>
                                                <div class="spxx_x_con_right22"><img src="${pageContext.request.contextPath }/100nnPc20/images/sp_07.png" /></div>
                                              </span>
                                            </div>
                                          </li>
                                          <li>
                                            <div class="spxx_x_con_left">
                                              <span class="spxx_x_con_left1">好吃。第二次购买了。不过有种上"贼船"的感觉，因为吃了你家的米都不想吃别的米了。。。。
哈哈哈。。期待多搞活动啊。</span>
                                              <span class="spxx_x_con_left2">今天</span>
                                            </div>
                                            <div class="spxx_x_con_right">
                                              <span class="spxx_x_con_right1">会员：ShaRK</span>
                                              <span class="spxx_x_con_right2">
                                                <div class="spxx_x_con_right21">等级：</div>
                                                <div class="spxx_x_con_right22"><img src="${pageContext.request.contextPath }/100nnPc20/images/sp_07.png" /></div>
                                                <div class="spxx_x_con_right22"><img src="${pageContext.request.contextPath }/100nnPc20/images/sp_07.png" /></div>
                                              </span>
                                            </div>
                                          </li>
                                          <li>
                                            <div class="spxx_x_con_left">
                                              <span class="spxx_x_con_left1">这米确实好吃，真正软糯香，希望以后多多搞活动。高端大气上档次，必须的。。</span>
                                              <span class="spxx_x_con_left2">今天</span>
                                            </div>
                                            <div class="spxx_x_con_right">
                                              <span class="spxx_x_con_right1">会员：heyu3668</span>
                                              <span class="spxx_x_con_right2">
                                                <div class="spxx_x_con_right21">等级：</div>
                                                <div class="spxx_x_con_right22"><img src="${pageContext.request.contextPath }/100nnPc20/images/sp_07.png" /></div>
                                                <div class="spxx_x_con_right22"><img src="${pageContext.request.contextPath }/100nnPc20/images/sp_07.png" /></div>
                                              </span>
                                            </div>
                                          </li>
                                          <li>
                                            <div class="spxx_x_con_left">
                                              <span class="spxx_x_con_left1">超好吃，跟卖家说的一样，软，有香糯味。全家人都喜欢吃，外甥来我家吃饭，竟然吃了一大碗。
实惠好吃，值得。5分好评</span>
                                              <span class="spxx_x_con_left2">今天</span>
                                            </div>
                                            <div class="spxx_x_con_right">
                                              <span class="spxx_x_con_right1">会员：13111112397608</span>
                                              <span class="spxx_x_con_right2">
                                                <div class="spxx_x_con_right21">等级：</div>
                                                <div class="spxx_x_con_right22"><img src="${pageContext.request.contextPath }/100nnPc20/images/sp_07.png" /></div>
                                                <div class="spxx_x_con_right22"><img src="${pageContext.request.contextPath }/100nnPc20/images/sp_07.png" /></div>
                                              </span>
                                            </div>
                                          </li>
                                          <li>
                                            <div class="spxx_x_con_left">
                                              <span class="spxx_x_con_left1">这米确实好吃，真正软糯香，希望以后多多搞活动。高端大气上档次，必须的。。</span>
                                              <span class="spxx_x_con_left2">今天</span>
                                            </div>
                                            <div class="spxx_x_con_right">
                                              <span class="spxx_x_con_right1">会员：heyu3668</span>
                                              <span class="spxx_x_con_right2">
                                                <div class="spxx_x_con_right21">等级：</div>
                                                <div class="spxx_x_con_right22"><img src="${pageContext.request.contextPath }/100nnPc20/images/sp_07.png" /></div>
                                                <div class="spxx_x_con_right22"><img src="${pageContext.request.contextPath }/100nnPc20/images/sp_07.png" /></div>
                                              </span>
                                            </div>
                                          </li>
                                          <li>
                                            <div class="spxx_x_con_left">
                                              <span class="spxx_x_con_left1">高端绿色大米飞入寻常百姓家。顶起！超好吃！赞！赞！！！赞！！！！</span>
                                              <span class="spxx_x_con_left2">今天</span>
                                            </div>
                                            <div class="spxx_x_con_right">
                                              <span class="spxx_x_con_right1">会员：justyou0988</span>
                                              <span class="spxx_x_con_right2">
                                                <div class="spxx_x_con_right21">等级：</div>
                                                <div class="spxx_x_con_right22"><img src="${pageContext.request.contextPath }/100nnPc20/images/sp_07.png" /></div>
                                                <div class="spxx_x_con_right22"><img src="${pageContext.request.contextPath }/100nnPc20/images/sp_07.png" /></div>
                                              </span>
                                            </div>
                                          </li>
                                          <li>
                                            <div class="spxx_x_con_left">
                                              <span class="spxx_x_con_left1">好吃。第二次购买了。不过有种上"贼船"的感觉，因为吃了你家的米都不想吃别的米了。。。。
哈哈哈。。期待多搞活动啊。</span>
                                              <span class="spxx_x_con_left2">今天</span>
                                            </div>
                                            <div class="spxx_x_con_right">
                                              <span class="spxx_x_con_right1">会员：ShaRK</span>
                                              <span class="spxx_x_con_right2">
                                                <div class="spxx_x_con_right21">等级：</div>
                                                <div class="spxx_x_con_right22"><img src="${pageContext.request.contextPath }/100nnPc20/images/sp_07.png" /></div>
                                                <div class="spxx_x_con_right22"><img src="${pageContext.request.contextPath }/100nnPc20/images/sp_07.png" /></div>
                                              </span>
                                            </div>
                                          </li>
                                          <li>
                                            <div class="spxx_x_con_left">
                                              <span class="spxx_x_con_left1">这米确实好吃，真正软糯香，希望以后多多搞活动。高端大气上档次，必须的。。</span>
                                              <span class="spxx_x_con_left2">今天</span>
                                            </div>
                                            <div class="spxx_x_con_right">
                                              <span class="spxx_x_con_right1">会员：heyu3668</span>
                                              <span class="spxx_x_con_right2">
                                                <div class="spxx_x_con_right21">等级：</div>
                                                <div class="spxx_x_con_right22"><img src="${pageContext.request.contextPath }/100nnPc20/images/sp_07.png" /></div>
                                                <div class="spxx_x_con_right22"><img src="${pageContext.request.contextPath }/100nnPc20/images/sp_07.png" /></div>
                                              </span>
                                            </div>
                                          </li>
                                          <li>
                                            <div class="spxx_x_con_left">
                                              <span class="spxx_x_con_left1">超好吃，跟卖家说的一样，软，有香糯味。全家人都喜欢吃，外甥来我家吃饭，竟然吃了一大碗。
实惠好吃，值得。5分好评</span>
                                              <span class="spxx_x_con_left2">今天</span>
                                            </div>
                                            <div class="spxx_x_con_right">
                                              <span class="spxx_x_con_right1">会员：13111112397608</span>
                                              <span class="spxx_x_con_right2">
                                                <div class="spxx_x_con_right21">等级：</div>
                                                <div class="spxx_x_con_right22"><img src="${pageContext.request.contextPath }/100nnPc20/images/sp_07.png" /></div>
                                                <div class="spxx_x_con_right22"><img src="${pageContext.request.contextPath }/100nnPc20/images/sp_07.png" /></div>
                                              </span>
                                            </div>
                                          </li>
                                          <li>
                                            <div class="spxx_x_con_left">
                                              <span class="spxx_x_con_left1">这米确实好吃，真正软糯香，希望以后多多搞活动。高端大气上档次，必须的。。</span>
                                              <span class="spxx_x_con_left2">今天</span>
                                            </div>
                                            <div class="spxx_x_con_right">
                                              <span class="spxx_x_con_right1">会员：heyu3668</span>
                                              <span class="spxx_x_con_right2">
                                                <div class="spxx_x_con_right21">等级：</div>
                                                <div class="spxx_x_con_right22"><img src="${pageContext.request.contextPath }/100nnPc20/images/sp_07.png" /></div>
                                                <div class="spxx_x_con_right22"><img src="${pageContext.request.contextPath }/100nnPc20/images/sp_07.png" /></div>
                                              </span>
                                            </div>
                                          </li>
                                          <div class="spxx_x_con_x">
                                            <div class="spxx_x_con_xl">
                                            <a id="spxx_x_con_xll" href="#">[查看全部评价]</a>
                                            </div>
                                            <div class="spxx_x_con_xb">
                                            <a href="#">上一页</a>
                                            <a href="#">1</a>
                                            <a href="#">2</a>
                                            <a href="#">3</a>
                                            ...
                                            <a href="#">下一页</a>
                                            </div>
                                          </div>
                                          <div style="clear:both;"></div>
                                        </ul>
                                      </div>
                                    </div>
                                </div>
                                <!--[if !IE]>用户评价内容结束<![endif]-->
                                <!--[if !IE]>售后服务内容结束<![endif]-->
                                <div class="DVtabcontent" id="DVtabcontent3" style="display:none;">
                                  <div class="shff_a">
                                    <div class="shff_a_left">
                                    外卖超市出售均为正品，承诺提供"正品保障"服务。
                                    </div>
                                    <div class="shff_a_right">
                                    对于在外卖超市购物的买家提供"<br/>7天无理由退货"保障服务。
                                    </div>
                                  </div>
                                  <div class="shff_b">
                                  <img src="${pageContext.request.contextPath }/100nnPc20/images/ff_03.png"/>
                                  </div>
                                  <div class="shff_c">
                                  <img src="${pageContext.request.contextPath }/100nnPc20/images/ff_06.png"/>
                                  </div>
                                  <div class="shff_d">
                                  <img src="${pageContext.request.contextPath }/100nnPc20/images/ff_08.png"/>
                                  </div>
                                </div>
                                <!--[if !IE]>售后服务内容结束<![endif]-->
                            </div>
                            <!--[if !IE]>列表区域结束<![endif]-->
                        </div>
                    </div>
                    <!--[if !IE]>详细内容结束<![endif]-->
              </div>
              <!--[if !IE]>中部中左结束<![endif]-->
              <div style="clear:both;"></div>
            </div>
            <!--[if !IE]>中部中结束<![endif]-->
            <!--[if !IE]>中部下开始<![endif]-->
            <div class="content_foot">
              <!--[if !IE]>为您推荐开始<![endif]-->
              <div class="wntj">
                <div class="wntj_top">
                根据浏览为您推荐
                </div>
                <div class="wntj_con">
                  <div class="box_s">
	<div class="picbox">
		<ul class="piclist mainlist">
			 <s:iterator value="commodities" var="c" status="n">
				<li style="margin-right: 40px;">
					<a href="${pageContext.request.contextPath }/100nnPc20/qtcommoditynew_querycommodityinfo?c_id=<s:property value="#c.c_id"/>" target="_blank"><img src="${pageContext.request.contextPath }/imgss.jsp?file=<s:property value="#c.c_sltimg"/>" width="200" height="135" />
					<div class="wntj_con_c3"><a href="#"><s:property value="#c.c_name"/></a></div>
					<div class="wntj_con_c2"><s:property value="#c.c_jg" /></div>
					</a>
				</li>
			</s:iterator>
		</ul>
        <ul class="piclist swaplist"></ul>
	</div>
	<div class="og_prev"></div>
	<div class="og_next"></div>
</div>
                </div>
              </div>
              <!--[if !IE]>为您推荐结束<![endif]-->
            </div>
            <!--[if !IE]>中部下结束<![endif]-->
           </form>
        </div>
		<!--[if !IE]>中部结束<![endif]-->
        <!--[if !IE]>尾部开始<![endif]-->
        <div class="foot">
         <%@ include file="foot.jsp"%>
		</div>
        <!--[if !IE]>尾部结束<![endif]-->
    </div>
	<!--[if !IE]>主体结束<![endif]-->
</div>
<!--[if !IE]>网页结束<![endif]-->
<script type="text/javascript">
$(function(){
	$('#num').val(1);//结算价初始化
	var dj = $('#dj').html();//获取单价
	$('#jsj').html(dj);//结算价初始化
	$('#jia,#jian').click(function(){
		changeSL();
	})
	$('#num').on("input propertychange", function() {
		changeSL();
	}); 
	function changeSL(){
		var sl = $('#num').val();//获取数量
		$('#jsj').html((dj*sl).toFixed(2));
		}
	
	  $(".content_top_con_xn table tr").each(function(){
		  $(this).find("td").eq(1).css("padding-left","60px");
			 $(this).find("td").eq(2).css("padding-left","60px");
		  });
	  $
	  .ajax({
	  	type : "POST",
	  	url : "shoppingcar_querygwccount",
	  	success : function(msgs) {
	  		if(msgs=="登录超时,请重新登录"){
	  			
	  			$("#gwcnum").val("0");
	  		}else{
	  			
	  				var s="<a href=\"${pageContext.request.contextPath }/shoppingcar_querygwclist\">购物车有<span class=\"hz\" id=\"gwcnum\">"+msgs+"</span>件商品</a>";
	  				$("#gwc").html(s);
	  			
	  		}
	  	}
	  });
})
</script>
<script type="text/javascript">
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
</script>
<script type="text/javascript">
<!--切换-->
var activeDVTab = 1;
				   var activeDVTabContent = 1;
				   var zi;
				   for (zi = 2; zi <= 3; zi++) {
						document.getElementById("DVtabcontent"+zi).style.display = "none";
				   }
				   function showDVTabContent(zn) {
						document.getElementById("DVtabcontent" + activeDVTabContent).style.display = "none";
						document.getElementById("DVtabcontent" + zn).style.display = "";
						activeDVTabContent = zn;
					}
					function showDVTab(zn) {
						document.getElementById("DVtab" + activeDVTab).className = "DVTabBarNormal";
						document.getElementById("DVtab" + zn).className = "DVTabBarActive";
						activeDVTab = zn;
						showDVTabContent(zn);
				   }
//-->
</script>
 
 <script type="text/javascript" src="${pageContext.request.contextPath }/100nnPc20/js/spxx_tpck.js"></script> 
 <script type="text/javascript" src="${pageContext.request.contextPath }/100nnPc20/js/zzsc.js"></script>
 <script type="text/jscript" src="${pageContext.request.contextPath }/100nn/js/popup_layer.js"></script>
</body>         
       