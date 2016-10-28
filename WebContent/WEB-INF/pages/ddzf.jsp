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
		var o_id="${order.o_id}";
		$("#id").val(o_id);
		var o_spname="${order.o_spname}";
		$("#spname").html(o_spname);
		var o_yf="${order.o_yf}";
		$("#yf").html(o_yf);
 		 var o_zj="${order.o_zjg}";
 		 $("#zj").html(o_zj);
		
		
		$("#save").click(function(){	
			var zfje=$("#je").val();
			if(zfje.length==0){
				$("#jename").show();
				return false;
			}else{
				$("#jename").hide();
				$('#form1').submit();
				return true;
			}
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
		<div class="divall">
			<div style="height: 28px; background: url('img/titleall.gif') repeat-x;">
				<div class="titleleft"></div>
				<div class="titleright"></div>
			</div>
			<div style="height: 40px; text-align: center;line-height: 40px;background: #e0edff;font-family: '黑体';font-size: large;font-weight: bolder;">
					支付页面
			</div>
			<div style="height: 330px;">
				<form id="form1" method="post" action="paymentrecords_ddzf">
					<input type="text" id="id" name="id" value=''>
					<table style="margin: 0 auto;width: 50%;" class="table">
						<tr>
							<td class="td1">订单商品</td>
							<td class="td2" id="spname">
							
							</td>
						</tr>
						<tr>
							<td class="td1">邮费</td>
							<td class="td2" id="yf">
							</td>
						</tr>
						<tr>
							<td class="td1">总价</td>
							<td class="td2" id="zj">
							<s:property value="order.o_zjg"/>
							</td>				
						</tr>
						<tr>
							<td class="td1">输入支付金额</td>
							<td class="td2">
								<input type="text" id="je" name="zfje" value="">
								<span  id="jename" style="color:red;display:none;">不能为空</span>
							</td>				
						</tr>
						<tr>
							<td class="td1"></td>
							<td class="td2">
								<a id="save" icon="icon-save" href="#" class="easyui-linkbutton"  >确认支付</a>
							</td>
						</tr>
					</table>
				</form>
			</div>
		</div>
	</div>
</body>
</html>