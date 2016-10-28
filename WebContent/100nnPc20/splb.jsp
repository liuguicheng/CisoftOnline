<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="s" uri="/struts-tags"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>100南宁－快递超市</title>
<link href="${pageContext.request.contextPath }/100nnPc20/css/base.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath }/100nnPc20/css/splb.css" rel="stylesheet" type="text/css"/>
<link type="text/css" href="${pageContext.request.contextPath }/100nnPc20/css/zzsc.css" rel="stylesheet" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/100nnPc20/css/font-awesome.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/100nnPc20/css/vendor/normalize.css" />
		<link rel="stylesheet" href="${pageContext.request.contextPath }/100nnPc20/css/styles.min.css" />
		<link href="${pageContext.request.contextPath }/100nnPc20/css/jplist.min.css" rel="stylesheet" type="text/css" />		
		
<script src="${pageContext.request.contextPath }/js/jq1.9.js"></script>
<script>window._bd_share_config={"common":{"bdSnsKey":{},"bdText":"","bdMini":"2","bdMiniList":false,"bdPic":"","bdStyle":"0","bdSize":"16"},"slide":{"type":"slide","bdImg":"2","bdPos":"right","bdTop":"100"},"image":{"viewList":["qzone","tsina","tqq","renren","weixin"],"viewText":"分享到：","viewSize":"16"},"selectShare":{"bdContainerClass":null,"bdSelectMiniList":["qzone","tsina","tqq","renren","weixin"]}};with(document)0[(getElementsByTagName('head')[0]||body).appendChild(createElement('script')).src='http://bdimg.share.baidu.com/static/api/js/share.js?v=89860593.js?cdnversion='+~(-new Date()/36e5)];</script>
<!--返回顶部-->
<script type="text/javascript">

$(document).ready(function(){

    //首先将#back-to-top隐藏

    $("#back-to-top").hide();

    //当滚动条的位置处于距顶部100像素以下时，跳转链接出现，否则消失

    $(function () {

    $(window).scroll(function(){

    if ($(window).scrollTop()>200){

    $("#back-to-top").fadeIn(400);

    }

    else

    {

    $("#back-to-top").fadeOut(400);

    }

    });

    //当点击跳转链接后，回到页面顶部位置

    $("#back-to-top").click(function(){

    $('body,html').animate({scrollTop:0},500);

    return false;

    });

    });

    });
</script>
<!--返回顶部-->

<script>function changeImg(){var div = document.getElementById("th2");if(div.style.backgroundImage = "url(../images/jt.gif)"){div.style.backgroundImage = "url(../images/jtx.gif)";}else{div.style.backgroundImage = "url(../images/jt.gif)";}}</script>
<!--<div id="th2" onclick="changeImg()"></div>
-->
</head>

<body>
<!--主体开始-->
<div id="box">
 <!--头部开始-->
 <div>
  <%@ include file="top.jsp"%>
 </div>
 <!--头部结束-->
 <!--内容开始-->
 <div class="cc">
  <div class="con">
   <div class="con_c">
    <div class="location"><span class="bor">
    <s:if test="sortid==2">
    粮油副食
    </s:if>
    <s:elseif test="sortid==4">生鲜果蔬</s:elseif>
      <s:elseif test="sortid==5">居家日用</s:elseif>
        <s:elseif test="sortid==6">进口酒饮</s:elseif>
    </span></div>
    <div class="q_link">
     <div class="q_link_left">品牌</div>
     <div class="q_link_middle">
      <ul>
      <s:iterator value="commodityBrandlist"  >
       <li><a href="#" title="" target="_blank"><s:property value="cb_name"/> </a></li>
       </s:iterator>
      <!--  <li><a href="#" title="" target="_blank">胡姬花</a></li>
       <li><a href="#" title="" target="_blank">鲁花</a></li>
       <li><a href="#" title="" target="_blank">福临门</a></li>
       <li><a href="#" title="" target="_blank">多力</a></li>
       <li><a href="#" title="" target="_blank">融氏</a></li>
       <li><a href="#" title="" target="_blank">金龙鱼</a></li>
       <li><a href="#" title="" target="_blank">胡姬花</a></li>
       <li><a href="#" title="" target="_blank">鲁花</a></li>
       <li><a href="#" title="" target="_blank">福临门</a></li>
       <li><a href="#" title="" target="_blank">多力</a></li>
       <li><a href="#" title="" target="_blank">融氏</a></li>
       <li><a href="#" title="" target="_blank">金龙鱼</a></li>
       <li><a href="#" title="" target="_blank">胡姬花</a></li>
       <li><a href="#" title="" target="_blank">鲁花</a></li>
       <li><a href="#" title="" target="_blank">福临门</a></li>
       <li><a href="#" title="" target="_blank">多力</a></li>
       <li><a href="#" title="" target="_blank">融氏</a></li>
       <li><a href="#" title="" target="_blank">金龙鱼</a></li>
       <li><a href="#" title="" target="_blank">胡姬花</a></li>
       <li><a href="#" title="" target="_blank">鲁花</a></li>
       <li><a href="#" title="" target="_blank">福临门</a></li>
       <li><a href="#" title="" target="_blank">多力</a></li>
       <li><a href="#" title="" target="_blank">融氏</a></li> -->
      </ul>
     </div>
