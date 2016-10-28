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
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/js/easyui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/js/easyui/themes/icon.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/panel.css">
<script type="text/javascript"> 
	$(function(){
		//查询
		$("#btnsearch").click(function(){
			var truename=$("#truename").val();
			
			$("#grid").datagrid('load',{
				"ua_address":truename,
				"ua_shName":truename,
				"ua_shDh":truename
				
			});
		});
		var id=$("#u_id").val();
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
			url : "${pageContext.request.contextPath}/useraddress_getList?id="+id,
			idField : 'ua_id',
			toolbar : [
				{
					id:'add',
					text:'添加',
					iconCls:'icon-add',
					handler:function(){
						location.href="${pageContext.request.contextPath}/useraddress_addView?id="+id;
					}
				}
			],
			columns : [[
			 	{
			 		field:'ua_id',
			 		checkbox:true
			 	},{
			 		field:'ua_shName',
			 		title:'收货人',
			 		align:'center',
			 		width:120
			 	},{
			 		field:'ua_shDh',
			 		title:'手机号码',
			 		align:'center',
			 		width:120
			 	},{
			 		field:'ua_shGddh',
			 		title:'固定电话',
			 		align:'center',
			 		width:120
			 	}
			 	,{
			 		field:'ua_address',
			 		title:'收货地址',
			 		align:'center',
			 		width:120
			 		
			 	},{
			 		field:'ua_yb',
					title:'收货邮编',
					align:'center',
					width:100
			 	},{
			 		field:'ua_scbs',
					title:'是否默认',
					align:'center',
					width:40,
					formatter:function(value,row,index){
						if(row.ua_status=='0'){
							return "否";
						}else{
							return "是";
						}
					}
			 	}
			 	,{
			 		field:'caozuo',
			 		title:'操作',
			 		align:'center',
			 		width:120,
			 		formatter:function(value,row,index){
			 			if(row.ua_status=='0'){
			 				return "<a href='#'  onclick='edit("+row.ua_id+")'>修改<a>"+"  "+
				 			"<a href='#'  onclick='del("+row.ua_id+")'>删除<a>"+"  "+
				 			"<a href='#'  onclick='swmr("+row.ua_id+","+row.user.u_id+")'>设为默认<a>";
						}else{
							return "<a href='#'  onclick='edit("+row.ua_id+")'>修改<a>"+"  "+
				 			"<a href='#'  onclick='del("+row.ua_id+")'>删除<a>";
						}
			 			
			 		}
			 	}           
			 ]]
		});
	})
	function edit(id){
		/* parent.forward("修改收货信息","");
		location.href="${pageContext.request.contextPath}/useraddress_editView?ua_id="+id; */
		var widoid=",'new"+id+"'";
		  var iWidth="768"; //弹出窗口的宽度;
			 var iHeight="468"; //弹出窗口的高度;
			 var iTop = (window.screen.availHeight-30-iHeight)/2; //获得窗口的垂直位置;
			 var iLeft = (window.screen.availWidth-10-iWidth)/2; //获得窗口的水平位置;
	         window.open('${pageContext.request.contextPath}/useraddress_editView?ua_id='+id,widoid,'height='+iHeight+',width='+iWidth+',top='+iTop+',left='+iLeft+',toolbar=no,menubar=no,scrollbars=no,resizable=no,location=no,status=no');
	}
	function del(id){
		$.messager.confirm("提示","真的要删除吗?",function(r){
			if(r){
				$.ajax({
					   type: "POST",
					   url: "useraddress_delete",
					   data: "ua_id="+id,
					   success: function(msg){
					   		$.messager.alert("提示",msg,"info");
					   		$("#grid").datagrid('reload');
					   }
				});
			}
		})
	}
	
	function swmr(id,uid){
		$.messager.confirm("提示","真的要设置为默认收货地址?",function(r){
			if(r){
				$.ajax({
					   type: "POST",
					   url: "useraddress_reset",
					   data: "ua_id="+id+"&user.u_id="+uid,
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
	<div style="text-align: center;"><h1>收货地址管理</h1></div>
			<!-- <div style="height: 28px; background: url('img/titleall.gif') repeat-x;">
				<div class="titleleft"></div>
				<div class="titleright"></div>
			</div> -->
			<div class="middle">
			<input type="hidden" id="u_id" value="<%=request.getParameter("id") %>"/>
			关键字查询:&nbsp;&nbsp;&nbsp; <input type="text" id="truename" name="" value="" class="txt200">
				&nbsp;&nbsp;&nbsp;<a id="btnsearch" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'">查询</a>
			</div>
			<div style="height: 330px;">
				<table id="grid"></table>
			</div>
	</div>
</body>
</html>