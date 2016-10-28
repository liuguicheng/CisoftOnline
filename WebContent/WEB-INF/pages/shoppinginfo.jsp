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
		
		
		
		$.ajax({
					   type: "POST",
					   url: "commodity_queryspBrand",
					   success: function(msg){
						 var selObj = $("#sppp");//品牌
						 var flobh=$("#spfl");//分类
						 var bqobh=$("#spbq"); //标签
						 var ztobh=$("#spzt"); //状态
						 var gysobh=$("#spgys"); //供应商
						 
						   $.each(msg.cblist, function (key, val){ 
							    var value=msg.cblist[key].cb_id;  
							    var text=msg.cblist[key].cb_name;  
							    selObj.append("<option value='"+value+"'>"+text+"</option>");  
						   });
						   $.each(msg.cslist, function (key, val){ 
							    var value=msg.cslist[key].cs_id;  
							    var text=msg.cslist[key].cs_name;  
							    flobh.append("<option value='"+value+"'>"+text+"</option>");  
						   });
						   $.each(msg.clist, function (key, val){ 
							    var value=msg.clist[key].cl_id;  
							    var text=msg.clist[key].cl_name;  
							    bqobh.append("<option value='"+value+"'>"+text+"</option>");  
						   });
						   $.each(msg.csslist, function (key, val){ 
							    var value=msg.csslist[key].cs_id;  
							    var text=msg.csslist[key].cs_name;  
							    ztobh.append("<option value='"+value+"'>"+text+"</option>");  
						   });
						   $.each(msg.gyslist, function (key, val){ 
							    var value=msg.gyslist[key].g_id;  
							    var text=msg.gyslist[key].g_name;  
							    gysobh.append("<option value='"+value+"'>"+text+"</option>");  
						   });
						   
					   }
				});
		
		//查询
		$("#btnsearch").click(function(){
			var truename=$("#truename").val();
			 var selObj = $("#sppp").val();//品牌
			 var flobh=$("#spfl").val();//分类
			 var bqobh=$("#spbq").val(); //标签
			 var ztobh=$("#spzt").val();//状态
			 var gysobh=$("#spgys").val();//供应商
			 var huid=$("#huid").val();//货号
			 
			$("#grid").datagrid('load',{
				"c_name":truename,
				"commodityBrand.cb_id":selObj,
				"commoditySort.cs_id":flobh,
				"commodlabel.cl_id":bqobh,
				"commodityStatus.cs_id":ztobh,
				"gysInfo.g_id":gysobh,
				"c_spbh":huid
				
			});
		});
		//获取供应商id
		var g_id=$("#g_id").val();
		//初始化table
		$('#grid').datagrid({
			iconCls : 'icon-forward',
			fit : true,
			fitColumns:true,
			width:'100%',
			border : false,
			striped : true,
			rownumbers : true,
			method:"post",
			pagination:true,
			pageNumber:1,//初始化页号
			url : "${pageContext.request.contextPath}/commodity_getList?c_sj="+$("#c_sj").val(),
			idField : 'c_id',
			toolbar : [
				{
					id:'add',
					text:'添加',
					iconCls:'icon-add',
					handler:function(){
						/* parent.forward('添加商品信息',"");
						location.href="${pageContext.request.contextPath}/commodity_addView?gysInfo.g_id="+g_id; */
						 var widoid="up123";
						 var iWidth="1324"; //弹出窗口的宽度;
						 var iHeight="768"; //弹出窗口的高度;
						 var iTop = (window.screen.availHeight-30-iHeight)/2; //获得窗口的垂直位置;
						 var iLeft = (window.screen.availWidth-10-iWidth)/2; //获得窗口的水平位置;
				         window.open('${pageContext.request.contextPath}/commodity_addView?gysInfo.g_id='+g_id,widoid,'height='+iHeight+',width='+iWidth+',top='+iTop+',left='+iLeft+',toolbar=no,menubar=no,scrollbars=no,resizable=no,location=no,status=no');
						
					}
				},
				{
					id:'sx',
					text:'刷新',
					iconCls:'icon-reload',
					handler:function(){
						$("#grid").datagrid('reload');
					}
				},
				{
					id:'dr',
					text:'导入商品',
					iconCls:'icon-redo',
					handler:function(){
						todr();
					}
				},
				{
					id:'dc',
					text:'导出商品',
					iconCls:'icon-undo',
					handler:function(){
						var truename=$("#truename").val();
						 var selObj = $("#sppp").val();//品牌
						 var flobh=$("#spfl").val();//分类
						 var bqobh=$("#spbq").val(); //标签
						 var ztobh=$("#spzt").val();//状态
						 var gysobh=$("#spgys").val();//供应商
						 var huid=$("#huid").val();//货号
						 
						$.ajax({
							   type: "POST",
							   url: "commodity_doExpert",
							   data: "c_name="+truename+"&commodityBrand.cb_id="+selObj+"&commoditySort.cs_id="+flobh
								 +"&commodlabel.cl_id="+bqobh+"&commodityStatus.cs_id="+ztobh+"&gysInfo.g_id="+gysobh+"&c_spbh="+huid, 
							   success: function(msg){
							   		window.location.href="${pageContext.request.contextPath }/Template/"+msg;
							   }
						});
					}
				},{
					id:'pl',
					text:'批量删除',
					iconCls:'icon-cancel',
					handler:function(){
						var row = $('#grid').datagrid('getSelections');
						var ids=[];
						for(var i=0; i<row.length; i++){
						    	ids.push(row[i].c_id);
						}
							if(ids==""){
								$.messager.alert("提示","请选择商品","info");
							}else{
								dodeleteinfo(ids);
							}
					}
				},{
					id:'spbd',
					text:'绑定商品',
					iconCls:'icon-edit',
					handler:function(){
						var row = $('#grid').datagrid('getSelections');
						var ids=[];
						if(row.length>1){
							$.messager.alert("提示","只能选择一个商品","info");
						}else{
							
							for(var i=0; i<row.length; i++){
						    	ids.push(row[i].c_id);
							}
							if(ids==""){
								$.messager.alert("提示","请选择商品","info");
							}else{
								tobdsppage(ids);
							}
						}
						
							
					
					}
				}
				,{
					id:'set',
					text:'商品相册',
					iconCls:'icon-search',
					handler:function(){
						var rows=$("#grid").datagrid('getChecked');
						if(rows.length==0){
							$.messager.alert("警告","请选择商品","warning");
						}else{
							var id=rows[0].c_id;
							queryalbum(id);
						}
					}
				} 
				],
				columns : [[
						 	{
						 		field:'c_id',
						 		checkbox:true
						 	},{
						 		field:'c_spbh',
						 		title:'货号',
						 		align:'center',
						 		width:80
						 		
						 	}
						 	,{
						 		field:'c_name',
						 		title:'商品名称',
						 		align:'center',
						 		width:120
						 	},{
						 		field:'xsj',
						 		title:'销售价',
						 		align:'center',
						 		width:60,
						 		formatter:function(value,row,index){
						 			return "¥"+row.c_jg;
						 		}
						 	},{
						 		field:'c_ck',
						 		title:'库存',
						 		align:'center',
						 		width:60
						 	}
						 	,{
						 		field:'c_img',
						 		title:'商品图片',
						 		align:'center',
						 		width:120,
						 		formatter:function(value,row,index){
						 			return "<img src='imgss.jsp?file="+row.c_sltimg+"' width='40px' height='40px'  />";
						 		}
						 	}
						 	,{
						 		field:'caozuo',
						 		title:'操作',
						 		align:'center',
						 		width:120,
						 		formatter:function(value,row,index){
						 			if(row.c_sj=="2"){
						 				return "<a href='#'  onclick='upstatus("+row.c_id+",1)'>上架<a>"+"  "+
							 			"<a href='#'  onclick='edit("+row.c_id+")'>修改<a>"+" "+
							 			"<a href='#'  onclick='del("+row.c_id+")'>删除<a>"+" "+
							 			"<a href='#'  onclick='toyl("+row.c_id+")'>预览<a>";
						 			}else if(row.c_sj=="1"){
						 				return	"<a href='#'  onclick='upstatus("+row.c_id+",2)'>下架<a>"+" "+
							 			"<a href='#'  onclick='edit("+row.c_id+")'>修改<a>"+" "+
							 			"<a href='#'  onclick='del("+row.c_id+")'>删除<a>"+" "+
							 			"<a href='#'   onclick='toyl("+row.c_id+")'>预览<a>";
						 			}else{
						 				return "<a href='#'  onclick='edit("+row.c_id+")'>修改<a>"+" "+
							 			"<a href='#'  onclick='del("+row.c_id+")'>删除<a>"+" "+
							 			"<a href='#'  onclick='toyl("+row.c_id+")'>预览<a>";
						 			}
						 			
						 		}
						 	}           
						 ]]
	});
		
	})
	function edit(id){
		 var widoid="123";
		 var iWidth="1324"; //弹出窗口的宽度;
		 var iHeight="768"; //弹出窗口的高度;
		 var iTop = (window.screen.availHeight-30-iHeight)/2; //获得窗口的垂直位置;
		 var iLeft = (window.screen.availWidth-10-iWidth)/2; //获得窗口的水平位置;
         window.open('${pageContext.request.contextPath}/commodity_editView?c_id='+id,widoid,'height='+iHeight+',width='+iWidth+',top='+iTop+',left='+iLeft+',toolbar=no,menubar=no,scrollbars=no,resizable=no,location=no,status=no');
	}
	function del(id){
		$.messager.confirm("提示","真的要删除吗?",function(r){
			if(r){
				$.ajax({
					   type: "POST",
					   url: "commodity_delete",
					   data: "c_id="+id,
					   success: function(msg){
					   		$.messager.alert("提示",msg,"info");
					   		$("#grid").datagrid('reload');
					   }
				});
			}
		})
	}
	function upstatus(id,status){
		$.ajax({
			   type: "POST",
			   url: "commodity_upstatus",
			   data: "gysid="+id+"&g_id="+status,
			   success: function(msg){
			   		$.messager.alert("提示",msg,"info");
			   		$("#grid").datagrid('reload');
			   }
		});
	}

	
	  function toyl(id) {
		  var widoid="123di";
		  var iWidth="1324"; //弹出窗口的宽度;
			 var iHeight="768"; //弹出窗口的高度;
			 var iTop = (window.screen.availHeight-30-iHeight)/2; //获得窗口的垂直位置;
			 var iLeft = (window.screen.availWidth-10-iWidth)/2; //获得窗口的水平位置;
	         window.open('${pageContext.request.contextPath}/qtcommodity_querycommodityinfo?c_id='+id,widoid,'height='+iHeight+',width='+iWidth+',top='+iTop+',left='+iLeft+',toolbar=no,menubar=no,scrollbars=no,resizable=no,location=no,status=no');
      }
	  //跳转导入页面
	  function todr(){
		  
		  var widoid="123diddd";
		  var iWidth="768"; //弹出窗口的宽度;
			 var iHeight="350"; //弹出窗口的高度;
			 var iTop = (window.screen.availHeight-30-iHeight)/2; //获得窗口的垂直位置;
			 var iLeft = (window.screen.availWidth-10-iWidth)/2; //获得窗口的水平位置;
	         window.open('${pageContext.request.contextPath}/commodity_toExpCommodity',widoid,'height='+iHeight+',width='+iWidth+',top='+iTop+',left='+iLeft+',toolbar=no,menubar=no,scrollbars=no,resizable=no,location=no,status=no');
      }
	  
	  //批量删除
	function dodeleteinfo(id){
		//alert(id);
		$.messager.confirm("提示","真的要删除吗?",function(r){
			if(r){
				$.ajax({
					   type: "POST",
					   url: "commodity_delete",
					   data: "result="+id,
					   success: function(msg){
					   		$.messager.alert("提示",msg,"info");
					   		$("#grid").datagrid('reload');
					   		$('#grid').datagrid('clearChecked');
					   }
				});
			}
		})
	
		}
	  
	  function tobdsppage(id){
		  var widoid="bangding";
		  var iWidth="768"; //弹出窗口的宽度;
			 var iHeight="400"; //弹出窗口的高度;
			 var iTop = (window.screen.availHeight-30-iHeight)/2; //获得窗口的垂直位置;
			 var iLeft = (window.screen.availWidth-10-iWidth)/2; //获得窗口的水平位置;
	         window.open('${pageContext.request.contextPath}/pages_commodityBindinglistPage?result='+id,widoid,'height='+iHeight+',width='+iWidth+',top='+iTop+',left='+iLeft+',toolbar=no,menubar=no,scrollbars=no,resizable=no,location=no,status=no');
      }
	  
	  function queryalbum(id){
		  var widoid="bangding"+id;
		  var iWidth="1064"; //弹出窗口的宽度;
			 var iHeight="698"; //弹出窗口的高度;
			 var iTop = (window.screen.availHeight-30-iHeight)/2; //获得窗口的垂直位置;
			 var iLeft = (window.screen.availWidth-10-iWidth)/2; //获得窗口的水平位置;
	         window.open('${pageContext.request.contextPath}/commodityimg_queryAlbum?commodity.c_id='+id,widoid,'height='+iHeight+',width='+iWidth+',top='+iTop+',left='+iLeft+',toolbar=no,menubar=no,scrollbars=no,resizable=no,location=no,status=no');
      }
