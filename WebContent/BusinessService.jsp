<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="s" uri="/struts-tags"%>
<%@ page import="com.cisoft.model.User" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<meta name="Keywords" content="南宁同城快递超市、网上超市、快递超市、水果网上超市、日用品网上超市、南宁居民便民社区">
<meta name="description" content="南宁同城快递超市、网上超市、快递超市、水果网上超市、日用品网上超市、南宁居民便民社区">
<title>100南宁</title>
<link href="${pageContext.request.contextPath }/100nn/css/base.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath }/100nn/css/nav_style.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath }/100nn/css/100nnindex.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath }/100nn/css/foot_style.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath }/100nn/css/Untitled-2.css" rel="stylesheet" type="text/css" />
<script type="text/jscript" src="${pageContext.request.contextPath }/100nn/js/jquery-1.8.0.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
  $(".left_nav_mian_tz1").hide();
  $(".nav_button").click(function(){
	$(".left_nav_mian_tz1").hide();
    $(this).next(".left_nav_mian_tz1").show();
  });
  $(".left_nav_mian_tz").click(function(){
    //var p_html = $(".left_nav_mian_tz").html();
    var p_html = $(this).html();
	$(".nav_button").html(p_html);
    $(".left_nav_mian_tz1").hide();
  });
  
});
</script>
</head>
<body>
<!--[if !IE]> 头部|开始 <![endif]-->
<%@ include file="WEB-INF/100nn/top.jsp"%>
<!--[if !IE]> 头部|结束 <![endif]-->
<!--[if !IE]> 内容|开始 <![endif]-->
<div id="Mian">

<!--[if !IE]> 内容|导航开始 <![endif]-->
<div id="MianLeft">
  <%@ include file="/WEB-INF/100nn/menu.jsp"%>
</div>
<!--[if !IE]> 内容|导航结束 <![endif]-->
<!--[if !IE]> 内容|主内容开始 <![endif]-->
<!--[if !IE]> 内容|主内容开始 <![endif]-->
<div id="MianRight">
    <div id="MianRightM">
      <div class="MianRightML">
        <div class="MianRightMtop" >
          <div id="ppt3" class="com">
            <ul>
                <li><a href="#"><img src="Images/a_02.jpg"></a></li>
              <li><a href="#"><img src="Images/a_03.jpg"></a></li>
              <li><a href="#"><img src="Images/a_04.jpg"></a></li>
            </ul>
          </div>
        </div>
        <div class="MianRightMfoot"> 
            <a target="_blank"  href="qtcommodity_querycommdityList?commoditySort.cs_id=2" title="粮油副食"><img style="float:left;" src="Images/sy_03.jpg" /> </a> 
            <a target="_blank"  href="qtcommodity_querycommdityList?commoditySort.cs_id=5" title="居家日用"> <img style="float:left;" src="Images/sy_04.jpg"/> </a> 
            <a target="_blank"  href="qtcommodity_querycommdityList?commoditySort.cs_id=4" title="生疏果蔬"> <img style="float:left;" src="Images/sy_05.jpg"/> </a> 
            <a target="_blank"  href="qtcommodity_querycommdityList?commoditySort.cs_id=6" title="进口酒饮"> <img style="float:left;"  src="Images/sy_06.jpg"/> </a> 
         </div>
      </div>
    </div>
    <div class="sy_sys" style="margin-left: 20px;">
        <img src="Images/sy_sys_03.jpg" style="margin-left: 20px;margin-top: 20px;"/>
    </div>
  </div>
<!--[if !IE]> 内容|主内容开始 <![endif]-->
</div>
<!--[if !IE]> 内容|结束 <![endif]-->
<!--[if !IE]> 版权|开始 <![endif]-->
<div id="Foot">
	Copyright ©2005-2013 Cisoft Corporation, All Rights Reserved. 桂ICP备12002922号-1   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 版权所有：<a href="http://www.cisoft.cn/" title="广西南宁市熙软循环信息科技有限公司"  target="_blank">广西南宁市熙软循环信息科技有限公司</a><br/>
	友情链接：<a href="http://m.kuaidi100.com" target="_blank">快递查询</a>
