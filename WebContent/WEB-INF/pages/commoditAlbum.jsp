<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>广西100南宁商家订单系统</title>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/jquery-1.8.3.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/css/bootstrap.min.css">
<style type="text/css">
.middle {
	margin: 20px 20px auto;
}

a {
	cursor: pointer;
}

.file_td input {
	vertical-align: middle;
	margin: 0;
	padding: 0
}

.file_td {
	position: relative;
	/* width:235px */
}

.file_td .file_txt {
	height: 26px;
	border: 1px solid #9b9b9b;
	width: 55px;
	display: none;
}

.file_td .file_btn {
	border: 1px solid #9b9b9b;
	height: 28px;
	line-height: 28px;
	width: 50px;
}

.file_td .file_file {
	position: absolute;
	top: 0;
	right: 100;
	height: 28px;
	filter: alpha(opacity : 0);
	opacity: 0;
}
.checkinput{
  border: 1px solid #000;
  width: 20px;
  height: 20px;
}
</style>
<script type="text/javascript">
	$(function() {
		
	});

	//删除缩略图
	function delslt() {
		$.ajax({
			/*  cache: true, */
			type : "POST",
			url : "commodityimg_delimg",
			data : "result="+$("#slid").val(),// 你的formid
			/*  async: false, */
			error : function(request) {
				alert("删除失败");
			},
			success : function(data) {
				alert(data);
				location.reload();

			}
		});
	}
	function delxxt(){
		$.ajax({
			/*  cache: true, */
			type : "POST",
			url : "commodityimg_delimg",
			data : "result="+$("#xxyid").val(),// 你的formid
			/*  async: false, */
			error : function(request) {
				alert("删除失败");
			},
			success : function(data) {
				alert(data);
				location.reload();

			}
		});
	}
	function delggt(id){
		$.ajax({
			/*  cache: true, */
			type : "POST",
			url : "commodityimg_delimg",
			data : "result="+id,// 你的formid
			/*  async: false, */
			error : function(request) {
				alert("删除失败");
			},
			success : function(data) {
				alert(data);
				location.reload();

			}
		});
	}
	function add(id,ims){
		var widoid="add123"+id;
		  var iWidth="468"; //弹出窗口的宽度;
			 var iHeight="268"; //弹出窗口的高度;
			 var iTop = (window.screen.availHeight-30-iHeight)/2; //获得窗口的垂直位置;
			 var iLeft = (window.screen.availWidth-10-iWidth)/2; //获得窗口的水平位置;
	         window.open('${pageContext.request.contextPath}/pages_commodityAlbumslt?result='+id+"&ims="+ims,widoid,'height='+iHeight+',width='+iWidth+',top='+iTop+',left='+iLeft+',toolbar=no,menubar=no,scrollbars=no,resizable=no,location=no,status=no');
	}
	function addxxt(id,ims){
		var widoid="add123"+id;
		  var iWidth="468"; //弹出窗口的宽度;
			 var iHeight="268"; //弹出窗口的高度;
			 var iTop = (window.screen.availHeight-30-iHeight)/2; //获得窗口的垂直位置;
			 var iLeft = (window.screen.availWidth-10-iWidth)/2; //获得窗口的水平位置;
	         window.open('${pageContext.request.contextPath}/pages_commodityAlbumxxt?result='+id+"&ims="+ims,widoid,'height='+iHeight+',width='+iWidth+',top='+iTop+',left='+iLeft+',toolbar=no,menubar=no,scrollbars=no,resizable=no,location=no,status=no');
	}
</script>
</head>
<body class="easyui-layout">
	<div region="center" border="false">
		<div class="middle" id="tb">
			<div style="float: left; font-size: 18px;font-weight: bold;">商品相册</div>
			<div style="float: left;border-left: 1px solid #000;padding-left: 20px;margin-left: 20px;padding-top: 3px;">
			 ${commodity.c_name }
			</div>
			<div style="float: right;"><button type="button" class="btn btn-info" onclick="">全部导出</button></div>
			<div style="clear: both;"></div>
			<!-- <a class="btn btn-primary" style="float: right;">增加规格项</a> -->
		</div>
		<hr>
		<div class="middle">

			<div class="bs-example bs-example-tabs" role="tabpanel"
				data-example-id="togglable-tabs">
				<ul id="myTab" class="nav nav-tabs" role="tablist">
					<li role="presentation" class="active"><a href="#home1"
						id="home-tab1" role="tab" data-toggle="tab" aria-controls="home1"
						aria-expanded="true">缩略图</a></li>
					<li role="presentation"><a href="#home2" id="home-tab2"
						role="tab" data-toggle="tab" aria-controls="home2"
						aria-expanded="true">商品形象图 </a></li>
					<li role="presentation"><a href="#home3" id="home-tab3"
						role="tab" data-toggle="tab" aria-controls="home3"
						aria-expanded="true">商品规格图 </a></li>
					<!-- <li role="presentation"><a href="#profile" role="tab"
						id="profile-tab" data-toggle="tab" aria-controls="profile">颜色</a></li> -->

				</ul>
				<div id="myTabContent" class="tab-content">
					<div role="tabpanel" class="tab-pane fade in active" id="home1"
						aria-labelledby="home-tab1">
						<div style="margin-top: 10px;margin-bottom: 10px;"> 
						 	<s:if test="commodity.c_sltimg!=''">
						 	<button type="button" class="btn btn-primary" onclick="add('${commodity.c_id }','${commodity.c_sltimg }');">修改</button>
						 <button type="button" class="btn btn-danger" onclick="delslt();">删除</button>
						 </s:if>
						 <s:else>
						 <button type="button" class="btn btn-primary" onclick="add('${commodity.c_id }','null');">添加</button>
						 </s:else>
						</div>
							<s:if test="commodity.c_sltimg!=''">
						<div class="bs-example" data-example-id="simple-thumbnails">
							<div class="row">
								<div class="col-xs-6 col-md-3">
									<a href="#" class="thumbnail"> <img  
										data-src="holder.js/100%x180" alt="100%x180"
										src="imgss.jsp?file=${commodity.c_sltimg }"
										data-holder-rendered="true" 
										style=" height: 180px;width: 100%; display: block;">
									<input type="hidden" name="" value="${commodity.c_id },sl" id="slid" class="checkinput">	
									</a>
								</div>
							</div>
						</div>
						</s:if>
						<s:else>
						
						<div class="panel panel-default">
  <div class="panel-body text-center">
    暂无相关图片
  </div>
