<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>广西100南宁商家订单系统</title>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/jquery-1.8.3.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/easyui/jquery.easyui.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/easyui/easyui-lang-zh_CN.js"></script>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/js/easyui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/js/easyui/themes/icon.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/css/panel.css">
<script type="text/javascript">
	$(function() {
		//查询
		$("#btnsearch").click(function() {
			var truename = $("#truename").val();

			$("#grid").datagrid('load', {
				"mi_name" : truename
			});
		});

		$('#grid')
				.datagrid(
						{
							iconCls : 'icon-forward',
							fit : true,
							fitColumns : true,
							width : '100%',
							border : false,
							striped : true,
							singleSelect:true,//单选
							rownumbers : true,
							method : "post",
							pagination : true,
							pageNumber : 1,//初始化页号
							url : "${pageContext.request.contextPath}/merchantinfo_getList",
							idField : 'u_id',
							toolbar : [
									{
										id : 'add',
										text : '添加商户',
										iconCls : 'icon-add',
										handler : function() {
											parent.forward('添加商户', "");/* 
																	location.href="${pageContext.request.contextPath}/user_addView"; */
											add();
										}
									},
									{
										id : 'addzh',
										text : '添加商户账号',
										iconCls : 'icon-add',
										handler : function() {
											var row = $('#grid').datagrid('getSelections');
											var ids=[];
											if(row.lenght>1){
												$.messager.alert("提示","只能选择一个商户","info");
											}else{
												for(var i=0; i<row.length; i++){
											    	ids.push(row[i].mi_id);
													
													}
											if(ids==""){
												$.messager.alert("提示","请选择商户","info");
											}else{
												selectorderinfo(ids);
												
											}
											}
											
										}
									},
									{
										id : 'sx',
										text : '刷新',
										iconCls : 'icon-reload',
										handler : function() {
											sx();
										}
									} ,
									{
										id : 'sxs',
										text : '查询商户账号列表',
										iconCls : 'icon-reload',
										handler : function() {
											var row = $('#grid').datagrid('getSelections');
											var ids=[];
											if(row.lenght>1){
												$.messager.alert("提示","只能选择一个商户","info");
											}else{
												for(var i=0; i<row.length; i++){
											    	ids.push(row[i].mi_id);
													
													}
											if(ids==""){
												$.messager.alert("提示","请选择商户","info");
											}else{
												cs(ids);
												
											}
											}
											
										}
									}
									
									],
							columns : [ [
									{
										field : 'mi_id',
										checkbox : true
									},
									{
										field : 'mi_name',
										title : '商户名称',
										align : 'center',
										width : 120
									},
									{
										field : 'mi_url',
										title : '商户网址',
										align : 'center',
										width : 120
									},
									{
										field : 's',
										title : '商户等级',
										align : 'center',
										width : 120,
										formatter : function(value, row, index) {
											if (row.merchantClass != null) {
												return row.merchantClass.rolename;
											}
										}
									},
									{
										field : 'sgffh',
										title : '开始时间',
										align : 'center',
										width : 100,
										formatter:function(value,row,index){
									    	if(row.mi_starttime!=null){
								 				var s=row.mi_starttime.split("T");
									 			return s[0]+"  "+s[1];
								 			}
								 			return "";
								 			
									 		}
									},
									{
										field : 'dfdfd',
										title : '到期时间',
										align : 'center',
										width : 100,
										formatter:function(value,row,index){
									    	if(row.mi_endtime!=null){
								 				var s=row.mi_endtime.split("T");
									 			return s[0]+"  "+s[1];
								 			}
								 			return "";
								 			
									 		}
									},
									{
										field : 'caozuo',
										title : '操作',
										align : 'center',
										width : 120,
										formatter : function(value, row, index) {
											return "<a href='#'  onclick='edit("
													+ row.mi_id
													+ ")'>修改<a>"
													+ "  "
													+ "<a href='#'  onclick='del("
													+ row.mi_id
													+ ")'>删除<a>";
										}
									} 
									] ]
						});
		
		
	});
		
	function edit(id) {
		/* parent.forward("修改用户","");
		location.href="${pageContext.request.contextPath}/user_editView?u_id="+id; */
		var widoid = ",'news" + id + "'";
		var iWidth = "768"; //弹出窗口的宽度;
		var iHeight = "468"; //弹出窗口的高度;
		var iTop = (window.screen.availHeight - 30 - iHeight) / 2; //获得窗口的垂直位置;
		var iLeft = (window.screen.availWidth - 10 - iWidth) / 2; //获得窗口的水平位置;
		window
				.open(
						'${pageContext.request.contextPath}/merchantinfo_editView?mi_id='
								+ id,
						widoid,
						'height='
								+ iHeight
								+ ',width='
								+ iWidth
								+ ',top='
								+ iTop
								+ ',left='
								+ iLeft
								+ ',toolbar=no,menubar=no,scrollbars=no,resizable=no,location=no,status=no');
	}
	function add() {
		/* parent.forward("修改用户","");
		location.href="${pageContext.request.contextPath}/user_editView?u_id="+id; */
		var widoid = "addd123";
		var iWidth = "768"; //弹出窗口的宽度;
		var iHeight = "468"; //弹出窗口的高度;
		var iTop = (window.screen.availHeight - 30 - iHeight) / 2; //获得窗口的垂直位置;
		var iLeft = (window.screen.availWidth - 10 - iWidth) / 2; //获得窗口的水平位置;
		window
				.open(
						'${pageContext.request.contextPath}/merchantinfo_addView',
						widoid,
						'height='
								+ iHeight
								+ ',width='
								+ iWidth
								+ ',top='
								+ iTop
								+ ',left='
								+ iLeft
								+ ',toolbar=no,menubar=no,scrollbars=no,resizable=no,location=no,status=no');
	}
	//查询收货地址
	
	function selcetadd(id){
		var widoid = "addd12123ddddd";
		var iWidth = "768"; //弹出窗口的宽度;
		var iHeight = "468"; //弹出窗口的高度;
		var iTop = (window.screen.availHeight - 30 - iHeight) / 2; //获得窗口的垂直位置;
		var iLeft = (window.screen.availWidth - 10 - iWidth) / 2; //获得窗口的水平位置;
		window
				.open(
						'${pageContext.request.contextPath}/pages_useraddress?id='+id,
						widoid,
						'height='
								+ iHeight
								+ ',width='
								+ iWidth
								+ ',top='
								+ iTop
								+ ',left='
								+ iLeft
								+ ',toolbar=no,menubar=no,scrollbars=no,resizable=no,location=no,status=no');
	}
	
	function del(id) {
		$.messager.confirm("提示", "真的要删除吗?", function(r) {
			if (r) {
				$.ajax({
					type : "POST",
					url : "merchantinfo_delete",
					data : "mi_id=" + id,
					success : function(msg) {
						$.messager.alert("提示", msg, "info");
						$("#grid").datagrid('reload');
					}
				});
			}
		})
	}
	
	function sx(){
		$("#grid").datagrid('reload');
	}
	
	function selectorderinfo(id){
		var widoid="doshh1";
		  var iWidth="768"; //弹出窗口的宽度;
			 var iHeight="468"; //弹出窗口的高度;
			 var iTop = (window.screen.availHeight-30-iHeight)/2; //获得窗口的垂直位置;
			 var iLeft = (window.screen.availWidth-10-iWidth)/2; //获得窗口的水平位置;
	         window.open('${pageContext.request.contextPath}/merchantinfo_todoaddlogin?mi_id='+id,widoid,'height='+iHeight+',width='+iWidth+',top='+iTop+',left='+iLeft+',toolbar=no,menubar=no,scrollbars=no,resizable=no,location=no,status=no');
	}

	function cs(id){
		var widoid="doshh1";
		  var iWidth="768"; //弹出窗口的宽度;
			 var iHeight="468"; //弹出窗口的高度;
			 var iTop = (window.screen.availHeight-30-iHeight)/2; //获得窗口的垂直位置;
			 var iLeft = (window.screen.availWidth-10-iWidth)/2; //获得窗口的水平位置;
	         window.open('${pageContext.request.contextPath}/merchantinfo_queryloginlist?userinfo.merchantInfo.mi_id='+id,widoid,'height='+iHeight+',width='+iWidth+',top='+iTop+',left='+iLeft+',toolbar=no,menubar=no,scrollbars=no,resizable=no,location=no,status=no');
	}
</script>
</head>
<body class="easyui-layout" style="border-top-width: 0px;">
	<div region="center" border="false">

         <div style="text-align: center;"><h1>商户管理</h1></div>
		<div class="easyui-tabs" style="margin-top: 10px;">
				<div title="商户管理">
			 	  <div class="middle" style="border-top:0px;">
				商户名称:&nbsp; &nbsp;&nbsp; <input type="text" id="truename" name="" value="" class="txt200">
				&nbsp; &nbsp;&nbsp;<a id="btnsearch" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'">查询</a>
				</div>
				<div style="height: 330px;">
					<table id="grid"  ></table>
				</div>
			</div>

		</div>
	</div>

</body>
</html>