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
				"c_name":truename
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
			url : "${pageContext.request.contextPath}/commodityimg_getList",
			idField : 'ci_id',
			toolbar : [
				{
					id:'add',
					text:'添加',
					iconCls:'icon-add',
					handler:function(){
						parent.forward('添加商品图片',"");
						location.href="${pageContext.request.contextPath}/commodityimg_addView";
					}
				}
				],
				columns : [[
						 	{
						 		field:'ci_id',
						 		checkbox:true
						 	},{
						 		field:'commodity',
						 		title:'商品名称',
						 		align:'center',
						 		width:120
						 	},{
						 		field:'ci_url',
						 		title:'图片路径',
						 		align:'center',
						 		width:120
						 	}
						 	,{
						 		field:'caozuo',
						 		title:'操作',
						 		align:'center',
						 		width:120,
						 		formatter:function(value,row,index){
						 			alert(ci_id);
						 			return "<a href='#'  onclick='edit("+row.ci_id+")'>修改<a>"+"  "+
						 			"<a href='#'  onclick='del("+row.ci_id+")'>删除<a>";
						 		}
						 	}           
						 ]]
	});
	})
	function edit(id){
		parent.forward("修改用户","");
		location.href="${pageContext.request.contextPath}/commodityimg_editView?ci_id="+id;
	}
	function del(id){
		$.messager.confirm("提示","真的要删除吗?",function(r){
			if(r){
				$.ajax({
					   type: "POST",
					   url: "commodityimg_delete",
					   data: "ci_id="+id,
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
			供应商名称:<input type="text" id="truename" name="" value="">
				<a id="btnsearch" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'">查询</a>
			</div>
			<div style="height: 330px;">
				<table id="grid"></table>
			</div>
		</div>
	</div>
	
</body>
</html>