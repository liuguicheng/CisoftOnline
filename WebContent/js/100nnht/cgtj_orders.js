$(function(){
	 //数量统计 －今天采购订单
	$.ajax({
		   type: "POST",
		   url: "purchase_querylistcount?kddh=0",
		   success: function(msg){
			   $("#or_today span").html(msg);
		   }
	  });
	$.ajax({
		   type: "POST",
		   url: "purchase_querylistcount?kddh=3y",
		   success: function(msg){
			   $("#or_3y span").html(msg);
		   }
	  });
	$.ajax({
		   type: "POST",
		   url: "purchase_querylistcount?kddh=-3y",
		   success: function(msg){
			   $("#or_f3y span").html(msg);
		   }
	  });
	
	
	
	
		//仓库
		$.ajax({
			   type: "POST",
			   url: "storehouse_querystorehomelist",
			   success: function(msg){
				   $("#or_selectid").html("");
				    //获取库房
				    $.each(msg, function(i){  
				    	$("<li id=\""+msg[i].sh_id+"\"><a href=\"#\" id=\""+msg[i].sh_id+"\">"+msg[i].sh_name+"</a></li>").appendTo("#or_selectid");
					 }); 
 				    $(".select").bind("click",function(event){
				           //阻止事件冒泡
				           event.stopPropagation();   
				          var ids= $(this).attr("id");
				          
				    var s=$(this);
					var z=parseInt(s.css("z-index"));
					var dt=$(this).children("dt");
					var dd=$(this).children("dd");
					var _hide=function(){dd.slideUp(200);dt.removeClass("cur");s.css("z-index",z);};    //关闭效果
					    dd.find("a").click(function(){
						dt.html($(this).html());
						dt.attr("id",$(this).attr("id")),
						_hide();//选择效果（如需要传值，可自定义参数，在此处返回对应的“value”值 ）
						if(ids=="ckid"){
						    //清空库房信息
						    //获取库房信息下拉
						    toqueryroom($(this).attr("id"));
						}
					
					$("body").click(function(i){ !$(i.target).parents(".select").first().is(s) ? _hide():"";});
				    }); 
			   });
			   }
		});
		$(".select").each(function(){
			var s=$(this);
			var z=parseInt(s.css("z-index"));
			var dt=$(this).children("dt");
			var dd=$(this).children("dd");
			var _show=function(){dd.slideDown(200);dt.addClass("cur");s.css("z-index",z+1);};   //展开效果
			var _hide=function(){dd.slideUp(200);dt.removeClass("cur");s.css("z-index",z);};    //关闭效果
			dt.click(function(){dd.is(":hidden")?_show():_hide();});
			dd.find("a").click(function(){dt.html($(this).html());_hide();});     //选择效果（如需要传值，可自定义参数，在此处返回对应的“value”值 ）
			$("body").click(function(i){ !$(i.target).parents(".select").first().is(s) ? _hide():"";});
		});
		//查询
		$("#or_btnsearch").click(function(){
			var truename=$("#truename").val();//订单号
			var zts=$("#or_zt_id").find("dt").attr("id");//状态
			var xdstartime=$("#txtStartTime").datebox("getValue");//采购下单启始时间
			var xdendtime=$("#txtEndTime").datebox("getValue");//采购下单结束时间
			var s=$("#ckid").find("dt").attr("id");
			$("#grid").datagrid('load',{
				"p_no":truename,
				"p_zt":zts,
				"xdstartime":xdstartime,
				"xdendtime":xdendtime,
				"storeroom.s_id":s
				
			});
		});
	
		$('#grid').datagrid(
				{
					iconCls : 'icon-forward',
					fit : true,
					fitColumns:true,
					width:'100%',
//					singleSelect:true,//单选
					border : false,
					striped : true,
					rownumbers : true,
					method:"post",
					pagination:true,
					pageNumber:1,//初始化页号
					url : "${pageContext.request.contextPath}/purchase_getList",
					idField : 'p_id',
					toolbar : [
//					     						{
//					    							id:'add',
//					    							text:'添加',
//					    							iconCls:'icon-add',
//					    							handler:function(){
//					    								parent.forward('添加采购信息',"");
//					    								location.href="${pageContext.request.contextPath}/purchase_addView";
//					    							}
//					    						}
					    					],
					columns : [[
					 	{
					 		field:'p_id',
					 		checkbox:true
					 	},{
					 		field:'p_no',
					 		title:'采购单号',
					 		align:'center',
					 		width:220,
					 		formatter:function(value,row,index){
					 			return "<a href='#'  onclick='info("+row.p_id+")'>"+row.p_no+"<a>";
					 		}
					 	},{
					 		field:'rq',
					 		title:'采购日期',
					 		align:'center',
					 		width:150,
					 		formatter:function(value,row,index){
					 			if(row.p_zdDate!=null){
					 				var s=row.p_zdDate.split("T");
						 			return s[0]+"  "+s[1];
					 			}
					 			return "";
					 			
					 		}
					 	}
					 	,{
					 		field:'kf',
					 		title:'库房',
					 		align:'center',
					 		width:150,
					 		formatter:function(value,row,index){
					 			var s=row.storeroom.storehouse.sh_name;
					 			return s;
					 		}
					 	},{
					 		field:'storeroom.s_name',
					 		title:'库区',
					 		align:'center',
					 		width:150,
					 		formatter:function(value,row,index){
					 			var s=row.storeroom.s_name;
					 			return s;
					 		}
					 	},{
					 		field:'p_username',
					 		title:'制单人',
					 		align:'center',
					 		width:150
					 	},{
					 		field:'rqlx',
					 		title:'状态',
					 		align:'center',
					 		width:150,
					 		formatter:function(value,row,index){
					 			if(row.p_zt==1){
					 				return "未付款";
					 			}else if(row.p_zt==2){
					 				return "未收货";
					 			}
								else if(row.p_zt==3){
									return "已入库";
					 			}else if(row.p_zt==4){
									return "已退货";
					 			}
					 			
					 		}
					 	},{
					 		field:'caozuo',
					 		title:'操作',
					 		align:'center',
					 		width:120,
					 		formatter:function(value,row,index){
					 			if(row.p_zt==1){
					 				return "<a href='#'  onclick='fks(\""+row.p_no+"\");'>付款<a>";
					 			}else if(row.p_zt==2){
					 				return "<a href='#'  onclick='sh(\""+row.p_no+"\")'>收货<a>";
					 			}else if(row.p_zt==3){
					 				return "<a href='#'  onclick='th(\""+row.p_no+"\")'>退货<a>";
					 			}
					 			else{
					 			return "<a href='#'  onclick='edit("+row.p_id+")'>修改<a>"+"  "+
					 			"<a href='#'  onclick='del("+row.p_id+")'>删除<a>";
					 			}
					 		}
					 	}           
					 ]]
				});
		
	})
	function edit(id){
			var widoid="eid"+id;
			  var iWidth="1024"; //弹出窗口的宽度;
				 var iHeight="768"; //弹出窗口的高度;
				 var iTop = (window.screen.availHeight-30-iHeight)/2; //获得窗口的垂直位置;
				 var iLeft = (window.screen.availWidth-10-iWidth)/2; //获得窗口的水平位置;
		         window.open('purchase_toupView?p_id='+id,widoid,'height='+iHeight+',width='+iWidth+',top='+iTop+',left='+iLeft+',toolbar=no,menubar=no,scrollbars=no,resizable=no,location=no,status=no');
	}
	function info(id){
		var widoid="eidifno"+id;
		  var iWidth="1024"; //弹出窗口的宽度;
			 var iHeight="768"; //弹出窗口的高度;
			 var iTop = (window.screen.availHeight-30-iHeight)/2; //获得窗口的垂直位置;
			 var iLeft = (window.screen.availWidth-10-iWidth)/2; //获得窗口的水平位置;
	         window.open('purchase_editView?p_id='+id,widoid,'height='+iHeight+',width='+iWidth+',top='+iTop+',left='+iLeft+',toolbar=no,menubar=no,scrollbars=no,resizable=no,location=no,status=no');
}
	function fks(id){
		var widoid="eidfks"+id;
		  var iWidth="1024"; //弹出窗口的宽度;
			 var iHeight="768"; //弹出窗口的高度;
			 var iTop = (window.screen.availHeight-30-iHeight)/2; //获得窗口的垂直位置;
			 var iLeft = (window.screen.availWidth-10-iWidth)/2; //获得窗口的水平位置;
	         window.open('purchasepay_addView?p_no='+id,widoid,'height='+iHeight+',width='+iWidth+',top='+iTop+',left='+iLeft+',toolbar=no,menubar=no,scrollbars=no,resizable=no,location=no,status=no');
	}
	function sh(id){
		$.messager.confirm("提示","确认收货?",function(r){
			if(r){
				$.ajax({
					   type: "POST",
					   url: "purchaserece_save",
					   data: "pr_no="+id,
					   success: function(msg){
					   		$.messager.alert("提示",msg,"info");
					   		$("#grid").datagrid('reload');
					   }
				});
			}
		});
	}
	function th(id){
		var widoid="eidfksth"+id;
		  var iWidth="1024"; //弹出窗口的宽度;
			 var iHeight="768"; //弹出窗口的高度;
			 var iTop = (window.screen.availHeight-30-iHeight)/2; //获得窗口的垂直位置;
			 var iLeft = (window.screen.availWidth-10-iWidth)/2; //获得窗口的水平位置;
	         window.open('purchasereturn_addView?p_no='+id,widoid,'height='+iHeight+',width='+iWidth+',top='+iTop+',left='+iLeft+',toolbar=no,menubar=no,scrollbars=no,resizable=no,location=no,status=no');
	}
	function del(id){
		$.messager.confirm("提示","真的要删除吗?",function(r){
			if(r){
				$.ajax({
					   type: "POST",
					   url: "purchase_delete",
					   data: "p_id="+id,
					   success: function(msg){
					   		$.messager.alert("提示",msg,"info");
					   		$("#grid").datagrid('reload');
					   }
				});
			}
		});
	}
	//获取库房
	function toqueryroom(id){
		
		$.ajax({
			   type: "POST",
			   url: "storeroom_querystoreroomlist?houseid="+id,
			   success: function(msg){
				   $("#or_selectroomid").html("");
				   $("#or_kfid").css("display","block");
				   $("#or_kfid").find("dt").html("请选择库房");
				    //获取库房
				    $.each(msg, function(){  
				    	$("<li id=\""+msg[0].s_id+"\"><a href=\"#\" id=\""+msg[0].s_id+"\">"+msg[0].s_name+"</a></li>").appendTo("#or_selectroomid");
					 }); 
			   }
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
		var s="0";
		if (id==0){
			
		}else{
			s=id+"y";
		}
    	$("#grid").datagrid('load',{
			"kddh":s
		});
    
	}
    
  //导出
	function or_onplexport(id){
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
	function or_onplprintcontext(){
		var truename=$("#truename").val();//订单号
		var zts=$("#or_zt_id").find("dt").attr("id");//状态
		var xdstartime=$("#txtStartTime").datebox("getValue");//采购下单启始时间
		var xdendtime=$("#txtEndTime").datebox("getValue");//采购下单结束时间
		var s=$("#ckid").find("dt").attr("id");
		$("#or_plprint").css("display","block");
		$.ajax({
			   type: "POST",
			   url: "csv_printcgorderdata",
			   data: "truename="+truename+"&p_zt="+zts+"&xdstartime="+xdstartime+"&xdendtime="+xdendtime+"&s_id="+s,
			   success: function(msg){
				   $("#or_contextid").remove();
				   if(msg!=null){
					   var htmlstr="<table id='or_contextid' cellpadding='3' cellspacing='0' style='background-color: #b9d8f3;border: 1px white solid;' width='100%'>";
					   $.each(msg, function(i) {  
						   htmlstr+="<tr style='text-align: center;'>";
						  		htmlstr+="<td width='10%' style='border-bottom:1px white solid;border-right:1px white solid;'>"+msg[i].id+"</td>";
						  		htmlstr+="<td width='25%' style='border-bottom:1px white solid;border-right:1px white solid;'>"+msg[i].cgno+"</td>";
						  		htmlstr+="<td width='35%' style='border-bottom:1px white solid;border-right:1px white solid;text-align:center;'>"+msg[i].cgdate+"</td>";
						  		htmlstr+="<td width='20%' style='border-bottom:1px white solid;border-right:1px white solid;'>"+msg[i].cgck+"</td>";
						  		htmlstr+="<td width='10%' style='border-bottom:1px white solid;border-right:1px white solid;text-align:center;'>"+msg[i].ztstr+"</td>";
						   htmlstr+="</tr>";
						}); 
					   htmlstr+="</table>";
					 $(htmlstr).appendTo("#or_plprintcontext");
				   }else{
					   var htmlstr="<table id='or_contextid' cellpadding='3'width='100%'  cellspacing='0' style='background-color: #b9d8f3;border: 1px white solid;'>";
					   htmlstr+="<tr style='text-align: center;'>";
					   htmlstr+="<td colspan='6' style='border-bottom:1px white solid;'>暂无相关信息</td>";
					   htmlstr+="</tr>";
					   htmlstr+="</table>";
					   $(htmlstr).appendTo("#or_plprintcontext");
				   }
			   }
		});
		$("#or_plprint").css("display","block");
		 $('#or_plprint').window({   
			      width:824,   
			     height:500,   
			      modal:true,
			  }); 
		
	}
	//打印
	function or_onplprint(){
		 $('#or_plprintcontext').jqprint();
		
	}
	//批量导出
	function or_onexpert(){
		var truename=$("#truename").val();//订单号
		var zts=$("#or_zt_id").find("dt").attr("id");//状态
		var xdstartime=$("#txtStartTime").datebox("getValue");//采购下单启始时间
		var xdendtime=$("#txtEndTime").datebox("getValue");//采购下单结束时间
		var s=$("#ckid").find("dt").attr("id");
		$.ajax({
			   type: "POST",
			   url: "csv_exportcgorderData2CSV",
			   data: "truename="+truename+"&p_zt="+zts+"&xdstartime="+xdstartime+"&xdendtime="+xdendtime+"&s_id="+s,
			   success: function(msg){
			   	    //清除选中
			   		window.location.href=msg;
			   }
		});
	}