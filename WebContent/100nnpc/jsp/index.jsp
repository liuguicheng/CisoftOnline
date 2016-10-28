<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>100南宁商城后台管理系统</title>
<link href="${pageContext.request.contextPath }/100nnpc/css/Article.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath }/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath }/100nnpc/css/bootstrap-responsiv.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath }/100nnpc/css/bootstrap.datatable.css" rel="stylesheet" type="text/css" />

</head>
<body>
<!-- 头部导航开始 -->
<div id="Top">
  <div class="Toolbar1">
    <div class="CentreBox">
      <div class="Logo"><a href="#" target="_self"><!-- <img src="../Images/logo_1.jpg" alt="网站名称" width="166px" height="50px"/> --></a></div>
      <div class="Menu">
        <ul class="List1">
          <li class="Select"><a href="#" target="_blank">100南宁</a></li>
          <li><a href="#" target="_blank">行业快讯</a></li>
          <li><a href="#" target="_blank">供需市场</a></li>
          <li><a href="#" target="_blank">系统设置</a></li>
          <li><a href="#" target="_blank">帮助中心</a></li>
        </ul>
       <!--  <ul class="List2">
          <li><a href="#" target="_blank">企业微博</a></li>
          <li><a href="#" target="_blank">推广</a></li>
          <li><a href="#" target="_blank">相册</a></li>
          <li><a href="#" target="_blank">群组</a></li>
          <li><a href="#" target="_blank">分享</a></li>
          <li><a href="#" target="_blank">商机</a></li>
        </ul> -->
      </div>
      <div class="UserInfo">
        <div class="NickName"><span class="PicMiddle"><a href="#" target="_self"><img src="../Images/Vip.png" alt="VIP用户" /></a></span>&nbsp;&nbsp;<a href="http://www.baidu.com" target="_self">lgc</a></div>
      </div>
      <div class="Setting"><a href="#" target="_self"></a></div>
      <div class="Message"><a href="#" target="_self"></a></div>
    </div>
  </div>
  <div class="Toolbar2">
    <div class="CentreBox">
      <div class="Menu">
        <ul>
          <li class="Select"><a href="#jygldiv" target="_self">交易管理</a></li>
          <li><a href="#ghgldiv" target="_self">客户管理</a></li>
          <li><a href="#" target="_self">商品管理</a></li>
          <li><a href="#" target="_self">数据魔方</a></li>
          <li><a href="#" target="_self">商城管理</a></li>
        </ul>
      </div>
    </div>
  </div>
