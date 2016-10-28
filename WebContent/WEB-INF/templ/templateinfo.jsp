<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>CisoftOnline</title>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-1.8.3.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/easyui/easyui-lang-zh_CN.js"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/js/easyui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/js/easyui/themes/icon.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/panel.css">
<script type="text/javascript">
	$(function(){		
		$("input:radio[name='cp_lx']").change(function (){ 
			$("#lxid").val($(this).val());
			});
		$("input:radio[name='us_lx']").change(function (){ 
			$("#usid").val($(this).val());
			});
		$("#parentid").val("${_parentId}");
		$("#save").click(function(){
			$("#form1").form('submit',{
				url:'${pageContext.request.contextPath}/templad_save',
				onSubmit:function(){
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
				<s:if test="t_id!=0">
					修改模版信息
				</s:if>
				<s:else>
					添加模版信息
				</s:else>
			</div>
			<div style="height: 330px;">
				<form id="form1" method="post" enctype="multipart/form-data">
				<input type="hidden" name="_parentId" id="fid" value="${_parentId}">
					<table style="margin: 0 auto;width: 50%;">
					<tr>
							<td style="width: 20%;text-align: right;">主模版名称</td>
							<td style="text-align: left;padding-left: 20px;">
								<select id="parentid" name="s" class="select_d">
									   <option value="0" >无</option>
									<s:iterator value="#template" var="ds">
											<option value="${t_id }">${t_name }</option>
									</s:iterator>
								</select>								
							</td>
						</tr>
						<tr>
							<td style="width: 20%;text-align: right;">模版名称</td>
							<td style="text-align: left;padding-left: 20px;">
								<input type="hidden" id="id" name="t_id" value="${t_id}">
								<input type="hidden" id="isdelete" name="t_scbs" value="${t_scbs}">
								
								<input type="text" id="unitname" name="t_name" class="txt200" value="${t_name }" >
								<span id="spanunitname" style="color:red;display:none;">不能为空</span>
							</td>
						</tr>
						<tr>
							<td style="width: 20%;text-align: right;">模版缩略图</td>
							<td style="text-align: left;padding-left: 20px;">
								<input name="fileProductPic" type="file"
									id="fileProductPic" size="40"
									style="border: darkgray 1px solid; height: 22px; line-height: 20px; width: 180px;" />
									<s:if test="t_sltimg!=''">
										<input type="hidden" name="t_sltimg" value="${t_sltimg }" />
										<a href="imgss.jsp?file=${t_sltimg }" target="_blank"> <img
											title="浏览图片" src="imgss.jsp?file=${t_sltimg }"
											style="cursor: hand; border: 0;" width="30px" height="30px"></a>
									</s:if>
								
							</td>
						</tr>
						<tr>
							<td style="width: 20%;text-align: right;">上传模版</td>
							<td style="text-align: left;padding-left: 20px;">
								<input name="fileProductPicst" type="file"
									id="fileProductPicst" size="40"
									style="border: darkgray 1px solid; height: 22px; line-height: 20px; width: 180px;" />
									<s:if test="t_url!=''">
										<input type="hidden" name="t_url" value="${t_url }" />
										<a href="${t_url }" target="_blank">${t_url }</a>
									</s:if>
								
							</td>
						</tr>
							<tr>
							<td style="width: 20%;text-align: right;">是否应用</td>
							<td style="text-align: left;padding-left: 20px;">
									<input type="hidden" name="t_userbs" value="" id="usid"/>
									<s:if test="t_userbs==1">
									<label><input name="us_lx" type="radio" value="1" checked="checked"/>是 </label> 
									<label><input name="us_lx" type="radio" value="2" />否 </label> 
									</s:if>
									<s:else>
									<label><input name="us_lx" type="radio" value="1" />是 </label> 
									<label><input name="us_lx" type="radio" value="2" checked="checked"/>否 </label> 
									</s:else>
							</td>
						</tr>
						<tr>
							<td style="width: 20%;text-align: right;">是否免费</td>
							<td style="text-align: left;padding-left: 20px;">
								<input type="hidden" name="t_vipbs" value="" id="lxid"/>
							<s:if test="t_vipbs==1">
							<label><input name="cp_lx" type="radio" value="1" checked="checked"/>是 </label> 
							<label><input name="cp_lx" type="radio" value="2" />否 </label> 
							</s:if>
							<s:else>
							<label><input name="cp_lx" type="radio" value="1" />是 </label> 
							<label><input name="cp_lx" type="radio" value="2" checked="checked"/>否 </label> 
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