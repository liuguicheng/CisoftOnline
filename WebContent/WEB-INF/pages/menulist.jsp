<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		$('#grid').treegrid({
			iconCls : 'icon-forward',
			fit : true,
			fitColumns:true,
			width:'100%',
			border:false,
			striped:true,//有条纹的行
			rownumbers:true,
			method:"post",
			url : "${pageContext.request.contextPath}/menu_getList",
			idField : 'id',
			treeField:'menuname', 
			animate:true,
			toolbar :'#tb',
			toolbar : [
				{
					id:'add',
					text:'添加',
					iconCls:'icon-add',
					handler:function(){
						add();
					}
				}
			],
			columns : [[
			 	{
			 		field:'id',
			 		checkbox:true
			 	},{
			 		field:'menuname',
			 		title:'菜单名称',
			 		width:200
			 	},{
			 		field:'page',
			 		title:'路径',
			 		width:300
			 	}
			 	/* ,{
			 		field:'parentid',
			 		title:'父id',
			 		align:'center',
			 		width:200
			 	} */,{
			 		field:'caozuo',
			 		title:'操作',
			 		align:'center',
			 		width:200,
			 		formatter:function(value,row,index){
			 			return "<a href='#'  onclick='edit("+row.id+")'>修改<a>";
			 		}
			 	}           
			 ]]
		});
	});
	
	function add(){
		
		var widoid = "121";
		var iWidth = "768"; //弹出窗口的宽度;
		var iHeight = "468"; //弹出窗口的高度;
		var iTop = (window.screen.availHeight - 30 - iHeight) / 2; //获得窗口的垂直位置;
		var iLeft = (window.screen.availWidth - 10 - iWidth) / 2; //获得窗口的水平位置;
		window
				.open(
						'${pageContext.request.contextPath}/menu_addView'
							,
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
	function edit(id) {
		var widoid = "12312321"+id;
		var iWidth = "768"; //弹出窗口的宽度;
		var iHeight = "468"; //弹出窗口的高度;
		var iTop = (window.screen.availHeight - 30 - iHeight) / 2; //获得窗口的垂直位置;
		var iLeft = (window.screen.availWidth - 10 - iWidth) / 2; //获得窗口的水平位置;
		window
				.open(
						'${pageContext.request.contextPath}/menu_editView?id='
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
</script>
</head>
<body class="easyui-layout">
	<div region="center" border="false">
		<!-- 	<div style="height: 28px; background: url('img/titleall.gif') repeat-x;">
				<div class="titleleft"></div>
				<div class="titleright"></div>
			</div> -->
			<div class="middle" id="tb"></div>
			<div style="height: 430px;">
				<table id="grid" ></table>
			</div>
	</div>
</body>
</html>