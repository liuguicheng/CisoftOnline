<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>广西100南宁商家订单系统</title>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-1.8.3.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/easyui/easyui-lang-zh_CN.js"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/js/easyui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/js/easyui/themes/icon.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/panel.css">
<script type="text/javascript">
	$(function(){		
		
		//下拉框回显
		var commodity="${commodity.c_id}";
		$("#commodity").val(commodity);
		/* $.ajax({
			   type: "POST",
			   url: "order_select",
			   success: function(msg){
				 
					}
		}); */
		
		$("#save").click(function(){
			$("#form1").form('submit',{
				url:'${pageContext.request.contextPath}/htorder_save',
				onSubmit:function(){
					var unitname=$("#unitname").val();
					if($.trim(unitname).length==0){
						$("#spanunitname").show();
						return false;
					}else{
						$("#spanunitname").hide();
					}
				},
				success:function(data){
					$.messager.alert("提示",eval("("+data+")"),"info");
				}
			});
		});
	})
</script>
</head>
<body class="easyui-layout">	
	<div region="center" style="padding-top: 10px;">
	<div style="margin-top:10px;width: 94%;padding-left:10px;padding-top:10px; border: solid 1px #ccc; background-color: #f7f7f7;height: 30px;margin: 0 auto;font-size: 14px;">
	订单详细
	</div>
				<form id="form1" method="post">
					<table style="margin: 0 auto;width: 95%;margin-top:5px; border-left: solid 1px #ccc; border-top: solid 1px #ccc;  font-size: 14px;" cellspacing="0" cellpadding="0">
						<tr>
							<td class="lefttd">订单编号</td>
							<td class="righttd">${o_bh }</td>
							<td class="lefttd">编号</td>
							<td  class="righttd">${o_id }</td>
						</tr>
						<tr>
							<td class="lefttd">商品名称</td>
							<td class="righttd" colspan="3">${o_spname }</td>
						</tr>
						<tr>
							<td class="lefttd">购买数量</td>
							<td class="righttd">${o_spnum }</td>
							<td class="lefttd">金额</td>
							<td  class="righttd">${ o_zjg}元</td>
						</tr>
						<tr>
							<td class="lefttd">收货人</td>
							<td class="righttd">${user.u_zsName }</td>
							<td class="lefttd">联系电话</td>
							<td  class="righttd"></td>
						</tr>
						<tr>
							<td class="lefttd">联系手机</td>
							<td class="righttd"></td>
							<td class="lefttd">发货地址</td>
							<td  class="righttd"></td>
						</tr>
						<tr>
							<td class="lefttd">备注</td>
							<td class="righttd" colspan="3">${o_bz }</td>
						</tr>
						<tr>
							<td class="lefttd">下单时间</td>
							<td class="righttd">${o_startTime }</td>
							<td class="lefttd">发货时间</td>
							<td  class="righttd">
							${fhtime}
							</td>
						</tr>
						<tr>
							<td class="lefttd">收货时间</td>
							<td class="righttd">
							${shtime }
							</td>
							<td class="lefttd">付款方式</td>
							<td  class="righttd">
							在线支付
							</td>
						</tr>
						<tr>
							<td class="lefttd">收货人</td>
							<td class="righttd">
							${shrname }
							</td>
							<td class="lefttd">收货方式</td>
							<td  class="righttd">
							<s:if test="o_status==2">
								本人签收
								</s:if>
							
							</td>
						</tr>
						<tr>
							<td class="lefttd">状态</td>
							<td class="righttd">
								<s:if test="o_status==6">
								未下单
								</s:if>
								<s:elseif test="o_status==5">
								退货处理中
								</s:elseif>
								<s:elseif test="o_status==4">
								退货申请中
								</s:elseif>
								<s:elseif test="o_status==3">
								完成订单
								</s:elseif>
								<s:elseif test="o_status==2">
								已收货
								</s:elseif>
								<s:elseif test="o_status==1">
								未收货
								</s:elseif>
								<s:elseif test="o_status==0">
								未发货
								</s:elseif>
								
								
							</td>
							<td class="lefttd">是否在线支付</td>
							<td  class="righttd">是</td>
						</tr>
						<tr>
							<td class="lefttd">管理员备注</td>
							<td class="righttd" colspan="3">
							<textarea rows="5" cols="5" name="o_bz" style="width: 200px;">${o_bz}</textarea>
							</td>
						</tr>
						
					</table>
				</form>
	</div>
</body>
</html>