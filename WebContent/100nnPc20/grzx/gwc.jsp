<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="s" uri="/struts-tags"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>100南宁－快递超市</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="${pageContext.request.contextPath }/100nn/Supermarket/css/jiaofei.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/100nn/cj/alert/jquery.prompt.css">
</head>

<body style="overflow-y:auto;">
<!--[if !IE]> 内容|主内容开始 <![endif]-->
 <%@ include file="top_gwc.jsp"%>
  <div style="margin: 0 auto; width: 1002px;">
<div id="MianRight" style="overflow-x:hidden;overflow-y:auto;margin-bottom: 10px;">
   <div id="MianRight_z" style="height: auto;min-height: 380px;margin:0px;">
      <div id="MianRight_wz" style="background: #f0e9e3; border-top: 1px solid #bd0200;height: 40px;">
       
        <table width="100%" height="37" class="TableInfo">
      
            <tr>
                <td width="25"  class="quan"><input type="checkbox" name="DelAll"  value="全选2" id="qx1"/></td>
                <td width="40" align="left"  class="qx">全选</td> 
                <td align="center">商品</td>
                <td width="139" align="center">单价</td>
                <td width="124" align="center">数量</td>
                <td width="90" align="center">小计</td>
                <td width="121" align="center">操作</td>
            </tr>
        </table>
       
      </div>
      <div id="MianRight_wMian">
      <s:if test="#shoppingcarlist.size()>0">
    <!-- 重量：  --> <input type="hidden" id="zlid" value=""/>
<!--     商品价格 ： < --><input type="hidden" id="spjg" value=""/>
   <!--   邮费：  --><input type="hidden" id="shangpyf" value=""/>
       <!-- 总价格： --><input type="hidden" id="zjg" value=""/>
      <s:iterator value="#shoppingcarlist"  var="s" status="d">
      <input type="hidden" id='zl<s:property value="#s.sc_id"/>' class="yfclass" value='<s:property value="#s.commodity.c_zl"/>'/>
      <input type="hidden" id='djzl<s:property value="#s.sc_id"/>' value='<s:property value="#s.commodity.c_zl"/>'>
      <table width="100%" border="0" height="74" class="bg222">
      
  <tr>
   <td width="25" align="right" >
   	<input type="checkbox" name="che" value="<s:property value='#s.ordetail.o_id'/>" id="<s:property value='#s.sc_id'/>" onclick="doxz('<s:property value='#s.sc_id'/>');"/>
   	</td>
    <td width="80" align="center"><a href="qtcommodity_querycommodityinfo?c_id=<s:property value="#s.commodity.c_id"/>" target="_blank"><img src="imgss.jsp?file=<s:property value="#s.commodity.c_sltimg"/>" width="40" height="58" /></a></td>
    <td ><a style="color: #7c7c7c;" href="qtcommodity_querycommodityinfo?c_id=<s:property value="#s.commodity.c_id"/>" target="_blank"><s:property value="#s.commodity.c_name"/></a> </td>
    <td width="139" align="center" id="dj<s:property value='#s.sc_id'/>" >¥<s:property value="#s.ordetail.commodity.c_jg"/></td>
    <td width="124"  align="center" ><div class="SL"><div style="margin-left: 2px;float: left;cursor:pointer;" id="jian" onclick="numsum(-1,<s:property value='#s.sc_id'/>,<s:property value="#s.ordetail.commodity.c_jg"/>);">－</div><input class="kk" id="sl<s:property value='#s.sc_id'/>"  onBlur="jsdnum('<s:property value='#s.sc_id'/>');" name="Sex" value="<s:property value='#s.ordetail.o_num'/>"  width="39" height="19" /><div class="jia" style="cursor:pointer;" onclick="numsum(1,<s:property value="#s.sc_id"/>,<s:property value="#s.ordetail.commodity.c_jg"/>);"></div></div></td>
    <td width="90" align="center" class="jq" id="jq<s:property value='#s.sc_id'/>">￥<s:property value='#s.ordetail.o_zjg'/></td>
    <td width="121" align="center" class="dami"> <a onclick="ondelete('<s:property value='#s.sc_id'/>');" style="cursor:pointer;">删除</a></td>
  </tr>
