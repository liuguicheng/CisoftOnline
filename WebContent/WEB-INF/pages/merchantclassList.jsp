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
		$('#grid').datagrid({
			iconCls : 'icon-forward',
			fit : true,
			border : false,
			striped : true,
			rownumbers : true,
			singleSelect:true,
			pagination:true,
			pageNumber:1,//初始化页号
			url : "${pageContext.request.contextPath}/mclass_getList",
			idField : 'id',
			toolbar : [
				{
					id:'add',
					text:'添加',
					iconCls:'icon-add',
					handler:function(){
						/* parent.forward("添加角色","");
						location.href="${pageContext.request.contextPath}/pages_roleoperate"; */
						add();
					}
				},{
					id:'set',
					text:'分配权限',
					iconCls:'icon-add',
					handler:function(){
						var rows=$("#grid").datagrid('getChecked');
						if(rows.length==0){
							$.messager.alert("警告","你还没有选择","warning");
						}else{
							var id=rows[0].id;
							$("#id").val(id);//角色id
							$("#windowmenu").window('open');
							$('#tree').tree({ 
								url:'mserac_tree', 
								checkbox:true,
								animate:true,
								onLoadSuccess:function(){
									var arrs=new Array();
									$.ajax({
										async:false,
										type:"POST",
										url:'${pageContext.request.contextPath}/mclass_getLimitByRoleid',
										data:"id="+id,
										success:function(data){
											for(var i=0;i<data.length;i++){
												if(data[i].parentid!=0){
													arrs.push(data[i].id);
												}
											}
										}
									});
									
									for(var i=0;i<arrs.length;i++){
										var node = $('#tree').tree('find',arrs[i]);
										$('#tree').tree('check', node.target);
									}
								} 
							}); 
						}
					}
				}
			],
			columns : [[
			 	{
			 		field:'id',
			 		checkbox:true
			 	},{
			 		field:'rolename',
			 		title:'等级名称',
			 		align:'center',
			 		width:350
			 	},{
			 		field:'mark',
			 		title:'备注',
			 		align:'left',
			 		width:350
			 	},{
			 		field:'caozuo',
			 		title:'操作',
			 		align:'center',
			 		width:120,
			 		formatter:function(value,row,index){
			 			return "<a href='#'  onclick='edit("+row.id+")'>修改<a>"
			 			+" <a href='#' onclick='del("+row.id+")'>删除</a>";
			 		}
			 	}           
			 ]]
		});
		//点击确定
		$("#btn").click(function(){			
			var ids="";
			//半选状态
			var nodess = $('#tree').tree('getChecked', 'indeterminate');	
			for(var i=0;i<nodess.length;i++){
				if(ids==""){
					ids=nodess[i].id;
				}else{
					ids=ids+","+nodess[i].id;
				}			
			}
			//全选状态
			var nodes = $('#tree').tree('getChecked');
			for(var i=0;i<nodes.length;i++){
				var id=nodes[i].id;//被选中的id
				if(ids==""){
					ids=id;
				}else{
					ids=ids+","+id;
				}
			}
			$("#menuid").val(ids);
			$("#form1").form('submit',{
				url:"${pageContext.request.contextPath}/mclass_savelimit",
				success:function(data){
					$.messager.alert("提示",data,"info");
					$("#windowmenu").window('close');
				}
			})
		});
	});
	function del(id){
		
		$.messager.confirm("提示", "真的要删除吗?", function(r) {
			if (r) {
				$.ajax({
					type : "POST",
					url : "mclass_delete",
					data : "id=" + id,
					success : function(msg) {
						$.messager.alert("提示", msg, "info");
						$("#grid").datagrid('reload');
					}
				});
			}
		})
		
	}
	function edit(id){
		/* parent.forward("修改角色","");
		location.href="${pageContext.request.contextPath}/role_editView?id="+id; */
			/* parent.forward("修改用户","");
			location.href="${pageContext.request.contextPath}/user_editView?u_id="+id; */
			var widoid="123"+id;
			  var iWidth="768"; //弹出窗口的宽度;
				 var iHeight="468"; //弹出窗口的高度;
				 var iTop = (window.screen.availHeight-30-iHeight)/2; //获得窗口的垂直位置;
				 var iLeft = (window.screen.availWidth-10-iWidth)/2; //获得窗口的水平位置;
		         window.open('${pageContext.request.contextPath}/mclass_editView?id='+id,widoid,'height='+iHeight+',width='+iWidth+',top='+iTop+',left='+iLeft+',toolbar=no,menubar=no,scrollbars=no,resizable=no,location=no,status=no');
	}
	function add(){
		var widoid="123r";
		  var iWidth="768"; //弹出窗口的宽度;
			 var iHeight="468"; //弹出窗口的高度;
			 var iTop = (window.screen.availHeight-30-iHeight)/2; //获得窗口的垂直位置;
			 var iLeft = (window.screen.availWidth-10-iWidth)/2; //获得窗口的水平位置;
	         window.open('${pageContext.request.contextPath}/pages_merchantclassinfo?id=0',widoid,'height='+iHeight+',width='+iWidth+',top='+iTop+',left='+iLeft+',toolbar=no,menubar=no,scrollbars=no,resizable=no,location=no,status=no');
}
</script>
</head>
<body class="easyui-layout">
	<div region="center" border="false">
		<!-- 	<div style="height: 28px; background: url('img/titleall.gif') repeat-x;">
				<div class="titleleft"></div>
				<div class="titleright"></div>
			</div> -->
			<div class="middle"></div>
			<div style="height: 330px;">
				<table id="grid" ></table>
			</div>
	</div>
	<div id="windowmenu" class="easyui-window" title="菜单窗口" style="width:350px;height:500px" data-options="iconCls:'icon-save',closed:true,modal:true"> 
		<div class="easyui-layout" data-options="fit:true"> 
			<div data-options="region:'north',split:true" style="height: 40px;">
				<a id="btn" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-save',plain:true">确定</a>
			</div> 
			<div data-options="region:'center'"> 
				<form id="form1" action="" method="post">
					<input type="hidden" id="id" name="id">
					<input type="hidden" id="menuid" name="menuid">
				</form>
				<ul id="tree"></ul>
			</div> 
		</div> 
	</div>
</body>
</html>