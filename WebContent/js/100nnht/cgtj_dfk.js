$(function(){
	
	 //数量统计 -采购付款统计
	$.ajax({
		   type: "POST",
		   url: "purchasepay_querylistcount?kddh=0",
		   success: function(msg){
			   $("#fk_today span").html(msg);
		   }
	  });
	$.ajax({
		   type: "POST",
		   url: "purchasepay_querylistcount?kddh=3y",
		   success: function(msg){
			   $("#fk_j3y span").html(msg);
		   }
	  });
	$.ajax({
		   type: "POST",
		   url: "purchasepay_querylistcount?kddh=-3y",
		   success: function(msg){
			   $("#fk_3yold span").html(msg);
		   }
	  });
	   
		//查询
		$("#fk_btnsearch").click(function(){
			var truename=$("#fkno").val();//订单号
			var zts=$("#fkfsid").find("dt").attr("id");//付款类型
			var xdstartime=$("#fk_txtStartTime").datebox("getValue");//采购付款启始时间
			var xdendtime=$("#fk_txtEndTime").datebox("getValue");//采购付款结束时间
			$("#gridcjsjiennfd").datagrid('load',{
				"pp_no":truename,
				"pp_zflx":zts,
				"xdstartime":xdstartime,
				"xdendtime":xdendtime
				
			});
		});
	
		
	});
	function edit(id){
		var widoid="eidfksed"+id;
		  var iWidth="1024"; //弹出窗口的宽度;
			 var iHeight="768"; //弹出窗口的高度;
			 var iTop = (window.screen.availHeight-30-iHeight)/2; //获得窗口的垂直位置;
			 var iLeft = (window.screen.availWidth-10-iWidth)/2; //获得窗口的水平位置;
	         window.open('purchasepay_editView?pp_id='+id,widoid,'height='+iHeight+',width='+iWidth+',top='+iTop+',left='+iLeft+',toolbar=no,menubar=no,scrollbars=no,resizable=no,location=no,status=no');
	}
	function del(id){
		$.messager.confirm("提示","真的要删除吗?",function(r){
			if(r){
				$.ajax({
					   type: "POST",
					   url: "purchasepay_delete",
					   data: "pp_id="+id,
					   success: function(msg){
					   		$.messager.alert("提示",msg,"info");
					   		$("#grid").datagrid('reload');
					   }
				});
			}
		})
	}

	//时间点击选择（3个月等）
    function fk_ontime(id,div){
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
    	$("#gridcjsjiennfd").datagrid('load',{
			"kddh":s
		});
    
	}
    
  
	//弹出打印内容
	function fk_onplprintcontext(){
		var truename=$("#fkno").val();//订单号
		var zts=$("#fkfsid").find("dt").attr("id");//付款类型
		var xdstartime=$("#fk_txtStartTime").datebox("getValue");//采购付款启始时间
		var xdendtime=$("#fk_txtEndTime").datebox("getValue");//采购付款结束时间
		$.ajax({
			   type: "POST",
			   url: "csv_printcgfkdata",
			   data: "truename="+truename+"&pp_zflx="+zts+"&xdstartime="+xdstartime+"&xdendtime="+xdendtime,
			   success: function(msg){
				   $("#fkidsss").remove();
				   if(msg!=null){
					   var htmlstr="<table id='fkidsss' cellpadding='3' cellspacing='0' style='background-color: #b9d8f3;border: 1px white solid;' width='100%'>";
					   $.each(msg, function(i) {  
						   htmlstr+="<tr style='text-align: center;'>";
						  		htmlstr+="<td width='10%' style='border-bottom:1px white solid;border-right:1px white solid;'>"+msg[i].id+"</td>";
						  		htmlstr+="<td width='25%' style='border-bottom:1px white solid;border-right:1px white solid;'>"+msg[i].ppno+"</td>";
						  		htmlstr+="<td width='35%' style='border-bottom:1px white solid;border-right:1px white solid;text-align:center;'>"+msg[i].ppje+"</td>";
						  		htmlstr+="<td width='20%' style='border-bottom:1px white solid;border-right:1px white solid;'>"+msg[i].pptime+"</td>";
						  		htmlstr+="<td width='10%' style='border-bottom:1px white solid;border-right:1px white solid;text-align:center;'>"+msg[i].ztstr+"</td>";
						   htmlstr+="</tr>";
						}); 
					   htmlstr+="</table>";
					 $(htmlstr).appendTo(".fktjcontext");
				   }else{
					   var htmlstr="<table  id='fkidsss'   cellpadding='3'width='100%'  cellspacing='0' style='background-color: #b9d8f3;border: 1px white solid;'>";
					   htmlstr+="<tr style='text-align: center;'>";
					   htmlstr+="<td colspan='6' style='border-bottom:1px white solid;'>暂无相关信息</td>";
					   htmlstr+="</tr>";
					   htmlstr+="</table>";
					   $(htmlstr).appendTo(".fktjcontext");
				   }
			   }
		});
		$("#fktjjsdf_plprint").css("display","block");
		 $('#fktjjsdf_plprint').window({   
			      width:824,   
			     height:500,   
			      modal:true,
			  }); 
		
	}
	//打印
	function fk_onplprint(){
		 $('.fktjcontext').jqprint();
		
	}
	//批量导出
	function fk_onexpert(){
		var truename=$("#fkno").val();//订单号
		var zts=$("#fkfsid").find("dt").attr("id");//付款类型
		var xdstartime=$("#fk_txtStartTime").datebox("getValue");//采购付款启始时间
		var xdendtime=$("#fk_txtEndTime").datebox("getValue");//采购付款结束时间
		$.ajax({
			   type: "POST",
			   url: "csv_exportcgfkData2CSV",
			   data: "truename="+truename+"&pp_zflx="+zts+"&xdstartime="+xdstartime+"&xdendtime="+xdendtime,
			   success: function(msg){
			   	    //清除选中
			   		window.location.href=msg;
			   }
		});
	}
	
	function ongrid(){
		$("#gridcjsjiennfd").datagrid(
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
					url : "${pageContext.request.contextPath}/purchasepay_getList",
					idField : 'pp_id',
					/* toolbar : [
						{
							id:'add',
							text:'添加',
							iconCls:'icon-add',
							handler:function(){
								parent.forward('采购付款',"");
								location.href="${pageContext.request.contextPath}/purchasepay_addView";
							}
						}
					], */
					columns : [[
					 	{
					 		field:'pp_id',
					 		checkbox:true
					 	},{
					 		field:'pp_no',
					 		title:'采购单号',
					 		align:'center',
					 		width:220
					 	}
					 	,{
					 		field:'pp_sjfkje',
					 		title:'付款金额',
					 		align:'center',
					 		width:150
					 	},{
					 		field:'fkrq',
					 		title:'付款日期',
					 		align:'center',
					 		width:150,
					 		formatter:function(value,row,index){
					 			if(row.pp_fkdate!=null){
					 				var s=row.pp_fkdate.split("T");
						 			return s[0]+"  "+s[1];
					 			}
					 			return "";
					 			
					 		}
					 	},{
					 		field:'rqlxdd',
					 		title:'付款类型',
					 		align:'center',
					 		width:150,
					 		formatter:function(value,row,index){
					 			if(row.pp_zflx==1){
					 				return "网银转账";
					 			}else if(row.pp_zflx==2){
					 				return "现金支付";
					 			}
					 		}
					 	}
					 	,{
					 		field:'pp_bz',
					 		title:'备注',
					 		align:'center',
					 		width:150
					 	}
					 	/* ,{
					 		field:'caozuo',
					 		title:'操作',
					 		align:'center',
					 		width:120,
					 		formatter:function(value,row,index){
					 			return "<a href='#'  onclick='edit("+row.pp_id+")'>修改<a>"+"  "+
					 			"<a href='#'  onclick='del("+row.pp_id+")'>删除<a>";
					 		}
					 	}     */       
					 ]]
				});
	}