<!--     <div class="more">
      <div class="more1"><a href="#">多选</a></div>
      <div class="more2">更多</div>
     </div>
-->    </div>
    <div class="link2">
     <ul>
     <li>您是不是想找:</li>
     <li><a href="#" title="玉米油" target="_blank">玉米油</a></li>
     <li><a href="#" title="菜籽油" target="_blank">菜籽油</a></li>
     <li><a href="#" title="葵花籽油" target="_blank">葵花籽油</a></li>
     <li><a href="#" title="鲁花" target="_blank">鲁花</a></li>
     <li><a href="#" title="大豆油" target="_blank">大豆油</a></li>
     </ul>
    </div>
    <div class="xz">
     <div class="zh1"><a href="#" title="综合">综合</a></div>
     <div id="zh2" onclick="changeImg()"><a href="#" title="销量">销量</a></div>
     <div id="zh2" onclick="changeImg()"><a href="#" title="新品">新品</a></div>
     <div id="zh2" onclick="changeImg()"><a href="#" title="评论">评论</a></div>
     <div class="zh3"><a href="#" title="价格">价格</a></div>
     <div class="price">
      <div class="price1"><input name="" type="text"  value="￥"/></div>
      <div class="fh">-</div>
      <div class="price2"><input name="" type="text" value="￥"></div>
     </div>
    </div>
    <%-- <div class="ProductsList1">
     <div class="pl1">
      <a href="#" target="_blank">
       <div class="pl1_top"><img src="images/you.gif" width="232" height="236" /></div>
       <div class="pl1_bottom"><span class="ht">胡姬花&nbsp;古法小榨花生油&nbsp;5l/桶</span><br />
        <span class="hz">￥58.80</span>&nbsp;&nbsp;<del>60</del>
       </div>
      </a>
     </div>
     <div class="pl1">
      <a href="#" target="_blank">
       <div class="pl1_top"><img src="images/you.gif" width="232" height="236" /></div>
       <div class="pl1_bottom"><span class="ht">胡姬花&nbsp;古法小榨花生油&nbsp;5l/桶</span><br />
        <span class="hz">￥58.80</span>&nbsp;&nbsp;<del>60</del>
       </div>
      </a>
     </div>
     <div class="pl1">
      <a href="#" target="_blank">
       <div class="pl1_top"><img src="images/you.gif" width="232" height="236" /></div>
       <div class="pl1_bottom"><span class="ht">胡姬花&nbsp;古法小榨花生油&nbsp;5l/桶</span><br />
        <span class="hz">￥58.80</span>&nbsp;&nbsp;<del>60</del>
       </div>
      </a>
     </div>
     <div class="pl2">
      <a href="#" target="_blank">
       <div class="pl1_top"><img src="images/you.gif" width="232" height="236" /></div>
       <div class="pl1_bottom"><span class="ht">胡姬花&nbsp;古法小榨花生油&nbsp;5l/桶</span><br />
        <span class="hz">￥58.80</span>&nbsp;&nbsp;<del>60</del>
       </div>
      </a>
     </div>
    </div>
    <div class="ProductsList1">
     <div class="pl1">
      <a href="#" target="_blank">
       <div class="pl1_top"><img src="images/you.gif" width="232" height="236" /></div>
       <div class="pl1_bottom"><span class="ht">胡姬花&nbsp;古法小榨花生油&nbsp;5l/桶</span><br />
        <span class="hz">￥58.80</span>&nbsp;&nbsp;<del>60</del>
       </div>
      </a>
     </div>
     <div class="pl1">
      <a href="#" target="_blank">
       <div class="pl1_top"><img src="images/you.gif" width="232" height="236" /></div>
       <div class="pl1_bottom"><span class="ht">胡姬花&nbsp;古法小榨花生油&nbsp;5l/桶</span><br />
        <span class="hz">￥58.80</span>&nbsp;&nbsp;<del>60</del>
       </div>
      </a>
     </div>
     <div class="pl1">
      <a href="#" target="_blank">
       <div class="pl1_top"><img src="images/you.gif" width="232" height="236" /></div>
       <div class="pl1_bottom"><span class="ht">胡姬花&nbsp;古法小榨花生油&nbsp;5l/桶</span><br />
        <span class="hz">￥58.80</span>&nbsp;&nbsp;<del>60</del>
       </div>
      </a>
     </div>
     <div class="pl2">
      <a href="#" target="_blank">
       <div class="pl1_top"><img src="images/you.gif" width="232" height="236" /></div>
       <div class="pl1_bottom"><span class="ht">胡姬花&nbsp;古法小榨花生油&nbsp;5l/桶</span><br />
        <span class="hz">￥58.80</span>&nbsp;&nbsp;<del>60</del>
       </div>
      </a>
     </div>
    </div>
    <div class="ProductsList1">
     <div class="pl1">
      <a href="#" target="_blank">
       <div class="pl1_top"><img src="images/you.gif" width="232" height="236" /></div>
       <div class="pl1_bottom"><span class="ht">胡姬花&nbsp;古法小榨花生油&nbsp;5l/桶</span><br />
        <span class="hz">￥58.80</span>&nbsp;&nbsp;<del>60</del>
       </div>
      </a>
     </div>
     <div class="pl1">
      <a href="#" target="_blank">
       <div class="pl1_top"><img src="images/you.gif" width="232" height="236" /></div>
       <div class="pl1_bottom"><span class="ht">胡姬花&nbsp;古法小榨花生油&nbsp;5l/桶</span><br />
        <span class="hz">￥58.80</span>&nbsp;&nbsp;<del>60</del>
       </div>
      </a>
     </div>
     <div class="pl1">
      <a href="#" target="_blank">
       <div class="pl1_top"><img src="images/you.gif" width="232" height="236" /></div>
       <div class="pl1_bottom"><span class="ht">胡姬花&nbsp;古法小榨花生油&nbsp;5l/桶</span><br />
        <span class="hz">￥58.80</span>&nbsp;&nbsp;<del>60</del>
       </div>
      </a>
     </div>
     <div class="pl2">
      <a href="#" target="_blank">
       <div class="pl1_top"><img src="images/you.gif" width="232" height="236" /></div>
       <div class="pl1_bottom"><span class="ht">胡姬花&nbsp;古法小榨花生油&nbsp;5l/桶</span><br />
        <span class="hz">￥58.80</span>&nbsp;&nbsp;<del>60</del>
       </div>
      </a>
     </div>
    </div>
    <div class="ProductsList1">
     <div class="pl1">
      <a href="#" target="_blank">
       <div class="pl1_top"><img src="images/you.gif" width="232" height="236" /></div>
       <div class="pl1_bottom"><span class="ht">胡姬花&nbsp;古法小榨花生油&nbsp;5l/桶</span><br />
        <span class="hz">￥58.80</span>&nbsp;&nbsp;<del>60</del>
       </div>
      </a>
     </div>
     <div class="pl1">
      <a href="#" target="_blank">
       <div class="pl1_top"><img src="images/you.gif" width="232" height="236" /></div>
       <div class="pl1_bottom"><span class="ht">胡姬花&nbsp;古法小榨花生油&nbsp;5l/桶</span><br />
        <span class="hz">￥58.80</span>&nbsp;&nbsp;<del>60</del>
       </div>
      </a>
     </div>
     <div class="pl1">
      <a href="#" target="_blank">
       <div class="pl1_top"><img src="images/you.gif" width="232" height="236" /></div>
       <div class="pl1_bottom"><span class="ht">胡姬花&nbsp;古法小榨花生油&nbsp;5l/桶</span><br />
        <span class="hz">￥58.80</span>&nbsp;&nbsp;<del>60</del>
       </div>
      </a>
     </div>
     <div class="pl2">
      <a href="#" target="_blank">
       <div class="pl1_top"><img src="images/you.gif" width="232" height="236" /></div>
       <div class="pl1_bottom"><span class="ht">胡姬花&nbsp;古法小榨花生油&nbsp;5l/桶</span><br />
        <span class="hz">￥58.80</span>&nbsp;&nbsp;<del>60</del>
       </div>
      </a>
     </div>
    </div> --%>
   <!--  <div class="page"><img src="images/fy.gif" width="1001" height="46" /></div> -->
   <!-- main content -->
   <!-- 商品详细主体开始-->
   <div style="margin-top: 10px;border: 1px solid #e4e4e4;min-height: 500px;margin-bottom: 20px;">
		<div id="main-content" class="box" style="">
			<div class="center">
				<div id="page-content" class="box">

					
					<!-- demo -->
					<div id="demo" class="box jplist">
					
						<!-- ios button: show/hide panel -->
						<div class="jplist-ios-button">
							<i class="fa fa-sort"></i>
							<!-- jPList Actions -->
						</div>
						
						<!-- panel -->
						<div class="jplist-panel box panel-top">						
							
							<!-- reset button -->
							<%-- <button 
								type="button" 
								class="jplist-reset-btn"
								data-control-type="reset" 
								data-control-name="reset" 
								data-control-action="reset">
								复位 &nbsp;<i class="fa fa-share"></i>
							</button>
							
							<div 
								class="jplist-drop-down" 
								data-control-type="drop-down" 
								data-control-name="paging" 
								data-control-action="paging">
								<ul>
									<li><span data-number="5">每页显示5条 </span></li>
									<li><span data-number="10" data-default="true"> 每页显示10条</span></li>
									<li><span data-number="15"> 每页显示15条 </span></li>
									<li><span data-number="all"> 显示所有 </span></li>
								</ul>
							</div>
							
							<div 
								class="jplist-drop-down" 
								data-control-type="drop-down" 
								data-control-name="sort" 
								data-control-action="sort">
								<ul>
									<li><span data-path="default">排序</span></li>
									<li><span data-path=".title" data-order="asc" data-type="text">标题排序 A-Z</span></li>
									<li><span data-path=".title" data-order="desc" data-type="text">标题排序 Z-A</span></li>
									<li><span data-path=".desc" data-order="asc" data-type="text">Description A-Z</span></li>
									<li><span data-path=".desc" data-order="desc" data-type="text">Description Z-A</span></li>
									<li><span data-path=".like" data-order="asc" data-type="number" data-default="true">Likes asc</span></li>
									<li><span data-path=".like" data-order="desc" data-type="number">Likes desc</span></li>
									<li><span data-path=".date" data-order="asc" data-type="datetime">Date asc</span></li>
									<li><span data-path=".date" data-order="desc" data-type="datetime">Date desc</span></li>
								</ul>
							</div> --%>
							
							<!-- filter by title -->
							<!-- <div class="text-filter-box">
							
								<i class="fa fa-search  jplist-icon"></i>
								
								[if lt IE 10]>
								<div class="jplist-label">Filter by Title:</div>
								<![endif]
								
								<input 
									data-path=".title" 
									type="text" 
									value="" 
									placeholder="输入商品名称" 
									data-control-type="textbox" 
									data-control-name="title-filter" 
									data-control-action="filter"
								/>
							</div>
							 -->
							<!-- filter by description -->
							<!-- <div class="text-filter-box">
								
								<i class="fa fa-search  jplist-icon"></i>
								
								[if lt IE 10]>
								<div class="jplist-label">Filter by Description:</div>
								<![endif]
								
								<input 
									data-path=".desc" 
									type="text" 
									value="" 
									placeholder="Filter by Description" 
									data-control-type="textbox" 
									data-control-name="desc-filter" 
									data-control-action="filter"
								/>	
							</div> -->
							
							<!-- views -->
							<div 
								class="jplist-views" 
								data-control-type="views" 
								data-control-name="views" 
								data-control-action="views"
								data-default="jplist-grid-view" style="margin-top: -60px;margin-left: 820px;">
								
								<button type="button" class="jplist-view jplist-list-view" data-type="jplist-list-view"></button>
								<button type="button" class="jplist-view jplist-grid-view" data-type="jplist-grid-view"></button>
								<button type="button" class="jplist-view jplist-thumbs-view" data-type="jplist-thumbs-view"></button>
							</div>
							
							<!-- pagination results -->
							<!-- <div 
								class="jplist-label" 
								data-type="{current} / {pages}" 
								data-control-type="pagination-info" 
								data-control-name="paging" 
								data-control-action="paging">
							</div> -->
								
							<!-- pagination -->
							<!-- <div 
								class="jplist-pagination" 
								data-control-type="pagination" 
								data-control-name="paging" 
								data-control-action="paging">
							</div>	 -->
							
						</div>
						
						
						<!-- data -->   
						<div class="list box text-shadow">
							<s:iterator value="#commditylist" var="c"   status='st'>
							<!-- item 1 -->
							<div class="list-item box" >		
							
							<a href="${pageContext.request.contextPath }/100nnPc20/qtcommoditynew_querycommodityinfo?c_id=<s:property value="#c.c_id"/>" target="_blank">			
								<!-- img -->
								<div class="img left">
									<img src="${pageContext.request.contextPath }/imgss.jsp?file=<s:property value="#c.c_sltimg"/>" alt="<s:property value="#c.c_name"/>" title="<s:property value="#c.c_name"/>" />
								</div>
								
								<!-- data -->
								<div class="block right">
									<p class="date" style="color: red;font-size: 14px;">￥<s:property value="#c.c_jg" />  <span style="color:#000;">/</span><span style="text-decoration:line-through;font-size: 10px;margin-left: 5px;color:#5e5e5e;">  ¥<s:property value="c_scjg"/></span></p>
									<p class="title" style="color:#000;"><s:property value="#c.c_name"/></p>
									<p class="desc">
									<s:property value="#c.c_splbms"/>
									</p>
									<p class="like"><s:property value="#c.c_djs" /> 关注度</p>
								</div>
							</a>
							</div>
							
						
							</s:iterator>
														
							
							
						</div>	
						
						<!-- <div class="box jplist-no-results text-shadow align-center">
							<p>没有找到结果</p>
						</div> -->
						
						<!-- ios button: show/hide panel -->
						<div class="jplist-ios-button">
							<i class="fa fa-sort"></i>
							<!-- jPList Actions -->
						</div>
						
						<!-- panel -->
						<div class="jplist-panel box panel-bottom">						
													
							 <div 
								class="jplist-drop-down" 
								data-control-type="drop-down" 
								data-control-name="paging" 
								data-control-action="paging"
								data-control-animate-to-top="true">
								<ul>
									
									<li><span data-number="5">每页显示5条 </span></li>
									<li><span data-number="10" data-default="true"> 每页显示10条</span></li>
									<li><span data-number="15"> 每页显示15条 </span></li>
									<li><span data-number="all"> 显示所有 </span></li>
								</ul> 
							</div>
							<%--<div 
								class="jplist-drop-down" 
								data-control-type="drop-down" 
								data-control-name="sort" 
								data-control-action="sort"
								data-control-animate-to-top="true">
								<ul>
									<li><span data-path="default">排序</span></li>
									<li><span data-path=".title" data-order="asc" data-type="text">Title A-Z</span></li>
									<li><span data-path=".title" data-order="desc" data-type="text">Title Z-A</span></li>
									<li><span data-path=".desc" data-order="asc" data-type="text">Description A-Z</span></li>
									<li><span data-path=".desc" data-order="desc" data-type="text">Description Z-A</span></li>
									<li><span data-path=".like" data-order="asc" data-type="number">Likes asc</span></li>
									<li><span data-path=".like" data-order="desc" data-type="number">Likes desc</span></li>
									<li><span data-path=".date" data-order="asc" data-type="datetime">Date asc</span></li>
									<li><span data-path=".date" data-order="desc" data-type="datetime">Date desc</span></li>
								</ul>
							</div> --%>
							
							<!-- pagination results -->
							<div 
								class="jplist-label" 
								data-type="{start} - {end} /{all}"
								data-control-type="pagination-info" 
								data-control-name="paging" 
								data-control-action="paging">
							</div>
								
							<!-- pagination -->
							<div 
								class="jplist-pagination" 
								data-control-type="pagination" 
								data-control-name="paging" 
								data-control-action="paging"
								data-control-animate-to-top="true">
							</div>					
						</div>
					</div>
					<!-- end of demo -->
				</div>
			</div>
		</div>
		<div style="clear: both;"></div>
		</div>	
		<!-- 商品详细主体结束 -->
   
     <!-- 推荐商品  开始 -->
    <div class="con_bottom">
     <div class="con_bottom_top">根据浏览为您推荐</div>
   
     <div class="con_bottom_bottom"><!-- <img src="images/gdt.gif" width="998" height="230" /> -->
     		<div class="box_s">
	<div class="picbox">
		<ul class="piclist mainlist">
			 <s:iterator value="commodities" var="c" status="n">
				<li>
					<a href="${pageContext.request.contextPath }/100nnPc20/qtcommoditynew_querycommodityinfo?c_id=<s:property value="#c.c_id"/>" target="_blank"><img src="${pageContext.request.contextPath }/imgss.jsp?file=<s:property value="#c.c_sltimg"/>" width="220" height="105" />
					<div class="wntj_con_c3"><a href="#"><s:property value="#c.c_name"/></a></div>
					<div class="wntj_con_c2"><s:property value="#c.c_jg" /></div>
					</a>
				</li>
			</s:iterator>
		</ul>
        <ul class="piclist swaplist"></ul>
	</div>
	<div class="og_prev" style="opacity: 0.7;"></div>
	<div class="og_next" style="opacity: 0.7;"></div>
