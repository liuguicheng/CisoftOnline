<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>

<!-- <meta name="viewport" content="width=device-width, initial-scale=1"> -->
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0;" name="viewport" />
<title>商品详情-售后服务</title>
<!--<link href="js/jquerymobile/jquery.mobile-1.4.0.min.css" rel="stylesheet" type="text/css" />-->
<link href="${pageContext.request.contextPath }/100nnwx/js/jquerymobile/zt/jquery.mobile-1.4.0.min.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath }/100nnwx/css/SecurityCenter.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${pageContext.request.contextPath }/100nnwx/js/jquery-1.8.3.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/100nnwx/js/jquerymobile/jquery.mobile-1.4.0.min.js"></script>

</head>
<body>
	<div data-role="page" style="background:#f5f5f5;">
		<div data-role="header" class="Top" style=" background:#8bc563; color:#FFF;text-shadow: 0 0 0 #eee;">
        <div class="Top_return"><a href="javascript:history.go(-1);" target="_self"><img src="${pageContext.request.contextPath }/100nnwx/img/return_button.gif" width="57" height="24"></a></div>
        商品详情
        <div class="Top_user_center">
        	<a href="wxSecurityCenter.jsp" target="_self"><img src="img/yh.gif" width="32" height="30"></a>
            <div class="Top_user_center_gwcIco"><a href="${pageContext.request.contextPath }/100nnwx/wxshoppingcar_getList" target="_self"><img src="${pageContext.request.contextPath }/100nnwx/img/gwc_ico.jpg" width="32" height="30"></a></div>
        </div>
        </div>
        
        
		<div role="main" class="ui-content" style="padding:0;">
            <div class="Mian_spcsTitle">
                <div class="Mian_spcsTitle_r" cellpadding="0" cellspacing="0">
                    <div class="Mian_spcsTitle_r_td" style="width:29%;border-top-left-radius:10px; border-bottom-left-radius:10px;border-right:#8bc563 solid 1px; "><a href="${pageContext.request.contextPath }/wxcommodity_querycommodityinfo?commodity.c_id=<%=request.getParameter("c_id") %>&bsid=2" target="_self">商品参数</a></div>
                    <div class="Mian_spcsTitle_r_td" style="width:40%; "><a href="wxGoodsDetails_yhpj.jsp?c_id=<%=request.getParameter("c_id") %>" target="_self">用户评价</a></div>
                    <div class="Mian_spcsTitle_r_td" style="width:30%;color:#FFF; background:#8bc563; border-top-right-radius:10px; border-bottom-right-radius:10px; text-shadow: 0 0 0 #f3f3f3; float:right">售后服务</div>
                    <div class="clear"></div>
                </div>
            </div>
            <div class="Mian_spcsmian_2">
                <div class="Mian_spcsmian_2_title"><span class="Mian_spcsmian_2_title_span1">正品保证<img src="${pageContext.request.contextPath }/100nnwx/img/7tzm.gif" width="17" height="16"></span></div>
                <div class="Mian_spcsmian_2_title"><span class="Mian_spcsmian_2_title_span2">外卖超市出售均为正品，承诺提供“正品保障”服务。</span></div>
            </div>
            <div class="Mian_spcsmian_2">
                <div class="Mian_spcsmian_2_title"><span class="Mian_spcsmian_2_title_span1">7天退货<img src="${pageContext.request.contextPath }/100nnwx/img/7tzm_ico.gif" width="17" height="16"></span></div>
                <div class="Mian_spcsmian_2_title"><span class="Mian_spcsmian_2_title_span2">对于在外卖超市购物的买家提供“7天无理由退货”保障服务。</span></div>
            </div>
            <div class="Mian_spcsmian_2">
                <div class="Mian_spcsmian_2_title"><span class="Mian_spcsmian_2_title_span1">外卖超市购物承诺</span></div>
                <div class="Mian_spcsmian_2_title"><span class="Mian_spcsmian_2_title_span2">外卖超市承诺所有商品均来自有品牌授权的供货商以 及正规厂家，均是符合国家相关行业标准与规定的正 品，所有商品都经过严格审核与挑选，请您放心购买。</span></div>
            </div>
            <div class="Mian_spcsmian_2">
                <div class="Mian_spcsmian_2_title"><span class="Mian_spcsmian_2_title_span1">退换货流程</span></div>
                <div class="Mian_spcsmian_3_title"><img src="img/th_lc.gif" width="300" height="356"></div>
            </div>
            <div class="Mian_spcsmian_2">
                <div class="Mian_spcsmian_2_title"><span class="Mian_spcsmian_2_title_span1">退换货政策</span></div>
                <div class="Mian_spcsmian_4_title">食品类商品如无质量问题，用户签收后，将不能进行退换货。<br>
<b>特别说明，存在以下情形之一的，外卖超市不承担退换货责任</b><br>
1.任何非购自外卖超市的商品。<br>
2.任何因客户使用或保管不当导致出现质量问题的商品。<br>
3.任何因客户原因导致超过保质期的商品。<br>
4.仅赠品存在问题，且不影响主要商品使用或食用的<br><br>

注：<br>
1.用户在退货时不再享有商品的相关优惠政策。<br>
2.为了保证您的食用安全，凡经退换的商品一律不再上架。为避免造成不必要的浪费，请您在购物时细心挑选您所需要的商品。<br>
<br>
<span class="Mian_spcsmian_4_titleSpan">*温馨提示*</span><br>
为了您的利益，请收到货物后仔细清点检查您订购的商品。如商品配送有误、包装破损、产品腐烂、数量不对等问题，请当面及时向配送人员提出，以便我们能尽快的为您处理。<br>
客服电话：400-8061-026
</div>
            </div>
		</div>

<!--        <div data-role="footer">
		</div>-->
	</div>
</body>
</html>