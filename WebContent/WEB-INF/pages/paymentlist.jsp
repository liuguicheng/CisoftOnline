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
				"paymentBh":truename
			});
		});
		
		$('#grid').datagrid(
				{
					iconCls : 'icon-forward',
					fit : true,
					fitColumns:true,
					singleSelect:true,//单选
					width:'100%',
					border : false,
					striped : true,
					rownumbers : true,
					method:"post",
					pagination:true,
					pageNumber:1,//初始化页号
					url : "${pageContext.request.contextPath}/payment_getList",
					idField : 'id',
					toolbar : [
						{
							id:'set',
							text:'查询缴费订单详情',
							iconCls:'icon-search',
							handler:function(){
								var rows=$("#grid").datagrid('getChecked');
								if(rows.length==0){
									$.messager.alert("警告","你还没有选择","warning");
								}else{
									var id=rows[0].id;
									tcxx(id);
								}
							}
						}
						
					],
					columns : [[
					 	{
					 		field:'id',
					 		checkbox:true
					 	},{
					 		field:'paymentBh',
					 		title:'缴费编号',
					 		align:'center',
					 		width:40
					 	},{
					 		field:'paymentjyh',
					 		title:'交易流水号',
					 		align:'center',
					 		width:30
					 	},{
					 		field:'paymentName',
							title:'缴费名称',
							align:'center',
							width:80
					 	},{
					 		field:'user1',
							title:'缴费类型',
							align:'center',
							width:30,
							formatter:function(value,row,index){
								var s="";
					 			if(row.paymentType!=null){
					 				
					 				if(row.paymentType=='1'){
					 					s="水费";
					 				}else if(row.paymentType=='2'){
					 					s="电费";
					 				}else if(row.paymentType=='3'){
					 					s="煤气费";
					 				}else if(row.paymentType=='4'){
					 					s="其他";
					 				}
					 				
					 				return s;
					 			}
					 		}
					 	}
					 	,{
					 		field:'paymentZhanghao',
							title:'缴费账号',
							align:'center',
							width:50,
							
					 	},{
					 		field:'paymentXingMin',
							title:'缴费姓名',
							align:'center',
							width:30
					 		
					 	},{
					 		field:'paymentDate',
							title:'缴费时间',
							align:'center',
							width:50,
							formatter:function(value,row,index){
					 			if(row.paymentDate!=null){
					 				var s=row.paymentDate.split("T");
						 			return s[0]+"  "+s[1];
					 			}
					 			return "";
					 			
					 		}
					 		
					 	},{
					 		field:'paymentPrice',
							title:'缴费金额',
							align:'center',
							width:30
					 		
					 	},{
					 		field:'paymendf',
							title:'缴费渠道',
							align:'center',
							width:20,
					 		formatter:function(value,row,index){
					 			if(row.paymentFs=='1'){
					 				return "支付宝";
					 			}else if(row.paymentFs=='2') {
					 				return "银联";
					 			}
					 		}
					 	},{
					 		field:'ad',
							title:'缴费状态',
							align:'center',
							width:20,
					 		formatter:function(value,row,index){
					 			if(row.paymentZt=='1'){
					 				return "<span style='color:green;'>支付成功</span>";
					 			}else if(row.paymentZt=='2') {
					 				return "<span style='color:red;'>支付失败</span>";
					 			}else if(row.paymentZt=='3') {
					 				return "正在验证";
					 			}else if(row.paymentZt=='4') {
					 				return "<span style='color:red;'>未成功</span>";
					 			}else if(row.paymentZt=='5') {
					 				return "未收货";
					 			}else if(row.paymentZt=='6') {
					 				return "<span style='color:green;'>交易完成</span>";
					 			}
					 		}
					 	},{
					 		field:'caozuo',
					 		title:'操作',
					 		align:'center',
					 		width:30,
					 		formatter:function(value,row,index){
					 			if(row.paymentZt=='1'){
					 				return "<a href=\"#\"  onclick=\"fh('"+row.paymentBh+"')\">发货<a>";
					 			}
					 		}
					 	}           
					 ]]
				});
	})
	
	//结算
	function fh(id){
		var url="payment.paymentBh="+id;
		$
		.ajax({
			type : "POST",
			url : "payment_tofhpage",
			data : url,
			success : function(msgs) {
				if(msgs=="1"){
					$.messager.alert("提示","发货成功","info");
			   		$("#grid").datagrid('reload');
				}else{
					alert("发货失败");
				}
			}
		});
	}
	
	function tcxx(id){
		var widoid=",'new"+id+"'";
		  var iWidth="1324"; //弹出窗口的宽度;
			 var iHeight="768"; //弹出窗口的高度;
			 var iTop = (window.screen.availHeight-30-iHeight)/2; //获得窗口的垂直位置;
			 var iLeft = (window.screen.availWidth-10-iWidth)/2; //获得窗口的水平位置;
	         window.open('${pageContext.request.contextPath}/payment_paymentDetail?id='+id,widoid,'height='+iHeight+',width='+iWidth+',top='+iTop+',left='+iLeft+',toolbar=no,menubar=no,scrollbars=no,resizable=no,location=no,status=no');
		
		
	}
	
</script>
</head>
<body class="easyui-layout" style="border-top-width:0px;">
	<div region="center" border="false">
		<div  style="border-top-width:0px;">
			<div class="middle">
			请输入关键字（缴费编号、村医生姓名、手机号码）:<input type="text" id="truename" name="" value="" style="width: 250px; height: 25px;">
				<a id="btnsearch" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'">查询</a>
			</div>
			<div style="height: 330px;">
				<table id="grid"></table>
			</div>
		</div>
	</div>
	
</body>
</html>