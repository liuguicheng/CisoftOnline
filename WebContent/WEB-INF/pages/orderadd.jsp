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
		
		//下拉框回显
		var role="${commodity.c_id}";
		$("#commodity").val(role);
		
		$("#save").click(function(){
			$("#form1").form('submit',{
				url:'${pageContext.request.contextPath}/htorder_save',
				onSubmit:function(){
					var unitname=$("#o_spnum").val();
					if($.trim(unitname).length==0){
						$("#spanunitname").show();
						return false;
					}else{
						$("#spanunitname").hide();
					}
				},
				success:function(data){
					$.messager.alert("提示",eval("("+data+")"),"info");
				}
			});
		});
		
		/* $("#commodity").change(function(){
			var id=$("#commodity").val();
						$.ajax({
							   type: "POST",
							   url: "order_querycommodity",
							   data: "commodity.c_id="+id,
							   success: function(msg){
							   		$.messager.alert("提示",commodityss.c_jg,"info");
							   }
						});
		}); */
		
	})
</script>
</head>
<body class="easyui-layout">	
	<div region="center">
		<div class="divall" style="height: 500px;">
			<div style="height: 28px; background: url('img/titleall.gif') repeat-x;">
				<div class="titleleft"></div>
				<div class="titleright"></div>
			</div>
			<div style="height: 40px; text-align: center;line-height: 40px;background: #e0edff;font-family: '黑体';font-size: large;font-weight: bolder;">
				<s:if test="id>0">
					修改页面
				</s:if>
				<s:else>
					添加页面
				</s:else>
			</div>
			<div style="height: 330px;">
				<form id="form1" method="post">
					<table style="margin: 0 auto;width: 50%;">
						<tr>
							<td style="width: 20%;text-align: right;">商品名称</td>
							<td style="text-align: left;padding-left: 20px;">
								<input type="hidden" id="id" name="o_id" value="${o_id}">
								<input type="hidden" id="isdelete" name="o_scbs" value="${o_scbs}">
								<input type="hidden" id="o_spjg" name="o_spjg" value="${commodity.c_jg }">
								<input type="hidden" id="o_yf" name="o_yf" value="${commodity.c_psjg }">
								<select id="commodity" name="commodity.c_id" style="width:210px">
									<s:iterator value="#commoditys" var="u">
										<option value="${c_id }">${c_name }</option>
									</s:iterator>
								</select> 
								<span id="spanunitname" style="color:red;display:none;">不能为空</span>
							</td>
						</tr>
						<%-- <tr >
							<td style="width: 20%;text-align: right;">单价</td>
							<td style="text-align: left;padding-left: 20px;" id="dj">
							${commodity.c_jg }
							</td>
						</tr>
						<tr>
							<td style="width: 20%;text-align: right;">库存</td>
							<td style="text-align: left;padding-left: 20px;" id="o_ck">
							
							</td>
						</tr>
						<tr >
							<td style="width: 20%;text-align: right;">邮费</td>
							<td style="text-align: left;padding-left: 20px;" id="yf">
							
							</td>
						</tr> --%>
						<tr>
							<td style="width: 20%;text-align: right;">数量</td>
							<td style="text-align: left;padding-left: 20px;">
								<input type="text" id="o_spnum" name="o_spnum" value="${o_spnum}" style="width: 200px;">
								
								<span id="spanunitname" style="color:red;display:none;">不能为空</span>
							</td>
						</tr>
						<tr>
							<td style="width: 20%;text-align: right;">备注</td>
							<td style="text-align: left;padding-left: 20px;">
								<textarea rows="5" cols="5" name="o_bz" style="width: 200px;">${o_bz}</textarea>
								
								<span id="spanunitname" style="color:red;display:none;">不能为空</span>
							</td>
						</tr>
						<tr>
							<td style="width: 20%;text-align: right;"></td>
							<td style="text-align: left;padding-left: 20px;">
								<a id="save" icon="icon-save" href="#" class="easyui-linkbutton"  >保存</a>
							</td>
						</tr>
					</table>
				</form>
			</div>
		</div>
	</div>
</body>
</html>