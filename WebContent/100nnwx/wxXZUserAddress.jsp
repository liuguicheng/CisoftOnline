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
        <div class="Top_user_center"><a href="wxuseraddress_getList" target="_self">管理</a></div>
        </div>
		<div role="main" class="ui-content" style="padding-top:0;">
		    <input type="hidden" id="ids" name="ids" value="${result}">
			<input type="hidden" id="numstr" name="numstr" value="${id  }">
			<s:iterator value="useraddresslist">
			<a href="javascript:void(0);" target="_self" onclick="onse(<s:property value="ua_id"/>)" style="text-decoration:none;color: #333;">
			<div class="Mian_dzgl_m" style="background:null" >
                <div class="Mian_dzgl_mt"  ><s:property value="ua_shName"/> <span style="color:#333;"><s:property value="ua_shGddh"/> </span></div>
                <div class="Mian_dzgl_mt" style="text-overflow: ellipsis;overflow: hidden;white-space: nowrap;width: 270px;font-size: 12px;color: #a2a2a2;"><s:if test="ua_status==1">[默认]</s:if><s:property value="ua_address"/> </div>
			</div>
			</a>
           </s:iterator>
           
		</div>
<!--        <div data-role="footer">
		</div>-->
	</div>
</body>
<script type="text/javascript">
   function onse(shdz){
	   var ids=  $("#ids").val();
	   var numstr=  $("#numstr").val();
	   window.location.href="wxshoppingcar_qrorder?c_id="+ids+"&numid="+numstr+"&shdz="+shdz;
   }

</script>
</html>