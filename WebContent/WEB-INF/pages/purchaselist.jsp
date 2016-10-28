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
<script language="javascript" src="${pageContext.request.contextPath }/js/jquery.jqprint-0.3.js"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/js/easyui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/js/easyui/themes/icon.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/panel.css">
<script type="text/javascript"> 
	$(function(){
		
		//查询
		$("#btnsearch").click(function(){
			var truename=$("#truename").val();
			
			$("#grid").datagrid('load',{
				"p_no":truename
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
					url : "${pageContext.request.contextPath}/purchase_getList",
					idField : 'pi_id',
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
					 		field:'p_id',
					 		checkbox:true
					 	},{
					 		field:'p_no',
					 		title:'采购单号',
					 		align:'center',
					 		width:220,
					 		formatter:function(value,row,index){
					 			return "<a href='#'  onclick='info("+row.p_id+")'>"+row.p_no+"<a>";
					 		}
					 	},{
					 		field:'rq',
					 		title:'采购日期',
					 		align:'center',
					 		width:150,
					 		formatter:function(value,row,index){
					 			if(row.p_zdDate!=null){
					 				var s=row.p_zdDate.split("T");
						 			return s[0]+"  "+s[1];
					 			}
					 			return "";
					 			
					 		}
					 	}
					 	,{
					 		field:'kf',
					 		title:'库房',
					 		align:'center',
					 		width:150,
					 		formatter:function(value,row,index){
					 			var s=row.storeroom.storehouse.sh_name;
					 			return s;
					 		}
					 	},{
					 		field:'storeroom.s_name',
					 		title:'库区',
					 		align:'center',
					 		width:150,
					 		formatter:function(value,row,index){
					 			var s=row.storeroom.s_name;
					 			return s;
					 		}
					 	},{
					 		field:'p_username',
					 		title:'制单人',
					 		align:'center',
					 		width:150
					 	},{
					 		field:'rqlx',
					 		title:'状态',
					 		align:'center',
					 		width:150,
					 		formatter:function(value,row,index){
					 			if(row.p_zt==1){
					 				return "未付款";
					 			}else if(row.p_zt==2){
					 				return "未收货";
					 			}
								else if(row.p_zt==3){
									return "已入库";
					 			}else if(row.p_zt==4){
									return "已退货";
					 			}
					 			
					 		}
					 	},{
					 		field:'caozuo',
					 		title:'操作',
					 		align:'center',
					 		width:120,
					 		formatter:function(value,row,index){
					 			if(row.p_zt==1){
					 				return "<a href='#'  onclick='fks(\""+row.p_no+"\");'>付款<a>";
					 			}else if(row.p_zt==2){
					 				return "<a href='#'  onclick='sh(\""+row.p_no+"\")'>收货<a>";
					 			}else if(row.p_zt==3){
					 				return "<a href='#'  onclick='th(\""+row.p_no+"\")'>退货<a>";
					 			}
					 			else{
					 			return "<a href='#'  onclick='edit("+row.p_id+")'>修改<a>"+"  "+
					 			"<a href='#'  onclick='del("+row.p_id+")'>删除<a>";
					 			}
					 		}
					 	}           
					 ]]
				});
	})
	function edit(id){
		/* parent.forward("修改修改采购单","");
		location.href="${pageContext.request.contextPath}/purchase_toupView?p_id="+id; */
		var widoid=",'new"+id+"'";
		  var iWidth="1324"; //弹出窗口的宽度;
			 var iHeight="768"; //弹出窗口的高度;
			 var iTop = (window.screen.availHeight-30-iHeight)/2; //获得窗口的垂直位置;
			 var iLeft = (window.screen.availWidth-10-iWidth)/2; //获得窗口的水平位置;
	         window.open('${pageContext.request.contextPath}/purchase_toupView?p_id='+id,widoid,'height='+iHeight+',width='+iWidth+',top='+iTop+',left='+iLeft+',toolbar=no,menubar=no,scrollbars=no,resizable=no,location=no,status=no');
	}
	function info(id){
		/* parent.forward("采购订单详情","");
		location.href="${pageContext.request.contextPath}/purchase_editView?p_id="+id; */
		var widoid=",'new"+id+"'";
		  var iWidth="1324"; //弹出窗口的宽度;
			 var iHeight="768"; //弹出窗口的高度;
			 var iTop = (window.screen.availHeight-30-iHeight)/2; //获得窗口的垂直位置;
			 var iLeft = (window.screen.availWidth-10-iWidth)/2; //获得窗口的水平位置;
	         window.open('${pageContext.request.contextPath}/purchase_editView?p_id='+id,widoid,'height='+iHeight+',width='+iWidth+',top='+iTop+',left='+iLeft+',toolbar=no,menubar=no,scrollbars=no,resizable=no,location=no,status=no');
	}
	function fks(id){
	    /* parent.forward("采购付款详情","");
		location.href="${pageContext.request.contextPath}/purchasepay_addView?p_no="+id */
		var widoid=",'new"+id+"'";
		  var iWidth="1324"; //弹出窗口的宽度;
			 var iHeight="768"; //弹出窗口的高度;
			 var iTop = (window.screen.availHeight-30-iHeight)/2; //获得窗口的垂直位置;
			 var iLeft = (window.screen.availWidth-10-iWidth)/2; //获得窗口的水平位置;
	         window.open('${pageContext.request.contextPath}/purchasepay_addView?p_no='+id,widoid,'height='+iHeight+',width='+iWidth+',top='+iTop+',left='+iLeft+',toolbar=no,menubar=no,scrollbars=no,resizable=no,location=no,status=no');
	}
	function sh(id){
		$.messager.confirm("提示","确认收货?",function(r){
			if(r){
				$.ajax({
					   type: "POST",
					   url: "purchaserece_save",
					   data: "pr_no="+id,
					   success: function(msg){
					   		$.messager.alert("提示",msg,"info");
					   		$("#grid").datagrid('reload');
					   }
				});
			}
		});
	}
	function th(id){
		/* parent.forward("采购退货详情","");
		location.href="${pageContext.request.contextPath}/purchasereturn_addView?p_no="+id; */
		var widoid=",'new"+id+"'";
		  var iWidth="1324"; //弹出窗口的宽度;
			 var iHeight="768"; //弹出窗口的高度;
			 var iTop = (window.screen.availHeight-30-iHeight)/2; //获得窗口的垂直位置;
			 var iLeft = (window.screen.availWidth-10-iWidth)/2; //获得窗口的水平位置;
	         window.open('${pageContext.request.contextPath}/purchasereturn_addView?p_no='+id,widoid,'height='+iHeight+',width='+iWidth+',top='+iTop+',left='+iLeft+',toolbar=no,menubar=no,scrollbars=no,resizable=no,location=no,status=no');
	}
	function add(){
		/* parent.forward("采购退货详情","");
		location.href="${pageContext.request.contextPath}/purchasereturn_addView?p_no="+id; */
		var widoid="addi";
		  var iWidth="1324"; //弹出窗口的宽度;
			 var iHeight="768"; //弹出窗口的高度;
			 var iTop = (window.screen.availHeight-30-iHeight)/2; //获得窗口的垂直位置;
			 var iLeft = (window.screen.availWidth-10-iWidth)/2; //获得窗口的水平位置;
	         window.open('${pageContext.request.contextPath}/purchase_addView',widoid,'height='+iHeight+',width='+iWidth+',top='+iTop+',left='+iLeft+',toolbar=no,menubar=no,scrollbars=no,resizable=no,location=no,status=no');
	}
	function del(id){
		$.messager.confirm("提示","真的要删除吗?",function(r){
			if(r){
				$.ajax({
					   type: "POST",
					   url: "purchase_delete",
					   data: "p_id="+id,
					   success: function(msg){
					   		$.messager.alert("提示",msg,"info");
					   		$("#grid").datagrid('reload');
					   }
				});
			}
		});
	}
</script>
</head>
<body class="easyui-layout" style="border-top-width:0px;">
	<div region="center" border="false">
		<div  style="border-top-width:0px;">
			<div class="middle">
			采购单号:&nbsp;&nbsp;&nbsp; <input type="text" id="truename" name="" value="" class="txt200">
				&nbsp;&nbsp;&nbsp;<a id="btnsearch" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'">查询</a>
			</div>
			 
			<div style="height: 330px;">
				<table id="grid"></table>
			</div>
		</div>
	</div>
	
</body>
</html>