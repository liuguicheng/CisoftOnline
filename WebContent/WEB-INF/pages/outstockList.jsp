<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>广西100南宁-后台管理系统</title>
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
				"commodity.c_name":truename
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
					url : "${pageContext.request.contextPath}/outstock_getList",
					idField : 'os_id',
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
					 		field:'os_id',
					 		checkbox:true
					 	},{
					 		field:'commodity.c_name',
					 		title:'商品名称',
					 		align:'center',
					 		width:220,
					 		formatter:function(value,row,index){
					 			return row.commodity.c_name;
					 		}
					 	}
					 	,{
					 		field:'os_cksl',
					 		title:'出库数量',
					 		align:'center',
					 		width:150
					 	},{
					 		field:'storeroom.s_name',
					 		title:'库房',
					 		align:'center',
					 		width:150,
					 		formatter:function(value,row,index){
					 			var s=row.storeroom.storehouse.sh_name+" "+row.storeroom.s_name;
					 			return s;
					 		}
					 	},{
					 		field:'rq',
					 		title:'出库日期',
					 		align:'center',
					 		width:150,
					 		formatter:function(value,row,index){
					 			if(row.os_ckdate!=null){
					 				var s=row.os_ckdate.split("T");
						 			return s[0]+"  "+s[1];
					 			}
					 			return "";
					 			
					 		}
					 	},{
					 		field:'rqr',
					 		title:'出库人',
					 		align:'center',
					 		width:150,
					 		formatter:function(value,row,index){
					 			return row.user.u_name;
					 		}
					 	},{
					 		field:'rqlx',
					 		title:'出库类型',
					 		align:'center',
					 		width:150,
					 		formatter:function(value,row,index){
					 			if(row.os_cklx==0){
					 				return "报损";
					 			}else if(row.os_cklx==1){
					 				return "借出";
					 			}
								else if(row.os_cklx==2){
									return "借入还出";
					 			}
								else if(row.os_cklx==3){
									return "赠送";
					 			}
								else if(row.os_cklx==4){
									return "其他出仓";
					 			}
					 			
					 			
					 		}
					 	}
					 	,{
					 		field:'os_bz',
					 		title:'描述',
					 		align:'center',
					 		width:150
					 	},{
					 		field:'caozuo',
					 		title:'操作',
					 		align:'center',
					 		width:120,
					 		formatter:function(value,row,index){
					 			return "<a href='#'  onclick='edit("+row.os_id+")'>修改<a>"+"  "+
					 			"<a href='#'  onclick='del("+row.os_id+")'>删除<a>";
					 		}
					 	}           
					 ]]
				});
	})
	function edit(id){
		/* parent.forward("修改商品出库","");
		location.href="${pageContext.request.contextPath}/outstock_editView?os_id="+id; */
		var widoid=",'new"+id+"'";
		  var iWidth="768"; //弹出窗口的宽度;
			 var iHeight="468"; //弹出窗口的高度;
			 var iTop = (window.screen.availHeight-30-iHeight)/2; //获得窗口的垂直位置;
			 var iLeft = (window.screen.availWidth-10-iWidth)/2; //获得窗口的水平位置;
	         window.open('${pageContext.request.contextPath}/outstock_editView?os_id='+id,widoid,'height='+iHeight+',width='+iWidth+',top='+iTop+',left='+iLeft+',toolbar=no,menubar=no,scrollbars=no,resizable=no,location=no,status=no');
	}
	function add(){
		/* parent.forward("修改商品入库","");
		location.href="${pageContext.request.contextPath}/stock_editView?st_id="+id; */
		var widoid="addid123";
		  var iWidth="768"; //弹出窗口的宽度;
			 var iHeight="468"; //弹出窗口的高度;
			 var iTop = (window.screen.availHeight-30-iHeight)/2; //获得窗口的垂直位置;
			 var iLeft = (window.screen.availWidth-10-iWidth)/2; //获得窗口的水平位置;
	         window.open('${pageContext.request.contextPath}/outstock_addView',widoid,'height='+iHeight+',width='+iWidth+',top='+iTop+',left='+iLeft+',toolbar=no,menubar=no,scrollbars=no,resizable=no,location=no,status=no');
	}
	function del(id){
		$.messager.confirm("提示","真的要删除吗?",function(r){
			if(r){
				$.ajax({
					   type: "POST",
					   url: "outstock_delete",
					   data: "os_id="+id,
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
			商品名称:&nbsp;&nbsp;&nbsp; <input type="text" id="truename" name="" value="" class="txt200">
				&nbsp;&nbsp;&nbsp;<a id="btnsearch" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'">查询</a>
			</div>
			 
			<div style="height: 330px;">
				<table id="grid"></table>
			</div>
		</div>
	</div>
	
</body>
</html>