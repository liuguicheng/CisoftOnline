<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="s" uri="/struts-tags"%>
     <%@ page import="com.cisoft.model.User"%>   
<!DOCTYPE>
<html>
<head>
<!-- <meta name="viewport" content="width=device-width, initial-scale=1"> -->
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0;" name="viewport" />
<title>100NN同城快递超市</title>
		<link href="img/favicon.ico" rel="shortcut icon" type="image/x-icon">
<!--<link href="js/jquerymobile/jquery.mobile-1.4.0.min.css" rel="stylesheet" type="text/css" />-->
<link href="${pageContext.request.contextPath }/100nnwx/js/jquerymobile/zt/jquery.mobile-1.4.0.min.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath }/100nnwx/css/SecurityCenter.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${pageContext.request.contextPath }/100nnwx/js/jquery-1.8.3.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/100nnwx/js/jquerymobile/jquery.mobile-1.4.0.min.js"></script>

</head>
<body>
	<div data-role="page" style="background:#FFF;">
		<div data-role="header" class="Top" style=" background:#8bc563; color:#FFF;text-shadow: 0 0 0 #eee;">
        <div class="Top_return"><a href="javascript:history.go(-1);" target="_self"><img src="${pageContext.request.contextPath }/100nnwx/img/return_button.gif" width="57" height="24"></a></div>
        用户中心
        <div class="Top_user_center"><a href="wxshoppingcar_getList" target="_self"><img src="${pageContext.request.contextPath }/100nnwx/img/user_center.gif" width="32" height="30"></a></div>
        </div>
        <div class="Mian_userTitle">
        	<div class="Mian_userTitle_Ico">
        	    <% 
       			User users = (User) request.getSession().getAttribute("usersession");
 				if (users != null) {
 				if("".equals(users.getTximgurl())){
 		%>
        	    <div class="Mian_userTitle_Ico_img"><img src="img/user_ico.png" width="50" height="50"></div>
                <div class="Mian_userTitle_Ico_font" style="width: 150px;"><a href="${pageContext.request.contextPath }/wxuseraddress_towxinfo" target="_self" style="font-size: 12px; text-decoration: none;">点击使用微信昵称</a></div>
        	     
        	    <%}else{ %>
        	    
        	    <div class="Mian_userTitle_Ico_img"><img src="<%=users.getTximgurl() %>" width="50" height="50"></div>
                <div class="Mian_userTitle_Ico_font" style="width: 150px;"><%=users.getU_name() %></div>
				<%}} %>            	
                <div class="Mian_userTitle_Ico_rz"><!-- <img src="img/rz_ico.gif" width="82" height="20"> --></div>
            </div>
        </div>
		<div role="main" class="ui-content" style="padding-top:0;">
            <div class="Mian_dzgl_mtcb"><a href="${pageContext.request.contextPath }/wxorders_getList" target="_self">
                <div class="Mian_dzgl_mtcbImg"><img src="${pageContext.request.contextPath }/100nnwx/img/Qrdduser_ico.gif" width="42" height="60"></div>
                <div class="Mian_dzgl_mtcbFont">我的订单</div></a>
			</div>
            <div class="Mian_dzgl_mtcb"><a href="${pageContext.request.contextPath }/wxshoppingcar_getList" target="_self">
                <div class="Mian_dzgl_mtcbImg"><img src="${pageContext.request.contextPath }/100nnwx/img/Qrddgwc_ico.gif" width="42" height="60"></div>
                <div class="Mian_dzgl_mtcbFont">购物车</div></a>
			</div>
            <div class="Mian_dzgl_mtcb"><a href="${pageContext.request.contextPath }/wxuseraddress_getList" target="_self">
                <div class="Mian_dzgl_mtcbImg"><img src="${pageContext.request.contextPath }/100nnwx/img/Qrdddzgl_ico.gif" width="42" height="60"></div>
                <div class="Mian_dzgl_mtcbFont">地址管理</div></a>
			</div>
           <!--  <div class="Mian_dzgl_mtcb"><a href="SecurityCenter.html" target="_self">
                <div class="Mian_dzgl_mtcbImg"><img src="img/Qrddaqzx_ico.gif" width="42" height="60"></div>
                <div class="Mian_dzgl_mtcbFont">安全中心</div></a>
			</div>
            <div class="Mian_dzgl_mtcb"><a href="AuthenticationInformation.html" target="_self">
                <div class="Mian_dzgl_mtcbImg"><img src="img/Qrddrzxx_ico.gif" width="42" height="60"></div>
                <div class="Mian_dzgl_mtcbFont">认证信息</div></a>
			</div> -->
            
		</div>
<!--        <div data-role="footer">
		</div>-->
	</div>
</body>
<script type="text/javascript">
 function towxinfo(){
	 window.location.href="${pageContext.request.contextPath }/wxuseraddress_towxinfo";
 }

</script>
</html>