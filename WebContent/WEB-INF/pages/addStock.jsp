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
				url : '${pageContext.request.contextPath}/stock_save',
				onSubmit : function() {
					var unitname = $("#unitname").val();
					if ($.trim(unitname).length == 0) {
						$("#spanunitname").show();
						return false;
					} else {
						$("#spanunitname").hide();
					}
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
			<div
				style="height: 40px; text-align: center; line-height: 40px; background: #e0edff; font-family: '黑体'; font-size: large; font-weight: bolder;margin-top: 10px;">
				<s:if test="st_id!=0">
					修改入库商品信息
				</s:if>
				<s:else>
					商品入库商品信息
				</s:else>
			</div>
			<div style="height: 330px;">
				<form id="form1" method="post">
					<table style="margin: 0 auto; width: 50%;">
						<tr>
							<td style="width: 20%; text-align: right;">入库商品名称</td>
							<td style="text-align: left; padding-left: 20px;"><input
								type="hidden" id="id" name="st_id" value="${st_id}"> <input
								type="hidden" id="isdelete" name="s_scbs" value="${s_scbs}">
								<input
								type="hidden"  name="s_no" value="${s_no}">
								<input type="hidden" id="isdelete" name="s_date"
								value="${s_date}"> <select id="role"
								name="commodity.c_id" class="select_d">
									<s:iterator value="#commodity" var="u">
										<s:if test="commodity.c_id==#u.c_id">
											<option value="${c_id}" selected="selected">${c_name }</option>
										</s:if>
										<option value="${c_id}">${c_name }</option>
									</s:iterator>
							</select></td>
						</tr>
						<%-- <tr>
							<td style="width: 20%; text-align: right;">供应商</td>
							<td style="text-align: left; padding-left: 20px;">
							 <select name="gysInfo.g_id" >
										<s:iterator value="#gyslist" var="g">
											<s:if test="#g.g_id==gysInfo.g_id">
												<option value="<s:property value="#g.g_id"/>"
													selected="selected"><s:property value="#g.g_name" />
												</option>
											</s:if>
											<s:else>
												<option value="<s:property value="#g.g_id"/>"><s:property
														value="#g.g_name" />
												</option>
											</s:else>
										</s:iterator>

								</select>
							
							</td>
						</tr> --%>
						<tr>
							<td style="width: 20%; text-align: right;">入库库房</td>
							<td style="text-align: left; padding-left: 20px;"><select
								id="storeroom" name="storeroom.s_id" class="select_d">
									<s:iterator value="#storeroom" var="u">
										<s:if test="storeroom.s_id==#u.s_id">
											<option value="${s_id}" selected="selected"><s:property value="#u.storehouse.sh_name"/> ${s_name }</option>
										</s:if>
										<option value="${s_id}"><s:property value="#u.storehouse.sh_name"/>  ${s_name }</option>
									</s:iterator>
							</select></td>
						</tr>
						<tr>
							<td style="width: 20%; text-align: right;">入库数量</td>
							<td style="text-align: left; padding-left: 20px;"><input
								type="text" id="unitname" name="s_smsl" class="txt200"
								value="${s_smsl }"> <span id="spanunitname"
								style="color: red; display: none;">不能为空</span></td>
						</tr>
						<tr>
							<td style="width: 20%; text-align: right;">入库数量</td>
							<td style="text-align: left; padding-left: 20px;">
							<select name="s_rklx" class="select_d">
								<s:if test="s_rklx==0">
									<option value="0" selected="selected">报溢</option>
									<option value="1">借入</option>
									<option value="2">借出还入</option>
									<option value="3">受赠</option>
									<option value="4">采购入仓</option>
									<option value="5">其他入仓</option>
								</s:if>
								<s:if test="s_rklx==1">
									<option value="0">报溢</option>
									<option value="1" selected="selected">借入</option>
									<option value="2">借出还入</option>
									<option value="3">受赠</option>
										<option value="4">采购入仓</option>
									<option value="5">其他入仓</option>
								</s:if>
								<s:if test="s_rklx==2">
									<option value="0">报溢</option>
									<option value="1">借入</option>
									<option value="2" selected="selected">借出还入</option>
									<option value="3">受赠</option>
										<option value="4">采购入仓</option>
									<option value="5">其他入仓</option>
								</s:if>
								<s:if test="s_rklx==3">
									<option value="0">报溢</option>
									<option value="1">借入</option>
									<option value="2">借出还入</option>
									<option value="3" selected="selected">受赠</option>
										<option value="4">采购入仓</option>
									<option value="5">其他入仓</option>
								</s:if>
								<s:if test="s_rklx==4">
									<option value="0">报溢</option>
									<option value="1">借入</option>
									<option value="2">借出还入</option>
									<option value="3">受赠</option>
										<option value="4" selected="selected">采购入仓</option>
									<option value="5" >其他入仓</option>
									
								</s:if>
								<s:if test="s_rklx==5">
									<option value="0">报溢</option>
									<option value="1">借入</option>
									<option value="2">借出还入</option>
									<option value="3">受赠</option>
										<option value="4" >采购入仓</option>
									<option value="5" selected="selected">其他入仓</option>
									
								</s:if>
								
							</select>
							</td>
						</tr>
						<tr>
						<td style="width: 20%; text-align: right;">进货价</td>
							<td style="text-align: left; padding-left: 20px;">
							<input
								type="text"  name="pricestr" class="txt200"
								value="${pricestr }">
							</td>
						
						</tr>
						<tr>
							<td style="width: 20%; text-align: right;">描述</td>
							<td style="text-align: left; padding-left: 20px;"><textarea
									rows="3" cols="3" name="s_bz" class="txt200" style="height: 100px;">${s_bz }</textarea>
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
</body>
</html>