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
			<form action="" method="post" id="form1">
				<p>第一步：下载特定类型的csv格式文件</p>
				选择商品分类：
				<!-- Single button -->
				<div class="btn-group">
					<select id="parentid" name="commoditySort.cs_id" class="select_d"
						style="width: 100px;">
						<option value="0">请选择</option>
						<s:iterator value="cslist">
							<option value="<s:property value="cs_id"/>"><s:property
									value="cs_name" /></option>
						</s:iterator>
					</select>

				</div>

				&nbsp;&nbsp; 选择商品品牌：
				<!-- Single button -->
				<div class="btn-group">
					<select id="dfparentid" name="commodityBrand.cb_id" class="select_d"
						style="width: 100px;">
						<option value="0">请选择</option>
						<s:iterator value="cblist">
							<option value="<s:property value="cb_id"/>"><s:property
									value="cb_name" /></option>
						</s:iterator>
					</select>
				</div>
				&nbsp;&nbsp; 选择商品供应商：
				<!-- Single button -->
				<div class="btn-group">
					<select id="dfpsarentid" name="gysInfo.g_id" class="select_d"
						style="width: 100px;">
						<option value="0">请选择</option>
						<s:iterator value="gyslist">
							<option value="<s:property value="g_id"/>"><s:property
									value="g_name" /></option>
						</s:iterator>
					</select>
				</div>
				<div style="clear: both; margin-bottom: 10px;"></div>
				<a href="#" class="btn btn-primary" id="down">下载</a>
              </form>
			</div>

			<div class="bg-info" style="padding: 10px 20px; margin-top: 20px;">
				<p>第二步：根据下载特定类型的csv格式文件进行文件填写</p>
			</div>

			<div class="bg-info" style="padding: 10px 20px; margin-top: 20px;">
				<form action="commodity_uploadcommdity.action" method="post" enctype="multipart/form-data">
					<p>第三步：上传您填写的商品信息csv格式文件</p>
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
		$("#down").click(function(){
			 var selObj = $("#dfparentid").val();//品牌
			 var flobh=$("#parentid").val();//分类
			 var gysobh=$("#dfpsarentid").val();//供应商
			$.ajax({
				   type: "POST",
				   url: "commodity_downexcel",
				   data: "commodityBrand.cb_id="+selObj+"&commoditySort.cs_id="+flobh
					 +"&gysInfo.g_id="+gysobh,
				   success: function(msg){
				   		window.location.href="${pageContext.request.contextPath }/Template/"+msg;
				   }
			});
		});
		 
	})
</script>
</body>
</html>