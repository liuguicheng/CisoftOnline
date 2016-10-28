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
<script language="javascript" src="${pageContext.request.contextPath }/js/jquery.jqprint-0.3.js"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/js/easyui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/js/easyui/themes/icon.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/panel.css">
<script type="text/javascript"> 
	$(function(){
		$.ajax({
			   type: "POST",
			   url: "htorderdetail_querycount?order.o_status="+'-1'+"&order.o_sort="+2+"&kddh=3y",
			   success: function(msg){
				    //获取数量
					$("#j3y span").html(msg);
			   }
		});
		$.ajax({
			   type: "POST",
			   url: "htorderdetail_querycount?order.o_status="+'8'+"&order.o_sort="+2,
			   success: function(msg){
				    //获取数量
					$("#dfkid span").html(msg);
			   }
		});
		$.ajax({
			   type: "POST",
			   url: "htorderdetail_querycount?order.o_status="+'1'+"&order.o_sort="+2,
			   success: function(msg){
				    //获取数量
					$("#dshid span").html(msg);
			   }
		});
		$.ajax({
			   type: "POST",
			   url: "htorderdetail_querycount?order.o_status="+'0'+"&order.o_sort="+2,
			   success: function(msg){
				    //获取数量
					$("#dfhid span").html(msg);
			   }
		});
		$.ajax({
			   type: "POST",
			   url: "htorderdetail_querycount?order.o_status="+'2'+"&order.o_sort="+2,
			   success: function(msg){
				    //获取数量
					$("#yfhid span").html(msg);
			   }
		});
		$.ajax({
			   type: "POST",
			   url: "htorderdetail_querycount?order.o_status="+'-1'+"&order.o_sort="+2+"&kddh=-3y",
			   success: function(msg){
				    //获取数量
					$("#3yold span").html(msg);
			   }
		});
		$.ajax({
			   type: "POST",
			   url: "htorderdetail_querycount?order.o_status="+'-1'+"&order.o_sort="+2+"&kddh=0",
			   success: function(msg){
				    //获取数量
					$("#jr span").html(msg);
			   }
		});
		
		//查询
		$("#btnsearch").click(function(){
			var truename=$("#truename").val();//订单号
			var kddh=$("#txtTrackNo").val();//快递单号
			var shrinfo=$("#shr").val();//收货人名称
			var shrdh=$("#shdh").val();//收货电话
			var shdz=$("#shdz").val();//收货地址
			var zts=$("#selSettlementStatus").val();//状态
			var xdstartime=$("#txtStartTime").datebox("getValue");//下单启始时间
			var xdendtime=$("#txtEndTime").datebox("getValue");//下单结束时间
			var fkstratime=$("#txtPayTimeStart").datebox("getValue");//付款启始时间
			var fkendtime=$("#txtPayTimeEnd").datebox("getValue");//付款结束时间
			$("#grid").datagrid('load',{
				"order.o_bh":truename,
				/* "kddh":kddh, */
				"order.useraddress.ua_shName":shrinfo,
				"order.useraddress.ua_shDh":shrdh,
				"order.useraddress.ua_address":shdz,
				"status":zts,
				"xdstartime":xdstartime,
				"xdendtime":xdendtime,
				"fkstratime":fkstratime,
				"fkendtime":fkendtime,
				"sortid":2
				
			});
		});
		var urlstr="${pageContext.request.contextPath}/htorderdetail_getList?order.o_status="+$("#o_status").val()+"&order.o_sort="+2;
		var s=$("#o_status").val();
		if(s==-1){
			urlstr=urlstr;
		}else{
			urlstr="${pageContext.request.contextPath}/htorderdetail_getList?order.o_status="+$("#o_status").val()+"&order.o_sort="+2;
		}
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
					pagination:true,
					pageNumber:1,//初始化页号
					url : urlstr,
					idField : 'o_id',
					onLoadSuccess:function(data){
						var rows=$("#grid").datagrid('getRows');
				        var start=0;
				        var end=0;
				        for(var i=0;i<rows.length;i++){
					        var flag=true;
				        	for(var j=i+1;j<rows.length;j++){
				        		if(rows[i].order.o_bh!=rows[j].order.o_bh){
				        			start=i;
				        			end=j;
				        			if(i+1==j){
				        				start=i+1;
				        			}
				        			flag=false;
									break;
				        		}
				        	}
				        	if(flag==true){
				        		end=rows.length-1;
				        		$("#grid").datagrid('mergeCells',{
					        		index:start,
					        		field:'o_id',
					        		rowspan:(end-start+1)
					        	});
				        		$("#grid").datagrid('mergeCells',{
					        		index:start,
					        		field:'order.o_bh',
					        		rowspan:(end-start+1)
					        	});
				        		$("#grid").datagrid('mergeCells',{
					        		index:start,
					        		field:'o_zjg',
					        		rowspan:(end-start+1)
					        	});
				        		$("#grid").datagrid('mergeCells',{
					        		index:start,
					        		field:'n',
					        		rowspan:(end-start+1)
					        	});
				        		$("#grid").datagrid('mergeCells',{
					        		index:start,
					        		field:'dss',
					        		rowspan:(end-start+1)
					        	});
				        		$("#grid").datagrid('mergeCells',{
					        		index:start,
					        		field:'caozuo',
					        		rowspan:(end-start+1)
					        	});
				        		break;
				        	}
				        	$("#grid").datagrid('mergeCells',{
				        		index:start,
				        		field:'o_id',
				        		rowspan:(end-start)
				        	});
				        	$("#grid").datagrid('mergeCells',{
				        		index:start,
				        		field:'order.o_bh',
				        		rowspan:(end-start)
				        	});
				        	$("#grid").datagrid('mergeCells',{
				        		index:start,
				        		field:'o_zjg',
				        		rowspan:(end-start)
				        	});
				        	$("#grid").datagrid('mergeCells',{
				        		index:start,
				        		field:'n',
				        		rowspan:(end-start)
				        	});
				        	$("#grid").datagrid('mergeCells',{
				        		index:start,
				        		field:'dss',
				        		rowspan:(end-start)
				        	});
				        	$("#grid").datagrid('mergeCells',{
				        		index:start,
				        		field:'caozuo',
				        		rowspan:(end-start)
				        	});
				        }	        
					},
					toolbar : [
							 {
									id:'pl',
									text:'批量发货',
									iconCls:'icon-edit',
									handler:function(){
										var row = $('#grid').datagrid('getSelections');
										var ids=[];
										var noids=[];
										var orids=[];
										for(var i=0; i<row.length; i++){
											if(row[i].order.o_status==0){
										    	ids.push(row[i].order.o_bh);
										    	orids.push(row[i].order.o_id);
											}else{
												noids.push(row[i].order.o_bh);
												
											}
										}
										if(noids==""){
											if(ids==""){
												$.messager.alert("提示","请选择订单","info");
											}else{
												zfbfh(orids,ids);
											}
										
										}else{
											$.messager.alert("提示","不能做此操作，选中订单中有未付款的订单","info");
										}
									}
								}, {
									id:'plsh',
									text:'确认收货',
									iconCls:'icon-ok',
									handler:function(){
										var row = $('#grid').datagrid('getSelections');
										var ids=[];
										var noids=[];
										for(var i=0; i<row.length; i++){
											if(row[i].order.o_status==1){
										    	ids.push(row[i].order.o_bh);
											}else{
												noids.push(row[i].order.o_bh);
											}
										}
										if(noids==""){
											if(ids==""){
												$.messager.alert("提示","请选择订单","info");
											}else{
												qrsh(ids);
											}
										
										}else{
											$.messager.alert("提示","不能做次操作，选中订单中有未发货的订单","info");
										}
									}
								},								{
									id:'e',
									text:'取消订单',
									iconCls:'icon-cancel',
									handler:function(){
										var row = $('#grid').datagrid('getSelections');
										var ids=[];
									    var statusid=[];
										for(var i=0; i<row.length; i++){
											if(row[i].order.o_status==7){
												statusid.push(row[i].order.o_bh);
											}else{
												ids.push(row[i].order.o_bh);
											}
										    	
										}
										if(statusid==""){
										if(ids==""){
											$.messager.alert("提示","请选择订单","info");
										}else{
											
											onqxorder(ids);
										}
										}else{
											$.messager.alert("提示","不能做次操作，选中订单中存在已取消的订单","info");
										}
										
									}
								},{
									id:'pldc',
									text:'选择导出',
									iconCls:'icon-redo',
									handler:function(){
										var row = $('#grid').datagrid('getSelections');
										var ids=[];
										for(var i=0; i<row.length; i++){
									    	ids.push(row[i].o_id);
											
											}
									if(ids==""){
										$.messager.alert("提示","请选择要导出的订单","info");
									}else{
										onplexport(ids);
										
									}
									}		
											
								},{
									id:'pldy',
									text:'打印当前页面',
									iconCls:'icon-print',
									handler:function(){
										/* var row = $('#grid').datagrid('getSelections');
										var ids=[];
										for(var i=0; i<row.length; i++){
										    	ids.push(row[i].o_id);
												
										}
										if(ids==""){
											$.messager.alert("提示","请选择要打印的订单","info");
										}else{
											
											
											
										} */
										$("#tabstrid").jqprint();
										
									}
								}
								
							],
					columns : [[
					 	{
					 		field:'o_id',
					 		checkbox:true,
					 		formatter:function(value,row,index){
								return row.order.o_bh;
							}
					 	},{
					 		field:'order.o_bh',
					 		title:'订单编号',
					 		align:'center',
					 		width:150,
							formatter:function(value,row,index){
								return row.order.o_bh;
							}
					 	}
					 	,{
					 		field:'un',
							title:'订购商品',
							align:'center',
							width:240,
							formatter:function(value,row,index){
								return row.commodity.c_name;
							}
							
					 	}
					 	,{
					 		field:'o_num',
							title:'订购数量',
							align:'center',
							width:50
							
					 	}
					 	,{
					 		field:'spjg',
							title:'商品价格',
							align:'center',
							width:50,
							formatter:function(value,row,index){
								return row.commodity.c_jg;
							}
							
					 	}
					 	,{
					 		field:'o_zjg',
							title:'订单总价',
							align:'center',
							width:50,
							formatter:function(value,row,index){
								return row.order.o_zjg;
							}
							
							
					 	}
					 	,{
					 		field:'n',
							title:'订购日期',
							align:'center',
							width:140,
							formatter:function(value,row,index){
								return row.order.o_startTime;
							}
							
					 	}
					 	,{
					 		field:'dss',
							title:'订单状态',
							align:'center',
							width:60,
							formatter:function(value,row,index){
								
								if(row.order.o_status=='6'){
									return "未结算";
								}else if(row.order.o_status=='5'){
									return "退货处理中";
								}else if(row.order.o_status=='4'){
									return "退货申请中";
								}else if(row.order.o_status=='3'){
									return "完成订单";
								}else if(row.order.o_status=='2'){
									return "已收货";
								}else if(row.order.o_status=='1'){
									return "未收货";
								}else if(row.order.o_status=='0'){
									return "未发货";
								}else if(row.order.o_status=='8'){
									return "未付款";
								}else if(row.order.o_status=='7'){
									return "订单取消";
								}
					 		}
					 	},{
					 		field:'caozuo',
					 		title:'操作',
					 		align:'center',
					 		width:160,
					 		formatter:function(value,row,index){
					 				var str= "<a href='#'  onclick='edit("+row.order.o_id+")'>详情<a>";
					 				if(row.order.o_fkfs==2){
					 					if(row.order.o_status==0){
					 						var a=[];
					 						a.push(row.order.o_bh);
					 					str+="   <a href='#'  onclick='zfbfh("+row.order.o_id+",\""+a+"\")'>发货<a>";
					 					}
					 				}
					 				
					 				return str;
					 		}
					 	}           
					 ]]
				});
		var sss=	$("#o_status").val();
		if(sss==8){
			$(".topfl a").css("background-color","");
			$(".topfl a").css("color","black");
			$(".topfl a").css("opacity","");
			$(".topfl a").css("border-radius","");
			$(".topfl a").css("padding","");
			$(".topfl a").find("span").css("color","red");
			$("#dfkid").css("background-color","red");
			$("#dfkid").css("color","white");
			$("#dfkid").css("opacity","0.8");
			$("#dfkid").css("border-radius","25px");
			$("#dfkid").css("padding","5px");
			$("#dfkid").find("span").css("color","white");
		}else if(sss==0){
			$(".topfl a").css("background-color","");
			$(".topfl a").css("color","black");
			$(".topfl a").css("opacity","");
			$(".topfl a").css("border-radius","");
			$(".topfl a").css("padding","");
			$(".topfl a").find("span").css("color","red");
			$("#dfhid").css("background-color","red");
			$("#dfhid").css("color","white");
			$("#dfhid").css("opacity","0.8");
			$("#dfhid").css("border-radius","25px");
			$("#dfhid").css("padding","5px");
			$("#dfhid").find("span").css("color","white");
		}
	})
	function edit(id){
/* 		parent.forward("订单详细","");
		location.href="${pageContext.request.contextPath}/htorderdetail_editView?order.o_id="+id;
 */		 var widoid=",'new"+id+"'";
		  var iWidth="824"; //弹出窗口的宽度;
			 var iHeight="500"; //弹出窗口的高度;
			 var iTop = (window.screen.availHeight-30-iHeight)/2; //获得窗口的垂直位置;
			 var iLeft = (window.screen.availWidth-10-iWidth)/2; //获得窗口的水平位置;
	         window.open('${pageContext.request.contextPath}/htorderdetail_editView?order.o_id='+id,widoid,'height='+iHeight+',width='+iWidth+',top='+iTop+',left='+iLeft+',toolbar=no,menubar=no,scrollbars=no,resizable=no,location=no,status=no');
	}
	//批量发货
	function onplfh (id){
		$.ajax({
			   type: "POST",
			   url: "htorderdetail_onplfh",
			   data: "result="+id,
			   success: function(msg){
			   		$.messager.alert("提示",msg,"info");
			   		$("#grid").datagrid('reload');
			   	//清除选中
			   		$('#grid').datagrid('clearChecked');
			   }
		});
	
		}
	//支付宝发货
	function zfbfh(id,bh){
		$.ajax({
			   type: "POST",
			   url: "wxpaymentrecords_plfh",
			   data: "id="+id+"&bh="+bh,
			   success: function(msg){
			   		$.messager.alert("提示",msg,"info");
			   		$("#grid").datagrid('reload');
			   	//清除选中
			   		$('#grid').datagrid('clearChecked');
			   		//location.reload(); 
			   }
		});
	}
	//取消订单
	function onqxorder(id){
			$.ajax({
				   type: "POST",
				   url: "htorderdetail_onqxorder",
				   data: "result="+id,
				   success: function(msg){
				   		$.messager.alert("提示",msg,"info");
				   		$("#grid").datagrid('reload');
				   	//清除选中
				   		$('#grid').datagrid('clearChecked');
				   }
			});
			
	}
	//导出
	function onplexport(id){
		$.ajax({
			   type: "POST",
			   url: "csv_exportData2CSV",
			   data: "result="+id,
			   success: function(msg){
			   	    //清除选中
			   		$('#grid').datagrid('clearChecked');
			   		window.location.href=msg;
			   }
		});
		
	}
		
	//弹出打印内容
	function onplprintcontext(){
		var truename=$("#truename").val();//订单号
		var kddh=$("#txtTrackNo").val();//快递单号
		var shrinfo=$("#shr").val();//收货人名称
		var shrdh=$("#shdh").val();//收货电话
		var shdz=$("#shdz").val();//收货地址
		var zts=$("#selSettlementStatus").val();//状态
		var xdstartime=$("#txtStartTime").datebox("getValue");//下单启始时间
		var xdendtime=$("#txtEndTime").datebox("getValue");//下单结束时间
		var fkstratime=$("#txtPayTimeStart").datebox("getValue");//付款启始时间
		var fkendtime=$("#txtPayTimeEnd").datebox("getValue");//付款结束时间
		$.ajax({
			   type: "POST",
			   url: "csv_printdata",
			   data: "truename="+truename+"&kddh="+kddh+"&shrinfo="+shrinfo+"&shrdh="+shrdh+"&shdz="+shdz+"&zts="+zts+"&xdstartime="+xdstartime+"&xdendtime="+xdendtime+"&fkstratime="+fkstratime+"&fkendtime="+fkendtime+"&result=0&sortid=2",
			   success: function(msg){
				   $("#contextid").remove();
				   if(msg!=null){
					   var htmlstr="<table id='contextid' cellpadding='3' cellspacing='0' style='background-color: #b9d8f3;border: 1px white solid;'>";
					   $.each(msg, function(i) {  
						   htmlstr+="<tr style='text-align: center;'>";
						  		htmlstr+="<td width='2%' style='border-bottom:1px white solid;border-right:1px white solid;'>"+msg[i].id+"</td>";
						  		htmlstr+="<td width='20%' style='border-bottom:1px white solid;border-right:1px white solid;'>"+msg[i].bh+"</td>";
						  		htmlstr+="<td width='30%' style='border-bottom:1px white solid;border-right:1px white solid;text-align:left;'>"+msg[i].spname+"<br/>数量："+msg[i].spnum+"<br/>单价："+msg[i].spdj+"</td>";
						  		htmlstr+="<td width='10%' style='border-bottom:1px white solid;border-right:1px white solid;'>"+msg[i].dgtime+"</td>";
						  		htmlstr+="<td width='25%' style='border-bottom:1px white solid;border-right:1px white solid;text-align:left;'>"+"收货人姓名："+msg[i].dgname+"<br/>收货人电话："+msg[i].dgdh+"<br/>收货人地址："+msg[i].dgdz+"</td>";
						  		htmlstr+="<td width='8%' style='border-bottom:1px white solid;'>"+msg[i].dgfl+"</td>";
						   htmlstr+="</tr>";
						}); 
					   htmlstr+="</table>";
					 $(htmlstr).appendTo("#plprintcontext");
				   }else{
					   var htmlstr="<table id='contextid' cellpadding='3'width='100%'  cellspacing='0' style='background-color: #b9d8f3;border: 1px white solid;'>";
					   htmlstr+="<tr style='text-align: center;'>";
					   htmlstr+="<td colspan='6' style='border-bottom:1px white solid;'>暂无相关信息</td>";
					   htmlstr+="</tr>";
					   htmlstr+="</table>";
					   $(htmlstr).appendTo("#plprintcontext");
				   }
			   }
		});
		$("#plprint").css("display","block");
		 $('#plprint').window({   
			      width:824,   
			     height:500,   
			      modal:true,
			  }); 
		
	}
	//打印
	function onplprint(){
		 $('#plprintcontext').jqprint();
		
	}
	//批量导出
	function onexpert(){
		var truename=$("#truename").val();//订单号
		var kddh=$("#txtTrackNo").val();//快递单号
		var shrinfo=$("#shr").val();//收货人名称
		var shrdh=$("#shdh").val();//收货电话
		var shdz=$("#shdz").val();//收货地址
		var zts=$("#selSettlementStatus").val();//状态
		var xdstartime=$("#txtStartTime").datebox("getValue");//下单启始时间
		var xdendtime=$("#txtEndTime").datebox("getValue");//下单结束时间
		var fkstratime=$("#txtPayTimeStart").datebox("getValue");//付款启始时间
		var fkendtime=$("#txtPayTimeEnd").datebox("getValue");//付款结束时间
		$.ajax({
			   type: "POST",
			   url: "csv_exportData2CSV",
			   data: "truename="+truename+"&kddh="+kddh+"&shrinfo="+shrinfo+"&shrdh="+shrdh+"&shdz="+shdz+"&zts="+zts+"&xdstartime="+xdstartime+"&xdendtime="+xdendtime+"&fkstratime="+fkstratime+"&fkendtime="+fkendtime+"&result=0&sortid=2",
			   success: function(msg){
			   	    //清除选中
			   		$('#grid').datagrid('clearChecked');
			   		window.location.href=msg;
			   }
		});
	}
	//确认收货
	function qrsh(id){
		$.ajax({
			   type: "POST",
			   url: "htorderdetail_onplsh",
			   data: "result="+id,
			   success: function(msg){
			   		$.messager.alert("提示",msg,"info");
			   		$("#grid").datagrid('reload');
			   	//清除选中
			   		$('#grid').datagrid('clearChecked');
			   }
		});
	}
	//条件点击选择（待收货等）
	function onstaic(id,div){
		$(".topfl a").css("background-color","");
		$(".topfl a").css("color","black");
		$(".topfl a").css("opacity","");
		$(".topfl a").css("border-radius","");
		$(".topfl a").css("padding","");
		$(".topfl a").find("span").css("color","red");
		$("#"+div).css("background-color","red");
		$("#"+div).css("color","white");
		$("#"+div).css("opacity","0.8");
		$("#"+div).css("border-radius","25px");
		$("#"+div).css("padding","5px");
		$("#"+div).find("span").css("color","white");
		
		$("#selSettlementStatus").val(id);
		$("#grid").datagrid('load',{
			"status":id,
			"sortid":2,
			"kddh":""
			
		});
	}
	//时间点击选择（3个月等）
    function ontime(id,div){
		$(".topfl a").css("background-color","");
		$(".topfl a").css("color","black");
		$(".topfl a").css("opacity","");
		$(".topfl a").css("border-radius","");
		$(".topfl a").css("padding","");
		$(".topfl a").find("span").css("color","red");
		$("#"+div).css("background-color","red");
		$("#"+div).css("color","white");
		$("#"+div).css("opacity","0.8");
		$("#"+div).css("border-radius","25px");
		$("#"+div).css("padding","5px");
		$("#"+div).find("span").css("color","white");
		var s="";
		if(id==0){
			s="0";
			
		}else{
			s=id+"y";
		}
    	$("#grid").datagrid('load',{
			"status":'-1',
			"sortid":2,
			"kddh":s
		});
    
	}