</script>
</head>
<body class="easyui-layout"  style="border-top-width:0px;height: 100%;">
	<div region="center" border="false" style="height: 100%;">
		<div  style="border-top-width:0px;">
			<div class="middle" style="height: 100%;padding-left: 30px; ">
			<div style="float: left;">
				商品品牌：&nbsp; &nbsp;&nbsp;
				<select class="select_d" id="sppp">
				 <option value="0">请选择</option>
				</select>
			</div>
			<div style="float: left;margin-left: 20px;"> 
			商品分类：&nbsp; &nbsp;&nbsp;
				<select class="select_d" id="spfl">
				 <option value="0">请选择</option>
				</select>
				</div>
				
			<div style="float: left;margin-left: 20px;">
		    商品标签：&nbsp; &nbsp;&nbsp;
				<select class="select_d" id="spbq">
				 <option value="0">请选择</option>
				</select>
		    </div>
		    <div style="clear: both;"></div>
		    <div style="float: left;">
		    商品状态：&nbsp; &nbsp;&nbsp;
				<select class="select_d" id="spzt">
				 <option value="0">请选择</option>
				</select>
		    </div >
		    <div style="float: left;margin-left: 20px;">
		    商品供应商：
				<select class="select_d" id="spgys">
				 <option value="0">请选择</option>
				</select>
			</div>
			<div style="clear: both;"></div>
			<div style="float: left;">
			商品名称：&nbsp;&nbsp; &nbsp;&nbsp;<input type="text" id="truename" name="" value="" class="txt200" >
			</div>
			<div style="float: left;margin-left: 20px;">
			商品货号：&nbsp;&nbsp; &nbsp;&nbsp;<input type="text" id="huid" name="" value="" class="txt200" >
				&nbsp; &nbsp;&nbsp;<a id="btnsearch" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'">查询</a>
			</div>
			<div style="clear: both;"></div>
			
			</div>
			 <input type="hidden" id="g_id" name="g_id" value="<%=request.getParameter("id") %>"/>
			<div style="height: 380px;">
			 <table id="grid" ></table>
			 </div>
		</div>
	</div>
	<% int c_sj=0;
	   String os=request.getParameter("c_sj");
	   if(os!=null){
		   c_sj=Integer.parseInt(os);
	   }
	%>
	<input type="text" id="c_sj" value="<%=c_sj%>">
	
</body>
<div id="win"   title="商品预览">  </div> 
</html>