</div>
     </div>
    </div>
     <!-- 推荐商品  结束 -->
     
     
    <div  class="right_link">
     <div  id="gw"><a href="javascript:void(0);" title="购物车"><img src="${pageContext.request.contextPath }/100nnPc20/images/bb1.gif" width="44" height="44" /></a></div>
     <%-- <div  id="cyc"><a href="#" title="浏览足迹"><img src="${pageContext.request.contextPath }/100nnPc20/images/bb2.gif" width="44" height="44" /></a></div> --%>
     <div  id="sj"><a href="#" title="微信扫一扫" onmouseover="mopen('m1');" onmouseout="mclosetime();"><img src="${pageContext.request.contextPath }/100nnPc20/images/bb3.gif" width="44" height="44" /></a></div>
      <div id="m1" onmouseover="mcancelclosetime()" onmouseout="mclosetime()" style="visibility: hidden;">
                              <a class="sys_1" href="#"><img src="${pageContext.request.contextPath }/100nnPc20/images/qrcode_for_gh_1e1c145c2809_430.jpg" width="136px" height="136px;"></a>
		                      <a class="sys_2"><img src="${pageContext.request.contextPath }/100nnPc20/images/sys3_09.jpg"></a>
		                    </div>
     
     <div  id="back-to-top"><a href="#top" target="_self" title="返回顶部"><img src="${pageContext.request.contextPath }/100nnPc20/images/bb4.gif" width="44" height="44" /></a></div>
    </div>
     
    
   </div>
  </div> 
 </div>
 <!--内容结束-->
 <!--尾部开始-->
 <div>
  <%@ include file="foot.jsp"%>
 </div>
 
 <!--尾部结束-->
</div>
<!--主体结束-->
</body>
<!-- 为你推荐  滚动图片js -->
 <script type="text/javascript" src="${pageContext.request.contextPath }/100nnPc20/js/zzsc.js"></script>
		<!-- js -->		
		<script src="${pageContext.request.contextPath }/100nnPc20/js/vendor/modernizr.min.js"></script>
		
		<script src="${pageContext.request.contextPath }/100nnPc20/js/jplist.min.js"></script>
 <script>
			$('document').ready(function(){
				$('#demo').jplist({
				
					//main options
					itemsBox: '.list' 
					,itemPath: '.list-item' 
					,panelPath: '.jplist-panel'
					//save plugin state
					,storage: 'localstorage' //'', 'cookies', 'localstorage'			
					,storageName: 'views'
				});
				
				$("#gw").find("a").click(function(){
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
					
						}else{
							if($("#gw").find("a").attr("href")=="javascript:void(0);"){
								$("#gw").find("a").attr("href","${pageContext.request.contextPath }/shoppingcar_querygwclist");
							}
							
							$("#gw").find("a").trigger("click");
						}
					}
				});
				});
			});
			

			//微信扫一扫 js
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
			</script>
</html>