</script>
</head>
<body class="easyui-layout" style="border-top-width:0px;">

	<div region="center" border="false">
	
		<div  style="border-top-width:0px;">
		<div class="topfl">
		  <a id="jr" href="javascript:ontime(0,'jr');">今日订单（<span>0</span>）</a> | <a id="j3y" href="javascript:ontime(3,'j3y');">近三个月（<span>0</span>）</a> | <a id="3yold" href="javascript:ontime(-3,'3yold');">三个月前（<span>0</span>）</a>  | <a id="dfkid" href="javascript:onstaic(8,'dfkid');">待付款（<span>0</span>）</a> | <a id="dshid" href="javascript:onstaic(1,'dshid');">待收货（<span>0</span>）</a> | <a id="dfhid" href="javascript:onstaic(0,'dfhid');">待发货（<span>0</span>）</a> | <a id="yfhid" href="javascript:onstaic(2,'yfhid');">已收货（<span>0</span>）</a>
		</div>
			<div class="serachdiv" >
		<!-- 	订单编号:<input type="text" id="truename" name="" value="">
				<a id="btnsearch" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'">查询</a> -->
				<div style="text-align: left; ">
				<input type="hidden" id="selSettlementStatus" value="-1"/>
                订单编号：<input name="txtOrderNo" type="text" maxlength="50" id="truename" class="txt200">&nbsp; 快递单号：<input name="txtTrackNo" type="text" maxlength="50" id="txtTrackNo" class="txt200" >&nbsp;
                <br>
                <br>
                收&nbsp;&nbsp;货&nbsp;&nbsp;人：<input name="txtConsignee" type="text" maxlength="100" id="shr" class="txt150" >&nbsp;
                联系电话：<input name="txtConsignee" type="text" maxlength="100" id="shdh" class="txt150" >&nbsp;
                收货地址：<input name="txtConsignee" type="text" maxlength="100" id="shdz" class="txt150" >&nbsp;
                <br>
                <br>
                下单时间：<input name="txtStartTime" type="text" id="txtStartTime" readonly="readonly" class="easyui-datebox" maxlength="20">&nbsp;&nbsp;&nbsp;至&nbsp;
                <input name="txtEndTime" type="text" id="txtEndTime" readonly="readonly" maxlength="20" class="easyui-datebox" >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                付款时间：<input name="txtPayTimeStart" type="text" id="txtPayTimeStart" readonly="readonly"  class="easyui-datebox" maxlength="20">&nbsp;&nbsp;&nbsp;至&nbsp;
                <input name="txtPayTimeEnd" type="text" id="txtPayTimeEnd" readonly="readonly" maxlength="20" class="easyui-datebox" >&nbsp;
                <br>
                <br>
                <!-- <select name="selSettlementStatus" id="selSettlementStatus" class="ddl100">
					<option selected="selected" value="-1">-- 结算状态 --</option>
					<option value="0">待结算</option>
					<option value="1">已结算</option>
					<option value="255">无需结算</option>
				</select> -->
				  <div style="float: left;">
                    <a id="btnsearch" href="#" class="easyui-linkbutton serachbtn" data-options="iconCls:'icon-search'">搜索</a>
                    <div class="t10"></div><div class="t10"></div>
                    </div>
                     <div style="float: left;margin-left: 5px;">
                     <a id="btndc" href="javascript:onexpert();" class="easyui-linkbutton serachbtn" data-options="iconCls:'icon-redo'">导出搜索内容</a>
                    <div class="t10"></div><div class="t10"></div>
                    </div>
                     <div style="float: left;padding-bottom: 10px;;margin-left: 5px;">
                    <a id="btnprint" href="javascript:onplprintcontext();" class="easyui-linkbutton serachbtn" data-options="iconCls:'icon-print'">打印搜索内容</a>
                    <div class="t10"></div><div class="t10"></div>
                    </div>
              </div>
			</div>
			<div style="height: 330px;clear: both;border-top:1px solid #aecaf1;"id="tabstrid" >
				<table id="grid"></table>
			</div>
			<div id="plprint" style="display: none;" title="搜索内容打印" iconCls="icon-search">
			<div style="margin-left: 45%;padding-top: 10px;padding-bottom: 10px;">
			   <a id="btnprint" href="javascript:onplprint();" class="easyui-linkbutton serachbtn" data-options="iconCls:'icon-print'">打印</a>
                    <div class="t10"></div><div class="t10"></div>
			 </div>
			 <div id="plprintcontext">
			 <table  id="tbodydiv" border="0" cellpadding="3" cellspacing="1" width="100%" align="center" style="background-color: #b9d8f3;">
			   <tr  style="text-align: center; COLOR: #0076C8; BACKGROUND-COLOR: #F4FAFF; font-weight: bold;">
			    <td width="2%">序号</td>
			    <td width="20%">订单编号</td>
			    <td width="30%">商品名称｜商品数量｜商品单价</td>
			    <td width="10%">下单时间</td>
			    <td width="25%">收货人姓名｜收货人电话｜收货人地址</td>
			    <td width="8%">订单分类</td>
			   </tr>
			 </table>
			 </div>
			 
			</div>
		</div>
	</div>
	<% int o_status=-1;
	   String os=request.getParameter("o_status");
	   if(os!=null){
		   o_status=Integer.parseInt(os);
	   }
	%>
	<input type="text" id="o_status" value="<%=o_status%>">
</body>
</html>