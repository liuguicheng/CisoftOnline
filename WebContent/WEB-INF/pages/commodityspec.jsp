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
				"cp_name":truename
			});
		});
	
		$('#grid').datagrid(
				{
					iconCls : 'icon-forward',
					fit : true,
					fitColumns:true,
					width:'100%',
					border:false,
					striped:true,//有条纹的行
					rownumbers:true,
					method:"post",
					pagination:true,
					pageNumber:1,//初始化页号
					url : "${pageContext.request.contextPath}/commodityspec_getList",
					idField : 'cp_id',
					treeField:'cp_name', 
					toolbar : [
						{
							id:'add',
							text:'添加',
							iconCls:'icon-add',
							handler:function(){
								add();
							}
						},
						{
							id:'sx',
							text:'刷新',
							iconCls:'icon-reload',
							handler:function(){
								sx();
							}
						}
					],
					columns : [[
					 	{
					 		field:'cp_id',
					 		checkbox:true
					 	},{
					 		field:'cp_name',
					 		title:'规格名称',
					 		width:120
					 	}
					 	,{
					 		field:'xsfs',
					 		title:'显示类型',
					 		width:120,
				 			formatter:function(value,row,index){
				 				if(row.cp_lx==1){
				 					return "文字";
				 				}else{
				 					return "图片";
				 					
				 				}
				 				
				 				return "";
					 			}
					 	},{
					 		field:'zsfs',
					 		title:'显示方式',
					 		width:120,
					 		formatter:function(value,row,index){
				 				if(row.cp_zsfs==1){
				 					return "下拉";
				 				}else{
				 					return "平铺";
				 					
				 				}
				 				
				 				return "";
					 			}
					 	},{
					 		field:'ggz',
					 		title:'规格值',
					 		width:120,
					 		formatter:function(value,row,index){
					 			var s="2";
					 			$.ajax({
			   						   type: "POST",
			   						   url: "commodityspec_doselectspecval",
			   						   data: "cp_id="+row.cp_id,
			   						async: false,
			   						   success: function(msg){
			   							   if(msg==2){
			   								   return "";
			   							   }else{
			   								   var lastIndex = msg.lastIndexOf(',');
			   							      if (lastIndex > -1) {
			   							    	s= msg.substring(0, lastIndex) + msg.substring(lastIndex + 1, msg.length);
			   							      
			   							      }
				   							
				   							   
			   							   }
			   							   
			   						   }
			   					});
				 				
				 				return s;
					 			}
					 	}
					 	,{
					 		field:'caozuo',
					 		title:'操作',
					 		width:120,
					 		formatter:function(value,row,index){
					 			return "<a href='#'  onclick='edit("+row.cp_id+")'>修改<a>"+"  "+
					 			"<a href='#'  onclick='del("+row.cp_id+")'>删除<a>";
					 		}
					 	}           
					 ]]
				});
	})
	function edit(id){
		var widoid="eidt123";
		  var iWidth="768"; //弹出窗口的宽度;
			 var iHeight="468"; //弹出窗口的高度;
			 var iTop = (window.screen.availHeight-30-iHeight)/2; //获得窗口的垂直位置;
			 var iLeft = (window.screen.availWidth-10-iWidth)/2; //获得窗口的水平位置;
	         window.open('${pageContext.request.contextPath}/commodityspec_editView?cp_id='+id,widoid,'height='+iHeight+',width='+iWidth+',top='+iTop+',left='+iLeft+',toolbar=no,menubar=no,scrollbars=no,resizable=no,location=no,status=no');
	
	}
	function del(id){
		$.ajax({
			   type: "POST",
			   url: "commodityspec_doselectspecval",
			   data: "cp_id="+id,
			   success: function(msg){
			   		if(msg==2){
			   			$.messager.confirm("提示","真的要删除吗?",function(r){
			   				if(r){
			   					$.ajax({
			   						   type: "POST",
			   						   url: "commodityspec_delete",
			   						   data: "cp_id="+id,
			   						   success: function(msg){
			   						   		$.messager.alert("提示",msg,"info");
			   						   		$("#grid").datagrid('reload');
			   						   }
			   					});
			   				}
			   			})
			   			
			   		}else{
			   			$.messager.alert("提示","您选择的商品规格包含多个规格值，不能删除","info");
			   		}
			   }
		});
		
		
	}
	
	function add(){
		var widoid="add123";
		  var iWidth="768"; //弹出窗口的宽度;
			 var iHeight="468"; //弹出窗口的高度;
			 var iTop = (window.screen.availHeight-30-iHeight)/2; //获得窗口的垂直位置;
			 var iLeft = (window.screen.availWidth-10-iWidth)/2; //获得窗口的水平位置;
	         window.open('${pageContext.request.contextPath}/commodityspec_addView',widoid,'height='+iHeight+',width='+iWidth+',top='+iTop+',left='+iLeft+',toolbar=no,menubar=no,scrollbars=no,resizable=no,location=no,status=no');
	}
	function sx(){
		$("#grid").datagrid('reload');
	}
</script>
</head>
<body class="easyui-layout">
	<div region="center" border="false">
			<div class="middle" id="tb">
			商品规格名称:&nbsp;&nbsp;&nbsp; <input type="text" id="truename" name="" value="" class="txt200">
				&nbsp;&nbsp;&nbsp;<a id="btnsearch" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'">查询</a>
			</div>
			 
			<div style="height: 330px;">
				<table id="grid"></table>
			</div>
	</div>
	
</body>
</html>