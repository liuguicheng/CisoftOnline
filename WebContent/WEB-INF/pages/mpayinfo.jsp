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
		 $("#parentid").val("${paymentM.pm_id}");
		$("#save").click(function(){
			$("#form1").form('submit',{
				url:'${pageContext.request.contextPath}/mpay_save',
				onSubmit:function(){
					
				},
				success:function(data){
					$.messager.alert("提示",eval("("+data+")"),"info");
				}
			});
		});
		$("#parentid").change(function(){
			//alert($(this).children('option:selected').val()); 
			var p1=$(this).children('option:selected').val();//这就是selected的值 
			$("#fid").val(p1);
		});
	})
</script>
</head>
<body class="easyui-layout">	
	<div region="center">
			<div style="height: 40px; text-align: center;line-height: 40px;background: #e0edff;font-family: '黑体';font-size: large;font-weight: bolder;">
				<s:if test="mp_id!=0">
					修改商家支付方式信息
				</s:if>
				<s:else>
					添加商家支付方式信息
				</s:else>
			</div>
			<div style="height: 330px;">
				<form id="form1" method="post">
					<table style="margin: 0 auto;width: 50%;">
						<tr>
							<td style="width: 20%;text-align: right;">支付方式</td>
							<td style="text-align: left;padding-left: 20px;">
								<input type="hidden" id="id" name="mp_id" value="${mp_id}">
								<input type="hidden" id="isdelete" name="mp_scbs" value="${mp_scbs}">
								<select id="parentid"
								name="d" class="select_d">
								<option value="0">无</option>
									<s:iterator value="#pmlist" var="u">
										<option value="${pm_id}">${pm_name}</option>
									</s:iterator>
							</select>
							<input type="hidden" name="paymentM.pm_id" id="fid" value="${paymentM.pm_id}">
							</td>
						</tr>
						<tr>
							<td style="width: 20%;text-align: right;">支付名称</td>
							<td style="text-align: left;padding-left: 20px;">
							<input type="text" id="unitname" name="mp_name" class="txt200"  value="${mp_name }">
							<span id="spanunitname" style="color:red;display:none;">不能为空</span>
							
							</td>
						</tr>
						<tr>
							<td style="width: 20%;text-align: right;">支持货币</td>
							<td style="text-align: left;padding-left: 20px;">
							<input type="text" id="unitname" name="mp_zc" class="txt200"  value="人民币"  readonly="readonly">
							<span id="spanunitname" style="color:red;display:none;">不能为空</span>
							
							</td>
						</tr>
						<tr>
							<td style="width: 20%;text-align: right;">合作者身份(parterID)</td>
							<td style="text-align: left;padding-left: 20px;">
							
							<input type="text" id="unitname" name="mp_jkid" class="txt200"  value="${mp_jkid }">
							<span id="spanunitname" style="color:red;display:none;">不能为空</span>
							
							</td>
						</tr>
						<tr>
							<td style="width: 20%;text-align: right;">交易安全交易码(key)</td>
							<td style="text-align: left;padding-left: 20px;">
							
							<input type="text" id="unitname" name="mp_jkmy" class="txt200"  value="${mp_jkmy }">
							<span id="spanunitname" style="color:red;display:none;">不能为空</span>
							
							</td>
						</tr>
						<tr>
							<td style="width: 20%;text-align: right;">选择接口类型</td>
							<td style="text-align: left;padding-left: 20px;">
							<select id="jklxid"
								name="mp_jklx" class="select_d">
								 <s:if test="mp_jklx==1">
								 <option value="1" selected="selected" >使用标准双接口</option>
										<option value="2">使用担保交易接口</option>
										<option value="3">使用即时到账交易接口</option>
								 </s:if>
								 <s:elseif test="mp_jklx==2">
								 <option value="1">使用标准双接口</option>
										<option value="2" selected="selected">使用担保交易接口</option>
										<option value="3">使用即时到账交易接口</option>
								 </s:elseif>
								  <s:elseif test="mp_jklx==3">
								  <option value="1">使用标准双接口</option>
										<option value="2">使用担保交易接口</option>
										<option value="3" selected="selected" >使用即时到账交易接口</option>
								 </s:elseif>
										
							</select>
							<span id="spanunitname" style="color:red;display:none;">不能为空</span>
							
							</td>
						</tr>
						<tr>
							<td style="width: 20%;text-align: right;">支付费率</td>
							<td style="text-align: left;padding-left: 20px;">
							
							<input type="text" id="unitname" name="mp_fl" class="txt200"  value="${mp_fl }">
							<span id="spanunitname" style="color:red;display:none;">不能为空</span>
							
							</td>
						</tr>
						<tr>
							<td style="width: 20%;text-align: right;">排序</td>
							<td style="text-align: left;padding-left: 20px;">
							<input type="text" id="unitname" name="mp_px" class="txt200"  value="${mp_px }">
							<span id="spanunitname" style="color:red;display:none;">不能为空</span>
							
							</td>
						</tr>
						<tr>
							<td style="width: 20%;text-align: right;">介绍</td>
							<td style="text-align: left;padding-left: 20px;">
							<textarea rows="10" cols="26" name="mp_bz">${mp_bz }</textarea>
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
</body>
</html>