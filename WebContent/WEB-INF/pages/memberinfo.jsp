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
		$("#parentid").val("${member.mgrad.mg_id}");
		$("input:radio[name='mg_sfmr1']").change(function (){ 
			$("#lxid").val($(this).val());
			});
		$("#save").click(function(){
			$("#form1").form('submit',{
				url:'${pageContext.request.contextPath}/member_save',
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
		$("#parentid").change(function(){
			//alert($(this).children('option:selected').val()); 
			var p1=$(this).children('option:selected').val();//这就是selected的值 
			$("#fid").val(p1);
		});
	})
</script>
</head>
<body class="easyui-layout">	
	<div region="center">
			<div style="height: 40px; text-align: center;line-height: 40px;background: #e0edff;font-family: '黑体';font-size: large;font-weight: bolder;">
				<s:if test="m_id!=0">
					修改会员信息
				</s:if>
				<s:else>
					添加会员信息
				</s:else>
			</div>
			<div style="height: 330px;">
				<form id="form1" method="post">
				
				<input type="hidden" name="mgrad.mg_id" id="fid" value="${member.mgrad.mg_id}">
					<table style="margin: 0 auto;width: 50%;">
					<s:if test="m_id==0">
						<tr>
							<td style="width: 20%;text-align: right;">登录账号</td>
							<td style="text-align: left;padding-left: 20px;">
								<input type="text" id="lxfs" name="user.u_name" class="txt200" value="${user.u_name }">
								<span id="lxrid" style="color:red;display:none;">不能为空</span>
							</td>
						</tr>
						<tr>
							<td style="width: 20%;text-align: right;">登录密码</td>
							<td style="text-align: left;padding-left: 20px;">
								<input type="password" id="lxfs" name="user.u_pwd" class="txt200" value="${user.u_pwd }">
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
								<input type="text" id="lxfs" name="user.u_email" class="txt200" value="${user.u_email }">
								<span id="lxrid" style="color:red;display:none;">不能为空</span>
							</td>
						</tr>
						</s:if>
						<s:else>
							<input type="hidden" value="${member.m_uid }" name="m_uid"/>
						</s:else>
						<tr>
							<td style="width: 20%;text-align: right;">会员名称</td>
							<td style="text-align: left;padding-left: 20px;">
								<input type="hidden" id="id" name="m_id" value="${member.m_id}">
								<input type="hidden" id="sdv" name="m_scbs" value="${member.m_scbs}">
								<input type="hidden" id="zcsj" name="m_zcsj" value="${member.m_zcsj}">
								<input type="text" id="unitname" name="m_name" class="txt200" value="${member.m_name }">
								<input type="hidden" id="d" name="m_loginname" value="${member.m_loginname}">
								<input type="hidden" id="ea" name="m_email" value="${member.m_email}">
								<input type="hidden" id="pwd" name="m_pwd" class="txt200" value="${member.m_pwd }">
								<span id="spanunitname" style="color:red;display:none;">不能为空</span>
							</td>
						</tr>
						<tr>
							<td style="width: 20%;text-align: right;">会员等级</td>
							<td style="text-align: left;padding-left: 20px;">
								 <select id="parentid"
								name="d" class="select_d">
								<option value="0">无</option>
									<s:iterator value="#mglist" var="u">
										<option value='<s:property value="#u.mg_id"/>'><s:property value="#u.mg_name"/></option>
									</s:iterator>
							</select>
								<span id="lxrid" style="color:red;display:none;">不能为空</span>
							</td>
						</tr>
						<tr>
							<td style="width: 20%;text-align: right;">联系手机</td>
							<td style="text-align: left;padding-left: 20px;">
								<input type="text" id="lxfs" name="m_phone" class="txt200" value="${member.m_phone }">
								<span id="lxfsid" style="color:red;display:none;">不能为空</span>
							</td>
						</tr>
						<tr>
							<td style="width: 20%;text-align: right;">联系qq</td>
							<td style="text-align: left;padding-left: 20px;">
								<input type="text" id="lxfs" name="m_qq" class="txt200" value="${member.m_qq }">
								<span id="lxfsid" style="color:red;display:none;">不能为空</span>
							</td>
						</tr>
						<tr>
							<td style="width: 20%;text-align: right;">所属地区</td>
							<td style="text-align: left;padding-left: 20px;">
								<input type="text" id="lxfs" name="m_address" class="txt200" value="${member.m_address }">
								<span id="lxfsid" style="color:red;display:none;">不能为空</span>
							</td>
						</tr>
						<tr>
							<td style="width: 20%;text-align: right;">出生日期</td>
							<td style="text-align: left;padding-left: 20px;">
								<input name="m_csrq" type="text" id="txtStartTime" readonly="readonly" value="${member.m_csrq }" class="easyui-datebox" >
								<span id="lxfsid" style="color:red;display:none;">不能为空</span>
							</td>
						</tr>
						<tr>
							<td style="width: 20%;text-align: right;">性别</td>
							<td style="text-align: left;padding-left: 20px;">
								<input type="hidden" name="m_xb" value="" id="lxid"/>
							<s:if test="#session.member.m_xb==0">
							<label><input name="mg_sfmr1" type="radio" value="0" checked="checked"/>男 </label> 
							<label><input name="mg_sfmr1" type="radio" value="1" />女</label> 
							</s:if>
							<s:else>
							<label><input name="mg_sfmr1" type="radio" value="0" />男 </label> 
							<label><input name="mg_sfmr1" type="radio" value="1" checked="checked"/>女 </label> 
							</s:else>
							</td>
						</tr>
						
						<tr>
							<td style="width: 20%;text-align: right;">备注</td>
							<td style="text-align: left;padding-left: 20px;">
								<input type="text" id="lxfs" name="m_bz" class="txt200" value="${member.m_bz }">
								<span id="lxfsid" style="color:red;display:none;">不能为空</span>
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