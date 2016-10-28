<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<!-- <meta name="viewport" content="width=device-width, initial-scale=1"> -->
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0;" name="viewport" />
<title>商品详情-用户评价</title>
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
                    <div class="Mian_spcsTitle_r_td" style="width:40%;color:#FFF; background:#8bc563;text-shadow: 0 0 0 #f3f3f3;">用户评价</div>
                    <div class="Mian_spcsTitle_r_td" style="width:30%; border-top-right-radius:10px; border-bottom-right-radius:10px;  float:right"><a href="wxGoodsDetails_shfw.jsp?c_id=<%=request.getParameter("c_id") %>" target="_self">售后服务</a></div>
                    <div class="clear"></div>
                </div>
            </div>
            <table class="Mian_spcsmian_2" cellpadding="0" cellspacing="0">
            	<tr>
                    <td width="80"><img src="${pageContext.request.contextPath }/100nnwx/img/yh_ico.gif" width="80" height="138"></td>
                    <td>
                    	<div class="Mian_yhpj_Name">ShaRK </div>
                        <div class="Mian_yhpj_Mian">高端绿色大米飞入寻常百姓家。顶起！超好吃！赞！赞！！！赞！！！！</div>
                        <div class="Mian_yhpj_Time">2014-01-20 </div>
                    </td>
                </tr>
            </table>
            <table class="Mian_spcsmian_2" cellpadding="0" cellspacing="0">
            	<tr>
                    <td width="80"><img src="${pageContext.request.contextPath }/100nnwx/img/yh_ico.gif" width="80" height="138"></td>
                    <td>
                    	<div class="Mian_yhpj_Name">ShaRK </div>
                        <div class="Mian_yhpj_Mian">高端绿色大米飞入寻常百姓家。顶起！超好吃！赞！赞！！！赞！！！！</div>
                        <div class="Mian_yhpj_Time">2014-01-20 </div>
                    </td>
                </tr>
            </table>
            <table class="Mian_spcsmian_2" cellpadding="0" cellspacing="0">
            	<tr>
                    <td width="80"><img src="${pageContext.request.contextPath }/100nnwx/img/yh_ico.gif" width="80" height="138"></td>
                    <td>
                    	<div class="Mian_yhpj_Name">ShaRK </div>
                        <div class="Mian_yhpj_Mian">高端绿色大米飞入寻常百姓家。顶起！超好吃！赞！赞！！！赞！！！！</div>
                        <div class="Mian_yhpj_Time">2014-01-20 </div>
                    </td>
                </tr>
            </table>
            <table class="Mian_spcsmian_2" cellpadding="0" cellspacing="0">
            	<tr>
                    <td width="80"><img src="${pageContext.request.contextPath }/100nnwx/img/yh_ico.gif" width="80" height="138"></td>
                    <td>
                    	<div class="Mian_yhpj_Name">ShaRK </div>
                        <div class="Mian_yhpj_Mian">高端绿色大米飞入寻常百姓家。顶起！超好吃！赞！赞！！！赞！！！！</div>
                        <div class="Mian_yhpj_Time">2014-01-20 </div>
                    </td>
                </tr>
            </table>
            <table class="Mian_spcsmian_2" cellpadding="0" cellspacing="0">
            	<tr>
                    <td width="80"><img src="${pageContext.request.contextPath }/100nnwx/img/yh_ico.gif" width="80" height="138"></td>
                    <td>
                    	<div class="Mian_yhpj_Name">ShaRK </div>
                        <div class="Mian_yhpj_Mian">高端绿色大米飞入寻常百姓家。顶起！超好吃！赞！赞！！！赞！！！！</div>
                        <div class="Mian_yhpj_Time">2014-01-20 </div>
                    </td>
                </tr>
            </table>
            
		</div>

<!--        <div data-role="footer">
		</div>-->
	</div>
</body>
</html>