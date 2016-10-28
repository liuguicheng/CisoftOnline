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
				"u_zsName" : truename,
				"u_name" : truename
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
							url : "${pageContext.request.contextPath}/user_getList?uwx_gzbs=3",
							idField : 'u_id',
							toolbar : [
									{
										id : 'add',
										text : '添加',
										iconCls : 'icon-add',
										handler : function() {
											parent.forward('添加用户', "");/* 
																	location.href="${pageContext.request.contextPath}/user_addView"; */
											add();
										}
									},
									{
										id : 'set',
										text : '查询收货地址',
										iconCls : 'icon-search',
										handler : function() {
											var rows = $("#grid").datagrid(
													'getChecked');
											if (rows.length == 0) {
												$.messager.alert("警告",
														"你还没有选择", "warning");
											} else {
												var id = rows[0].u_id;
												selcetadd(id);
											}
										}
									},{
										id:'adds',
										text:'刷新',
										iconCls:'icon-reload',
										handler:function(){
											sx();
										}
									}
									],
							columns : [ [
									{
										field : 'u_id',
										checkbox : true
									},
									{
										field : 'u_name',
										title : '用户名',
										align : 'center',
										width : 120
									},
									{
										field : 'u_email',
										title : '邮件地址',
										align : 'center',
										width : 100
									},
									{
										field : 'd',
										title : '状态',
										align : 'center',
										width : 100,
										formatter : function(value, row, index) {
											if(row.u_status==1){
											return "未验证邮箱";
											}else if(row.u_status==2){
												return	"已验证邮箱";
											}else if(row.u_status==0){
												return "未激活";
												
											}
										}
									},
									{
										field : 'caozuo',
										title : '操作',
										align : 'center',
										width : 120,
										formatter : function(value, row, index) {
											return  "<a href='#'  onclick='del("
													+ row.u_id
													+ ")'>删除<a>"
													+ "  "
													+ "<a href='#'  onclick='res("
													+ row.u_id + ")'>重置密码<a>";
										}
									} ] ]
						});
		$('#gridxt')
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
					url : "${pageContext.request.contextPath}/user_getList?uwx_gzbs=2",
					idField : 'u_id',
					toolbar : [
							{
								id : 'add',
								text : '添加',
								iconCls : 'icon-add',
								handler : function() {
									parent.forward('添加用户', "");/* 
															location.href="${pageContext.request.contextPath}/user_addView"; */
									add();
								}
							},{
								id:'adds',
								text:'刷新',
								iconCls:'icon-reload',
								handler:function(){
									xtsx();
								}
							}
					],
					columns : [ [
							{
								field : 'u_id',
								checkbox : true
							},
							{
								field : 'u_name',
								title : '用户名',
								align : 'center',
								width : 120
							},
							{
								field : 'u_zsName',
								title : '真实姓名',
								align : 'center',
								width : 120
							},
							{
								field : 'role',
								title : '角色',
								align : 'center',
								width : 120,
								formatter : function(value, row, index) {
									if (row.role != null) {
										return row.role.rolename;
									}
								}
							},
							{
								field : 'u_email',
								title : '邮件地址',
								align : 'center',
								width : 100
							},
							{
								field : 'caozuo',
								title : '操作',
								align : 'center',
								width : 120,
								formatter : function(value, row, index) {
									return "<a href='#'  onclick='edit("
											+ row.u_id
											+ ")'>修改<a>"
											+ "  "
											+ "<a href='#'  onclick='del("
											+ row.u_id
											+ ")'>删除<a>"
											+ "  "
											+ "<a href='#'  onclick='res("
											+ row.u_id + ")'>重置密码<a>";
								}
							} ] ]
				});
		//查询
		$("#xtbtnsearch").click(function() {
			var truename = $("#xtnc").val();

			$("#gridxt").datagrid('load', {
				"u_zsName" : truename,
				"u_name" : truename
			});
		});
		//查询
		$("#ncbtnsearch").click(function() {
			var truename = $("#nc").val();

			$("#wxgrid").datagrid('load', {
				"u_zsName" : truename,
				"u_name" : truename
			});
		});

		$('#wxgrid')
				.datagrid(
						{
							iconCls : 'icon-forward',
							fit : true,
							fitColumns : true,
							width : '100%',
							border : false,
							striped : true,
							rownumbers : true,
							singleSelect:true,//单选
							method : "post",
							pagination : true,
							pageNumber : 1,//初始化页号
							url : "${pageContext.request.contextPath}/user_getList?uwx_gzbs=1",
							idField : '1',
							toolbar : [
									{
										id : 'set',
										text : '查询收货地址',
										iconCls : 'icon-search',
										handler : function() {
											var rows = $("#wxgrid").datagrid(
													'getChecked');
											if (rows.length == 0) {
												$.messager.alert("警告",
														"你还没有选择", "warning");
											} else {
												var id = rows[0].u_id;
												selcetadd(id);
											}
										}
									},{
										id:'adds',
										text:'刷新',
										iconCls:'icon-reload',
										handler:function(){
											wxsx();
										}
									}
									],
							columns : [ [
									{
										field : 'u_id',
										checkbox : true
									},
									{
										field : 'u_name',
										title : '用户名',
										align : 'center',
										width : 120
									},
									{
										field : 'uwx_bs',
										title : '微信标识',
										align : 'center',
										width : 120
									},
									{
										field : 'tximgurl',
										title : '头像地址',
										align : 'center',
										width : 120
									},
									{
										field : 'caozuo',
										title : '操作',
										align : 'center',
										width : 120,
										formatter : function(value, row, index) {
											return  "<a href='#'  onclick='del("
													+ row.u_id
													+ ")'>删除<a>";
										}
									} ] ]
						});
		
		
		
		
		
		
	})
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
						'${pageContext.request.contextPath}/user_editView?u_id='
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
						'${pageContext.request.contextPath}/user_addView',
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
					url : "user_delete",
					data : "u_id=" + id,
					success : function(msg) {
						$.messager.alert("提示", msg, "info");
						$("#wxgrid").datagrid('reload');
					}
				});
			}
		})
	}

	function res(id) {
		$.messager.confirm("提示", "真的要重置密码吗?", function(r) {
			if (r) {
				$.ajax({
					type : "POST",
					url : "user_reset",
					data : "u_id=" + id,
					success : function(msg) {
						$.messager.alert("提示", msg, "info");
						$("#wxgrid").datagrid('reload');
					}
				});
			}
		})
	}
	function wxsx(){
		$("#wxgrid").datagrid('reload');
	}
	function xtsx(){
		$("#gridxt").datagrid('reload');
	}
	function sx(){
		$("#grid").datagrid('reload');
	}
