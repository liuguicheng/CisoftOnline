$(function(){
	 //数量统计 －今天采购退货单
	$.ajax({
		   type: "POST",
		   url: "purchaserece_querylistcount?kddh=0",
		   success: function(msg){
			   $("#sh_today span").html(msg);
		   }
	  });
	$.ajax({
		   type: "POST",
		   url: "purchaserece_querylistcount?kddh=3y",
		   success: function(msg){
			   $("#sh_3y span").html(msg);
		   }
	  });
	$.ajax({
		   type: "POST",
		   url: "purchaserece_querylistcount?kddh=-3y",
		   success: function(msg){
			   $("#sh_old3y span").html(msg);
		   }
	  });
	
		//查询
		$("#sh_btnsearch").click(function(){
			var truename=$("#sh_no").val();//订单号
			var xdstartime=$("#sh_txtStartTime").datebox("getValue");//采购收货启始时间
			var xdendtime=$("#sh_txtEndTime").datebox("getValue");//采购收货结束时间
			$("#shgrids").datagrid('load',{
				"pr_no":truename,
				"xdstartime":xdstartime,
				"xdendtime":xdendtime
			});
		});
	
		
	})
	//时间点击选择（3个月等）
    function sh_ontime(id,div){
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
    	$("#shgrids").datagrid('load',{
			"kddh":s
		});
    
	}
    
  
		
	//弹出打印内容
	function sh_onplprintcontext(){
		var truename=$("#sh_no").val();//订单号
		var xdstartime=$("#sh_txtStartTime").datebox("getValue");//采购收货启始时间
		var xdendtime=$("#sh_txtEndTime").datebox("getValue");//采购收货结束时间
		$("#sh_plprint").css("display","block");
		$.ajax({
			   type: "POST",
			   url: "csv_printcgshdata",
			   data: "truename="+truename+"&xdstartime="+xdstartime+"&xdendtime="+xdendtime,
			   success: function(msg){
				   $("#sh_contextid").remove();
				   if(msg!=null){
					   var htmlstr="<table id='sh_contextid' cellpadding='3' cellspacing='0' style='background-color: #b9d8f3;border: 1px white solid;' width='100%'>";
					   $.each(msg, function(i) {  
						   htmlstr+="<tr style='text-align: center;'>";
						  		htmlstr+="<td width='10%' style='border-bottom:1px white solid;border-right:1px white solid;'>"+msg[i].id+"</td>";
						  		htmlstr+="<td width='20%' style='border-bottom:1px white solid;border-right:1px white solid;'>"+msg[i].no+"</td>";
						  		htmlstr+="<td width='20%' style='border-bottom:1px white solid;border-right:1px white solid;text-align:center;'>"+msg[i].time+"</td>";
						  		htmlstr+="<td width='10%' style='border-bottom:1px white solid;border-right:1px white solid;'>"+msg[i].thr+"</td>";
						  		htmlstr+="<td width='40%' style='border-bottom:1px white solid;border-right:1px white solid;text-align:center;'>"+msg[i].bz+"</td>";
						   htmlstr+="</tr>";
						}); 
					   htmlstr+="</table>";
					 $(htmlstr).appendTo("#sh_plprintcontext");
				   }else{
					   var htmlstr="<table id='sh_contextid' cellpadding='3'width='100%'  cellspacing='0' style='background-color: #b9d8f3;border: 1px white solid;'>";
					   htmlstr+="<tr style='text-align: center;'>";
					   htmlstr+="<td colspan='6' style='border-bottom:1px white solid;'>暂无相关信息</td>";
					   htmlstr+="</tr>";
					   htmlstr+="</table>";
					   $(htmlstr).appendTo("#sh_plprintcontext");
				   }
			   }
		});
		$("#sh_plprint").css("display","block");
		 $('#sh_plprint').window({   
			      width:824,   
			     height:500,   
			      modal:true,
			  }); 
		
	}
	//打印
	function sh_onplprint(){
		 $('#sh_plprintcontext').jqprint();
		
	}
	//批量导出
	function sh_onexpert(){
		var truename=$("#sh_no").val();//订单号
		var xdstartime=$("#sh_txtStartTime").datebox("getValue");//采购收货启始时间
		var xdendtime=$("#sh_txtStartTime").datebox("getValue");//采购收货结束时间
		$.ajax({
			   type: "POST",
			   url: "csv_exportcgshData2CSV",
			   data: "truename="+truename+"&xdstartime="+xdstartime+"&xdendtime="+xdendtime,
			   success: function(msg){
			   	    //清除选中
			   		window.location.href=msg;
			   }
		});
	}
	
	function onshtisd(){
		$('#shgrids').datagrid(
				{
					iconCls : 'icon-forward',
					fit : true,
					fitColumns:true,
					width:'100%',
					border : false,
					striped : true,
					rownumbers : true,
					method:"post",
//					singleSelect:true,//单选
					pagination:true,
					pageNumber:1,//初始化页号
					url : "${pageContext.request.contextPath}/purchaserece_getList",
					idField : 'pr_id',
					columns : [[
					 	{
					 		field:'pr_id',
					 		checkbox:true
					 	},{
					 		field:'pr_no',
					 		title:'收货采购单号',
					 		align:'center',
					 		width:220
					 	}
					 	,{
					 		field:'pr_username',
					 		title:'收货人',
					 		align:'center',
					 		width:150
					 	},{
					 		field:'rq',
					 		title:'收货日期',
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