</table>
</s:iterator>
</s:if>
<s:else>
<table width="100%" border="0" height="74" class="bg222">
      
  <tr>
   <td rowspan="7" align="center"><a href="${pageContext.request.contextPath }/100nnPc20/index.jsp" target="_blank">暂无选中商品，马上去挑选？</a></td>
  </tr>
</table>
</s:else>
      </div>
      
      <div id="MianRight_Wf" >
        <div id="MianRight_Wfl">
        <table width="100%" height="37" class="TableInfo1">
        <tr>
          <td width="23%"  class="quan"><input type="checkbox" name="DelAll"  value="全选2" id="qx2"/></td>
         <td width="28%" align="left"  class="qx">全选</td> 
	     <td width="49%" align="left"  class="plgl"><a href="#" onclick="onpldelete();">批量删除</a></td> 
        </tr>
        </table>
        </div>
       <div id="MianRight_Wfr">
       
      <div style="float: left;">
         <%-- <div id="MianRight_Wfr1" style="margin-top: 10px;margin-right: 50px;">
         <select>
          <option>请选择收货地址</option>
          <s:iterator value="#useraddress" var="s">
           <option value="#s.ua_address"><s:property value="#s.ua_address"/> </option>
          </s:iterator>
         </select>
         </div> --%>
        <div id="MianRight_Wfr1" style="margin-top: 1px;">已选<span class="bignum2" id="spsl">0</span>件商品</div>
        <div id="MianRight_Wfr2" style="width: 100px;line-height: 37px;font-weight: bold;margin-top: 1px;">
        	运费：<span class="bignum2" id="yfid">包邮</span>
        </div>
        <div id="MianRight_Wfr2" style="width: 150px;">总价(含运费)：<span class="bignum2" id="zj"></span></div>
        <div id="js"><a  id="jsbutton" title="立即结算" target="_blank" onclick="jsbutton();" style="cursor:pointer;">结算</a></div>
       </div>
    </div>
    
       
   </div>
 </div>
	</div>
</div>
<div style="margin-top: 10px; min-height: 175px;display: inline;">
 <%@ include file="../foot.jsp"%>
 </div>
</body>
<!-- 提示框 -->
<script type="text/javascript" src="${pageContext.request.contextPath }/100nn/cj/alert/jquery.prompt.min.js"></script>
<script type="text/javascript">
$(function(){
	 $
		.ajax({
			type : "POST",
			url : "shoppingcar_querygwccount",
			success : function(msgs) {
					$("#gwcid").html(msgs);
			}
		});
	var num="";
	if($("#spsl").val()==0){
		$("#js").css("background","#AAAAAA");
	}else{
		
		$(".jq").each(function() {
		   var n=String($(this).text());
		   var nn=n.substring(1);
	       num=Number(nn)+Number(num);
	    });
		
		$("#js").css("background","#ff9c00");
	}
	if(num==""){
		num="0.0";
	}
	$("#zj").html("¥"+num);
	
	
	
	var _jq_chk = $("#qx1");
	var _jqitems = $("input[type='checkbox']");
	var _jq_chk2 = $("#qx2");
	//全选与全不选一体实现
	_jq_chk.click(function(){
		
		//列表中选框和全选选框统一状态
	    _jqitems.add(_jq_chk).attr('checked', this.checked);
	    _jq_chk2.attr('checked', this.checked);
	  doxz("0"); 
	});
	//全选与全不选一体实现
	_jq_chk2.click(function(){
		//列表中选框和全选选框统一状态
	    _jqitems.add(_jq_chk2).attr('checked', this.checked);
	    _jq_chk.attr('checked', this.checked);
	    doxz("0");
	});

	//选框的点击事件
	 _jqitems.click(function(e){
	    //阻止冒泡,避免行点击事件中,直接选择选框无效
	   e.stopPropagation();
		//判断选中个数与实际个数是否相同,以确定全选/全不选状态
	    _jq_chk.attr('checked', _jqitems.size() == _jqitems.filter(':checked').size());
	    _jq_chk2.attr('checked', _jqitems.size() == _jqitems.filter(':checked').size());
	});

	
	

	//弹出框
	
	
	 $('#shdzid').change(function(){ 
		 var p1=$(this).children('option:selected').val();//这就是selected的值 
		 var p=$(this).children('option:selected');
		 }) ;

});

