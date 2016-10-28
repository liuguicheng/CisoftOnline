<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>广西100南宁商家订单系统</title>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-1.8.3.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/validate/membershipgradeinfo_validate.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/easyui/easyui-lang-zh_CN.js"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/js/easyui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/js/easyui/themes/icon.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/panel.css">
<script type="text/javascript">
	$(function(){		
		$("input:radio[name='mg_sfmr1']").change(function (){ 
			$("#lxid").val($(this).val());
			});
		$("#save").click(function(){
			$("#form1").form('submit',{
				url:'${pageContext.request.contextPath}/membershipgrade_save',
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
				<s:if test="mg_id!=0">
					修改会员等级信息
				</s:if>
				<s:else>
					添加会员等级信息
				</s:else>
			</div>
			<div style="height: 330px;">
				<form id="form1" method="post">
					<table style="margin: 0 auto;width: 50%;">
						<tr>
							<td style="width: 20%;text-align: right;">会员等级名称</td>
							<td style="text-align: left;padding-left: 20px;">
								<input type="hidden" id="id" name="mg_id" value="${membershipGrade.mg_id}">
								<input type="hidden" id="isdelete" name="mg_scbs" value="${membershipGrade.mg_scbs}">
								
								<input type="text" id="unitname" name="mg_name" class="txt200" value="${membershipGrade.mg_name }">
								<span id="spanunitname" style="color:red;display:none;">不能为空</span>
							</td>
						</tr>
						<tr>
							<td style="width: 20%;text-align: right;">享受折扣</td>
							<td style="text-align: left;padding-left: 20px;">
								
								<input type="text" id="lxr" name="mg_zk" class="txt200" value="${membershipGrade.mg_zk}">
								<span id="lxrid" style="color:red;display:none;">不能为空</span>
							</td>
						</tr>
						<tr>
							<td style="width: 20%;text-align: right;">所需积分</td>
							<td style="text-align: left;padding-left: 20px;">
								<input type="text" id="lxfs" name="mg_jf" class="txt200" value="${membershipGrade.mg_jf }">
								<span id="lxfsid" style="color:red;display:none;">不能为空</span>
							</td>
						</tr>
						<tr>
							<td style="width: 20%;text-align: right;">是否默认</td>
							<td style="text-align: left;padding-left: 20px;">
								<input type="hidden" name="mg_sfmr" value="" id="lxid"/>
							<s:if test="#session.membershipGrade.mg_sfmr==1">
							<label><input name="mg_sfmr1" type="radio" value="1" checked="checked"/>是 </label> 
							<label><input name="mg_sfmr1" type="radio" value="2" />否</label> 
							</s:if>
							<s:else>
							<label><input name="mg_sfmr1" type="radio" value="1" />是 </label> 
							<label><input name="mg_sfmr1" type="radio" value="2" checked="checked"/>否 </label> 
							</s:else>
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