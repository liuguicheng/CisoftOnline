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
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/panel.css">
<script type="text/javascript"> 
	$(function(){
		//查询
		$("#btnsearch").click(function(){
			var truename=$("#truename").val();
			
			$("#grid").datagrid('load',{
				"ol_username":truename
			});
		});
	
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
					singleSelect:true,//单选
					pagination:true,
					pageNumber:1,//初始化页号
					url : "${pageContext.request.contextPath}/ol_getList",
					idField : 'ol_id',
					toolbar : [
						 {
							id:'add',
							text:'刷新',
							iconCls:'icon-reload',
							handler:function(){
								sx();
							}
						} 
					],
					columns : [[
					 	{
					 		field:'ol_id',
					 		checkbox:true
					 	},{
					 		field:'ol_username',
					 		title:'操作人员',
					 		align:'center',
					 		width:60
					 	},{
					 		field:'ol_usercode',
					 		title:'操作人员代码',
					 		align:'center',
					 		width:60
					 	},{
					 		field:'ol_ip',
					 		title:'登录ip',
					 		align:'center',
					 		width:60,
					 	}
					 	,{
					 		field:'ds',
					 		title:'操作类型',
					 		align:'center',
					 		width:60,
					 		formatter:function(value,row,index){
					 			var s="";
					 			if(row.ol_type==1){
					 				s="添加操作";
					 			}else if(row.ol_type==2){
					 				s="删除操作";
					 			}else if(row.ol_type==3){
					 				s="修改操作";
					 			}else if(row.ol_type==4){
					 				s="查询操作";
					 			}
					 			return s;
					 		}
					 	},{
					 		field:'ol_context',
							title:'操作内容',
							align:'center',
							width:150
					 	}
					 	,{
					 		field:'ol_time',
							title:'操作时间',
							align:'center',
							width:120,
							formatter:function(value,row,index){
								 var s=row.ol_time.split("T");
								 
								 return s[0]+" "+s[1];
							}
					 	},{
					 		field:'ol_bz',
							title:'备注',
							align:'center',
							width:130
					 	}
					 	/* ,{
					 		field:'caozuo',
					 		title:'操作',
					 		align:'center',
					 		width:120,
					 		formatter:function(value,row,index){
					 			return "<a href='#'  onclick='edit("+row._id+")'>修改<a>"+"  "+
					 			"<a href='#'  onclick='del("+row.g_id+")'>删除<a>";
					 		}
					 	}   */         
					 ]]
				});
	})
	function sx(){
		$("#grid").datagrid('reload');
	}
	
</script>
</head>
<body class="easyui-layout">
	<div region="center" border="false">
			<div class="middle">
			操作人员名称:&nbsp;&nbsp;&nbsp; <input type="text" id="truename" name="" value="" class="txt200">
				&nbsp;&nbsp;&nbsp;<a id="btnsearch" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'">查询</a>
			</div>
			 
			<div style="height: 330px;">
				<table id="grid"></table>
			</div>
	</div>
	
</body>
</html>