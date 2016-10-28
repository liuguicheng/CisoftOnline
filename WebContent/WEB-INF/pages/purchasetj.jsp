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
<script type="text/javascript" src="${pageContext.request.contextPath }/js/100nnht/cgtj_orders.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/100nnht/cgtj_dfk.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/100nnht/cgtj_th.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/100nnht/cgtj_sh.js"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/js/easyui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/js/easyui/themes/icon.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/panel.css">
<script type="text/javascript"> 
$(function(){
	var l=0;
	$('.navs_li').click(function(){
		$(this).siblings().removeClass('on');
		$(this).addClass('on');
		var i=$(this).index();	
		var a1=160*i;	
		$(".s_line").animate({left:a1},200);
		var index = $(".navs_li").index($(this));
		$(".item_tab").hide();
		$(".item_tab").eq(index).show();
		if(i==1){
			ongrid();
		}else if(i==2){
			onloadth();
		}else if(i==3){
			onshtisd();
		}
	});	
});
</script>
</head>
<body class="easyui-layout" style="border-top-width:0px;">
	<div region="center" border="false">
		<div class="box_163css">
	    <ul class="nav" style="-webkit-padding-start:0px;">
	        <li class="navs_li on">订单统计</li>
	        <li class="navs_li">付款统计</li>
	        <li class="navs_li">退货统计</li>
	        <li class="navs_li">收货统计</li>
	    </ul>
	    <div class="line">
	    	<span class="s_line">	    		
				<b></b>
	    	</span>
			<div style="clear: both;"></div>
		</div>		
		<div style="clear: both;"></div>
	</div>
	
	<div class="zlbox_content">
		<div class="item_tab" style="display: block;">
		 <!-- 订单table 开始 -->
		   <div  style="border-top-width:0px;margin-top: 4px;">
			<div class="topfl">
		<a id="or_today" href="javascript:ontime(0,'or_today');">今日（<span>0</span>）</a>  | <a id="or_3y" href="javascript:ontime(3,'or_3y');">近三个月（<span>0</span>）</a>  | <a id="or_f3y" href="javascript:ontime(-3,'or_f3y');">三个月前（<span>0</span>）</a> 
		</div>
			<div class="serachdiv" >
		<!-- 	订单编号:<input type="text" id="truename" name="" value="">
				<a id="btnsearch" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'">查询</a> -->
				<div style="text-align: left; ">
				<input type="hidden" id="selSettlementStatus" value="-1"/>
				<div style="float: left;">
                采购编号：<input name="txtOrderNo" type="text" maxlength="20" id="truename" class="txt200">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 仓库库房：
                </div>
                 <div style="float: lfet;">
               	 <dl class="select" id="ckid">
				   <dt id="-1">请选择仓库</dt>
					<dd>
					<ul id="or_selectid">
					</ul>
				</dd>
				</dl>
				 <dl class="select" style="margin-left: 135px;display: none;" id="or_kfid" >
				   <dt>请选择库房</dt>
					<dd>
					<ul id="or_selectroomid">
					</ul>
				</dd>
				</dl>
			</div>
                <br>
                <br>
                <div style="clear: both;padding-top: 10px;"></div>
                <div style="float: left;">
                采购时间：<input name="txtStartTime" type="text" id="txtStartTime" readonly="readonly" class="easyui-datebox" maxlength="20">&nbsp;&nbsp;&nbsp;至&nbsp;
                <input name="txtEndTime" type="text" id="txtEndTime" readonly="readonly" maxlength="20" class="easyui-datebox" >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                采购人：
                </div>
                 <div style="float: left;">
                <dl class="select">
				   <dt id="-1">请选择采购人</dt>
					<dd>
					<ul id="cgrid">
					</ul>
				</dd>
				</dl>
				</div>
				&nbsp;&nbsp;
				<div style="float: left;margin-left: 150px;">
				<div style="float: left;padding-top: 6px;">
				状态：
				</div>
 				<div style="float: left;">
				<dl class="select" id="or_zt_id">
				   <dt id="0">请选择状态</dt>
					<dd>
					<ul id="or_zt">
					 <li ><a href="#" id="0">不选择</a></li>
					 <li ><a href="#" id="1">未付款</a></li>
					 <li ><a href="#" id="2">未收货</a></li>
					 <li ><a href="#" id="3">已入库</a></li>
					 <li ><a href="#" id="4">已退货</a></li>
					 
					</ul>
				</dd>
				</dl>
				</div>
				</div>&nbsp;&nbsp;
                <br>
                <br>
                <!-- <select name="selSettlementStatus" id="selSettlementStatus" class="ddl100">
					<option selected="selected" value="-1">-- 结算状态 --</option>
					<option value="0">待结算</option>
					<option value="1">已结算</option>
					<option value="255">无需结算</option>
				</select> -->
				  <div style="float: left;margin-top: 10px;">
                    <a id="or_btnsearch" href="#" class="easyui-linkbutton serachbtn" data-options="iconCls:'icon-search'">搜索</a>
                    <div class="t10"></div><div class="t10"></div>
                    </div>
                     <div style="float: left;margin-left: 5px;margin-top: 10px;">
                     <a id="or_btndc" href="javascript:or_onexpert();" class="easyui-linkbutton serachbtn" data-options="iconCls:'icon-redo'">导出搜索内容</a>
                    <div class="t10"></div><div class="t10"></div>
                    </div>
                     <div style="float: left;padding-bottom: 10px;;margin-left: 5px;margin-top: 10px;">
                    <a id="or_btnprint" href="javascript:or_onplprintcontext();" class="easyui-linkbutton serachbtn" data-options="iconCls:'icon-print'">打印搜索内容</a>
                    <div class="t10"></div><div class="t10"></div>
                    </div>
              </div>
			</div>
			<div style="height: 330px;clear: both;border-top:1px solid #aecaf1;"id="tabstridsss" >
				<table id="grid"></table>
			</div>
			<div id="or_plprint" style="display: none;" title="搜索内容打印" iconCls="icon-search">
			<div style="margin-left: 45%;padding-top: 10px;padding-bottom: 10px;">
			   <a id="or_btnprints" href="javascript:or_onplprint();" class="easyui-linkbutton serachbtn" data-options="iconCls:'icon-print'">打印</a>
                    <div class="t10"></div><div class="t10"></div>
			 </div>
			 <div id="or_plprintcontext">
			 <table  id="or_tbodydiv" border="0" cellpadding="3" cellspacing="1" width="100%" align="center" style="background-color: #b9d8f3;">
			   <tr  style="text-align: center; COLOR: #0076C8; BACKGROUND-COLOR: #F4FAFF; font-weight: bold;">
			    <td width="10%">序号</td>
			    <td width="25%">采购单号</td>
			    <td width="35%">采购时间</td>
			    <td width="20%">采购库房</td>
			    <td width="10%">采购单状态</td>
			   </tr>
			 </table>
			 </div>
			 
			</div>
		</div>
		<!-- 订单table 结束 -->
		
		</div>
		<div class="item_tab" style="display: none;">
		    <!-- 付款table 开始 -->
		   <div  style="border-top-width:0px;margin-top: 4px;">
			<div class="topfl">
		<a id="fk_today" href="javascript:fk_ontime(0,'fk_today');">今日（<span>0</span>）</a>  | <a id="fk_j3y" href="javascript:fk_ontime(3,'fk_j3y');">近三个月（<span>0</span>）</a>  | <a id="fk_3yold" href="javascript:fk_ontime(-3,'fk_3yold');">三个月前（<span>0</span>）</a> 
		</div>
			<div class="serachdiv" >
		<!-- 	订单编号:<input type="text" id="truename" name="" value="">
				<a id="btnsearch" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'">查询</a> -->
				<div style="text-align: left; ">
				<input type="hidden" id="selSettlementStatus" value="-1"/>
				<div style="float: left;">
                采购编号：<input name="txtOrderNo" type="text" maxlength="20" id="fkno" class="txt200">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 付款方式：
                </div>
                 <div style="float: lfet;">
               	 <dl class="select" id="fkfsid">
				   <dt id="0">请选择付款方式</dt>
					<dd>
					<ul id="fkfsulid">
					 <li> <a href="#" id="1">网银转账</a></li>
					 <li> <a href="#" id="2">现金支付</a></li>
					</ul>
				</dd>
				</dl>
			</div>
                <br>
                <br>
                <div style="clear: both;padding-top: 10px;"></div>
                <div style="float: left;">
                付款时间：<input name="txtStartTime" type="text" id="fk_txtStartTime" readonly="readonly" class="easyui-datebox" maxlength="20">&nbsp;&nbsp;&nbsp;至&nbsp;
                <input name="txtEndTime" type="text" id="fk_txtEndTime" readonly="readonly" maxlength="20" class="easyui-datebox" >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                </div>
                <br>
                <br>
				  <div style="float: left;margin-top: 10px;">
                    <a id="fk_btnsearch" href="#" class="easyui-linkbutton serachbtn" data-options="iconCls:'icon-search'">搜索</a>
                    <div class="t10"></div><div class="t10"></div>
                    </div>
                     <div style="float: left;margin-left: 5px;margin-top: 10px;">
                     <a id="fk_btndc" href="javascript:fk_onexpert();" class="easyui-linkbutton serachbtn" data-options="iconCls:'icon-redo'">导出搜索内容</a>
                    <div class="t10"></div><div class="t10"></div>
                    </div>
                     <div style="float: left;padding-bottom: 10px;;margin-left: 5px;margin-top: 10px;">
                    <a id="fk_btnprint" href="javascript:fk_onplprintcontext();" class="easyui-linkbutton serachbtn" data-options="iconCls:'icon-print'">打印搜索内容</a>
                    <div class="t10"></div><div class="t10"></div>
                    </div>
              </div>
			</div>
			<div style="height:330px;clear: both;border-top:1px solid #aecaf1;" id="tabstrid">
				<table id="gridcjsjiennfd" ></table>
			</div>
			<div id="fktjjsdf_plprint" style="display: none;" title="搜索内容打印" iconCls="icon-search">
			<div style="margin-left: 45%;padding-top: 10px;padding-bottom: 10px;">
			   <a id="fk_btnprintsssssssss" href="javascript:fk_onplprint();" class="easyui-linkbutton serachbtn" data-options="iconCls:'icon-print'">打印</a>
                    <div class="t10"></div><div class="t10"></div>
			 </div>
			 <div class="fktjcontext">
			 <table  id="fk_tbodydivssss" border="0" cellpadding="3" cellspacing="1" width="100%" align="center" style="background-color: #b9d8f3;">
			   <tr  style="text-align: center; COLOR: #0076C8; BACKGROUND-COLOR: #F4FAFF; font-weight: bold;">
			    <td width="10%">序号</td>
			    <td width="25%">采购单号</td>
			    <td width="35%">付款金额</td>
			    <td width="20%">付款时间</td>
			    <td width="10%">备注</td>
			   </tr>
			 </table>
			 </div>
			 
			</div>
		</div>
		<!-- 付款table 结束 -->
		
		
		
		</div>
		<div class="item_tab" style="display: none;">
		   <!-- 退货table 开始 -->
		   <div  style="border-top-width:0px;margin-top: 4px;">
			<div class="topfl">
		<a id="th_today" href="javascript:th_ontime(0,'th_today');">今日（<span>0</span>）</a>  | <a id="th_3y" href="javascript:th_ontime(3,'th_3y');">近三个月（<span>0</span>）</a>  | <a id="th_old3y" href="javascript:th_ontime(-3,'th_old3y');">三个月前（<span>0</span>）</a> 
		</div>
			<div class="serachdiv" >
		<!-- 	订单编号:<input type="text" id="truename" name="" value="">
				<a id="btnsearch" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'">查询</a> -->
				<div style="text-align: left; ">
				<input type="hidden" id="selSettlementStatus" value="-1"/>
				<div style="float: left;">
                采购编号：<input name="txtOrderNo" type="text" maxlength="20" id="th_cgbh" class="txt200">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <!-- 退货人： -->
                </div>
                <!--  <div style="float: lfet;">
               	 <dl class="select">
				   <dt>请选择退货人</dt>
					<dd>
					<ul id="selectid">
					</ul>
				</dd>
				</dl>
			</div> -->
                <!-- <br>
                <br>
                <div style="clear: both;padding-top: 10px;"></div> -->
                <div style="float: left;">
                退货时间：<input name="txtStartTime" type="text" id="th_txtStartTime" readonly="readonly" class="easyui-datebox" maxlength="20">&nbsp;&nbsp;&nbsp;至&nbsp;
                <input name="txtEndTime" type="text" id="th_txtEndTime" readonly="readonly" maxlength="20" class="easyui-datebox" >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                </div>
                <br>
                <br>
                <!-- <select name="selSettlementStatus" id="selSettlementStatus" class="ddl100">
					<option selected="selected" value="-1">-- 结算状态 --</option>
					<option value="0">待结算</option>
					<option value="1">已结算</option>
					<option value="255">无需结算</option>
				</select> -->
				  <div style="float: left;margin-top: 10px;">
                    <a id="th_btnsearch" href="#" class="easyui-linkbutton serachbtn" data-options="iconCls:'icon-search'">搜索</a>
                    <div class="t10"></div><div class="t10"></div>
                    </div>
                     <div style="float: left;margin-left: 5px;margin-top: 10px;">
                     <a id="th_btndc" href="javascript:th_onexpert();" class="easyui-linkbutton serachbtn" data-options="iconCls:'icon-redo'">导出搜索内容</a>
                    <div class="t10"></div><div class="t10"></div>
                    </div>
                     <div style="float: left;padding-bottom: 10px;;margin-left: 5px;margin-top: 10px;">
                    <a id="th_btnprint" href="javascript:th_onplprintcontext();" class="easyui-linkbutton serachbtn" data-options="iconCls:'icon-print'">打印搜索内容</a>
                    <div class="t10"></div><div class="t10"></div>
                    </div>
              </div>
			</div>
			<div style="height: 330px;clear: both;border-top:1px solid #aecaf1;" >
				<table id="th_girds"></table>
			</div>
			<div id="th_plprint" style="display: none;" title="搜索内容打印" iconCls="icon-search">
			<div style="margin-left: 45%;padding-top: 10px;padding-bottom: 10px;">
			   <a id="th_btnprint_id" href="javascript:th_onplprint();" class="easyui-linkbutton serachbtn" data-options="iconCls:'icon-print'">打印</a>
                    <div class="t10"></div><div class="t10"></div>
			 </div>
			 <div id="th_printcontext">
			 <table  id="tbodydiv" border="0" cellpadding="3" cellspacing="1" width="100%" align="center" style="background-color: #b9d8f3;">
			   <tr  style="text-align: center; COLOR: #0076C8; BACKGROUND-COLOR: #F4FAFF; font-weight: bold;">
			    <td width="10%">序号</td>
			    <td width="25%">采购单号</td>
			    <td width="20%">退货时间</td>
			    <td width="10%">退回人</td>
			    <td width="30%">备注</td>
			   </tr>
			 </table>
			 </div>
			 
			</div>
		</div>
		<!-- 退货table 结束 -->
		 
		
		</div>
		<div class="item_tab" style="display: none;">
		   <!-- 收货table 开始 -->
		   <div  style="border-top-width:0px;margin-top: 4px;">
			<div class="topfl">
		<a id="sh_today" href="javascript:sh_ontime(0,'sh_today');">今日（<span>0</span>）</a>  | <a id="sh_3y" href="javascript:sh_ontime(3,'sh_3y');">近三个月（<span>0</span>）</a>  | <a id="sh_old3y" href="javascript:sh_ontime(-3,'sh_old3y');">三个月前（<span>0</span>）</a> 
		</div>
			<div class="serachdiv" style="margin-bottom: 5px;">
		<!-- 	订单编号:<input type="text" id="truename" name="" value="">
				<a id="btnsearch" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'">查询</a> -->
				<div style="text-align: left; ">
				<input type="hidden" id="selSettlementStatus" value="-1"/>
				<div style="float: left;">
                采购编号：<input name="txtOrderNo" type="text" maxlength="20" id="sh_no" class="txt200">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                </div>
                收货时间：<input name="txtStartTime" type="text" id="sh_txtStartTime" readonly="readonly" class="easyui-datebox" maxlength="20">&nbsp;&nbsp;&nbsp;至&nbsp;
                <input name="txtEndTime" type="text" id="sh_txtEndTime" readonly="readonly" maxlength="20" class="easyui-datebox" >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                </div>
                   <br/>
				  <div style="float: left;margin-top: 5px;">
                    <a id="sh_btnsearch" href="#" class="easyui-linkbutton serachbtn" data-options="iconCls:'icon-search'">搜索</a>
                    <div class="t10"></div><div class="t10"></div>
                    </div>
                     <div style="float: left;margin-left: 5px;margin-top: 5px;">
                     <a id="sh_btndc" href="javascript:sh_onexpert();" class="easyui-linkbutton serachbtn" data-options="iconCls:'icon-redo'">导出搜索内容</a>
                    <div class="t10"></div><div class="t10"></div>
                    </div>
                     <div style="float: left;padding-bottom: 10px;;margin-left: 5px;margin-top: 5px;">
                    <a id="sh_btnprint" href="javascript:sh_onplprintcontext();" class="easyui-linkbutton serachbtn" data-options="iconCls:'icon-print'">打印搜索内容</a>
                    <div class="t10"></div><div class="t10"></div>
                    </div>
              </div>
			</div>
			<div style="height: 330px;clear: both;border-top:1px solid #aecaf1;" >
				<table id="shgrids"></table>
			</div>
			<div id="sh_plprint" style="display: none;" title="搜索内容打印" iconCls="icon-search">
			<div style="margin-left: 45%;padding-top: 10px;padding-bottom: 10px;">
			   <a id="sh_btnprint_id" href="javascript:sh_onplprint();" class="easyui-linkbutton serachbtn" data-options="iconCls:'icon-print'">打印</a>
                    <div class="t10"></div><div class="t10"></div>
			 </div>
			 <div id="sh_plprintcontext">
			 <table  id="sh_tbodydiv" border="0" cellpadding="3" cellspacing="1" width="100%" align="center" style="background-color: #b9d8f3;">
			   <tr  style="text-align: center; COLOR: #0076C8; BACKGROUND-COLOR: #F4FAFF; font-weight: bold;">
			    <td width="10%">序号</td>
			    <td width="20%">订单编号</td>
			    <td width="20%">收货时间</td>
			    <td width="10%">收货人</td>
			    <td width="40%">备注</td>
			   </tr>
			 </table>
			 </div>
			 
			</div>
		</div>
		<!-- 收货table 结束 -->
		
		
		</div>
	</div>
		
		
		
	</div>
	
</body>
</html>