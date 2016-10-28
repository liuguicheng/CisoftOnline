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
		var id=$("#o_id").val();
	
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
					url : "${pageContext.request.contextPath}/htorder_getList?id="+id,
					idField : 'o_id',
					toolbar : [
						{
							id:'add',
							text:'添加',
							iconCls:'icon-add',
							handler:function(){
								parent.forward('添加订单',"");
								location.href="${pageContext.request.contextPath}/htorder_addView";
							}
						},
						{
							id:'set',
							text:'查询订单流程详情',
							iconCls:'icon-search',
							handler:function(){
								var rows=$("#grid").datagrid('getChecked');
								if(rows.length==0){
									$.messager.alert("警告","你还没有选择","warning");
								}else{
									var id=rows[0].o_id;
								parent.forward('查询订单流程',"pages_orderrecord?id="+id);
								location.href="${pageContext.request.contextPath}/pages_orderrecord?id="+id;
								}
							}
						}
						
					],
					columns : [[
					 	{
					 		field:'o_id',
					 		checkbox:true
					 	},{
					 		field:'o_bh',
					 		title:'订单编号',
					 		align:'center',
					 		width:40
					 	},{
					 		field:'user',
					 		title:'收货人',
					 		align:'center',
					 		width:30,
					 		formatter:function(value,row,index){
					 			if(row.user!=null){
					 				return row.useraddress.ua_shName;
					 			}
					 		}
					 	},{
					 		field:'users',
							title:'收货地址',
							align:'center',
							width:80,
							formatter:function(value,row,index){
					 			if(row.user!=null){
					 				return row.useraddress.ua_address;
					 			}
					 		}
					 	},{
					 		field:'user1',
							title:'联系方式',
							align:'center',
							width:30,
							formatter:function(value,row,index){
					 			if(row.user!=null){
					 				return row.useraddress.ua_shName;
					 			}
					 		}
					 	}
					 	,{
					 		field:'o_startTime',
							title:'订购日期',
							align:'center',
							width:50,
							
					 	}					 	,{
					 		field:'o_status',
							title:'状态',
							align:'center',
							width:30,
							formatter:function(value,row,index){
								
								if(row.o_status=='6'){
									return "未结算";
								}else if(row.o_status=='5'){
									return "退货处理中";
								}else if(row.o_status=='4'){
									return "退货申请中";
								}else if(row.o_status=='3'){
									return "完成订单";
								}else if(row.o_status=='2'){
									return "已收货";
								}else if(row.o_status=='1'){
									return "未收货";
								}else if(row.o_status=='0'){
									return "未发货";
								}
					 		}
					 	}	,{
					 		field:'chuli',
							title:'处理',
							align:'center',
							width:40,
					 		formatter:function(value,row,index){
					 			if(row.o_status=='6'){
					 				return "<select class='commodity' name='' style='width:80px'>"+
									"<option value='0'>未付款</option>"+
									"</select> ";
					 			}else if(row.o_status=='0') {
					 				return "<select class='commodity' onchange='changeop("+row.o_id+")' style='width:80px'>"+
					 				"<option value='0' seleced>未发货</option>"+
									"<option value='1'>发货</option>"+
									"<option value='3'>取消订单</option>"+
									"</select> ";
					 			}else if(row.o_status=='1') {
					 				return "<select class='commodity' onchange='changeop("+row.o_id+")' style='width:80px'>"+
					 				"<option value='0' >请选择</option>"+
					 				"<option value='2' >确认收货</option>"+
									"</select> ";
					 			}else if(row.o_status=='2') {
					 				return "订单完成";
					 			}else if(row.o_status=='3') {
					 				return "订单结束";
					 			}
					 		}
					 	},{
					 		field:'caozuo',
					 		title:'操作',
					 		align:'center',
					 		width:30,
					 		formatter:function(value,row,index){
					 			if(row.o_status=='6'){
					 				return "<a href='#'  onclick='edit("+row.o_id+")'>详情<a>"+"  "+
						 			"<a href='#'  onclick='del("+row.o_id+")' >删除<a>"+"  "+
						 			"<a href='#'  onclick='js("+row.o_id+")' >结算<a>";
					 			}else{
					 			return "<a href='#'  onclick='edit("+row.o_id+")'>详情<a>"+"  "+
					 			"<a href='#'  onclick='del("+row.o_id+")' >删除<a>";
					 			}
					 		}
					 	}           
					 ]]
				});
	})
	function edit(id){
		/* parent.forward("订单详细","");
		location.href="${pageContext.request.contextPath}/htorder_editView?o_id="+id; */
		var widoid=",'new"+id+"'";
		  var iWidth="1324"; //弹出窗口的宽度;
			 var iHeight="768"; //弹出窗口的高度;
			 var iTop = (window.screen.availHeight-30-iHeight)/2; //获得窗口的垂直位置;
			 var iLeft = (window.screen.availWidth-10-iWidth)/2; //获得窗口的水平位置;
	         window.open('${pageContext.request.contextPath}/htorder_editView?o_id='+id,widoid,'height='+iHeight+',width='+iWidth+',top='+iTop+',left='+iLeft+',toolbar=no,menubar=no,scrollbars=no,resizable=no,location=no,status=no');
	}
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
	
	function changeop (id){
		var status=$(".commodity").val();
		if(status!=0){
		$.ajax({
			   type: "POST",
			   url: "htorder_updatepwd",
			   data: "o_status="+status+"&o_id="+id,
			   success: function(msg){
			   		$.messager.alert("提示",msg,"info");
			   		$("#grid").datagrid('reload');
			   }
		});
		
		}
		}
	//结算
	function js(id){
/* 		parent.forward('订单结算',"order_tojspage?id="+id);
		location.href="${pageContext.request.contextPath}/htorder_tojspage?id="+id; */
		var widoid=",'new"+id+"'";
		  var iWidth="1324"; //弹出窗口的宽度;
			 var iHeight="768"; //弹出窗口的高度;
			 var iTop = (window.screen.availHeight-30-iHeight)/2; //获得窗口的垂直位置;
			 var iLeft = (window.screen.availWidth-10-iWidth)/2; //获得窗口的水平位置;
	         window.open('${pageContext.request.contextPath}/htorder_tojspage?id='+id,widoid,'height='+iHeight+',width='+iWidth+',top='+iTop+',left='+iLeft+',toolbar=no,menubar=no,scrollbars=no,resizable=no,location=no,status=no');
		
		
	}
	
</script>
</head>
<body class="easyui-layout" style="border-top-width:0px;">
	<div region="center" border="false">
		<div  style="border-top-width:0px;">
			<input type="hidden" id="o_id" value="<%=request.getParameter("id") %>"/>
			<div class="middle">
			订单编号:<input type="text" id="truename" name="" value="">
				<a id="btnsearch" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'">查询</a>
			</div>
			<div style="height: 330px;">
				<table id="grid"></table>
			</div>
		</div>
	</div>
	
</body>
</html>