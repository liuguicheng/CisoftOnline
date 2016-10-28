<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>广西100南宁商家订单系统</title>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-1.8.3.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/validate/memberinfo_validate.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/easyui/easyui-lang-zh_CN.js"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/js/easyui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/js/easyui/themes/icon.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/panel.css">
<script type="text/javascript">
	$(function(){		
		$("#save").click(function(){
			$("#form1").form('submit',{
				url:'${pageContext.request.contextPath}/merchantinfo_doaddlogin',
				onSubmit:function(){
					/* var flag=validate();
					return flag; */
				},
				success:function(data){
					$.messager.alert("提示",eval("("+data+")"),"info");
					window.opener.location.href = window.opener.location.href;
					window.close(); 
				}
			});
		});
	})
</script>
</head>
<body class="easyui-layout">	
	<div region="center">
			<div style="height: 40px; text-align: center;line-height: 40px;background: #e0edff;font-family: '黑体';font-size: large;font-weight: bolder;">
				添加商户账号
			</div>
			<div style="height: 330px;">
				<form id="form1" method="post">
				
				<input type="text" name="userinfo.merchantInfo.mi_id" id="fid" value="${merchantInfo.mi_id}">
					<table style="margin: 0 auto;width: 50%;">
						<tr>
							<td style="width: 20%;text-align: right;">登录账号</td>
							<td style="text-align: left;padding-left: 20px;">
								<input type="text" id="lxfs" name="userinfo.u_name" class="txt200" value="${userinfo.u_name }">
								<span id="lxrid" style="color:red;display:none;">不能为空</span>
							</td>
						</tr>
						<tr>
							<td style="width: 20%;text-align: right;">登录密码</td>
							<td style="text-align: left;padding-left: 20px;">
								<input type="password" id="lxfs" name="userinfo.u_pwd" class="txt200" value="${userinfo.u_pwd }">
								<span id="lxrid" style="color:red;display:none;">不能为空</span>
							</td>
						</tr>
						<tr>
							<td style="width: 20%;text-align: right;">确认密码</td>
							<td style="text-align: left;padding-left: 20px;">
								<input type="password" id="lxfs" name="pwd2" class="txt200" value="">
								<span id="lxrid" style="color:red;display:none;">不能为空</span>
							</td>
						</tr>
						<tr>
							<td style="width: 20%;text-align: right;">常用邮箱</td>
							<td style="text-align: left;padding-left: 20px;">
								<input type="text" id="lxfs" name="userinfo.u_email" class="txt200" value="${userinfo.u_email }">
								<span id="lxrid" style="color:red;display:none;">不能为空</span>
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