</div>
<!-- 头部导航结束 -->
<!-- 交易管理div开始 -->
	<div id="jygldiv" style="display: none;margin: 20px auto;">
	  <!-- Nav tabs -->
	 	 <div style="width: 250px;margin-left: 5%;float: left;border: 1px #eeeeee solid;padding: 5px;">
			<ul class="nav nav-stacked nav-pills" placement="left"  role="tablist" >
  			<li class="active"><a href="#home" role="tab" data-toggle="tab" id="ddglid" >订单管理<span class="glyphicon glyphicon-chevron-right" style="float: right;"></span> </a></li>
  			<li><a href="#profile" role="tab" data-toggle="tab" >收款单管理<span class="glyphicon glyphicon-chevron-right" style="float: right;"></span></a></li>
 			<li><a href="#messages" role="tab" data-toggle="tab"  >快递方式管理<span class="glyphicon glyphicon-chevron-right" style="float: right;"></span></a></li>
 			<li><a href="#settings" role="tab" data-toggle="tab" >发货地址管理<span class="glyphicon glyphicon-chevron-right" style="float: right;"></span></a></li>
			</ul>
		 </div>
		<div style="float: left;margin-left:20px;width: 1000px;" id="home" class="tab-pane" >
		
		<div class="panel panel-default">
 		 <div class="panel-heading">
   		 <h3 class="panel-title">订单管理</h3>
 		 </div>
 		 <div class="panel-body">
            <!-- Nav tabs -->
			<ul class="nav nav-tabs " role="tablist">
  				<li class="active"><a href="#3yue" role="tab" data-toggle="tab">近三个月 <span class="badge">14</span></a></li>
  				<li><a href="#dfk" role="tab" data-toggle="tab">待付款</a></li>
  				<li><a href="#dfh" role="tab" data-toggle="tab">待发货</a></li>
  				<li><a href="#yfh" role="tab" data-toggle="tab">已发货</a></li>
			</ul>

		<!-- Tab panes -->
		    <div class="tab-content">
 			    <div class="tab-pane active" id="3yue">
 			      <div style="margin: 5px;">
 				  <table class="table table-striped table-bordered table-hover datatable">
				<thead>
					<tr>
						<th>Rendering engine</th>
						<th>Browser</th>
						<th>Platform(s)</th>
						<th>Engine version</th>
						<th>CSS grade</th>
					</tr>
				</thead>
				<tbody>
					<tr class="odd gradeX">
						<td>Trident</td>
						<td>
							Internet
						 Explorer 4.0
						</td>
						<td>Win 95+</td>
						<td class="center">4</td>
						<td class="center">X</td>
					</tr>
					<tr class="even gradeC">
						<td>Trident</td>
						<td>
							Internet
						 Explorer 5.0
						</td>
						<td>Win 95+</td>
						<td class="center">5</td>
						<td class="center">C</td>
					</tr>
					<tr class="odd gradeA">
						<td>Trident</td>
						<td>
							Internet
						 Explorer 5.5
						</td>
						<td>Win 95+</td>
						<td class="center">5.5</td>
						<td class="center">A</td>
					</tr>
					<tr class="even gradeA">
						<td>Trident</td>
						<td>
							Internet
						 Explorer 6
						</td>
						<td>Win 98+</td>
						<td class="center">6</td>
						<td class="center">A</td>
					</tr>
					<tr class="odd gradeA">
						<td>Trident</td>
						<td>Internet Explorer 7</td>
						<td>Win XP SP2+</td>
						<td class="center">7</td>
						<td class="center">A</td>
					</tr>
					<tr class="even gradeA">
						<td>Trident</td>
						<td>AOL browser (AOL desktop)</td>
						<td>Win XP</td>
						<td class="center">6</td>
						<td class="center">A</td>
					</tr>
					<tr class="gradeA">
						<td>Gecko</td>
						<td>Firefox 1.0</td>
						<td>Win 98+ / OSX.2+</td>
						<td class="center">1.7</td>
						<td class="center">A</td>
					</tr>
					<tr class="gradeA">
						<td>Gecko</td>
						<td>Firefox 1.5</td>
						<td>Win 98+ / OSX.2+</td>
						<td class="center">1.8</td>
						<td class="center">A</td>
					</tr>
					<tr class="gradeA">
						<td>Gecko</td>
						<td>Firefox 2.0</td>
						<td>Win 98+ / OSX.2+</td>
						<td class="center">1.8</td>
						<td class="center">A</td>
					</tr>
					<tr class="gradeA">
						<td>Gecko</td>
						<td>Firefox 3.0</td>
						<td>Win 2k+ / OSX.3+</td>
						<td class="center">1.9</td>
						<td class="center">A</td>
					</tr>
					<tr class="gradeA">
						<td>Gecko</td>
						<td>Camino 1.0</td>
						<td>OSX.2+</td>
						<td class="center">1.8</td>
						<td class="center">A</td>
					</tr>
					
				</tbody>
				
			</table>
			</div>
 				 </div>
  				<div class="tab-pane" id="dfk">...</div>
  				<div class="tab-pane" id="dfh">...</div>
 				 <div class="tab-pane" id="yfk">...</div>
			</div>
				
 		 </div>
		 </div>
		  
		</div>
		<div style="float: left;margin-left:20px;width: 1000px;" id="profile" class="tab-pane" >
		</div>
	
	</div>
<!-- 交易管理div结束 -->
<!-- 客户管理div开始 -->
	<div id="ghgldiv" style="display: none;">
	  <div id="yw12" class="tabs-left"><ul id="yw13" class="nav nav-tabs"><li class="active"><a data-toggle="tab" href="#yw12_tab_1">Home</a></li><li><a data-toggle="tab" href="#yw12_tab_2">Profile</a></li><li><a data-toggle="tab" href="#yw12_tab_3">Messages</a></li></ul><div class="tab-content"><div id="yw12_tab_1" class="tab-pane fade active in">Home Content</div><div id="yw12_tab_2" class="tab-pane fade">Profile Content</div><div id="yw12_tab_3" class="tab-pane fade">Messages Content</div></div></div>
	</div>
<!-- 客户管理div结束 -->
<!-- foot -->

</body>
<script type="text/jscript" src="${pageContext.request.contextPath }/js/jquery-1.8.3.js"></script>
<script type="text/jscript" src="${pageContext.request.contextPath }/100nnpc/js/Article.js"></script>
<script type="text/jscript" src="${pageContext.request.contextPath }/js/bootstrap.min.js"></script>
<script type="text/jscript" src="${pageContext.request.contextPath }/100nnpc/js/bootstrap.datatable.js"></script>
<script type="text/jscript" src="${pageContext.request.contextPath }/100nnpc/js/bootstrap.datatable.cz.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$('.datatable').dataTable( { 
		"oLanguage": {
				"sUrl": "../zh_CN.json"
			} 
	});
	$("#ddglid").click(function(){
		$($(this).attr("href")).attr();
	});
});
</script>
</html>