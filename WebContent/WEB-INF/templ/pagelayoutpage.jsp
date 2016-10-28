<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>CisoftOnline</title>
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
				"pl_name":truename
			}) 
		});
	 // 表格  树形菜单
		$('#grid').datagrid(
				{
					iconCls : 'icon-forward',
					fit : true,
					fitColumns:true,
					width:'100%',
					border:false,
					striped:true,//有条纹的行
					rownumbers:true,
					method:"post",
					pagination:true,
					pageNumber:1,//初始化页号
					url : "${pageContext.request.contextPath}/pagelayout_getList",
					idField : 'pl_id',
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
					 		field:'pl_id',
					 		checkbox:true
					 	}
					 	,{
					 		field:'pl_name',
					 		title:'页面名称',
					 		width:120
					 	},{
					 		field:'s',
					 		title:'是否生成',
					 		width:60,
					 		formatter:function(value,row,index){
					 			if(row.pl_jtbs==1){
					 				return "<span style='color:green;'>已生成模版</span>";
					 			}else{
					 				return "<span style='color:red;'>未生成模版</span>";
					 			}
					 		}
					 	}
					 	,{
					 		field:'f',
					 		title:'是否发布',
					 		width:60,
					 		formatter:function(value,row,index){
					 			if(row.pl_fbbs==1){
					 				return "<span style='color:green;'>已发布静态页面</span>";
					 			}else{
					 				return "<span style='color:red;'>未发布静态页面</span>";
					 			}
					 		}
					 	}
					 	,{
					 		field:'caozuo',
					 		title:'操作',
					 		width:120,
					 		formatter:function(value,row,index){
					 				return "<a href='#'  onclick='edit("+row.pl_id+")'>修改<a>"+"  "+
					 				"<a href='#'  onclick='ylpage("+row.pl_id+")'>预览<a>"+"  "+
					 				"<a href='#'  onclick='fbpage("+row.pl_id+")'>发布<a>"+"  "+
						 			"<a href='#'  onclick='del("+row.pl_id+")'>删除<a>";
					 			
					 		}
					 	}           
					 ]]
				});
	})
	function edit(id){
/* 		parent.forward("修改商品分类信息","");
		location.href="${pageContext.request.contextPath}/csort_editView?cs_id="+id; */
		 var widoid=",'new"+id+"'";
		  var iWidth="1024"; //弹出窗口的宽度;
			 var iHeight="768"; //弹出窗口的高度;
			 var iTop = (window.screen.availHeight-30-iHeight)/2; //获得窗口的垂直位置;
			 var iLeft = (window.screen.availWidth-10-iWidth)/2; //获得窗口的水平位置;
	         window.open('${pageContext.request.contextPath}/pagelayout_editView?pl_id='+id,widoid,'height='+iHeight+',width='+iWidth+',top='+iTop+',left='+iLeft+',toolbar=no,menubar=no,scrollbars=no,resizable=no,location=no,status=no');
	}
	function add(){
		 var widoid="add3";
		  var iWidth="1024"; //弹出窗口的宽度;
			 var iHeight="768"; //弹出窗口的高度;
			 var iTop = (window.screen.availHeight-30-iHeight)/2; //获得窗口的垂直位置;
			 var iLeft = (window.screen.availWidth-10-iWidth)/2; //获得窗口的水平位置;
	         window.open('${pageContext.request.contextPath}/pagelayout_addView',widoid,'height='+iHeight+',width='+iWidth+',top='+iTop+',left='+iLeft+',toolbar=no,menubar=no,scrollbars=no,resizable=no,location=no,status=no');
	}
	function zxbj(id){
		 var widoid="add3"+id;
		  var iWidth="768"; //弹出窗口的宽度;
			 var iHeight="568"; //弹出窗口的高度;
			 var iTop = (window.screen.availHeight-30-iHeight)/2; //获得窗口的垂直位置;
			 var iLeft = (window.screen.availWidth-10-iWidth)/2; //获得窗口的水平位置;
	         window.open('${pageContext.request.contextPath}/pagelayout_zxbj?pl_id='+id,widoid,'height='+iHeight+',width='+iWidth+',top='+iTop+',left='+iLeft+',toolbar=no,menubar=no,scrollbars=no,resizable=no,location=no,status=no');
	}
	function del(id){
		$.messager.confirm("提示","真的要删除吗?",function(r){
			if(r){
				$.ajax({
					   type: "POST",
					   url: "pagelayout_delete",
					   data: "pl_id="+id,
					   success: function(msg){
					   		$.messager.alert("提示",msg,"info");
					   		$("#grid").datagrid('reload');
					   }
				});
			}
		})
	}
	function sx(){
		$("#grid").datagrid('reload');
	}
	
	//预览
	function ylpage(id){
		 var widoid="addds3"+id;
		  var iWidth="1024"; //弹出窗口的宽度;
			 var iHeight="768"; //弹出窗口的高度;
			 var iTop = (window.screen.availHeight-30-iHeight)/2; //获得窗口的垂直位置;
			 var iLeft = (window.screen.availWidth-10-iWidth)/2; //获得窗口的水平位置;
	         window.open('${pageContext.request.contextPath}/pagelayout_ylpage?pl_id='+id,widoid,'height='+iHeight+',width='+iWidth+',top='+iTop+',left='+iLeft+',toolbar=no,menubar=no,scrollbars=no,resizable=no,location=no,status=no');
	}
	function fbpage(id){
		
		$.ajax({
			   type: "POST",
			   url: "pagelayout_releasePage",
			   data: "pl_id="+id,
			   success: function(msg){
			   		$.messager.alert("提示",msg,"info");
			   		$("#grid").datagrid('reload');
			   }
		});
	}
	
</script>
</head>
<body class="easyui-layout">
	<div region="center" border="false">
			<div class="middle" id="tb">
			页面名称:&nbsp;&nbsp;&nbsp; <input type="text" id="truename" name="" value=""  class="txt200">
				&nbsp;&nbsp;&nbsp;<a id="btnsearch" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'">查询</a>
			</div>
			 
			<div style="height: 330px;">
				<table id="grid"></table>
			</div>
			 <%--  <table id="test" title="商品分类" class="easyui-datagrid" 
			data-options="
				url: '${pageContext.request.contextPath}/data/datagrid_data.json',
				method: 'get',
				rownumbers: true,
				idField: 'id',
				treeField: 'name',
				loadFilter: myLoadFilter
			">
		<thead>
			<tr>
				<th field="name" width="220">分类名称</th>
				<th field="size" width="100" align="right">排序</th>
				<th field="date" width="150">最后修改时间</th>
				<th field="cz" width="150">操作</th>
			</tr>
		</thead>
	</table> --%>
		</div>
	
</body>
</html>