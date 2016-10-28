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
			});
		});
	    var id=$("#spid").val();
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
			url : "${pageContext.request.contextPath}/cbaction_getList?cb_zid="+id,
			idField : 'cb_id',
			toolbar : [
				{
					id:'add',
					text:'添加',
					iconCls:'icon-add',
					handler:function(){
						add(id);
					}
				},{
					id:'pl',
					text:'批量删除',
					iconCls:'icon-cancel',
					handler:function(){
						var row = $('#grid').datagrid('getSelections');
						var ids=[];
						for(var i=0; i<row.length; i++){
						    	ids.push(row[i].cb_id);
						}
							if(ids==""){
								$.messager.alert("提示","请选择商品","info");
							}else{
								alert(ids);
								del(ids);
							}
					}
				}
				],
				columns : [[
						 	{
						 		field:'cb_id',
						 		checkbox:true
						 	}
						 	,{
						 		field:'spn',
						 		title:'商品名称',
						 		align:'center',
						 		width:120,
						 		formatter:function(value,row,index){
						 			var spid=row.cb_fid;
						 			var s="";
									$.ajax({
										   type: "POST",
										   async: false,
										   url: "commodity_queryCommodity",
										   data: "c_id="+spid,
										   success: function(msg){
											   s= ""+msg+"";
										   }
									});
									return s;
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
					   url: "cbaction_delete",
					   data: "result="+id,
					   success: function(msg){
					   		$.messager.alert("提示",msg,"info");
					   		$("#grid").datagrid('reload');
					   }
				});
			}
		})
	}
	
	function add(id){
		var widoid="add123ee";
		  var iWidth="768"; //弹出窗口的宽度;
			 var iHeight="468"; //弹出窗口的高度;
			 var iTop = (window.screen.availHeight-30-iHeight)/2; //获得窗口的垂直位置;
			 var iLeft = (window.screen.availWidth-10-iWidth)/2; //获得窗口的水平位置;
	         window.open('${pageContext.request.contextPath}/cbaction_toAddCommodityBindingPage?result='+id,widoid,'height='+iHeight+',width='+iWidth+',top='+iTop+',left='+iLeft+',toolbar=no,menubar=no,scrollbars=no,resizable=no,location=no,status=no');
	}
	function sx(){
		$("#grid").datagrid('reload');
	}
</script>
</head>
<body class="easyui-layout">
	<div region="center" border="false">
	<input type="hidden" id="spid" value="<%=request.getParameter("result") %>">
			<div class="middle" id="tb">
			商品名称:&nbsp;&nbsp;&nbsp; <input type="text" id="truename" name="" value="" class="txt200">
				&nbsp;&nbsp;&nbsp;<a id="btnsearch" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'">查询</a>
			</div>
			 
			<div style="height: 330px;">
				<table id="grid"></table>
			</div>
	</div>
	
</body>
</html>