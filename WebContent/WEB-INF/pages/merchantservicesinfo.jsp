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
		$("#parentid").val("${_parentId}");
		$("#save").click(function(){
			$("#form1").form('submit',{
				url:'mserac_save',
				onSubmit:function(){
					var flag=validate();
					return flag;
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
	function validate(){
		var mseracname=$("#mseracname").val();
		var page=$("#page").val();
		var flag1=true,flag2=true;
		if($.trim(mseracname).length==0){
			flag1=false;
			$("#mseracnameid").show();
		}else{
			flag1=true;
			$("#mseracnameid").hide();
		}
		/* if($.trim(page).length==0){
			flag2=false;
			$("#pageid").show();
		}else{
			flag2=true;
			$("#pageid").hide();
		} */
		
		
		
		
		if(flag1==false||flag2==false){
			return false;
		}
		
		
	}
</script>
</head>
<body class="easyui-layout">	
	<div region="center">
			<div style="height: 40px; text-align: center;line-height: 40px;background: #e0edff;font-family: '黑体';font-size: large;font-weight: bolder;">
				<s:if test="id!=0">
					修改商家服务信息
				</s:if>
				<s:else>
					添加商家服务信息
				</s:else>
			</div>
			<div style="height: 330px;">
				<form id="form1" method="post">
					<input type="hidden" name="_parentId" id="fid" value="${_parentId}">
						<input type="hidden" name="scbs" id="fid" value="${scbs}">
					<table style="margin: 0 auto;width: 50%;">
						
						<tr>
							<td style="width: 20%;text-align: right;">父菜单</td>
							<td style="text-align: left;padding-left: 20px;">
								<input type="hidden" id="id" name="id" value="${id}">
								<select id="parentid" name="parentid" class="select_d">
									<option value="0">无</option>
									<s:iterator value="#merchantServices" var="m">
										<option value="${id }">${menuname }</option>
									</s:iterator>
								</select>								
							</td>
						</tr>
						<tr>
							<td style="width: 20%;text-align: right;">服务名称</td>
							<td style="text-align: left;padding-left: 20px;">
								<input type="text" id="mseracname" name="menuname" value="${menuname }" class="txt200">
								<span id="mseracnameid" style="color:red;display:none;">不能为空</span>
							</td>
						</tr>
						<%-- <tr>
							<td style="width: 20%;text-align: right;">路径</td>
							<td style="text-align: left;padding-left: 20px;">
								<input type="text" id="page" name="page" value="${page }" class="txt200">
								<span id="pageid" style="color:red;display:none;">不能为空</span>
							</td>
						</tr> --%>
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