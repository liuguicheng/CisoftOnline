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
				"g_name":truename
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
					singleSelect:true,//单选
					pagination:true,
					pageNumber:1,//初始化页号
					url : "${pageContext.request.contextPath}/reconciliation_getList",
					idField : 'r_id',
					toolbar : [
						{
							id:'add',
							text:'手动生成对账记录',
							iconCls:'icon-add',
							handler:function(){
								
							}
						},
						{
							id:'set',
							text:'查询对账详细',
							iconCls:'icon-search',
							handler:function(){
								var rows=$("#grid").datagrid('getChecked');
								if(rows.length==0){
									$.messager.alert("警告","你还没有选择","warning");
								}else{
									var id=rows[0].r_id;
								}
							}
						},
						{
							id:'sets',
							text:'导出对账信息',
							iconCls:'icon-redo',
							handler:function(){
								var rows=$("#grid").datagrid('getChecked');
								if(rows.length==0){
									$.messager.alert("警告","你还没有选择","warning");
								}else{
									var id=rows[0].r_id;
								}
							}
						}
					],
					columns : [[
					 	{
					 		field:'r_id',
					 		checkbox:true
					 	},{
					 		field:'g_name',
					 		title:'商家名称',
					 		align:'center',
					 		width:120,
					 		formatter:function(value,row,index){
					 			if(row.merchantInfo!=null){
					 				return row.merchantInfo.mi_name;
					 			}
					 		}
					 	},{
					 		field:'er',
					 		title:'交易时间',
					 		align:'center',
					 		width:60,
					 		formatter:function(value,row,index){
					 			if(row.r_time!=null){
					 				var s=row.r_time.split("T");
						 			return s[0]+"  "+s[1];
					 			}
					 			return "";
					 		}
					 	},{
					 		field:'r_je',
					 		title:'金额',
					 		align:'center',
					 		width:60
					 	},{
					 		field:'r_zjel',
							title:'总金额(包括手续费)',
							align:'center',
							width:100
					 	},{
					 		field:'caozuo',
					 		title:'操作',
					 		align:'center',
					 		width:120,
					 		formatter:function(value,row,index){
					 			return
					 			"<a href='#'  onclick='del("+row.r_id+")'>删除<a>";
					 		}
					 	}           
					 ]]
				});
	})
	
	function selectshoping(id){
		/* parent.forward("修改供应商信息","");
		location.href="${pageContext.request.contextPath}/reconciliation_editView?r_id="+id; */
		var widoid="shping"+id;
		  var iWidth="768"; //弹出窗口的宽度;
			 var iHeight="468"; //弹出窗口的高度;
			 var iTop = (window.screen.availHeight-30-iHeight)/2; //获得窗口的垂直位置;
			 var iLeft = (window.screen.availWidth-10-iWidth)/2; //获得窗口的水平位置;
	         window.open('${pageContext.request.contextPath}/pages_shoppinginfo?id='+id,widoid,'height='+iHeight+',width='+iWidth+',top='+iTop+',left='+iLeft+',toolbar=no,menubar=no,scrollbars=no,resizable=no,location=no,status=no');
	}
	function edit(id){
		/* parent.forward("修改供应商信息","");
		location.href="${pageContext.request.contextPath}/reconciliation_editView?r_id="+id; */
		var widoid=",'new"+id+"'";
		  var iWidth="768"; //弹出窗口的宽度;
			 var iHeight="468"; //弹出窗口的高度;
			 var iTop = (window.screen.availHeight-30-iHeight)/2; //获得窗口的垂直位置;
			 var iLeft = (window.screen.availWidth-10-iWidth)/2; //获得窗口的水平位置;
	         window.open('${pageContext.request.contextPath}/reconciliation_editView?r_id='+id,widoid,'height='+iHeight+',width='+iWidth+',top='+iTop+',left='+iLeft+',toolbar=no,menubar=no,scrollbars=no,resizable=no,location=no,status=no');
	}
	function add(){
		var widoid="add123";
		  var iWidth="768"; //弹出窗口的宽度;
			 var iHeight="468"; //弹出窗口的高度;
			 var iTop = (window.screen.availHeight-30-iHeight)/2; //获得窗口的垂直位置;
			 var iLeft = (window.screen.availWidth-10-iWidth)/2; //获得窗口的水平位置;
	         window.open('${pageContext.request.contextPath}/reconciliation_addView',widoid,'height='+iHeight+',width='+iWidth+',top='+iTop+',left='+iLeft+',toolbar=no,menubar=no,scrollbars=no,resizable=no,location=no,status=no');
	}
	function del(id){
		$.messager.confirm("提示","真的要删除吗?",function(r){
			if(r){
				$.ajax({
					   type: "POST",
					   url: "reconciliation_delete",
					   data: "r_id="+id,
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
			<div class="middle">
			商家名称:&nbsp;&nbsp;&nbsp; <input type="text" id="truename" name="" value="" class="txt200">
				&nbsp;&nbsp;&nbsp;<a id="btnsearch" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'">查询</a>
			</div>
			 
			<div style="height: 330px;">
				<table id="grid"></table>
			</div>
	</div>
	
</body>
</html>