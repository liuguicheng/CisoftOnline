<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<script type="text/javascript">
	$(function(){
		$('#grid').datagrid({
			iconCls : 'icon-forward',
			fit : true,
			border : true,
			striped : true,
			rownumbers : true,
			method:"post",
			pagination:true,
			pageNumber:1,//初始化页号
			pagePosition:'both',
			url : "${pageContext.request.contextPath}/backups_getList",
			idField : 'id',
			columns : [[
			 	{
			 		field:'id',
			 		checkbox:true
			 	},{
			 		field:'user',
			 		title:'备份人姓名',
			 		align:'center',
			 		width:120,
			 		formatter:function(value,row,index){
			 			if(row.user!=null){
			 				return row.user.u_zsName;
			 			}
			 		}
			 	},{
			 		field:'backupstime',
			 		title:'备份时间',
			 		align:'center',
			 		width:120
			 	},{
			 		field:'filename',
			 		title:'文件名称',
			 		align:'center',
			 		width:120
			 	}     
			 ]]
		});
	})
</script>
</head>
<body class="easyui-layout">
	<div region="center" border="false">
		<div>
			<form action="backups_save" method="post">		
				路径:<input type="text" id="filename" name="result">
				<input type="submit" value="备份">
			</form>
		</div>
		<table id="grid"></table>
	</div>
</body>
</html>