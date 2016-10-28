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
width: 290px;
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
		 $(".easyui-datebox").datebox();
		//点击添加
		$("#addcommdity").click(function(){
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
						url : "${pageContext.request.contextPath}/purchaseinfo_getList",
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
						 			return row.commodity.c_name;
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
						 		field:'storeroom.s_name',
						 		title:'库房',
						 		align:'center',
						 		width:150,
						 		formatter:function(value,row,index){
						 			var s=row.storeroom.storehouse.sh_name+" "+row.storeroom.s_name;
						 			return s;
						 		}
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
						 	},{
						 		field:'caozuo',
						 		title:'操作',
						 		align:'center',
						 		width:120,
						 		formatter:function(value,row,index){
						 			return "<a href='#'  onclick='edit("+row.pi_id+")'>修改<a>"+"  "+
						 			"<a href='#'  onclick='del("+row.pi_id+")'>删除<a>";
						 		}
						 	}           
						 ]]
					});
		});
		
		$("#savecgid").click(function(){
			$("#addcommdityid").css("display","block");
			
		});

		
	});
</script>
<body class="easyui-layout" style="border-top-width:0px;">

	<div region="center" border="false">
	<div class="title_div">添加采购订单</div>
	<div>
	<div>采购订单表头</div>
	<form action="">
	<input type="hidden" name="p_id" value="${p_id }"/>
	<input type="hidden" name="p_zdDate" value="${p_zdDate }"/>
	<input type="hidden" name="p_scbs" value="${p_scbs }"/>
	
	<table  cellpadding="10" cellspacing="1" class="table1">
	
 <tr> 
 <td>采购单号</td>
   <td><input type="text" name="p_no" value="${p_no }" readonly="readonly" class="input_readonly"></td>
   <td>制单日期</td>
   <td><input type="text" name="p_zdDate" value="${p_zdDate }" readonly="readonly" class="input_readonly" ></td>
   <td>库房</td>
   <td> 
    
     <select id="storeroom" name="storeroom.s_id" style="width: 150px">
								 <option value="-1">请选择库房</option>
									<s:iterator value="#storeroom" var="u">
										<s:if test="storeroom.s_id==#u.s_id">
											<option value="${s_id}" selected="selected"><s:property value="#u.storehouse.sh_name"/> ${s_name }</option>
										</s:if>
										<option value="${s_id}"><s:property value="#u.storehouse.sh_name"/>  ${s_name }</option>
									</s:iterator>
							</select>
    <span class="span_1">＊请选择存放库房</span>
    </td>
 </tr>
 <tr> 
   <td>签订日期</td>
   <td><input type="text" name="p_cgDate" class="easyui-datebox"><span class="span_1">＊请输入签订日期</span></td>
    <td>交货日期</td>
   <td colspan="3">
   <input type="text" name="p_jhDate" class="easyui-datebox"><span class="span_1">＊请输入交货日期</span>
   </td>
 </tr>
 <tr> 
   <td>收货地址</td>
   <td colspan="5"><input type="text" name="p_jhAddres" style="width: 790px;"><span class="span_1">＊请输入收货地址</span></td>
 </tr>
 <tr> 
   <td>备注</td>
   <td colspan="5"><input type="text" name="p_ms" style="width: 800px;">
   <input  type="button" value="保   存" class="input_buttion" id="savecgid" style="margin-left: 112px;"/>
   </td>
 </tr>
</table>
</form>
	</div>
	<div id="addcommdityid" style="display:none;">
	<div style="margin-top: 2%;">添加商品</div>
	<form action="">
	
	<input type="hidden" name="pi_id" value="${pi_id }"/>
	<input type="hidden" name="pi_no" value="${pi_no }"/>
	<input type="hidden" name="pi_scbs" value="${pi_scbs }"/>
	<table  cellpadding="10" cellspacing="1" class="table1">
 <tr> 
 <td>商品条形码</td>
   <td><input type="text" name=""><span class="span_1">＊请扫描商品条形码</span></td>
   <td>商品名称</td>
   <td><input type="text" name="" readonly="readonly" class="input_readonly"></td>
   <td>价钱</td>
   <td><input type="text" name="" value="" readonly="readonly" class="input_readonly"></td>
 </tr>
 <tr> 
   <td>数量</td>
   <td><input type="text" name="pi_num"><span class="span_1">＊请输入采购数量</span></td>
    <td>供应商</td>
   <td >
    <select name="gysInfo.g_id" >
										<option value="－1">-- 请选择商品供应商 --</option>
										<s:iterator value="#gyslist" var="g">
											<s:if test="#g.g_id==gysInfo.g_id">
												<option value="<s:property value="#g.g_id"/>"
													selected="selected"><s:property value="#g.g_name" />
												</option>
											</s:if>
											<s:else>
												<option value="<s:property value="#g.g_id"/>"><s:property
														value="#g.g_name" />
												</option>
											</s:else>
										</s:iterator>

								</select><span class="span_1">＊请选择供应商</span>
   </td>
      <td colspan="2" >
      <input id="addcommdity" type="button" value="添  加" class="input_buttion"/>
   </td>
 </tr>

</table>
</form>
			<div style="border-top-width: 0px;">
				<div>已选商品</div>
				<div class="middle">
					关键字查询:<input type="text" id="truename" name="" value=""> <a
						id="btnsearch" href="#" class="easyui-linkbutton"
						data-options="iconCls:'icon-search'">查询</a>
				</div>

				<div style="height: 235px;">
					<table id="grid"></table>
				</div>
			</div>
		</div>
	
	
	</div>
</body>
</html>
