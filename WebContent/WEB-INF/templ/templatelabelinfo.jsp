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
		$("#parentid").val("${_parentId}");
		$("#save").click(function(){
			$("#form1").form('submit',{
				url:'${pageContext.request.contextPath}/templabel_save',
				onSubmit:function(){
					var s= $("#tlid").val();
					var unitname=$("#unitname").val();
					if(s==""){
						alert("请填写标签内容");
						return false;
					}
					if(unitname==""){
						alert("请填写标签名称");
						return false;
					}
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
				<s:if test="tl_id!=0">
					修改模版标签信息
				</s:if>
				<s:else>
					添加模版标签信息
				</s:else>
			</div>
			<div style="height: 330px;">
				<form id="form1" method="post" >
				<input type="hidden" name="_parentId" id="fid" value="${_parentId}">
					<table style="margin: 0 auto;width: 50%;">
					<tr>
							<td style="width: 20%;text-align: right;">主模版标签名称</td>
							<td style="text-align: left;padding-left: 20px;">
								<select id="parentid" name="s" class="select_d">
									   <option value="0" >无</option>
									<s:iterator value="#templateLabel" var="ds">
											<option value="${tl_id }">${tl_name }</option>
									</s:iterator>
								</select>								
							</td>
						</tr>
						<tr>
							<td style="width: 20%;text-align: right;">模版名称</td>
							<td style="text-align: left;padding-left: 20px;">
								<input type="hidden" id="id" name="tl_id" value="${tl_id}">
								<input type="hidden" id="isdelete" name="tl_scbs" value="${tl_scbs}">
								
								<input type="text" id="unitname" name="tl_name" class="txt200" value="${tl_name }" >
								<span id="spanunitname" style="color:red;display:none;">不能为空</span>
							</td>
						</tr>
						<tr>
							<td style="width: 20%;text-align: right;">模版标签内容</td>
							<td style="text-align: left;padding-left: 20px;">
							<textarea rows="10" cols="30" name="tl_context" id="tlid">${tl_context }</textarea>
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