</div>
<!--[if !IE]> 版权|结束 <![endif]-->
</body>
<script>
function bg(k){
	for(i=1;i<=2;i++){
		document.getElementById("kg"+i).style.display="none";
		//document.getElementById("bt_t"+i).style.color="#7f9bb1";
		document.getElementById("bt_t"+i).className="MianRight_mianYcontentList_MianTitlets";
		//document.getElementById("xz"+i).className="N_mianJh_xzjc_miantitleR_span";
		}
	document.getElementById("kg"+k).style.display="block";
	//document.getElementById("bt_t"+k).style.color="#ff7534";
	document.getElementById("bt_t"+k).className="MianRight_mianYcontentList_MianTitletsk";
	//document.getElementById("xz"+i).className="N_mianJh_xzjc_miantitleR_span1";
	}
</script>
<script>
function yr(k){
	for(i=1;i<=4;i++){
		document.getElementById("zhxxd"+i).style.display="none";
		//document.getElementById("bt_t"+i).style.color="#7f9bb1";
		document.getElementById("yhxx"+i).className="MianRight_mianYcontentList_MianTitletszhxx";
		//document.getElementById("xz"+i).className="N_mianJh_xzjc_miantitleR_span";
		}
	document.getElementById("zhxxd"+k).style.display="block";
	//document.getElementById("bt_t"+k).style.color="#ff7534";
	document.getElementById("yhxx"+k).className="MianRight_mianYcontentList_MianTitletyzxx";
	//document.getElementById("xz"+i).className="N_mianJh_xzjc_miantitleR_span1";
	}
</script>
<script> 
(function(e){function t(e,t){this.$ele=t,this.set=e,this.WH=this.set.vertical?t.height():t.width(),this.lis=t.find("ul li"),this.idx=0,this.timer=null}e.fn.myPic=function(n){return e.fn.myPic.defaults={vertical:!1,button:!0,auto:!0,effect:"scroll",onMouse:"mouseover"},this.each(function(){var r=n?e.extend(e.fn.myPic.defaults,n):e.fn.myPic.defaults,i=new t(r,e(this));r.button&&i.generate(e(this)),r.auto&&i.auto()}),this},t.prototype={generate:function(t){var n=e("<ol></ol>").appendTo(t),r=this;e.each(this.lis,function(t,r){e("<li>"+(t+1)+"</li>").appendTo(n)}),this.olis=t.find("ol li"),this.olis.eq(0).attr("class","on");switch(this.set.effect){case"scroll":t.find("ul").css({position:"absolute",left:0,top:0}),this.set.vertical&&this.lis.css({"float":"none"});break;case"flip":case"fade":this.lis.css({position:"absolute",left:0,top:0,"float":"none"}).eq(0).css("zIndex","2");break;case"in":this.lis.css({display:"none"}).eq(0).css("display","block");break;default:}t.delegate("ol li",this.set.onMouse,function(){var $this=e(this);setTimeout(function(){r.start($this.index())},300),r.stop()}).delegate("ol li","mouseout",function(){r.auto()})},start:function(e){this.idx=e,this.idx!=this.from&&(this.effect(this),this.reset())},effect:function(t){var n=t.idx,r={};switch(t.set.effect){case"scroll":r[t.set.vertical?"top":"left"]=-(n*this.WH),this.$ele.find("ul").stop(!0,!0).animate(r),r=null;break;case"flip":this.lis.eq(n).css("zIndex",1),this.lis.eq(this.from||0).stop(!0,!0).css("opacity",.8).animate({left:-100,opacity:0},600,function(){e(this).css({zIndex:0,opacity:1,left:0}),t.lis.eq(n).css("zIndex","2")});break;case"fade":this.lis.eq(n).css("zIndex","1"),this.lis.eq(this.from||0).stop(!0,!0).fadeOut(500,function(){e(this).css({zIndex:0,display:"block"}),t.lis.eq(n).css("zIndex","2")});break;case"in":this.lis.eq(this.from||0).stop(!0,!0).fadeOut(400,function(){t.lis.eq(n).stop(!0,!0).fadeIn(700)});default:}},reset:function(){this.olis.eq(this.from||0).attr("class",""),this.olis.eq(this.idx).attr("class","on"),this.from=this.idx||0},stop:function(){var e=this;clearInterval(e.timer)},auto:function(){var e=this,t=this.lis.length;this.timer=setInterval(function(){e.idx=e.idx>=t-1?0:++e.idx,e.start(e.idx)},3e3)}}})(jQuery);
$('#ppt').myPic({
	vertical:true
	
});
$('#ppt2').myPic({
	effect:"in"
});
$('#ppt3').myPic({
	effect:"fade"
});
$('#ppt4').myPic({
	effect:"flip"
});
$('#ppt5').myPic(); 
</script>
</html>