</script>
</head>
<body class="easyui-layout" style="border-top-width: 0px;">
	<div region="center" border="false">

         <div style="text-align: center;"><h1>用户管理</h1></div>
		<div class="easyui-tabs" style="margin-top: 10px;">
				<div title="系统后台用户">
				  <div class="middle" style="border-top:0px;">
				昵称:&nbsp; &nbsp;&nbsp; <input type="text" id="xtnc" name="" value="" class="txt200">
				&nbsp; &nbsp;&nbsp;<a id="xtbtnsearch" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'">查询</a>
				</div>
				<div style="height: 330px;">
					<table id="gridxt"  ></table>
				</div>
				
			</div>
				<div title="pc端用户">
			 	  <div class="middle" style="border-top:0px;">
				用户名:&nbsp; &nbsp;&nbsp; <input type="text" id="truename" name="" value="" class="txt200">
				&nbsp; &nbsp;&nbsp;<a id="btnsearch" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'">查询</a>
				</div>
				<div style="height: 330px;">
					<table id="grid"  ></table>
				</div>
			</div>
			<div title="微信端用户">
				  <div class="middle" style="border-top:0px;">
				昵称:&nbsp; &nbsp;&nbsp; <input type="text" id="nc" name="" value="" class="txt200">
				&nbsp; &nbsp;&nbsp;<a id="ncbtnsearch" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'">查询</a>
				</div>
				<div style="height: 330px;">
					<table id="wxgrid"  ></table>
				</div>
				
			</div>

		</div>
	</div>

</body>
</html>