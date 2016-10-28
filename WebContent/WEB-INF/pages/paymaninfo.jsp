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
				url:'${pageContext.request.contextPath}/payman_save',
				onSubmit:function(){
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
				<s:if test="pm_id!=0">
					修改支付方式信息
				</s:if>
				<s:else>
					添加支付方式信息
				</s:else>
			</div>
			<div style="height: 330px;">
				<form id="form1" method="post">
					<table style="margin: 0 auto;width: 50%;">
						<tr>
							<td style="width: 20%;text-align: right;">支付方式名称</td>
							<td style="text-align: left;padding-left: 20px;">
								<input type="hidden" id="id" name="pm_id" value="${pm_id}">
								<input type="hidden" id="isdelete" name="pm_scbs" value="${pm_scbs}">
								
								<input type="text" id="unitname" name="pm_name" class="txt200" value="${pm_name }">
								<span id="spanunitname" style="color:red;display:none;">不能为空</span>
							</td>
						</tr>
						<tr>
							<td style="width: 20%;text-align: right;">排序</td>
							<td style="text-align: left;padding-left: 20px;">
								
								<input type="text" id="lxr" name="pm_px" class="txt200" value="${pm_px }">
								<span id="lxrid" style="color:red;display:none;">不能为空</span>
							</td>
						</tr>
						
						
						<tr>
							<td style="width: 20%;text-align: right;">介绍</td>
							<td style="text-align: left;padding-left: 20px;">
								<textarea rows="10" cols="26" name="pm_bz">${pm_bz }</textarea>
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