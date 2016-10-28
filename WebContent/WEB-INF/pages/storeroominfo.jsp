<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>广西100南宁－后台管理系统</title>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-1.8.3.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/easyui/easyui-lang-zh_CN.js"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/js/easyui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/js/easyui/themes/icon.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/panel.css">
<script type="text/javascript">
	$(function(){		
		//下拉框回显
		
		$("#save").click(function(){
			$("#form1").form('submit',{
				url:'${pageContext.request.contextPath}/storeroom_save',
				onSubmit:function(){
					var unitname=$("#unitname").val();
					if($.trim(unitname).length==0){
						$("#spanunitname").show();
						return false;
					}else{
						$("#spanunitname").hide();
					}
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
		<div class="divall">
			<div style="height: 40px; text-align: center;line-height: 40px;background: #e0edff;font-family: '黑体';font-size: large;font-weight: bolder;">
				<s:if test="s_id!=0">
					修改库房信息
				</s:if>
				<s:else>
					添加库房信息
				</s:else>
			</div>
			<div style="height: 330px;">
				<form id="form1" method="post">
					<table style="margin: 0 auto;width: 50%;">
						<tr>
							<td style="width: 20%;text-align: right;">库房名称</td>
							<td style="text-align: left;padding-left: 20px;">
								<input type="hidden" id="id" name="s_id" value="${s_id}">
								<input type="hidden" id="isdelete" name="s_scbs" value="${s_scbs}">
								
								<input type="text" id="unitname" name="s_name"  class="txt200" value="${s_name }">
								<span id="spanunitname" style="color:red;display:none;">不能为空</span>
							</td>
						</tr>
						<tr>
							<td style="width: 20%;text-align: right;">所属仓库</td>
							<td style="text-align: left;padding-left: 20px;">
								<select id="role" name="storehouse.sh_id" class="select_d">
									<s:iterator value="#storehouse" var="u">
									<s:if test="storeroom.sh_id==#u.sh_id">
									<option value="${sh_id}" selected="selected">${sh_name }</option>
									</s:if>
										<option value="${sh_id}">${sh_name }</option>
									</s:iterator>
								</select>
							</td>
						</tr>
						<tr>
							<td style="width: 20%;text-align: right;">描述</td>
							<td style="text-align: left;padding-left: 20px;">
								
								<textarea rows="3" cols="3" name="s_ms" class="txt200" style="height: 100px;">${s_ms }</textarea>
								<span id="msid" style="color:red;display:none;">不能为空</span>
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
	</div>
</body>
</html>