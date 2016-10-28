<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0;" name="viewport" />
<title>100NN同城快递超市</title>
		<link href="img/favicon.ico" rel="shortcut icon" type="image/x-icon">
<link href="${pageContext.request.contextPath }/100nnwx/js/jquerymobile/zt/jquery.mobile-1.4.0.min.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath }/100nnwx/css/SecurityCenter.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${pageContext.request.contextPath }/100nnwx/js/jquery-1.8.3.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/100nnwx/js/jquerymobile/jquery.mobile-1.4.0.min.js"></script>

</head>
<body>
	<div data-role="page" style="background:#FFF;">
		<div data-role="header" class="Top" style=" background:#8bc563; color:#FFF;text-shadow: 0 0 0 #eee;">
        <div class="Top_return"><a href="javascript:history.go(-1);" target="_self"><img src="${pageContext.request.contextPath }/100nnwx/img/return_button.gif" width="57" height="24"></a></div>
        地址管理
        <div class="Top_user_center"><a href="wxshoppingcar_getList" target="_self"><img src="${pageContext.request.contextPath }/100nnwx/img/user_center.gif" width="32" height="30"></a></div>
        </div>
		<div role="main" class="ui-content" style="padding-top:0;">
		  <s:if test="useraddresslist.size()>0">
			<s:iterator value="useraddresslist">
			<a href="wxuseraddress_editView?useraddress.ua_id=<s:property value="ua_id"/>" target="_self" style="text-decoration:none;color: #333;">
			<div class="Mian_dzgl_m" >
                <div class="Mian_dzgl_mt"  ><s:property value="ua_shName"/> <span style="color:#333;"><s:property value="ua_shGddh"/> </span></div>
                <div class="Mian_dzgl_mt" style="text-overflow: ellipsis;overflow: hidden;white-space: nowrap;width: 270px;font-size: 12px;color: #a2a2a2;"><s:if test="ua_status==1">[默认]</s:if><s:property value="ua_address"/> </div>
			</div>
			</a>
           </s:iterator>
           </s:if>
           <s:else>
            <div style="text-align: center;margin-top: 45px;margin-bottom: 20px;" id="zwid">暂无收货地址！</div>
           </s:else>
            <table style="width: 100%;">					
					<tr>
						<td>
                        	<a style="background:#8ac463; color:#FFF; font-weight:100; font-family:'黑体'; font-size:18px; font-weight:bold; text-shadow : 0 0 1px #000;" id="btnlogin" href="wxuseraddress_toadd?id=${usersession.u_id }&bs=2" data-role="button" target="_self">新增收货地址</a> 
                        </td>
                    </tr>
             </table>
		</div>
<!--        <div data-role="footer">
		</div>-->
	</div>
</body>
</html>