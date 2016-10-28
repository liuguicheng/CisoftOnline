<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>广西100南宁商家订单系统</title>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-1.8.3.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/validate/user1.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/easyui/easyui-lang-zh_CN.js"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/js/easyui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/js/easyui/themes/icon.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/panel.css">
<script type="text/javascript">
	$(function(){
		//下拉框回显
		var role="${role.id}";
		$("#role").val(role);
		
		
		$("#save").click(function(){			
			$('#form1').form('submit',{
				url:"${pageContext.request.contextPath}/userself_save",
				onSubmit:function(){
					var flag=validate();
					return flag;
				},
				success:function(data){
					var d=eval("("+data+")");
					$.messager.alert("提示",d,"info");
				}
			});
		});
	});
</script>
<style type="text/css">
	.table tr{
		height:30px;
	}
	.td1{
		text-align:rigth;	
		width:20%;
	}
	.td2{
		text-align:left;
		padding-left:20px;
	}
</style>
</head>
<body class="easyui-layout">	
	<div region="center" style="text-align: center;">
		<div class="divall">
			<div style="height: 28px; background: url('img/titleall.gif') repeat-x;">
				<div class="titleleft"></div>
				<div class="titleright"></div>
			</div>
			<div style="height: 40px; text-align: center;line-height: 40px;background: #e0edff;font-family: '黑体';font-size: large;font-weight: bolder;">
				<s:if test="id>0">
					修改页面
				</s:if>
				<s:else>
					添加页面
				</s:else>
			</div>
			<div style="height: 330px;">
				<form id="form1" method="post">
					<table style="margin: 0 auto;width: 50%;" class="table">
						<tr>
							<td class="td1">用户名</td>
							<td class="td2">
								<input type="hidden" id="id" name="id" value="${id}">
								<input type="hidden" id="isdelete" name="isdelete" value="${isdelete}">
								
								<input type="text" id="username" name="username" value="${username }">
								<span  id="spanusername" style="color:red;display:none;">不能为空</span>
							</td>
						</tr>
						<tr>
							<td class="td1">密码</td>
							<td class="td2">
								<input type="password" id="password" name="password" value="${password }">
								<span  id="spanpassword" style="color:red;display:none;">不能为空</span>
							</td>				
						</tr>
						<tr>
							<td class="td1">真实姓名</td>
							<td class="td2">
								<input type="text" id="truename" name="truename" value="${truename }">
								<span  id="spantruename" style="color:red;display:none;">不能为空</span>
							</td>				
						</tr>
						<tr>
							<td class="td1">邮件地址</td>
							<td class="td2">
								<input type="text" id="email" name="email" value="${email }">
								<span id="spanemail" style="color:red;display:none;">不能为空</span>
								<span id="spanemail1" style="color:blue;display:none;">格式不对</span>
							</td>
						</tr>
						<tr>
							<td class="td1">电话号码</td>
							<td class="td2">
								<input type="text" id="telephone" name="telephone" value="${telephone }">
								<span id="spantelephone" style="color:red;display:none;">不能为空</span>
							</td>
						</tr>
						
						
						<tr>
							<td class="td1">角色</td>
							<td class="td2">
								<select id="role" name="role.id" style="width:150px">
									<s:iterator value="#roles" var="u">
										<option value="${id }">${rolename }</option>
									</s:iterator>
								</select>
							</td>
						</tr>
						<tr>
							<td class="td1"></td>
							<td class="td2">
								<a id="save" icon="icon-save" href="#" class="easyui-linkbutton"  >保存</a>
							</td>
						</tr>
					</table>
				</form>
			</div>
		</div>
	</div>
</body>
</html>