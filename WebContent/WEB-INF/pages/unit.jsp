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
		$('#grid').datagrid({
			iconCls : 'icon-forward',
			fit : true,
			border : false,
			striped : true,
			rownumbers : true,
			url : "${pageContext.request.contextPath}/unit_getList",
			idField : 'id',
			toolbar : [
				{
					id:'add',
					text:'添加',
					iconCls:'icon-add',
					handler:function(){
						parent.forward("添加单位","");
						location.href="${pageContext.request.contextPath}/unit_addView";
					}
				}
			],
			columns : [[
			 	{
			 		field:'id',
			 		checkbox:true
			 	},{
			 		field:'unitname',
			 		title:'单位名称',
			 		align:'center',
			 		width:400
			 	},{
			 		field:'caozuo',
			 		title:'操作',
			 		align:'center',
			 		width:300,
			 		formatter:function(value,row,index){
			 			return "<a href='#'  onclick='edit("+row.id+")'>修改<a>"+" "+
			 			"<a href='#'  onclick='del("+row.id+")'>删除<a>";
			 		}
			 	}           
			 ]]
		});
	})
	
	function edit(id){
		parent.forward("修改单位","");
		location.href="${pageContext.request.contextPath}/unit_editView?id="+id;
	}
	function del(id){
		$.messager.confirm("提示","真的要删除吗?",function(r){
			if(r){
				$.ajax({
					   type: "POST",
					   url: "unit_delete",
					   data: "id="+id,
					   success: function(msg){
					   		$.messager.alert("提示",msg,"info");
					   		$("#grid").datagrid('reload');
					   }
				});
			}
		})
	}
</script>
</head>
<body class="easyui-layout">
	<div region="center" border="false">
		<div class="divall">
			<div style="height: 28px; background: url('img/titleall.gif') repeat-x;">
				<div class="titleleft"></div>
				<div class="titleright"></div>
			</div>
			<div class="middle"></div>
			<div style="height: 330px;">
				<table id="grid" ></table>
			</div>
		</div>
	</div>
</body>
</html>