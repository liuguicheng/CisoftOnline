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
<script language="javascript" src="${pageContext.request.contextPath }/js/jquery.jqprint-0.3.js"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/js/easyui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/js/easyui/themes/icon.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/panel.css">
<script type="text/javascript"> 
	$(function(){
		$.ajax({
			   type: "POST",
			   url: "stockinventory_querycount?status=0&kddh=3y",
			   success: function(msg){
				    //获取数量
					$("#j3y span").html(msg);
			   }
		});
		$.ajax({
			   type: "POST",
			   url: "stockinventory_querycount?status=1",
			   success: function(msg){
				    //获取数量
					$("#dfkid span").html(msg);
			   }
		});
		$.ajax({
			   type: "POST",
			   url: "stockinventory_querycount?status=2",
			   success: function(msg){
				    //获取数量
					$("#yfhid span").html(msg);
			   }
		});
		$.ajax({
			   type: "POST",
			   url: "stockinventory_querycount?status=0&kddh=-3y",
			   success: function(msg){
				    //获取数量
					$("#3yold span").html(msg);
			   }
		});
		//仓库
		$.ajax({
			   type: "POST",
			   url: "storehouse_querystorehomelist",
			   success: function(msg){
				   $("#selectid").html("");
				    //获取库房
				    $.each(msg, function(i){  
				    	$("<li id=\""+msg[i].sh_id+"\"><a href=\"#\" id=\""+msg[i].sh_id+"\">"+msg[i].sh_name+"</a></li>").appendTo("#selectid");
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
		$("#btnsearch").click(function(){
			var truename=$("#truename").val();
			var xdstartime=$("#txtStartTime").datebox("getValue");//入库启始时间
			var xdendtime=$("#txtEndTime").datebox("getValue");//入库结束时间
			var fkstratime=$("#txtPayTimeStart").datebox("getValue");//出库启始时间
			var fkendtime=$("#txtPayTimeEnd").datebox("getValue");//出库结束时间
			var statis=$("#statis").val();//状态
			var kddh="";//
			var kfids=$("#kfid").children("dt");
			var kfid=kfids.attr("id");
			$("#grid").datagrid('load',{
				"commodity.c_name":truename,
				"storeroom.s_id":kfid,
				"kddh":kddh,
				"status":statis,
				"xdstartime":xdstartime,
				"xdendtime":xdendtime,
				"fkstratime":fkstratime,
				"fkendtime":fkendtime,
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
					pagination:true,
					pageNumber:1,//初始化页号
					url : "${pageContext.request.contextPath}/stockinventory_getList",
					idField : 'si_id',
					columns : [[
					 	{
					 		field:'st_id',
					 		checkbox:true
					 	},{
					 		field:'commodity.c_name',
					 		title:'商品名称',
					 		align:'center',
					 		width:220,
					 		formatter:function(value,row,index){
					 			return row.commodity.c_name;
					 		}
					 	}
					 	,{
					 		field:'si_smsl',
					 		title:'库存',
					 		align:'center',
					 		width:150
					 	},{
					 		field:'dd',
					 		title:'库房',
					 		align:'center',
					 		width:150,
					 		formatter:function(value,row,index){
					 			var s=row.storeroom.storehouse.sh_name+" "+row.storeroom.s_name;
					 			return s;
					 		}
					 	}
					 	,{
					 		field:'a',
					 		title:'入库日期',
					 		align:'center',
					 		width:150,
					 		formatter:function(value,row,index){
					 			if(row.si_date!=null){
					 				var s=row.si_date.split("T");
						 			return s[0]+"  "+s[1];
					 			}
					 			return "";
					 			
					 		}
					 	}
					 	,{
					 		field:'d',
					 		title:'最后出库日期',
					 		align:'center',
					 		width:150,
					 		formatter:function(value,row,index){
					 			if(row.si_lastckdate!=null){
					 				var s=row.si_lastckdate.split("T");
						 			return s[0]+"  "+s[1];
					 			}
					 			return "";
					 			
					 		}
					 	}
					 	,{
					 		field:'si_bz',
					 		title:'描述',
					 		align:'center',
					 		width:150
					 	}    
					 ]]
				});
	});
	//获取库房
	function toqueryroom(id){
		$.ajax({
			   type: "POST",
			   url: "storeroom_querystoreroomlist?houseid="+id,
			   success: function(msg){
				   $("#selectroomid").html("");
				   $("#kfid").css("display","block");
				   $("#kfid").find("dt").html("请选择库房");
				    //获取库房
				    $.each(msg, function(){  
				    	$("<li id=\""+msg[0].s_id+"\"><a href=\"#\" id=\""+msg[0].s_id+"\">"+msg[0].s_name+"</a></li>").appendTo("#selectroomid");
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
    	$("#grid").datagrid('load',{
			"kddh":id+"y"
		});
	}
   //入库或出库
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
			"status":id
			
		});
	}
	//弹出打印内容
	function onplprintcontext(){
		var truename=$("#truename").val();
		var xdstartime=$("#txtStartTime").datebox("getValue");//入库启始时间
		var xdendtime=$("#txtEndTime").datebox("getValue");//入库结束时间
		var fkstratime=$("#txtPayTimeStart").datebox("getValue");//出库启始时间
		var fkendtime=$("#txtPayTimeEnd").datebox("getValue");//出库结束时间
		var statis=$("#statis").val();//状态
		var kfids=$("#kfid").children("dt");
		var kfid=kfids.attr("id");
	$.ajax({
		   type: "POST",
		   url: "csv_kcprintdata",
		   data: "truename="+truename+"&s_id="+kfid+"&xdstartime="+xdstartime+"&xdendtime="+xdendtime+"&fkstratime="+fkstratime+"&fkendtime="+fkendtime+"&status="+statis,
		   success: function(msg){
			   $("#contextid").remove();
			   if(msg!=null){
				   var htmlstr="<table id='contextid' cellpadding='3' cellspacing='0' style='background-color: #b9d8f3;border: 1px white solid;'>";
				   $.each(msg, function(i) {  
					   htmlstr+="<tr style='text-align: center;'>";
					  		htmlstr+="<td width='5%' style='border-bottom:1px white solid;border-right:1px white solid;'>"+msg[i].id+"</td>";
					  		htmlstr+="<td width='30%' style='border-bottom:1px white solid;border-right:1px white solid;'>"+msg[i].spname+"</td>";
					  		htmlstr+="<td width='10%' style='border-bottom:1px white solid;border-right:1px white solid;text-align:center;'>"+msg[i].kc+"</td>";
					  		htmlstr+="<td width='15%' style='border-bottom:1px white solid;border-right:1px white solid;text-align:center;'>"+msg[i].rktime+"</td>";
					  		htmlstr+="<td width='15%' style='border-bottom:1px white solid;border-right:1px white solid;text-align:center;'>"+msg[i].cktime+"</td>";
					  		htmlstr+="<td width='25%' style='border-bottom:1px white solid;'>"+msg[i].kf+"</td>";
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
	var truename=$("#truename").val();
	var xdstartime=$("#txtStartTime").datebox("getValue");//入库启始时间
	var xdendtime=$("#txtEndTime").datebox("getValue");//入库结束时间
	var fkstratime=$("#txtPayTimeStart").datebox("getValue");//出库启始时间
	var fkendtime=$("#txtPayTimeEnd").datebox("getValue");//出库结束时间
	var statis=$("#statis").val();//状态
	var kfids=$("#kfid").children("dt");
	var kfid=kfids.attr("id");
	$.ajax({
		   type: "POST",
		   url: "csv_exportkcData2CSV",
		   data: "truename="+truename+"&s_id="+kfid+"&xdstartime="+xdstartime+"&xdendtime="+xdendtime+"&fkstratime="+fkstratime+"&fkendtime="+fkendtime+"&status="+statis,
		   success: function(msg){
		   	    //清除选中
		   		$('#grid').datagrid('clearChecked');
		   		window.location.href=msg;
		   }
	});
}
   
</script>
</head>
<body class="easyui-layout" style="border-top-width:0px;">
	<div region="center" border="false">
		<div  style="border-top-width:0px;">
		<div class="topfl">
		 <a id="j3y" href="javascript:ontime(3,'j3y');">近三个月（<span>0</span>）</a> | <a id="dfkid" href="javascript:onstaic(1,'dfkid');">已入库（<span>0</span>）</a> | <a id="yfhid" href="javascript:onstaic(2,'yfhid');">已出库（<span>0</span>）</a> | <a id="3yold" href="javascript:ontime(-3,'3yold');">三个月前（<span>0</span>）</a> 
		</div>
		<input id="statis" value="0" type="hidden">
			<div class="serachdiv" style="z-index: 0;height: 100%;">
		<!-- 	订单编号:<input type="text" id="truename" name="" value="">
				<a id="btnsearch" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'">查询</a> -->
				<div style="text-align: left; ">
				<input type="hidden" id="selSettlementStatus" value="-1"/>
				<div style="float: left;">
                商品名称：<input name="txtOrderNo" type="text" maxlength="20" id="truename" class="txt200">&nbsp; 库存地址：
              </div>
              <div style="float: lfet;">
               	 <dl class="select" id="ckid" >
				   <dt>请选择仓库</dt>
					<dd>
					<ul id="selectid">
					</ul>
				</dd>
				</dl>
				 <dl class="select" style="margin-left: 135px;display: none;" id="kfid" >
				   <dt>请选择库房</dt>
					<dd>
					<ul id="selectroomid">
					</ul>
				</dd>
				</dl>
			</div>
                &nbsp;
                <br>
                <br>
                <div style="clear: both;padding-top: 10px;"></div>
                入库时间：<input name="txtStartTime" type="text" id="txtStartTime" readonly="readonly" class="easyui-datebox" maxlength="20">&nbsp;&nbsp;&nbsp;至&nbsp;
                <input name="txtEndTime" type="text" id="txtEndTime" readonly="readonly" maxlength="20" class="easyui-datebox" >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                出库时间：<input name="txtPayTimeStart" type="text" id="txtPayTimeStart" readonly="readonly"  class="easyui-datebox" maxlength="20">&nbsp;&nbsp;&nbsp;至&nbsp;
                <input name="txtPayTimeEnd" type="text" id="txtPayTimeEnd" readonly="readonly" maxlength="20" class="easyui-datebox" >&nbsp;
                <br>
                <br>
                <!-- <select name="selSettlementStatus" id="selSettlementStatus" class="ddl100">
					<option selected="selected" value="-1">-- 结算状态 --</option>
					<option value="0">待结算</option>
					<option value="1">已结算</option>
					<option value="255">无需结算</option>
				</select> -->
				  <div style="float: left;padding-top: 5px;">
                    <a id="btnsearch" href="#" class="easyui-linkbutton serachbtn" data-options="iconCls:'icon-search'">搜索</a>
                    <div class="t10"></div><div class="t10"></div>
                    </div>
                     <div style="float: left;margin-left: 5px;padding-top: 5px;">
                     <a id="btndc" href="javascript:onexpert();" class="easyui-linkbutton serachbtn" data-options="iconCls:'icon-redo'">导出搜索内容</a>
                    <div class="t10"></div><div class="t10"></div>
                    </div>
                     <div style="float: left;padding-bottom: 10px;;margin-left: 5px;padding-top: 5px;">
                    <a id="btnprint" href="javascript:onplprintcontext();" class="easyui-linkbutton serachbtn" data-options="iconCls:'icon-print'">打印搜索内容</a>
                    <div class="t10"></div><div class="t10"></div>
                    </div>
              </div>
			</div>
			<div style="height: 330px;clear: both;border-top:1px solid #aecaf1;margin-top: 10px;"id="tabstrid" >
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
			    <td width="5%">序号</td>
			    <td width="30%">商品名称</td>
			    <td width="10%">库存</td>
			    <td width="15%">入库时间</td>
			    <td width="15%">出库时间</td>
			    <td width="25%">库房</td>
			   </tr>
			 </table>
			 </div>
			 
			</div>
		</div>
	</div>
	
</body>
</html>