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
		
		$("#save").click(function() {
			$("#form1").form('submit', {
				url : '${pageContext.request.contextPath}/merchantinfo_save',
				onSubmit : function() {
				},
				success : function(data) {
					$.messager.alert("提示", eval("(" + data + ")"), "info");
				}
			});
		});
	})
	
</script>
</head>
<body class="easyui-layout">	
	<div region="center">
			<!-- <div style="height: 28px; background: url('img/titleall.gif') repeat-x;">
				<div class="titleleft"></div>
				<div class="titleright"></div>
			</div> -->
			<div style="height: 40px; text-align: center;line-height: 40px;background: #e0edff;font-family: '黑体';font-size: large;font-weight: bolder;margin-top: 10px;">
				设置商家信息
			</div>
			<div style="height: 330px;">
				<form id="form1" method="post" enctype="multipart/form-data">
				<input type="hidden" name="mi_scbs" value="${mi_scbs }">
				<input type="hidden" name="mi_starttime" value="${mi_starttime }">
				<input type="hidden" name="mi_endtime" value="${mi_endtime }">
				<input type="hidden" name="mi_id" value="${mi_id }">
				<input type="hidden" name="merchantClass.id" value="${merchantClass.id }">
					<table style="margin: 0 auto;">
						<tr>
							<td>商家名称</td>
							<td>
							<input type="text" id="passwordold" name="mi_name" value='<s:property value="merchantInfo.mi_name"/>'  class="txt200">
								
							</td>
							<td>
							<span id="passwordidid" style="color: red;display: none;">不能为空</span>
							</td>
						</tr>
						<tr>
							<td>网店地址</td>
							<td>
								<input type="text" id="password"  name="mi_url" class="txt200" value="<s:property value="merchantInfo.mi_url"/>">
							</td>
							<td>
								<span id="spanpassword" style="color: red;display: none;">不能为空</span>
							</td>
						</tr>
						<tr>
							<td>商店logo</td>
							<td>
								<input name="fileProductPic" type="file"
									id="fileProductPic" size="40"
									style="border: darkgray 1px solid; height: 22px; line-height: 20px; width: 180px;" />
									<s:if test="mi_logourl!=''">
										<input type="hidden" name="mi_logourl" value="<s:property value="merchantInfo.mi_logourl"/>" />
										<a href="imgss.jsp?file=<s:property value="merchantInfo.mi_logourl"/>" target="_blank"> <img
											title="浏览图片" src="imgss.jsp?file=<s:property value="merchantInfo.mi_logourl"/>"
											style="cursor: hand; border: 0;" width="30px" height="30px"></a>
									</s:if>
							</td>
							<td>
								<span id="spanpasswordsecond" style="color: red;display: none;">不能为空</span>
							</td>
						</tr>
						<tr>
							<td>备案号</td>
							<td>
								<input type="text" id="password"  class="txt200" value="<s:property value="merchantInfo.mi_bzh"/>" name="mi_bzh">
							</td>
							<td>
								<span id="spanpassword" style="color: red;display: none;">不能为空</span>
							</td>
						</tr>
						<tr>
							<td></td>
							<td><a id="save" icon="icon-save" href="#" class="easyui-linkbutton"  >保存</a></td>
						</tr>
					</table>
				</form>
				
			</div>
	</div>
</body>
</html>