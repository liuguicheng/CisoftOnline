<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>    
<!DOCTYPE>
<html>
<head>
<!-- <meta name="viewport" content="width=device-width, initial-scale=1"> -->
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0;" name="viewport" />
<title>商品详情-商品参数</title>
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
        	<a href="100nnwx/wxSecurityCenter.jsp" target="_self"><img src="100nnwx/img/yh.gif" width="32" height="30"></a>
            <div class="Top_user_center_gwcIco"><a href="${pageContext.request.contextPath }/100nnwx/wxshoppingcar_getList" target="_self"><img src="${pageContext.request.contextPath }/100nnwx/img/gwc_ico.jpg" width="32" height="30"></a></div>
        </div>
        </div>
        
        
		<div role="main" class="ui-content" style="padding:0;">
        <div class="Mian_spcsTitle">
        	<div class="Mian_spcsTitle_r" cellpadding="0" cellspacing="0">
                	<div class="Mian_spcsTitle_r_td" style="width:30%;color:#FFF; background:#8bc563; border-top-left-radius:10px; border-bottom-left-radius:10px; text-shadow: 0 0 0 #f3f3f3;">商品参数</div>
                    <div class="Mian_spcsTitle_r_td" style="width:40%; border-right:#8bc563 solid 1px;"><a href="100nnwx/wxGoodsDetails_yhpj.jsp?c_id=<s:property value="commodity.c_id"/>" target="_self">用户评价</a></div>
                    <div class="Mian_spcsTitle_r_td" style="width:29%; border-top-right-radius:10px; border-bottom-right-radius:10px;"><a href="100nnwx/wxGoodsDetails_shfw.jsp?c_id=<s:property value="commodity.c_id"/>" target="_self">售后服务</a></div>
                    <div class="clear"></div>
            </div>
            
        </div>
        <s:iterator value="sxmap" id="id" status="st">
          <table class="Mian_spcsmian_1" cellpadding="0" cellspacing="0">
            	<tr>
                	<td width="100" align="center" style="color:#5f5f5f;"><s:property value="key"/></td>
                    <td><s:property value="value"/></td>
                </tr>
        	</table>
        </s:iterator>
		
		</div>
	</div>
</body>
</html>