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
		
		$("#save").click(function(){
			$("#form1").form('submit',{
				url:'${pageContext.request.contextPath}/commodityimg_addxxtimg',
				onSubmit:function(){
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
				上传图片
			</div>
			<div style="height: 330px;">
				<form id="form1" method="post" enctype="multipart/form-data">
				<input type="hidden" name="commodity.c_id" id="fid" value="<%=request.getParameter("result")%>">
					<table style="margin: 0 auto;width: 50%;">
						<tr>
								<td style="width: 20%;text-align: right;">属性形象图</td>
								<td style="text-align: left;padding-left: 20px;">
								<input name="fileProductPic" type="file"
									id="fileProductPic" size="40"
									style="border: darkgray 1px solid; height: 22px; line-height: 20px; width: 180px;" />
										
										<% 
										 String s=request.getParameter("ims");
										if(s!=null) {%>
										<input type="hidden" name="commodity.c_spxximg" value="<%=s %>" />
										<a href="imgss.jsp?file=<%=s %>" target="_blank"> <img
											title="浏览图片" src="imgss.jsp?file=<%=s %>"
											style="cursor: hand; border: 0;" width="30px" height="30px"></a>
											<%} %>
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