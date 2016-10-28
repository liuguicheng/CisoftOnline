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
		$("#save").click(function(){
			$("#form1").form('submit',{
				url:'${pageContext.request.contextPath}/ctype_save',
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
						$("#xzggid").val(data);
					}
					
				}
			});
		});
		$("#savetr").click(function(){
			var widoid="savertid12";
			  var iWidth="734"; //弹出窗口的宽度;
				 var iHeight="468"; //弹出窗口的高度;
				 var iTop = (window.screen.availHeight-30-iHeight)/2; //获得窗口的垂直位置;
				 var iLeft = (window.screen.availWidth-10-iWidth)/2; //获得窗口的水平位置;
		         window.open('${pageContext.request.contextPath}/ctype_tospecpage',widoid,'height='+iHeight+',width='+iWidth+',top='+iTop+',left='+iLeft+',toolbar=no,menubar=no,scrollbars=no,resizable=no,location=no,status=no');
			
		});
	})
	function doggdelte(id){
		var sd=$("#xzggid").val();
		$.ajax({
			type : "POST",
			url : "ctype_todeletespec",
			data : "ct_id="+sd+"&cspec.cp_id="+id,
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
				<s:if test="ct_id!=0">
					修改商品类型信息
				</s:if>
				<s:else>
					添加商品类型信息
				</s:else>
			</div>
			<div style="height: 330px;">
			<input type="hidden" value="${ct_id }" id="xzggid">
				<form id="form1" method="post" enctype="multipart/form-data">
					<table style="margin: 0 auto;width: 50%;">
						<tr>
							<td style="width: 20%;text-align: right;">商品类型名称</td>
							<td style="text-align: left;padding-left: 20px;">
								<input type="hidden" id="id" name="ct_id" value="${ct_id}">
								<input type="hidden" id="isdelete" name="ct_scbs" value="${ct_scbs}">
								<input type="text" id="unitname" name="ct_name" class="txt200" value="${ct_name }"><span style="color:red;"> *</span>
								<span id="spanunitname" style="color:red;display:none;">不能为空</span>
							</td>
						</tr>
						<tr>
							<td style="width: 20%;text-align: right;">排序</td>
							<td style="text-align: left;padding-left: 20px;">
								
								<input type="text" id="xh" name="ct_px" class="txt200" value="${ct_px }">
								<span id="xhid" style="color:red;display:none;">不能为空</span>
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
				
				<hr style="margin:0px;height:1px;border:0px;background-color:#D5D5D5;color:#D5D5D5;margin-top: 10px;"/>
					<form method="post" id="formid">
					<div style="margin: 0 auto;margin-top: 10px;">
						<a id="savetr" icon="icon-add" href="#" class="easyui-linkbutton"  >添加规格</a>
						<!-- <a id="addtr" icon="icon-save" href="#" class="easyui-linkbutton"  >保存规格值</a> -->
					</div>
					<div style="margin-top: 10px;">
						
					    	<table style="width: 100%;text-align:center;" class="table" id="tabl">
					     	 <tr>
					      		<td>规格名称</td>
					     	    <td>展示方式</td> 
					            <td>操作</td>
					         </tr>
					         <s:iterator value="cspec">
					          <tr>
					           <td><s:property value="cp_name"/> </td>
					           <td><s:if test="cp_zsfs==1">下拉展示</s:if><s:else>平铺展示</s:else>  </td>
					           <td><a href="javascript:doggdelte(<s:property value='cp_id'/>);" id="sc<s:property value='cp_id'/>">删除</a></td>
					          </tr>
					         </s:iterator>
					        </table>
					   
					</div>
				</form>
		</div>
	</div>
</body>
</html>