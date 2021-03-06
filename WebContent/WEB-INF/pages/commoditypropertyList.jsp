<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>广西100南宁-后台管理系统</title>
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
			
			$("#grid").treegrid('load',{
				"commoditysort.cs_name":truename
			});
		});
	
		$('#grid').treegrid(
				{
					iconCls : 'icon-forward',
					fit : true,
					fitColumns:true,
					width:'100%',
					border:false,
					striped:true,//有条纹的行
					rownumbers:true,
					method:"post",
					/* pageNumber:1,//初始化页号 */
					url : "${pageContext.request.contextPath}/property_getList",
					idField : 'cp_id',
					treeField:'cp_propertyname', 
					animate:true,
					toolbar :'#tb',
					toolbar : [
						{
							id:'add',
							text:'添加',
							iconCls:'icon-add',
							handler:function(){
								add();
							}
						},
						{
							id:'up',
							text:'刷新',
							iconCls:'icon-reload',
							handler:function(){
								sx();
							}
						}
					],
					columns : [[
					 	{
					 		field:'cp_id',
					 		checkbox:true
					 	}
					 	,{
					 		field:'cp_propertyname',
					 		title:'属性名称',
					 		width:150
					 	},{
					 		field:'cp_propertycontent',
					 		title:'属性备注',
					 		width:150
					 	},{
					 		field:'tu',
					 		title:'属性图片',
					 		width:150,
					 		formatter:function(value,row,index){
					 			return "<img src='imgss.jsp?file="+row.cp_imgurl+"' width='30px' height='30px'/>";
					 		}
					 	}
					 	,{
					 		field:'caozuo',
					 		title:'操作',
					 		width:120,
					 		formatter:function(value,row,index){
					 			return "<a href='#'  onclick='edit("+row.cp_id+")'>修改<a>"+"  "+
					 			"<a href='#'  onclick='del("+row.cp_id+")'>删除<a>";
					 		}
					 	}           
					 ]]
				});
	})
	function edit(id){
		/* parent.forward("修改商品出库","");
		location.href="${pageContext.request.contextPath}/property_editView?cp_id="+id; */
		 var widoid=",'new"+id+"'";
		  var iWidth="768"; //弹出窗口的宽度;
			 var iHeight="468"; //弹出窗口的高度;
			 var iTop = (window.screen.availHeight-30-iHeight)/2; //获得窗口的垂直位置;
			 var iLeft = (window.screen.availWidth-10-iWidth)/2; //获得窗口的水平位置;
	         window.open('${pageContext.request.contextPath}/property_editView?cp_id='+id,widoid,'height='+iHeight+',width='+iWidth+',top='+iTop+',left='+iLeft+',toolbar=no,menubar=no,scrollbars=no,resizable=no,location=no,status=no');
	}
	function add(){
		/* parent.forward("修改仓库信息","");
		location.href="${pageContext.request.contextPath}/storehouse_editView?sh_id="+id; */
		var widoid="add78";
		  var iWidth="768"; //弹出窗口的宽度;
			 var iHeight="468"; //弹出窗口的高度;
			 var iTop = (window.screen.availHeight-30-iHeight)/2; //获得窗口的垂直位置;
			 var iLeft = (window.screen.availWidth-10-iWidth)/2; //获得窗口的水平位置;
	         window.open('${pageContext.request.contextPath}/property_addView',widoid,'height='+iHeight+',width='+iWidth+',top='+iTop+',left='+iLeft+',toolbar=no,menubar=no,scrollbars=no,resizable=no,location=no,status=no');
	}
	function del(id){
		$.messager.confirm("提示","真的要删除吗?",function(r){
			if(r){
				$.ajax({
					   type: "POST",
					   url: "property_delete",
					   data: "cp_id="+id,
					   success: function(msg){
					   		$.messager.alert("提示",msg,"info");
					   		$("#grid").treegrid('reload');
					   }
				});
			}
		})
	}
	
	function sx(){
		$("#grid").treegrid('reload');
	}
</script>
</head>
<body class="easyui-layout" style="border-top-width:0px;">
	<div region="center" border="false">
		<div  style="border-top-width:0px;">
			<div class="middle" id="tb">
						属性名称:&nbsp;&nbsp;&nbsp; <input type="text" id="truename" name="" value="" class="txt200">
				&nbsp;&nbsp;&nbsp;<a id="btnsearch" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'">查询</a>
			</div>
			 
			<div style="height: 330px;">
				<table id="grid"></table>
			</div>
		</div>
	</div>
	
</body>
</html>