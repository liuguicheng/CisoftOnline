<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>广西100南宁商家订单系统</title>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-1.8.3.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/validate/gysinfo_validate.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/easyui/easyui-lang-zh_CN.js"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/js/easyui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/js/easyui/themes/icon.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/panel.css">
<script type="text/javascript">
	$(function(){		
		$("#save").click(function(){
			$("#form1").form('submit',{
				url:'${pageContext.request.contextPath}/gys_save',
				onSubmit:function(){
					var flag=validate();
					return flag;
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
	<div region="center">
			<div style="height: 40px; text-align: center;line-height: 40px;background: #e0edff;font-family: '黑体';font-size: large;font-weight: bolder;">
				<s:if test="g_id!=0">
					修改供应商信息
				</s:if>
				<s:else>
					添加供应商信息
				</s:else>
			</div>
			<div style="height: 330px;">
				<form id="form1" method="post">
					<table style="margin: 0 auto;width: 50%;">
						<tr>
							<td style="width: 20%;text-align: right;">供应商名称</td>
							<td style="text-align: left;padding-left: 20px;">
								<input type="hidden" id="id" name="g_id" value="${g_id}">
								<input type="hidden" id="isdelete" name="g_scbs" value="${g_scbs}">
								
								<input type="text" id="unitname" name="g_name" class="txt200" value="${g_name }">
								<span id="spanunitname" style="color:red;display:none;">不能为空</span>
							</td>
						</tr>
						<tr>
							<td style="width: 20%;text-align: right;">联系人</td>
							<td style="text-align: left;padding-left: 20px;">
								
								<input type="text" id="lxr" name="g_lxr" class="txt200" value="${g_lxr }">
								<span id="lxrid" style="color:red;display:none;">不能为空</span>
							</td>
						</tr>
						<tr>
							<td style="width: 20%;text-align: right;">联系方式</td>
							<td style="text-align: left;padding-left: 20px;">
								<input type="text" id="lxfs" name="g_dh" class="txt200" value="${g_dh }">
								<span id="lxfsid" style="color:red;display:none;">不能为空</span>
							</td>
						</tr>
						<tr>
							<td style="width: 20%;text-align: right;">地址</td>
							<td style="text-align: left;padding-left: 20px;">
								
								<input type="text" id="address" name="g_address" class="txt200" value="${g_address }">
								<span id="addressid" style="color:red;display:none;">不能为空</span>
							</td>
						</tr>
						<tr>
							<td style="width: 20%;text-align: right;">主营产品</td>
							<td style="text-align: left;padding-left: 20px;">
								
								<input type="text" id="zycp" name="g_cp" class="txt200" value="${g_cp }">
								<span id="zycpid" style="color:red;display:none;">不能为空</span>
							</td>
						</tr>
						<tr>
							<td style="width: 20%;text-align: right;">序号</td>
							<td style="text-align: left;padding-left: 20px;">
								
								<input type="text" id="xh" name="g_xh" class="txt200" value="${g_xh }">
								<span id="xhid" style="color:red;display:none;">不能为空</span>
								<span id="xhidid" style="color:red;display:none;">序号不能为0</span>
							</td>
						</tr>
						<tr>
							<td style="width: 20%;text-align: right;"></td>
							<td style="text-align: left;padding-left: 20px;">
								<a id="save" icon="icon-save" href="#" class="easyui-linkbutton"  >保存</a>
							</td>
						</tr>
					</table>
				</form>
			</div>
		</div>
</body>
</html>