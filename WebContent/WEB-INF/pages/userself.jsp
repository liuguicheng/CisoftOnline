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
		//查询
		$("#btnsearch").click(function(){
			var truename=$("#truename").val();
			$("#grid").datagrid('load',{
				"truename":truename
			});
		});
		
		$('#grid').datagrid({
			iconCls : 'icon-forward',
			fit : true,
			fitColumns:true,
			width:'100%',
			border : false,
			striped : true,
			rownumbers : true,
			method:"post",
			pagination:true,
			pageNumber:1,//初始化页号
			url : "${pageContext.request.contextPath}/userself_getList",
			idField : 'id',
			toolbar : [
				{
					id:'add',
					text:'添加',
					iconCls:'icon-add',
					handler:function(){
						parent.forward('添加用户',"");
						location.href="${pageContext.request.contextPath}/userself_addView";
					}
				}
			],
			columns : [[
			 	{
			 		field:'id',
			 		checkbox:true
			 	},{
			 		field:'username',
			 		title:'用户名',
			 		align:'center',
			 		width:120
			 	},{
			 		field:'truename',
			 		title:'真实姓名',
			 		align:'center',
			 		width:120
			 	},{
			 		field:'role',
			 		title:'角色',
			 		align:'center',
			 		width:120,
			 		formatter:function(value,row,index){
			 			if(row.role!=null){
			 				return row.role.rolename;
			 			}
			 		}
			 	},{
					field:'telephone',
					title:'电话',
					align:'center',
					width:120
			 	},{
			 		field:'department',
					title:'所属部门',
					align:'center',
					width:100
			 	},{
			 		field:'unit',
					title:'单位',
					align:'center',
					width:250,
					formatter:function(value,row,index){
						if(row.unit!=null){
							return row.unit.unitname;
						}
					}
			 	},{
			 		field:'caozuo',
			 		title:'操作',
			 		align:'center',
			 		width:120,
			 		formatter:function(value,row,index){
			 			return "<a href='#'  onclick='edit("+row.id+")'>修改<a>"+" "+
			 			"<a href='#'  onclick='del("+row.id+")'>删除<a>";
			 		}
			 	}           
			 ]]
		});
	})
	function edit(id){
/* 		parent.forward("修改用户","");
		location.href="${pageContext.request.contextPath}/userself_editView?id="+id; */
		var widoid=",'new"+id+"'";
		  var iWidth="1324"; //弹出窗口的宽度;
			 var iHeight="768"; //弹出窗口的高度;
			 var iTop = (window.screen.availHeight-30-iHeight)/2; //获得窗口的垂直位置;
			 var iLeft = (window.screen.availWidth-10-iWidth)/2; //获得窗口的水平位置;
	         window.open('${pageContext.request.contextPath}/userself_editView?id='+id,widoid,'height='+iHeight+',width='+iWidth+',top='+iTop+',left='+iLeft+',toolbar=no,menubar=no,scrollbars=no,resizable=no,location=no,status=no');
	}
	function del(id){
		$.messager.confirm("提示","真的要删除吗?",function(r){
			if(r){
				$.ajax({
					   type: "POST",
					   url: "userself_delete",
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
			<div class="middle">
				真实姓名:<input type="text" id="truename" name="" value="${truename}">
				<a id="btnsearch" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'">查询</a>
			</div>
			<div style="height: 330px;">
				<table id="grid"></table>
			</div>
		</div>
	</div>
</body>
</html>