//数量加减事件
function numsum(ids,id,spjq){
	//数量
	var num=$("#sl"+id).val();
	//商品邮费
	//var yf=$("#shangpyf").val();
	//商品价格总（不含邮费）
	var spjg=$("#spjg").val();
	//商品总重量
	//var zlid=$("#zlid").val();
	//商品总价格
	var zjg=$("#zjg").val();
	//商品每个重量
	//var djzl=$("#djzl"+id).val();
	if(num==0){
		if(ids==1){
			num=Number(num)+1;
		}
	}else{
	if(ids==1){
		num=Number(num)+1;
	}else{
		if(num==1){
			
		}else{
		num=Number(num)-1;
		}
	}
	}
	//根据数量与商品单价  算出每条商品的总价
	$("#sl"+id).val(num);
	var jg=Number(num)*Number(spjq);
	$("#jq"+id).html("¥"+jg.toFixed(1));
	
	var zj="0.0";
	var zzl="";//总重量
	
	//循环获取选中商品的总价格   
	var checklist = document.getElementsByTagName("input");
 for ( var i = 0; i < checklist.length; i++) {
 if (checklist[i].type == "checkbox"
 && checklist[i].checked == true&&checklist[i].value!="全选2"&& checklist[i].id != "mrcheckbox"&& checklist[i].id != "no") {
	//判断是否选中处理结算值
				/* $("#jq"+$(this).attr("id")).each(function(){ */
					/* var d=$(this).attr("id");
					var dd=$("#jq"+d).text();
					var danzj=dd.substring(1);
					zj=Number(danzj)+Number(zj);
					 zj=zj.toFixed(1);  */
				/* }); */
	 var dgsum= String($("#jq"+checklist[i].id).text());
		var dgjg=dgsum.substring(1);
		
		zj=Number(dgjg)+Number(zj);
			}
			 
			} 
   /*  zj=Number(zj); */

	if(zj==""){
		zj="0.0";
	}
	$("#zj").html("¥"+zj);
	
}
function jsdnum(id){

	var num=$("#sl"+id).val();
	var dj=$("#dj"+id).text();
	var nn=dj.substring(1);
	var zj=Number(num)*Number(nn);
	zj=zj.toFixed(1);
	$("#jq"+id).html("¥"+zj);
	
	//循环获取选中商品的总价格   
	var checklist = document.getElementsByTagName("input");
 var sum=0;
 for ( var i = 0; i < checklist.length; i++) {
 if (checklist[i].type == "checkbox"
 && checklist[i].checked == true&&checklist[i].value!="全选2"&& checklist[i].id != "mrcheckbox"&& checklist[i].id != "no") {
	var dgsum= String($("#jq"+checklist[i].id).text());
	var dgjg=dgsum.substring(1);
	sum+= Number(dgjg);
 }
 }
 
	//选中商品价格
	$("#spjg").val(sum);
	//总价格
	$("#zjg").val(sum);
	//总价格html
	$("#zj").html("¥"+$("#zjg").val());
 
}

function ondelete(id){
	$.ajax({
		   type: "POST",
		   url: "shoppingcar_deletegwc",
		   data: "c_id="+id,
		   success: function(msgs){
			   if(msgs=="删除成功"){
				   layer.msg(msgs,3,1,"100px");
					location.reload();
			   }else{
					layer.msg(msgs);
			   } 
		   }
	});
	
}
//全选
function CheckAll(obj,cName){
	$("input[type=checkbox]").each(function() {
		if($(this).val()=="全选"||$(this).val()=="全选2"){
			if($(this).attr("checked")){
				$(this).attr("checked",false);
			}else{
				$(this).attr("checked",true);
			}
		}
		if($(this).attr("checked")){
			$(this).attr("checked",false);
		}else{
			$(this).attr("checked",true);
		}
		
	});
	 
	doxz("0"); 
}

