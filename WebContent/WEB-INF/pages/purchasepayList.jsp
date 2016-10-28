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
				"pp_no":truename
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
					url : "${pageContext.request.contextPath}/purchasepay_getList",
					idField : 'pp_id',
					/* toolbar : [
						{
							id:'add',
							text:'添加',
							iconCls:'icon-add',
							handler:function(){
								parent.forward('采购付款',"");
								location.href="${pageContext.request.contextPath}/purchasepay_addView";
							}
						}
					], */
					columns : [[
					 	{
					 		field:'pp_id',
					 		checkbox:true
					 	},{
					 		field:'pp_no',
					 		title:'采购单号',
					 		align:'center',
					 		width:220
					 	}
					 	,{
					 		field:'pp_sjfkje',
					 		title:'付款金额',
					 		align:'center',
					 		width:150
					 	},{
					 		field:'rq',
					 		title:'付款日期',
					 		align:'center',
					 		width:150,
					 		formatter:function(value,row,index){
					 			if(row.pp_fkdate!=null){
					 				var s=row.pp_fkdate.split("T");
						 			return s[0]+"  "+s[1];
					 			}
					 			return "";
					 			
					 		}
					 	},{
					 		field:'rqlx',
					 		title:'付款类型',
					 		align:'center',
					 		width:150,
					 		formatter:function(value,row,index){
					 			if(row.pp_zflx==1){
					 				return "网银转账";
					 			}else if(row.pp_zflx==2){
					 				return "现金支付";
					 			}
					 		}
					 	}
					 	,{
					 		field:'pp_bz',
					 		title:'备注',
					 		align:'center',
					 		width:150
					 	}
					 	/* ,{
					 		field:'caozuo',
					 		title:'操作',
					 		align:'center',
					 		width:120,
					 		formatter:function(value,row,index){
					 			return "<a href='#'  onclick='edit("+row.pp_id+")'>修改<a>"+"  "+
					 			"<a href='#'  onclick='del("+row.pp_id+")'>删除<a>";
					 		}
					 	}     */       
					 ]]
				});
	})
	function edit(id){
/* 		parent.forward("修改商品入库","");
		location.href="${pageContext.request.contextPath}/purchasepay_editView?pp_id="+id; */
		var widoid=",'new"+id+"'";
		  var iWidth="1324"; //弹出窗口的宽度;
			 var iHeight="768"; //弹出窗口的高度;
			 var iTop = (window.screen.availHeight-30-iHeight)/2; //获得窗口的垂直位置;
			 var iLeft = (window.screen.availWidth-10-iWidth)/2; //获得窗口的水平位置;
	         window.open('${pageContext.request.contextPath}/purchasepay_editView?pp_id='+id,widoid,'height='+iHeight+',width='+iWidth+',top='+iTop+',left='+iLeft+',toolbar=no,menubar=no,scrollbars=no,resizable=no,location=no,status=no');
	}
	function del(id){
		$.messager.confirm("提示","真的要删除吗?",function(r){
			if(r){
				$.ajax({
					   type: "POST",
					   url: "purchasepay_delete",
					   data: "pp_id="+id,
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