</div>
						</s:else>
					</div>
					<div role="tabpanel" class="tab-pane fade" id="home2"
						aria-labelledby="home-tab2">
						<div style="margin-top: 10px;margin-bottom: 10px;"> 
						
						 <s:if test="commodity.c_spxximg!=''">
						 <button type="button" class="btn btn-primary" onclick="addxxt('${commodity.c_id}','${commodity.c_spxximg}');">修改</button>
						 <button type="button" class="btn btn-danger" onclick="delxxt();">删除</button>
						 </s:if>
						 <s:else>
						  <button type="button" class="btn btn-primary" onclick="addxxt('${commodity.c_id}',null);">添加</button>
						 </s:else>
						</div>
						<s:if test="commodity.c_spxximg!=''">
						<div class="bs-example" data-example-id="simple-thumbnails">
							<div class="row">
						<div class="col-xs-6 col-md-3">
									<a href="#" class="thumbnail"> <img
										data-src="holder.js/100%x180" alt="100%x180"
										src="imgss.jsp?file=${commodity.c_spxximg }"
										data-holder-rendered="true"
										style="height: 180px; width: 100%; display: block;">
										<input type="hidden" name="" value="${commodity.c_id },xy" id="xxyid" class="checkinput">
									</a>
								</div>
								</div>
								
								</div>
								</s:if>
								<s:else>
						
						<div class="panel panel-default">
  <div class="panel-body text-center">
    暂无相关图片
  </div>
</div>
						</s:else>
									
					</div>
					<div role="tabpanel" class="tab-pane fade" id="home3"
						aria-labelledby="home-tab3">
						<div style="margin-top: 10px;margin-bottom: 10px;"> 
						 <!-- <button type="button" class="btn btn-primary">添加</button> -->
						 
						</div>
						 <s:if test="#csllist.size()==0&&#sdl.size()==0">
						 <div class="panel panel-default">
  <div class="panel-body text-center">
    暂无相关图片
  </div>
</div>
						 </s:if>
						 <s:else>
							<s:iterator value="#csllist" var="sdd">
							<div class="col-xs-6 col-md-3">
									<a href="#" class="thumbnail"> <img
										data-src="holder.js/100%x180" alt="100%x180"
										src="imgss.jsp?file=<s:property value='#sdd.csl_imgs'/> "
										data-holder-rendered="true"
										style="height: 180px; width: 100%; display: block;">
										<input type="hidden" name="" value='<s:property value="#sdd.csl_id"/>,ggid' class="checkinput">
									<button type="button" class="btn btn-danger" onclick="delggt('<s:property value="#sdd.csl_id"/>,ggid');">删除</button>
									
									</a>
										
								</div>
								</s:iterator>
								<s:if test="#sdl.size()!=0">
								<s:iterator value="sdl" var="s">
								<div class="col-xs-6 col-md-3">
									<a href="#" class="thumbnail"> <img
										data-src="holder.js/100%x180" alt="100%x180"
										src="imgss.jsp?file=<s:property value='#s'/> "
										data-holder-rendered="true"
										style="height: 180px; width: 100%; display: block;">
										<input type="hidden" name="" value="<s:property value='#s'/>,xcid" class="checkinput">
									<button type="button" class="btn btn-danger" onclick="delggt('<s:property value='#s'/>,xcid');">删除</button>
									</a>
										
								</div>
								</s:iterator>
								</s:if>
								</s:else>
								</div>
								
				</div>
			</div>

			<div style="clear: both;"></div>
		</div>
	</div>

</body>
</html>