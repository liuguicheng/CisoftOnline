<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>广西100南宁－后台管理系统</title>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/jquery-1.8.3.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/easyui/jquery.easyui.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/easyui/easyui-lang-zh_CN.js"></script>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/js/easyui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/js/easyui/themes/icon.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/css/panel.css">
<script type="text/javascript">
	$(function() {

		$("#save").click(function() {
			$("#form1").form('submit', {
				url : '${pageContext.request.contextPath}/purchasepay_save',
				onSubmit : function() {
					
				},
				success : function(data) {
					$.messager.alert("提示", eval("(" + data + ")"), "info");
					window.location.href="${pageContext.request.contextPath}/pages_purchaselist";
				}
			});
		});
		
		/* $("#cgdh").change(function(){
			var cgdh=$("#cgdh").val();
			$.ajax({
	            cache: true,
	            type: "POST",
	            data:"p_no="+cgdh,
	            url:"purchasepay_querypurchase",
	            success: function(data) {
	            	if(data=="-1"){
	            		alert("暂无输入的采购单号");
	            	}else{
	            		$("#fjje").val(data);
	            	}
	            	
	            }
	        });
			
			
		}); */
	})
</script>
</head>
<body class="easyui-layout">
	<div region="center">
		<div class="divall">
			<div
				style="height: 40px; text-align: center; line-height: 40px; background: #e0edff; font-family: '黑体'; font-size: large; font-weight: bolder;">
				<s:if test="id>0">
					修改采购付款
				</s:if>
				<s:else>
					添加采购付款
				</s:else>
			</div>
			<div style="height: 330px;">
				<form id="form1" method="post">
					<table style="margin: 0 auto; width: 50%;">
						<tr>
							<td style="width: 20%; text-align: right;">采购单号</td>
							<td style="text-align: left; padding-left: 20px;"><input
								type="hidden" id="id" name="pp_id" value="${pp_id}"> <input
								type="hidden" id="isdelete" name="pp_scbs" value="${pp_scbs}">
								<input type="hidden"  name="pp_fkdate"
								value="${pp_fkdate}"> 
							<input type="text" name="pp_no" value="${pp_no }" readonly="readonly" id="cgdh" style="width: 300px;background-color: #C7C6C6;"/>		
									
							</td>
						</tr>
						<tr>
							<td style="width: 20%; text-align: right;">待付款金额</td>
							<td style="text-align: left; padding-left: 20px;">
							<input type="text" name="pp_dfje" value="${pp_dfje }" id="fjje" readonly="readonly" style="background-color: #C7C6C6;"/>
							</td>
						</tr>
						<tr>
							<td style="width: 20%; text-align: right;">附加金额</td>
							<td style="text-align: left; padding-left: 20px;">
							<input type="text" name="pp_fjje" value="${pp_fjje }"/>
							</td>
						</tr>
						<tr>
							<td style="width: 20%; text-align: right;">实际付款金额</td>
							<td style="text-align: left; padding-left: 20px;">
							<input type="text" name="pp_sjfkje" value="${pp_sjfkje }"/>
							</td>
						</tr>
						<tr>
							<td style="width: 20%; text-align: right;">转账类型</td>
							<td style="text-align: left; padding-left: 20px;">
							<select name="pp_zflx" style="width: 150px">
								<s:if test="pp_zflx==1">
									<option value="1" selected="selected">网银转账</option>
									<option value="2">现金支付</option>
								</s:if>
								<s:if test="pp_zflx==2">
									<option value="1">网银转账</option>
									<option value="2" selected="selected">现金支付</option>
								</s:if>
								<s:else>
								<option value="1">网银转账</option>
									<option value="2" >现金支付</option>
								</s:else>
							</select>
							</td>
						</tr>
						<tr>
							<td style="width: 20%; text-align: right;">描述</td>
							<td style="text-align: left; padding-left: 20px;"><textarea
									rows="3" cols="3" name="pp_bz" style="width: 300px;">${pp_bz }</textarea>
							</td>
						</tr>
						<tr>
							<td style="width: 20%; text-align: right;"></td>
							<td style="text-align: left; padding-left: 20px;"><a
								id="save" icon="icon-save" href="#" class="easyui-linkbutton">保存</a>
							</td>
						</tr>
					</table>
				</form>
			</div>
		</div>
	</div>
</body>
</html>