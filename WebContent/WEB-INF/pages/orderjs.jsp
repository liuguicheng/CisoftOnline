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
				"o_bh":truename
			});
		});
		
		$('#grid').datagrid(
				{
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
					url : "${pageContext.request.contextPath}/htorder_scorder",
					idField : 'o_id',
					toolbar : [
						{
							id:'add',
							text:'添加商品',
							iconCls:'icon-add',
							handler:function(){
								parent.forward('添加商品',"");
								location.href="${pageContext.request.contextPath}/htorder_addView";
							}
						},
						{
							id:'set',
							text:'结算',
							iconCls:'icon-search',
							handler:function(){
							}
						}
					],
					columns : [[
					 	{
					 		field:'c_id',
					 		checkbox:true
					 	},{
					 		field:'c_name',
							title:'商品名称',
							align:'center',
							width:60
					 	}
					 	,{
					 		field:'c_spnum',
							title:'数量',
							align:'center',
							width:20
					 	},{
					 		field:'c_zjg',
							title:'价钱',
							align:'center',
							width:60
					 	},{
					 		field:'caozuo',
					 		title:'',
					 		align:'center',
					 		width:80,
					 		formatter:function(value,row,index){
					 			"<a href='#'  onclick='del("+row.c_id+")' class='icon-cancel'><a>";
					 		}
					 	},{
					 		field:'caozuo',
					 		title:'操作',
					 		align:'center',
					 		width:80,
					 		formatter:function(value,row,index){
					 			"<a href='#'  onclick='del("+row.c_id+")' class='icon-cancel'><a>";
					 		}
					 	}           
					 ]]
				});
	})
	
	function del(id){
		$.messager.confirm("提示","真的要删除吗?",function(r){
			if(r){
				$.ajax({
					   type: "POST",
					   url: "htorder_delete",
					   data: "o_id="+id,
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
<body class="easyui-layout" style="border-top-width:0px;">
	<div region="center" border="false">
		<div  style="border-top-width:0px;">
			<div class="middle">
			订单编号:${o_bh }
			<div style="margin-left: 50px;">邮费：${o_yf}元</div>	
			<div style="margin-left: 5px;">总价：${o_o_zjg}元</div>	
			</div>
			<div class="middle">
			商品名称:<input type="text" id="truename" name="" value="">
				<a id="btnsearch" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'">查询</a>
			</div>
			<div style="height: 330px;">
				<table id="grid"></table>
			</div>
		</div>
	</div>
	
</body>
</html>