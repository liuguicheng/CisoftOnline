<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/jquery-1.8.3.js"></script>


<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/css/bootstrap.min.css">

<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/css/panel.css">
<style type="text/css">
.file_td input {
	vertical-align: middle;
	margin: 0;
	padding: 0
}

.file_td {
	position: relative;
	width: 235px
}

.file_td .file_txt {
	height: 26px;
	border: 1px solid #9b9b9b;
	width: 175px;
}

.file_td .file_btn {
	/* background-color:#FFF; */
	border: 1px solid #9b9b9b;
	height: 28px;
	line-height: 28px;
	width: 50px;
}

.file_td .file_file {
	position: absolute;
	top: 0;
	right: 0;
	height: 28px;
	filter: alpha(opacity : 0);
	opacity: 0;
}
</style>

</head>
<body>
	<div class="row" style="margin: 80px 20px;">
		<div class="col-md-8">
			<div class="bg-info" style="padding: 10px 20px;">
				
		     <div style="clear: both; margin-bottom: 10px;"></div>
		        <h2>批量导入商品信息成功,已导入${result }条商品信息！</h2>
		        
		        <a href="#" class="btn btn-primary" id="gbye">关闭本页</a>
				<a href="javascript:history.go(-1)" class="btn btn-primary" id="down">返回上页</a>
			</div>

			

		</div>
	</div>
	<script type="text/javascript"
		src="${pageContext.request.contextPath }/js/bootstrap.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath }/js/bootstrap-dropdown.js"></script>
	<script type="text/javascript">
	$(function() {
		$("#down").click(function(){
			window.history.go(-1);
		});
		 $("#gbye").click(function(){
			 window.close();
			});
	})
</script>
</body>
</html>