<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>广西100南宁商家订单系统</title>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-1.8.3.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/validate/useraddress_valodate.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/easyui/easyui-lang-zh_CN.js"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/js/easyui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/js/easyui/themes/icon.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/panel.css">
<script type="text/javascript">
	$(function(){
		
		
		$("#save").click(function(){		
			$('#form1').form('submit',{
				url:"${pageContext.request.contextPath}/useraddress_save",
				onSubmit:function(){
					//提交表单处理
					var flag=validate();
					return flag; 
					
				},
				success:function(data){
					var d=eval("("+data+")");
					$.messager.alert("提示",d,"info");
				}
			});
		});
		
		$("#black").click(function(){
			var id=$("#u_id").val();
			location.href="${pageContext.request.contextPath}/pages_useraddress?id="+id;
		});
	});
</script>
<style type="text/css">
	.table tr{
		height:30px;
	}
	.td1{
		text-align:rigth;	
		width:20%;
	}
	.td2{
		text-align:left;
		padding-left:20px;
	}
</style>
</head>
<body class="easyui-layout">	
	<div region="center" style="text-align: center;">
		<!-- 	<div style="height: 28px; background: url('img/titleall.gif') repeat-x;">
				<div class="titleleft"></div>
				<div class="titleright"></div>
			</div> -->
			<div style="height: 40px; text-align:center; ;line-height: 40px;background: #e0edff;font-family: '黑体';font-size: large;font-weight: bolder;">
			   
				<s:if test="ua_id!=0">
					修改收货地址
				</s:if>
				<s:else>
					添加收货地址
				</s:else>
			</div>
			<div style="height: 330px;">
				<form id="form1" method="post">
				<input type="hidden" id="id" name="ua_id" value="${ua_id}">
								<input type="hidden" id="isdelete" name="ua_scbs" value="${ua_scbs}">
								<input type=hidden id="u_id" name="user.u_id" value="${ id}">
					<table style="margin: 0 auto;width: 50%;" class="table">
						<tr>
							<td class="td1">收货人</td>
							<td class="td2">
								<input type="text" id="ua_shName" name="ua_shName" value="${ua_shName }" class="txt200">
								<span  id="spanpassword" style="color:red;display:none;">不能为空</span>
							</td>				
						</tr>
						<tr>
							<td class="td1">手机号码</td>
							<td class="td2">
								<input type="text" id="ua_shDh" name="ua_shDh" value="${ua_shDh }" class="txt200">
								<span  id="spantruename" style="color:red;display:none;">不能为空</span>
							</td>				
						</tr>
						<tr>
							<td class="td1">固定电话</td>
							<td class="td2">
								<input type="text" id="ua_shGddh" name="ua_shGddh" value="${ua_shGddh }" class="txt200">
								<span id="spanemail" style="color:red;display:none;">不能为空</span>
							</td>
						</tr>
						<tr>
							<td class="td1">收货地址</td>
							<td class="td2">
							<input type="text" id="ua_address" name="ua_address" value="${ua_address }" class="txt200">
							<span id="uaaddressid" style="color:red;display:none;">不能为空</span>
							</td>
						</tr>
						<tr>
							<td class="td1">收货邮编</td>
							<td class="td2">
							<input type="text" id="ua_yb" name="ua_yb" value="${ua_yb }" class="txt200">
							<span id="ybid" style="color:red;display:none;">不能为空</span>
							</td>
						</tr>
						<tr>
							<td class="td1">是否默认</td>
							<td class="td2">
							<s:if test="ua_status==0">
							<input id="all" type="radio" name="ua_status" value="1" />是&nbsp;&nbsp;&nbsp;  
                            <input id="famo" type="radio" name="ua_status" value="0" checked="checked"/>否
							</s:if>
							<s:elseif test="ua_status==1">
							<input id="all" type="radio" name="ua_status" value="1"  checked="checked"/>是&nbsp;&nbsp;&nbsp;  
                            <input id="famo" type="radio" name="ua_status" value="0"/>否
							</s:elseif>
							
							</td>
						</tr>
						<tr>
							<td class="td1"></td>
							<td class="td2">
								<a id="black" icon="icon-undo" href="#" class="easyui-linkbutton"  >返回</a>
								&nbsp;&nbsp;&nbsp;&nbsp;
								<a id="save" icon="icon-save" href="#" class="easyui-linkbutton"  >保存</a>
							</td>
						</tr>
					</table>
				</form>
			</div>
	</div>
</body>
</html>