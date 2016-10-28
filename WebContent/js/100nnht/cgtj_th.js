$(function(){
	 //数量统计 －今天采购退货单
	$.ajax({
		   type: "POST",
		   url: "purchasereturn_querylistcount?kddh=0",
		   success: function(msg){
			   $("#th_today span").html(msg);
		   }
	  });
	$.ajax({
		   type: "POST",
		   url: "purchasereturn_querylistcount?kddh=3y",
		   success: function(msg){
			   $("#th_3y span").html(msg);
		   }
	  });
	$.ajax({
		   type: "POST",
		   url: "purchasereturn_querylistcount?kddh=-3y",
		   success: function(msg){
			   $("#th_old3y span").html(msg);
		   }
	  });
	
		//查询
		$("#th_btnsearch").click(function(){
			var truename=$("#th_cgbh").val();//订单号
			var xdstartime=$("#th_txtStartTime").datebox("getValue");//采购下单启始时间
			var xdendtime=$("#th_txtEndTime").datebox("getValue");//采购下单结束时间
			$("#th_girds").datagrid('load',{
				"pr_no":truename,
				"xdstartime":xdstartime,
				"xdendtime":xdendtime
			});
		});
	
		
	})
	//时间点击选择（3个月等）
    function th_ontime(id,div){
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
    	$("#th_girds").datagrid('load',{
			"kddh":s
		});
    
	}
    
  //导出
	function th_onexpert(id){
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
	function th_onplprintcontext(){
		var truename=$("#th_cgbh").val();//订单号
		var xdstartime=$("#th_txtStartTime").datebox("getValue");//采购退货启始时间
		var xdendtime=$("#th_txtEndTime").datebox("getValue");//采购退货结束时间
		$("#th_plprint").css("display","block");
		$.ajax({
			   type: "POST",
			   url: "csv_printcgthdata",
			   data: "truename="+truename+"&xdstartime="+xdstartime+"&xdendtime="+xdendtime,
			   success: function(msg){
				   $("#th_contextid").remove();
				   if(msg!=null){
					   var htmlstr="<table id='th_contextid' cellpadding='3' cellspacing='0' style='background-color: #b9d8f3;border: 1px white solid;' width='100%'>";
					   $.each(msg, function(i) {  
						   htmlstr+="<tr style='text-align: center;'>";
						  		htmlstr+="<td width='10%' style='border-bottom:1px white solid;border-right:1px white solid;'>"+msg[i].id+"</td>";
						  		htmlstr+="<td width='25%' style='border-bottom:1px white solid;border-right:1px white solid;'>"+msg[i].no+"</td>";
						  		htmlstr+="<td width='20%' style='border-bottom:1px white solid;border-right:1px white solid;text-align:center;'>"+msg[i].time+"</td>";
						  		htmlstr+="<td width='10%' style='border-bottom:1px white solid;border-right:1px white solid;'>"+msg[i].thr+"</td>";
						  		htmlstr+="<td width='30%' style='border-bottom:1px white solid;border-right:1px white solid;text-align:center;'>"+msg[i].bz+"</td>";
						   htmlstr+="</tr>";
						}); 
					   htmlstr+="</table>";
					 $(htmlstr).appendTo("#th_printcontext");
				   }else{
					   var htmlstr="<table id='th_contextid' cellpadding='3'width='100%'  cellspacing='0' style='background-color: #b9d8f3;border: 1px white solid;'>";
					   htmlstr+="<tr style='text-align: center;'>";
					   htmlstr+="<td colspan='6' style='border-bottom:1px white solid;'>暂无相关信息</td>";
					   htmlstr+="</tr>";
					   htmlstr+="</table>";
					   $(htmlstr).appendTo("#th_printcontext");
				   }
			   }
		});
		$("#th_plprint").css("display","block");
		 $('#th_plprint').window({   
			      width:824,   
			     height:500,   
			      modal:true,
			  }); 
		
	}
	//打印
	function th_onplprint(){
		 $('#th_printcontext').jqprint();
		
	}
	//批量导出
	function th_onexpert(){
		var truename=$("#th_cgbh").val();//订单号
		var xdstartime=$("#th_txtStartTime").datebox("getValue");//采购退货启始时间
		var xdendtime=$("#th_txtEndTime").datebox("getValue");//采购退货结束时间
		$.ajax({
			   type: "POST",
			   url: "csv_exportcgthData2CSV",
			   data: "truename="+truename+"&xdstartime="+xdstartime+"&xdendtime="+xdendtime,
			   success: function(msg){
			   	    //清除选中
			   		window.location.href=msg;
			   }
		});
	}
	
	function onloadth(){
		$('#th_girds').datagrid(
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
					url : "${pageContext.request.contextPath}/purchasereturn_getList",
					idField : 'pr_id',
					columns : [[
					 	{
					 		field:'pr_id',
					 		checkbox:true
					 	},{
					 		field:'pr_no',
					 		title:'退货采购单号',
					 		align:'center',
					 		width:220
					 	}
					 	,{
					 		field:'pr_username',
					 		title:'退货人',
					 		align:'center',
					 		width:150
					 	},{
					 		field:'rq',
					 		title:'退货日期',
					 		align:'center',
					 		width:150,
					 		formatter:function(value,row,index){
					 			if(row.pr_shdate!=null){
					 				var s=row.pr_shdate.split("T");
						 			return s[0]+"  "+s[1];
					 			}
					 			return "";
					 			
					 		}
					 	}
					 	,{
					 		field:'pr_bz',
					 		title:'备注',
					 		align:'center',
					 		width:150
					 	}
					 ]]
				});
	}