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
				url:'${pageContext.request.contextPath}/cbrand_save',
				onSubmit:function(){
					var unitname=$("#unitname").val();
					if($.trim(unitname).length==0){
						$("#spanunitname").show();
						return false;
					}else{
						$("#spanunitname").hide();
						return true;
					}
				},
				success:function(data){
					$.messager.alert("提示",eval("("+data+")"),"info");
					window.opener.location.href = window.opener.location.href;
					window.close(); 
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
				<s:if test="cb_id!=0">
					修改商品品牌信息
				</s:if>
				<s:else>
					添加商品品牌信息
				</s:else>
			</div>
			<div style="height: 330px;">
				<form id="form1" method="post" enctype="multipart/form-data">
				<input type="hidden" name="_parentId" id="fid" value="${_parentId}">
					<table style="margin: 0 auto;width: 50%;">
					<tr>
							<td style="width: 20%;text-align: right;">父商品品牌</td>
							<td style="text-align: left;padding-left: 20px;">
								<select id="parentid" name="_parentIdkh" class="select_d">
									   <option value="0" >无</option>
									<s:iterator value="#cbrand" var="ds">
											<option value="${cb_id }">${cb_name }</option>
									</s:iterator>
								</select>								
							</td>
						</tr>
						<tr>
							<td style="width: 20%;text-align: right;">商品品牌名称</td>
							<td style="text-align: left;padding-left: 20px;">
								<input type="hidden" id="id" name="cb_id" value="${cb_id}">
								<input type="hidden" id="isdelete" name="cb_scbs" value="${cb_scbs}">
								
								<input type="text" id="unitname" name="cb_name" class="txt200" value="${cb_name }">
								<span id="spanunitname" style="color:red;display:none;">不能为空</span>
							</td>
						</tr>
						<tr>
							<td style="width: 20%;text-align: right;">排序</td>
							<td style="text-align: left;padding-left: 20px;">
								
								<input type="text" id="xh" name="cb_px" class="txt200" value="${cb_px }">
								<span id="xhid" style="color:red;display:none;">不能为空</span>
							</td>
						</tr>
						<tr>
								<td style="width: 20%;text-align: right;">属性缩略图</td>
								<td style="text-align: left;padding-left: 20px;">
								<input name="fileProductPic" type="file"
									id="fileProductPic" size="40"
									style="border: darkgray 1px solid; height: 22px; line-height: 20px; width: 180px;" />
									<s:if test="cb_imgurl!=''">
										<input type="hidden" name="cb_imgurl" value="${cb_imgurl }" />
										<a href="imgss.jsp?file=${cb_imgurl }" target="_blank"> <img
											title="浏览图片" src="imgss.jsp?file=${cb_imgurl }"
											style="cursor: hand; border: 0;" width="30px" height="30px"></a>
									</s:if>
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