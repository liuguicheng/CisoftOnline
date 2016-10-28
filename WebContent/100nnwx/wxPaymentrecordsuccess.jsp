<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0;" name="viewport" />
<title>支付结果-付款成功</title>
<!--<link href="js/jquerymobile/jquery.mobile-1.4.0.min.css" rel="stylesheet" type="text/css" />-->
<link href="${pageContext.request.contextPath }/100nnwx/js/jquerymobile/zt/jquery.mobile-1.4.0.min.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath }/100nnwx/css/SecurityCenter.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${pageContext.request.contextPath }/100nnwx/js/jquery-1.8.3.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/100nnwx/js/jquerymobile/jquery.mobile-1.4.0.min.js"></script>

</head>
<body>
	<div data-role="page" style="background:#FFF;">
		<div data-role="header" class="Top" style=" background:#8bc563; color:#FFF;text-shadow: 0 0 0 #eee;">支付结果</div>
		<div role="main" class="ui-content">
			<form action="weixin_login" method="post" id="form1" name="form1">
				<table style="width: 100%;">					
					<tr>
						<td>
                        	<div class="Mian_titleCG">
                            	<div class="Mian_titleCG_ico"><img src="img/cg_ico.gif" width="24" height="20"></div>
                                <div class="Mian_titleCG_font">付款成功</div>
                            </div>
						</td>
					</tr>
                    <tr>
						<td>
                        	<table class="Mian_FontTitle" cellpadding="0" cellspacing="0">
                            	<tr>
                                    <td width="80" valign="top"><div style="text-align:center;">商品名称:</div></td>
                                    <td>力拓稻源香 香丝苗 绿色大米 软糯甘甜</td>
                                </tr>
                            </table>
						</td>
					</tr>
					<tr>
						<td>
                        	<table class="Mian_FontTitle" cellpadding="0" cellspacing="0">
                            	<tr>
                        			<td width="50%"><a style=" margin-right:10px;background:#b3d303; color:#FFF; font-weight:100; font-family:'黑体'; font-size:16px; font-weight:bold; text-shadow : 0 0 1px #b3d303;" id="btnlogin" href="wxorders_getList?orders.user.u_id=1" data-role="button" target="_self">查看我的订单</a></td>
                        			<td width="50%"><a style=" margin-left:10px;background:#f0c946; color:#FFF; font-weight:100; font-family:'黑体'; font-size:16px; font-weight:bold; text-shadow : 0 0 1px #f0c946;" id="btnlogin" href="../towxpage.jsp" data-role="button" target="_self">&nbsp;&nbsp;&nbsp;&nbsp;继续购物&nbsp;&nbsp;&nbsp;&nbsp;</a></td>
                                </tr>
                            </table>
                        </td>
					</tr>
				</table>
			</form>
		</div>
		<!-- <div data-role="footer">
		</div> -->
	</div>
</body>
</html>