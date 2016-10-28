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
				url : '${pageContext.request.contextPath}/purchasereturn_save',
				onSubmit : function() {
					
				},
				success : function(data) {
					$.messager.alert("提示", eval("(" + data + ")"), "info");
				}
			});
		});
		
		
	})
</script>
</head>
<body class="easyui-layout">
	<div region="center">
		<div class="divall">
			<div
				style="height: 40px; text-align: center; line-height: 40px; background: #e0edff; font-family: '黑体'; font-size: large; font-weight: bolder;">
				<s:if test="id>0">
					修改采购退货
				</s:if>
				<s:else>
					添加采购退货
				</s:else>
			</div>
			<div style="height: 330px;">
				<form id="form1" method="post">
					<table style="margin: 0 auto; width: 50%;">
						<tr>
							<td style="width: 20%; text-align: right;">采购单号</td>
							<td style="text-align: left; padding-left: 20px;"><input
								type="hidden" id="id" name="pr_id" value="${pr_id}"> <input
								type="hidden" id="isdelete" name="pr_scbs" value="${pr_scbs}">
								<input type="hidden"  name="pr_shdate"
								value="${pr_shdate}"> 
								<input type="hidden"  name="pr_username"
								value="${pr_username}"> 
							<input type="text" name="pr_no" value="${pr_no }" readonly="readonly" id="cgdh" style="width: 300px;"/>		
									
							</td>
						</tr>
						<tr>
							<td style="width: 20%; text-align: right;">描述</td>
							<td style="text-align: left; padding-left: 20px;"><textarea
									rows="3" cols="3" name="pr_bz" style="width: 300px;">${pr_bz }</textarea>
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