//选择商品、单选或全选  结算按钮、商品数量、价钱修改
function doxz(status){
	//计算选中商品数量
	var num="0.0";
	//邮费
	//var yf="0.00";
	//重量
	//var  zl="0";

	//计算选商品总价，结算按钮、设置
	if($("#spsl").text()==0){
		$("#js").css("background","#AAAAAA");
		$("#shangpyf").val("0.0");
		$("#spjg").val("0.0");
		$("#zlid").val("0.0");
		$("#zjg").val(num);
		
	}
		if(status!="0"){
			$("#js").css("background","#ff9c00");
			if($("#"+status).attr("checked")){
			    var n=$("#jq"+status).text();
			    var nn=n.substring(1);
			    num=Number(nn)+Number(num);
			}
			
		}else{
			
		$(".jq").each(function() {
			   var n=String($(this).text());
			   var nn=n.substring(1);
		       num=Number(nn)+Number(num);
		       
		    });
			num=num.toFixed(1);
		}
	
	
	
	if(num==""){
		num="0.0";
	}
	
	//循环获取选中商品的总价格    选中商品数量
		var checklist = document.getElementsByTagName("input");
	 var id=0 ;
	 var sum=0;
	 for ( var i = 0; i < checklist.length; i++) {
	 if (checklist[i].type == "checkbox"
	 && checklist[i].checked == true&&checklist[i].value!="全选2"&& checklist[i].id != "mrcheckbox"&& checklist[i].id != "no") {
		id++; 
		var dgsum= String($("#jq"+checklist[i].id).text());
		var dgjg=dgsum.substring(1);
		sum+= Number(dgjg);
	 }
	 }
	 if(id>0){
		 $("#js").css("background","#ff9c00");
	 }else{
			$("#js").css("background","#AAAAAA"); 
	 }
	 //选中商品数量
	$("#spsl").html(id);
	//选中商品价格
	$("#spjg").val(sum);
	//总价格
	$("#zjg").val(sum);
	//总价格html
	$("#zj").html("¥"+$("#zjg").val());
}

//查询选中商品邮费
function jsyf(id,numno){
	$.ajax({
		   type: "POST",
		   url: "shoppingcar_jsyf",
		   data: "c_id="+id+"&numid="+numno,
		   success: function(msgs){
			   layer.msg(msgs);
		   }
	});
	
	
	
}
//批量删除
function onpldelete(){
	 var checklist = document.getElementsByTagName("input");
	 var id = "";
	 var mark = false;
	 for ( var i = 0; i < checklist.length; i++) {
	 if (checklist[i].type == "checkbox"
	 && checklist[i].checked == true) {
	 if (checklist[i].value != "" && checklist[i].value != "全选2"&& checklist[i].id != "mrcheckbox"&& checklist[i].id != "no") {
	 if (id == "") {
	 id = checklist[i].id;
	 mark = true;
	 } else {
	 id += "," + checklist[i].id;
	 }
	 }
	 }
	 }
	if(mark){
		$.ajax({
			   type: "POST",
			   url: "shoppingcar_deletegwc",
			   data: "c_id="+id,
			   success: function(msgs){
				   if(msgs=="删除成功"){
					   layer.msg(msgs,3,1,"100px");
					   location.reload();   
				   }else{
					   layer.msg(msgs);
				   } 
			   }
		});
	}else{
		layer.msg("请选择需删除的商品");
		
	}
}
//结算
function jsbutton(){
	var jg=$("#zj").text();
	var num=$("#spsl").text();
	if(num=="0"&&jg=="¥0.0"){
		layer.msg("请选择结算商品");
	}else{
		 var checklist = document.getElementsByTagName("input");
		 var id = "";
		 var mark = false;
		 var num="";//选中结算的商品数量
		 var numstr="";
		 for ( var i = 0; i < checklist.length; i++) {
		 if (checklist[i].type == "checkbox"
		 && checklist[i].checked == true) {
		 if (checklist[i].value != "" && checklist[i].value != "全选2"&& checklist[i].id != "mrcheckbox"&& checklist[i].id != "no") {
			 num=document.getElementById("sl"+checklist[i].id).value;
			 if(num>0){
				 if(numstr==""){
				 	numstr=num;
				 	mark= true;
				 }else{
					 numstr+=","+num; 
				 }
				 if (id == "") {
					 id = checklist[i].value;
					 mark = true;
					 } else {
					 id += "," + checklist[i].value;
					 }
			 }else{
				 mark=false;
			 }
		 }
		 }
		 }
		if(mark){
			location.href="shoppingcar_qrorder?c_id="+id+"&numid="+numstr;
		}else{
			layer.msg("请选择结算商品");
		}
	}
}
</script>
</html>