<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="s" uri="/struts-tags"%>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>广西100南宁商家订单系统</title>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-1.8.3.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/easyui/easyui-lang-zh_CN.js"></script>
<script language="javascript" src="${pageContext.request.contextPath }/js/jquery.jqprint-0.3.js"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/js/easyui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/js/easyui/themes/icon.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/panel.css">
<script type="text/javascript"> 
	$(function(){
		var str="${pageContext.request.contextPath}/htorderdetail_getList?order.o_status=-1&order.o_sort=1&order.user.u_id="+$("#uid").val();
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
					url :str,
					idField : 'o_id',
					onLoadSuccess:function(data){
						var rows=$("#grid").datagrid('getRows');
				        var start=0;
				        var end=0;
				        for(var i=0;i<rows.length;i++){
					        var flag=true;
				        	for(var j=i+1;j<rows.length;j++){
				        		if(rows[i].order.o_bh!=rows[j].order.o_bh){
				        			start=i;
				        			end=j;
				        			if(i+1==j){
				        				start=i+1;
				        			}
				        			flag=false;
									break;
				        		}
				        	}
				        	if(flag==true){
				        		end=rows.length-1;
				        		$("#grid").datagrid('mergeCells',{
					        		index:start,
					        		field:'o_id',
					        		rowspan:(end-start+1)
					        	});
				        		$("#grid").datagrid('mergeCells',{
					        		index:start,
					        		field:'order.o_bh',
					        		rowspan:(end-start+1)
					        	});
				        		$("#grid").datagrid('mergeCells',{
					        		index:start,
					        		field:'o_zjg',
					        		rowspan:(end-start+1)
					        	});
				        		$("#grid").datagrid('mergeCells',{
					        		index:start,
					        		field:'n',
					        		rowspan:(end-start+1)
					        	});
				        		$("#grid").datagrid('mergeCells',{
					        		index:start,
					        		field:'dss',
					        		rowspan:(end-start+1)
					        	});
				        		$("#grid").datagrid('mergeCells',{
					        		index:start,
					        		field:'caozuo',
					        		rowspan:(end-start+1)
					        	});
				        		break;
				        	}
				        	$("#grid").datagrid('mergeCells',{
				        		index:start,
				        		field:'o_id',
				        		rowspan:(end-start)
				        	});
				        	$("#grid").datagrid('mergeCells',{
				        		index:start,
				        		field:'order.o_bh',
				        		rowspan:(end-start)
				        	});
				        	$("#grid").datagrid('mergeCells',{
				        		index:start,
				        		field:'o_zjg',
				        		rowspan:(end-start)
				        	});
				        	$("#grid").datagrid('mergeCells',{
				        		index:start,
				        		field:'n',
				        		rowspan:(end-start)
				        	});
				        	$("#grid").datagrid('mergeCells',{
				        		index:start,
				        		field:'dss',
				        		rowspan:(end-start)
				        	});
				        	$("#grid").datagrid('mergeCells',{
				        		index:start,
				        		field:'caozuo',
				        		rowspan:(end-start)
				        	});
				        }	        
					},
					toolbar : [
								
							],
					columns : [[
					 	{
					 		field:'o_id',
					 		checkbox:true,
					 		formatter:function(value,row,index){
								return row.order.o_bh;
							}
					 	},{
					 		field:'order.o_bh',
					 		title:'订单编号',
					 		align:'center',
					 		width:150,
							formatter:function(value,row,index){
								return row.order.o_bh;
							}
					 	}
					 	,{
					 		field:'un',
							title:'订购商品',
							align:'center',
							width:240,
							formatter:function(value,row,index){
								return row.commodity.c_name;
							}
							
					 	}
					 	,{
					 		field:'o_num',
							title:'订购数量',
							align:'center',
							width:50
							
					 	}
					 	,{
					 		field:'spjg',
							title:'商品价格',
							align:'center',
							width:50,
							formatter:function(value,row,index){
								return row.commodity.c_jg;
							}
							
					 	}
					 	,{
					 		field:'o_zjg',
							title:'订单总价',
							align:'center',
							width:50,
							formatter:function(value,row,index){
								return row.order.o_zjg;
							}
							
							
					 	}
					 	,{
					 		field:'n',
							title:'订购日期',
							align:'center',
							width:140,
							formatter:function(value,row,index){
								return row.order.o_startTime;
							}
							
					 	}
					 	,{
					 		field:'dss',
							title:'订单状态',
							align:'center',
							width:60,
							formatter:function(value,row,index){
								
								if(row.order.o_status=='6'){
									return "未结算";
								}else if(row.order.o_status=='5'){
									return "退货处理中";
								}else if(row.order.o_status=='4'){
									return "退货申请中";
								}else if(row.order.o_status=='3'){
									return "完成订单";
								}else if(row.order.o_status=='2'){
									return "已收货";
								}else if(row.order.o_status=='1'){
									return "未收货";
								}else if(row.order.o_status=='0'){
									return "未发货";
								}else if(row.order.o_status=='8'){
									return "未付款";
								}else if(row.order.o_status=='7'){
									return "订单取消";
								}
					 		}
					 	}          
					 ]]
				});
	});
	
	
</script>
</head>
<body class="easyui-layout" style="border-top-width:0px;">

	<div region="center" border="false">
	<input type="hidden" id="uid" value='${member.m_uid }' style="margin: 10px;font-size: 20px;height: 20px;">
		<div  style="border-top-width:0px;">
		
			<div style="height: 330px;clear: both;border-top:1px solid #aecaf1;"id="tabstrid" >
				<table id="grid"></table>
			</div>
			
		</div>
	</div>
	
</body>
</html>