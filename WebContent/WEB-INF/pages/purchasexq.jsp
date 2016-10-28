<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>100南宁－后台管理系统</title>
<script type="text/jscript" src="100nn/js/jquery-1.8.0.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/easyui/easyui-lang-zh_CN.js"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/js/easyui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/js/easyui/themes/icon.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/panel.css">
<style type="text/css">
input{
border:0px;
border-bottom: 1px #ccc solid;
width: 200px;
}
.input_readonly{
background-color: rgba(204, 204, 204, 0.44);
}
.table1{
border: 1px #ccc solid;width: 100%; margin:0px auto;margin-bottom: 1%;
}
.title_div{
font-size: 23px;
font-family: "宋体";
background-color: #ccc;
padding: 10px 10px 10px 45%;
margin-bottom: 2%;
}
.input_buttion{
width: 240px;
height: 30px;
background-color: rgba(106, 195, 223, 0.65);
border: 0px;
box-shadow: 3px 3px 3px #D7E7EC;
border-radius:10px;
-moz-border-radius:10px;
cursor: pointer;
}
.span_1{
color: red;
font-size: 12px;
}
</style>
<script type="text/javascript"> 
	$(function() {
		 var ph=$("#pno").val();
		//添加
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
						url : "${pageContext.request.contextPath}/purchaseinfo_getList?pi_no="+ph,
						idField : 'pi_id',
						columns : [[
						 	{
						 		field:'pi_id',
						 		checkbox:true
						 	},{
						 		field:'commodity.c_spbh',
						 		title:'商品编号',
						 		align:'center',
						 		width:220,
						 		formatter:function(value,row,index){
						 			return row.commodity.c_spbh;
						 		}
						 	},{
						 		field:'commodity.c_name',
						 		title:'商品名称',
						 		align:'center',
						 		width:220,
						 		formatter:function(value,row,index){
						 			return row.commodity.c_name;
						 		}
						 	},{
						 		field:'gysInfo.g_name',
						 		title:'供应商',
						 		align:'center',
						 		width:150,
						 		formatter:function(value,row,index){
						 			var s=row.gysInfo.g_name;
						 			return s;
						 		}
						 	}
						 	,{
						 		field:'pi_num',
						 		title:'采购数量',
						 		align:'center',
						 		width:150
						 	},{
						 		field:'sdd',
						 		title:'库房',
						 		align:'center',
						 		width:150
						 	},{
						 		field:'pi_cgprice',
						 		title:'采购额',
						 		align:'center',
						 		width:150
						 	},{
						 		field:'pi_zkprice',
						 		title:'折扣额',
						 		align:'center',
						 		width:150
						 	},{
						 		field:'pi_ssprice',
						 		title:'税收额',
						 		align:'center',
						 		width:150
						 	}
						 	,{
						 		field:'pi_price',
						 		title:'总金额',
						 		align:'center',
						 		width:150
						 	}          
						 ]]
					});
		
		
			$('#grid1').datagrid(
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
						url : "${pageContext.request.contextPath}/purchasepay_getList?pp_no="+ph,
						idField : 'pp_id',
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
						 ]]
					});
		
			$('#grid2').datagrid(
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
						url : "${pageContext.request.contextPath}/purchaserece_getList?pr_no="+ph,
						idField : 'pr_id',
						columns : [[
						 	{
						 		field:'pr_id',
						 		checkbox:true
						 	},{
						 		field:'pr_no',
						 		title:'收货采购单号',
						 		align:'center',
						 		width:220
						 	}
						 	,{
						 		field:'pr_username',
						 		title:'收货人',
						 		align:'center',
						 		width:150
						 	},{
						 		field:'rq',
						 		title:'收货日期',
						 		align:'center',
						 		width:150,
						 		formatter:function(value,row,index){
						 			if(row.pr_shdate!=null){
						 				var s=row.pr_shdate.split("T");
							 			return s[0]+"  "+s[1];
						 			}
						 			return "";
						 			
						 		}
						 	}
						 	,{
						 		field:'pr_bz',
						 		title:'备注',
						 		align:'center',
						 		width:150
						 	}          
						 ]]
					});
			
			$('#grid3').datagrid(
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
						url : "${pageContext.request.contextPath}/purchasereturn_getList?pr_no="+ph,
						idField : 'pr_id',
						columns : [[
						 	{
						 		field:'pr_id',
						 		checkbox:true
						 	},{
						 		field:'pr_no',
						 		title:'退货采购单号',
						 		align:'center',
						 		width:220
						 	}
						 	,{
						 		field:'pr_username',
						 		title:'退货人',
						 		align:'center',
						 		width:150
						 	},{
						 		field:'rq',
						 		title:'退货日期',
						 		align:'center',
						 		width:150,
						 		formatter:function(value,row,index){
						 			if(row.pr_shdate!=null){
						 				var s=row.pr_shdate.split("T");
							 			return s[0]+"  "+s[1];
						 			}
						 			return "";
						 			
						 		}
						 	}
						 	,{
						 		field:'pr_bz',
						 		title:'备注',
						 		align:'center',
						 		width:150
						 	}          
						 ]]
					});
			
	});
