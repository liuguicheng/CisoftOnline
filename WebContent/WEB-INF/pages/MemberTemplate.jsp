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
	<div class="row" style="margin: 10px 20px;">
		<div class="col-md-8">
			<div class="bg-info" style="padding: 10px 20px;">
				<p>第一步：下载模版文件</p>
				<div style="clear: both; margin-bottom: 10px;"></div>
				<a href="${pageContext.request.contextPath }/Template/membertemple.xlsx" class="btn btn-primary" id="down">下载</a>
			</div>

			<div class="bg-info" style="padding: 10px 20px; margin-top: 20px;">
				<p>第二步：根据下载特定类型的csv格式文件进行文件填写</p>
			</div>

			<div class="bg-info" style="padding: 10px 20px; margin-top: 20px;">
				<form action="member_dosavemember.action" method="post" enctype="multipart/form-data">
					<p>第三步：上传您填写的会员信息csv格式文件</p>
					<div width="240" class="file_td">
						<input type="text" name='textfield' id='textfield2'
							class='file_txt' /> <input type='button'
							class='file_btn btn btn-primary btn-sm' value='选择' /> <input
							type="file" name="fileProductPic" class="file_file"
							id="fileField" size="28"
							onchange="document.getElementById('textfield2').value=this.value" />
					</div>

					<div style="margin-top: 10px;">
						<button type="submit" class="btn btn-primary">上传</button>
					</div>
				</form>
			</div>

		</div>
	</div>
	<script type="text/javascript"
		src="${pageContext.request.contextPath }/js/bootstrap.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath }/js/bootstrap-dropdown.js"></script>
	<script type="text/javascript">
	$(function() {
		
		 
	})
</script>
</body>
</html>