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
				"m_name":truename
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
					url : "${pageContext.request.contextPath}/member_getList",
					idField : 'm_id',
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
							
						},
						{
							id:'imp',
							text:'导入',
							iconCls:'icon-redo',
							handler:function(){
								doimport();
							}
							
						},
						{
							id:'exper',
							text:'导出',
							iconCls:'icon-undo',
							handler:function(){
								
										doexpert();
							}
							
						},
						{
							id:'selc',
							text:'查询订单',
							iconCls:'icon-search',
							handler:function(){
								var row = $('#grid').datagrid('getSelections');
								var ids=[];
								for(var i=0; i<row.length; i++){
							    	ids.push(row[i].m_id);
									
									}
							if(ids==""){
								$.messager.alert("提示","请选择要查询的会员","info");
							}else{
								selectorderinfo(ids);
								
							}
									
							
							}
							
						},
						{
							id:'seljf',
							text:'查询积分',
							iconCls:'icon-search',
							handler:function(){
								alert("研发中");
							}
							
						}
						
					],
					columns : [[
					 	{
					 		field:'m_id',
					 		checkbox:true
					 	},{
					 		field:'m_name',
					 		title:'会员名称',
					 		align:'center',
					 		width:120
					 	},{
					 		field:'m_phone',
					 		title:'手机',
					 		align:'center',
					 		width:60
					 	},{
					 		field:'m_qq',
					 		title:'qq',
					 		align:'center',
					 		width:60,
					 	},{
					 		field:'sdf',
							title:'性别',
							align:'center',
							width:100,
						    formatter:function(value,row,index){
									var msg="";
						 			if(row.m_xb==0){
						 				msg= "男";
						 			}else{
						 				msg= "女";
						 			}
						 			return msg;
						 		}
							
					 	},{
					 		field:'sd',
							title:'注册时间',
							align:'center',
							width:100,
						    formatter:function(value,row,index){
						    	if(row.m_zcsj!=null){
					 				var s=row.m_zcsj.split("T");
						 			return s[0]+"  "+s[1];
					 			}
					 			return "";
					 			
						 		}
							
					 	},
					 	{
					 		field:'sdkd',
							title:'会员等级',
							align:'center',
							width:100,
						    formatter:function(value,row,index){
						    	if(row.mgrad!=null){
					 				var s=row.mgrad.mg_name;
						 			return s;
					 			}
					 			return "";
					 			
						 		}
							
					 	}
					 	,{
					 		field:'caozuo',
					 		title:'操作',
					 		align:'center',
					 		width:120,
					 		formatter:function(value,row,index){
					 			return "<a href='#'  onclick='edit("+row.m_id+")'>修改<a>"+"  "+
					 			"<a href='#'  onclick='del("+row.m_id+")'>删除<a>";
					 		}
					 	}           
					 ]]
				});
	})
	
	
	function edit(id){
		/* parent.forward("修改供应商信息","");
		location.href="${pageContext.request.contextPath}/member_editView?m_id="+id; */
		var widoid=",'new"+id+"'";
		  var iWidth="768"; //弹出窗口的宽度;
			 var iHeight="468"; //弹出窗口的高度;
			 var iTop = (window.screen.availHeight-30-iHeight)/2; //获得窗口的垂直位置;
			 var iLeft = (window.screen.availWidth-10-iWidth)/2; //获得窗口的水平位置;
	         window.open('${pageContext.request.contextPath}/member_editView?m_id='+id,widoid,'height='+iHeight+',width='+iWidth+',top='+iTop+',left='+iLeft+',toolbar=no,menubar=no,scrollbars=no,resizable=no,location=no,status=no');
	}
	function add(){
		var widoid="add123";
		  var iWidth="768"; //弹出窗口的宽度;
			 var iHeight="468"; //弹出窗口的高度;
			 var iTop = (window.screen.availHeight-30-iHeight)/2; //获得窗口的垂直位置;
			 var iLeft = (window.screen.availWidth-10-iWidth)/2; //获得窗口的水平位置;
	         window.open('${pageContext.request.contextPath}/member_addView',widoid,'height='+iHeight+',width='+iWidth+',top='+iTop+',left='+iLeft+',toolbar=no,menubar=no,scrollbars=no,resizable=no,location=no,status=no');
	}
	function doimport(id){
		var widoid="doimport1";
		  var iWidth="768"; //弹出窗口的宽度;
			 var iHeight="468"; //弹出窗口的高度;
			 var iTop = (window.screen.availHeight-30-iHeight)/2; //获得窗口的垂直位置;
			 var iLeft = (window.screen.availWidth-10-iWidth)/2; //获得窗口的水平位置;
	         window.open('${pageContext.request.contextPath}/member_doimport',widoid,'height='+iHeight+',width='+iWidth+',top='+iTop+',left='+iLeft+',toolbar=no,menubar=no,scrollbars=no,resizable=no,location=no,status=no');
	}
	function doexpert(){
		var truename=$("#truename").val();
		$.ajax({
			   type: "POST",
			   url: "member_doexpert",
			   data: "m_name="+truename, 
			   success: function(msg){
			   		window.location.href="${pageContext.request.contextPath }/Template/"+msg;
			   }
		});
	}
	function selectorderinfo(id){
		var widoid="do1";
		  var iWidth="768"; //弹出窗口的宽度;
			 var iHeight="468"; //弹出窗口的高度;
			 var iTop = (window.screen.availHeight-30-iHeight)/2; //获得窗口的垂直位置;
			 var iLeft = (window.screen.availWidth-10-iWidth)/2; //获得窗口的水平位置;
	         window.open('${pageContext.request.contextPath}/member_domem?m_id='+id,widoid,'height='+iHeight+',width='+iWidth+',top='+iTop+',left='+iLeft+',toolbar=no,menubar=no,scrollbars=no,resizable=no,location=no,status=no');
	}
	
	function del(id){
		$.messager.confirm("提示","真的要删除吗?",function(r){
			if(r){
				$.ajax({
					   type: "POST",
					   url: "member_delete",
					   data: "m_id="+id,
					   success: function(msg){
					   		$.messager.alert("提示",msg,"info");
					   		$("#grid").datagrid('reload');
					   }
				});
			}
		})
	}
	
	function  sx(){
		$("#grid").datagrid('reload');
	}
</script>
</head>
<body class="easyui-layout">
	<div region="center" border="false">
			<div class="middle">
			会员名称:&nbsp;&nbsp;&nbsp; <input type="text" id="truename" name="" value="" class="txt200">
				&nbsp;&nbsp;&nbsp;<a id="btnsearch" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'">查询</a>
			</div>
			 
			<div style="height: 330px;">
				<table id="grid"></table>
			</div>
	</div>
	
</body>
</html>