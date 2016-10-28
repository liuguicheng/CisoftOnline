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
				"user.u_zsName":truename
			});
		});
		var id=$("#o_id").val();
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
					url : "${pageContext.request.contextPath}/orderrecords_getList?o_id="+id,
					idField : 'or_id',
					columns : [[
					 	{
					 		field:'or_id',
					 		checkbox:true
					 	},{
					 		field:'or_step',
					 		title:'操作内容',
					 		align:'center',
					 		width:40,
					 		formatter:function(value,row,index){
					 			if(row.or_step=='0'){
					 				return "下订单已付款";
					 			}else if(row.or_step=='1'){
					 				return "供应商发货";
					 			}else if(row.or_step=='2'){
					 				return "用户收货";
					 			}else if(row.or_step=='3'){
					 				return "关闭订单／取消订单";
					 			}else if(row.or_step=='4'){
					 				return "申请退货";
					 			}else if(row.or_step=='5'){
					 				return "交易完成";
					 			}else if(row.or_step=='6'){
					 				return "下单未付款";
					 			}
					 			
					 			
					 		}
					 	},{
					 		field:'or_szsj',
					 		title:'操作时间',
					 		align:'center',
					 		width:30,
					 		formatter:function(value,row,index){
					 			if(row.or_szsj!=null){
					 			return row.or_szsj.replace("T"," ");
					 			}else{
					 				return "";
					 			}
					 			
					 		}
					 	},{
					 		field:'user',
							title:'操作人',
							align:'center',
							width:80,
							formatter:function(value,row,index){
					 			return row.user.u_zsName;
					 		}
					 	}           
					 ]]
				});
	})
</script>
</head>
<body class="easyui-layout" style="border-top-width:0px;">
	<div region="center" border="false">
		<div  style="border-top-width:0px;">
			<div class="middle">
			操作人:<input type="text" id="truename" name="" value="">
				<a id="btnsearch" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'">查询</a>
			</div>
			<div style="height: 330px;">
				<table id="grid"></table>
			</div>
		</div>
	</div>
	
</body>
</html>