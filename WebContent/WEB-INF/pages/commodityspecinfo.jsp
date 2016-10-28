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
<style type="text/css"> 
body,table{ 
font-size:12px; 
} 
table{ 
table-layout:fixed; 
empty-cells:show; 
border-collapse: collapse; 
margin:0 auto; 
margin-bottom: 20px;
} 
td{ 
height:30px; 
} 
h1,h2,h3{ 
font-size:12px; 
margin:0; 
padding:0; 
} 
.table{ 
border:1px solid #cad9ea; 
color:#666; 
} 
.table th { 
background-repeat:repeat-x; 
height:30px; 
} 
.table td,.table th{ 
border:1px solid #cad9ea; 
padding:0 1em 0; 
} 
.table tr.alter{ 
background-color:#f5fafe; 
} 
</style> 
<script type="text/javascript">
	$(function(){	
		$("input:radio[name='cp_lx']").change(function (){ 
			$("#lxid").val($(this).val());
			});
		$("input:radio[name='cp_zsfs']").change(function (){ 
			$("#xsid").val($(this).val());
			});
		$("#save").click(function(){
			$("#form1").form('submit',{
				url:'${pageContext.request.contextPath}/commodityspec_save',
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
					if(data!=0){
						$.messager.alert("提示",eval("('保存成功')"),"info");
						data = data.replace("\"", ""); //去掉引号 
						data = data.replace("\"", ""); //去掉引号 
						$("#id").val(data);
					}
					
					
				}
			});
		});
		var i=1;
		$("#savetr").click(function(){
			i++;
			var cpid=$("#id").val();
			if(cpid==0){
				alert("请先填写规格基本信息");
			}else{
				var tr="<tr><td><input type='text' name='csvlist["+i+"].cpv_name' value=''/><input type='hidden' name='csvlist["+i+"].cpv_xh' value='"+i+"'/><input type='hidden' name='csvlist["+i+"].commoditySpec.cp_id' value='"+cpid+"'/></td><td><a href=\"javascript:od("+i+");\" id=\"sc"+i+"\">删除</a></td></tr>";
				$("#tabl").append(tr);
			}
			
		});
		
		$("#addtr").click(function(){
			$("#formid").form('submit',{
				url:'${pageContext.request.contextPath}/commodityspec_dosavespecval',
				success:function(data){
					$.messager.alert("提示",eval("("+data+")"),"info");
				}
			});
		});
		
	})
	function od(id){
	$("#sc"+id).parent("td").parent("tr").remove();
	
}
	function doggdelte(id){
		$.ajax({
			type : "POST",
			url : "commodityspec_dodeletespecval",
			data : "csvpecval.cpv_id=" +id,
			dataType : "json",
			success : function(msg) {
				if(msg=="删除成功"){
					$("#sc"+id).parent("td").parent("tr").remove();
					alert(msg);
				}
				
			}
		});
		
	}
</script>
</head>
<body class="easyui-layout">	
	<div region="center">
			<div style="height: 40px; text-align: center;line-height: 40px;background: #e0edff;font-family: '黑体';font-size: large;font-weight: bolder;">
				<s:if test="cp_id!=0">
					修改商品规格信息
				</s:if>
				<s:else>
					添加商品规格信息
				</s:else>
			</div>
			<div style="height: 330px;">
				<form id="form1" method="post" enctype="multipart/form-data">
					<table style="margin: 0 auto;width: 50%;">
						<tr>
							<td style="width: 20%;text-align: right;">商品规格名称</td>
							<td style="text-align: left;padding-left: 20px;">
								<input type="hidden" id="id" name="cp_id" value="${cp_id}">
								
								<input type="text" id="unitname" name="cp_name" class="txt200" value="${cp_name }">
								<span id="spanunitname" style="color:red;display:none;">不能为空</span>
							</td>
						</tr>
						<tr>
							<td style="width: 20%;text-align: right;">规格备注</td>
							<td style="text-align: left;padding-left: 20px;">
								<input type="text" id="cp_bz" name="cp_bz" class="txt200" value="${cp_bz }">
								<span id="cp_bz" style="color:red;display:none;">不能为空</span>
							</td>
						</tr>
						<tr>
							<td style="width: 20%;text-align: right;">显示类型</td>
							<td style="text-align: left;padding-left: 20px;">
							<input type="hidden" name="cspec.cp_lx" value="" id="lxid"/>
							<s:if test="cp_lx==1">
							<label><input name="cp_lx" type="radio" value="1" checked="checked"/>文字 </label> 
							<label><input name="cp_lx" type="radio" value="2" />图片 </label> 
							</s:if>
							<s:else>
							<label><input name="cp_lx" type="radio" value="1" />文字 </label> 
							<label><input name="cp_lx" type="radio" value="2" checked="checked"/>图片 </label> 
							</s:else>
							
							</td>
						</tr>
						<tr>
							<td style="width: 20%;text-align: right;">显示方式</td>
							<td style="text-align: left;padding-left: 20px;">
							<input type="hidden" name="cspec.cp_zsfs" value="" id="xsid"/>
							<s:if test="cp_zsfs==1">
							<label><input name="cp_zsfs" type="radio" value="1" checked="checked"/>下拉 </label> 
							<label><input name="cp_zsfs" type="radio" value="2" />平铺 </label>
						    </s:if>
							<s:else>
							<label><input name="cp_zsfs" type="radio" value="1" />下拉 </label> 
							<label><input name="cp_zsfs" type="radio" value="2" checked="checked"/>平铺 </label>
							</s:else>
							</td>
						</tr>
						<%-- <tr>
								<td style="width: 20%;text-align: right;">属性缩略图</td>
								<td style="text-align: left;padding-left: 20px;"><input name="fileProductPic" type="file"
									id="fileProductPic" size="40"
									style="border: darkgray 1px solid; height: 22px; line-height: 20px; width: 180px;" />
									<s:if test="cb_imgurl!=''">
										<input type="hidden" name="cb_imgurl" value="${cb_imgurl }" />
										<a href="imgss.jsp?file=${cb_imgurl }" target="_blank"> <img
											title="浏览图片" src="imgss.jsp?file=${cb_imgurl }"
											style="cursor: hand; border: 0;" width="30px" height="30px"></a>
									</s:if>
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
					
					 <hr style="margin:0px;height:1px;border:0px;background-color:#D5D5D5;color:#D5D5D5;"/>
					<form method="post" id="formid">
					<div style="margin: 0 auto;margin-top: 20px;">
						<a id="savetr" icon="icon-add" href="#" class="easyui-linkbutton"  >添加规格值</a>
						<a id="addtr" icon="icon-save" href="#" class="easyui-linkbutton"  >保存规格值</a>
					</div>
					<div style="margin-top: 10px;">
						
					    	<table style="width: 100%;text-align:center;" class="table" id="tabl">
					     	 <tr>
					      		<td>规格值名称</td>
					     	    <!-- <td>规格值图片</td> -->
					            <td>操作</td>
					         </tr>
					         <s:iterator value="csvlist">
					          <tr>
					           <td><s:property value="cpv_name"/> </td>
					           <td><a href="javascript:doggdelte(<s:property value='cpv_id'/>);" id="sc<s:property value='cpv_id'/>">删除</a></td>
					          </tr>
					         </s:iterator>
					        </table>
					   
					</div>
				</form>
		</div>
	</div>
</body>
</html>