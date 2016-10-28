<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/jquery-1.8.3.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/bootstrap.min.js"></script>
<script
	src="${pageContext.request.contextPath }/js/yj/js/jquery.contextmenu.js"></script>
<script src="${pageContext.request.contextPath }/js/yj/js/gb.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/layer/layer.js"></script>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/css/bootstrap.c6.css">
<script type="text/javascript">
	$(function() {
		$("#selid").click(function() {
			var s = $("#bqid").val();
			if (s == "") {
				alert("请选择标签");
				return false;
			} else {
				$("#content", window.parent.document).insert({
					"text" : s
				});
				//$(window.parent.document).find("#content").insert({"text":s});
				//layer.closeAll("iframe");
				var index = parent.layer.getFrameIndex(window.name); //先得到当前iframe层的索引
				parent.layer.close(index); //再执行关闭 
			}
		});

		$("input[name='cp_lx']").change(function() {
			$("#bqid").val($(this).val());
		});
	});
</script>
</head>
<body>

	<button class="btn btn-primary" type="button"
		style="margin-top: 10px; margin-left: 20px;" id="selid">选择</button>
	<input type="hidden" name="" id="bqid" value="">
	<div style="margin: 10px 20px auto;">

		<s:iterator value="#tllist" var="ds">

			<s:if test="_parentId==0">
				<div class="bs-callout bs-callout-warning"
					id="callout-modal-mobile-caveats">
					<h4 id="对于移动设备的附加说明">${tl_name }<a class="anchorjs-link"
							href="#对于移动设备的附加说明"><span class="anchorjs-icon"></span></a>
					</h4>
					<s:iterator value="#tllist" var="ssd">
						<s:if test="#ds.tl_id==#ssd._parentId&&_parentId!=0">
							<label><input name="cp_lx" type="radio"
								value="${tl_context}" />${tl_name} </label>
							<br />
						</s:if>
					</s:iterator>
				</div>
			</s:if>


		</s:iterator>
	</div>
</body>
</html>