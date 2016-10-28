<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>广西100南宁商家订单系统</title>
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
				url:'${pageContext.request.contextPath}/cbaction_addCommodityBinding',
				onSubmit:function(){
					
				},
				success:function(data){
						$.messager.alert("提示",eval("('"+data+"')"),"info");
					    window.close();
						window.opener.location.reload();
						
					
				}
			});
		});
	});
		
		
	
</script>
</head>
<body class="easyui-layout">	
	<div region="center">
			<div style="height: 40px; text-align: center;line-height: 40px;background: #e0edff;font-family: '黑体';font-size: large;font-weight: bolder;">
					绑定商品
			</div>
			<div style="height: 330px;">
				<form id="form1" method="post" >
					<table style="margin: 0 auto;width: 50%;">
						
						<tr>
							<td style="width: 20%;text-align: right;">绑定商品</td>
							<td style="text-align: left;padding-left: 20px;">
							<input type="hidden" name="cb_zid" value="<%= request.getParameter("result")%>">
							<select id="parentid" name="cb_fid" class="select_d">
									   <option value="0" >无</option>
									<s:iterator value="commodities" >
											<option value="${c_id }">${c_name }</option>
									</s:iterator>
								</select>		
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