</script>
<body class="easyui-layout" style="border-top-width:0px;">

	<div region="center" border="false">
	<div class="title_div">采购订单详情</div>
	<div>
	<div>采购订单表头</div>
	<form id="form1">
	<input type="hidden" name="p_id" value="${p_id }"/>
	<input type="hidden" name="p_scbs" value="${p_scbs }"/>
	
	<table  cellpadding="10" cellspacing="1" class="table1">
	
 <tr> 
 <td>采购单号</td>
   <td><input type="text" id="pno" name="p_no" value="${p_no }" readonly="readonly" class="input_readonly"></td>
   <td>制单日期</td>
   <td><input type="text" name="p_zdDate" value=" <s:date name="p_zdDate" format="yyyy-MM-dd HH:mm:ss" />" readonly="readonly" class="input_readonly" ></td>
   <td>制单人</td>
   <td> 
    <input type="text" name="p_username"  value="${p_username}" readonly="readonly" class="input_readonly" >
    </td>
 </tr>
 <tr> 
 <td>库房</td>
   <td> 
    <input type="text" name="storeroom.s_id"  value="${storeroom.storehouse.sh_name }${storeroom.s_name}" readonly="readonly" class="input_readonly" >
    </td>
   <td>签订日期</td>
   <td>
   <input type="text" name="p_cgDate" value=" <s:date name="p_cgDate" format="yyyy-MM-dd" />" readonly="readonly" class="input_readonly" >
   </td>
    <td>交货日期</td>
   <td >
   <input type="text" name="p_jhDate" value=" <s:date name="p_jhDate" format="yyyy-MM-dd" />" readonly="readonly" class="input_readonly" >
   </td>
 </tr>
 <tr> 
   <td>收货地址</td>
   <td colspan="5"><input type="text" name="p_jhAddres" value="${p_jhAddres }" style="width: 600px;" readonly="readonly" class="input_readonly" ></td>
 </tr>
 <tr> 
   <td>备注</td>
   <td colspan="5"><input type="text" name="p_ms" style="width: 600px;" value="${p_ms }" readonly="readonly" class="input_readonly" >
   </td>
 </tr>
</table>
</form>
	</div>
			<div style="border-top-width: 0px;">
				<div style="margin: 0 auto;"><h2>已选商品</h2></div>
				<div class="middle">
					关键字查询:<input type="text" id="truename" name="" value=""> <a
						id="btnsearch" href="#" class="easyui-linkbutton"
						data-options="iconCls:'icon-search'">查询</a>
				</div>

				<div style="height: 235px;">
					<table id="grid"></table>
				</div>
			</div>
			<div style="border-top-width: 0px;">
				<div style="margin: 0 auto;"><h2>付款记录</h2></div>
				<div class="middle">
					关键字查询:<input type="text" id="truename1" name="" value=""> <a
						id="btnsearch1" href="#" class="easyui-linkbutton"
						data-options="iconCls:'icon-search'">查询</a>
				</div>

				<div style="height: 235px;">
					<table id="grid1"></table>
				</div>
			</div>
			<div style="border-top-width: 0px;">
				<div style="margin: 0 auto;"><h2>收货记录</h2></div>
				<div class="middle">
					关键字查询:<input type="text" id="truename2" name="" value=""> <a
						id="btnsearch2" href="#" class="easyui-linkbutton"
						data-options="iconCls:'icon-search'">查询</a>
				</div>

				<div style="height: 235px;">
					<table id="grid2"></table>
				</div>
			</div>
			<div style="border-top-width: 0px;">
				<div style="margin: 0 auto;"><h2>退货记录</h2></div>
				<div class="middle">
					关键字查询:<input type="text" id="truename3" name="" value=""> <a
						id="btnsearch3" href="#" class="easyui-linkbutton"
						data-options="iconCls:'icon-search'">查询</a>
				</div>

				<div style="height: 235px;">
					<table id="grid3"></table>
				</div>
			</div>
			
			
		</div>
	
</body>
</html>
