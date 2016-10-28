<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>      
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- <meta name="viewport" content="width=device-width, initial-scale=1"> -->
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0;" name="viewport" />
<title>100NN同城快递超市</title>
		<link href="img/favicon.ico" rel="shortcut icon" type="image/x-icon">
<!--<link href="js/jquerymobile/jquery.mobile-1.4.0.min.css" rel="stylesheet" type="text/css" />-->
<link href="${pageContext.request.contextPath }/100nnwx/js/jquerymobile/zt/jquery.mobile-1.4.0.min.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath }/100nnwx/css/SecurityCenter.css" rel="stylesheet" type="text/css" />
<style type="text/css">
#zwid a{
text-decoration: none;color: rgb(123,123,123);
}
#zwid a:hover{
text-decoration: none;color:#333;
}
</style>

</head>
<body>
	<div data-role="page" style="background:#FFF;">
		<div data-role="header" class="Top" style=" background:#8bc563; color:#FFF;text-shadow: 0 0 0 #eee;">
        <div class="Top_return"><a href="javascript:history.go(-1);" target="_self"><img src="${pageContext.request.contextPath }/100nnwx/img/return_button.gif" width="57" height="24"></a></div>
        购物车
        <div class="Top_user_center"><!--<a href="#" target="_self"><img src="img/user_center.gif" width="32" height="30"></a>--></div>
        </div>
        <div class="Mian_GwcTitle">
           <!--  <div class="ui-checkbox" style="margin:0; padding-top:10px;">
                <label for="checkbox-enhanced" class="ui-btn ui-corner-all ui-btn-inherit ui-btn-icon-left ui-checkbox-off" style="background:#f0f0f0; border:0;" >全选</label>
                <input type="checkbox" name="checkbox-enhanced" id="checkbox-enhanced" data-enhanced="true" >
            </div> -->
            <div style="float: left;margin-top: 20px;margin-left: 6%;">
             <input type="checkbox"  value="0" id="qx"   >
            </div>
            <div style="float: left;margin-left:12%;">全选</div>
            <span>全部商品(<s:property value="shoppingCartlist.size()"/>)</span>
        </div>
		<div role="main" class="ui-content" style="padding-top:0;">
			<form action="weixin_login" method="post" id="form1" name="form1">
				<s:if test="shoppingCartlist.size()>0">
				<s:iterator value="shoppingCartlist">
				<table style="width: 100%;">					
					<!-- <tr>
						<td>
                        	<div class="Mian_GwcCpTitle" >
                            	<div class="ui-checkbox" style="margin:0;">
                                <form>
                                	<label style="background:#FFF; border:0;">
        								<input type="checkbox" name="checkbox-0 ">
    								</label>
                                </form>  
            					</div>
                            </div>
						</td>
					</tr> -->
                    <tr>
                    	<td>
                        	<table class="Mian_GwcCpmian">
                            	<tr>
                                	<td width="35"  valign="top" style="position:relative;">
                                       <%--  <div class="ui-checkbox" style="margin:0;position:absolute; left:-2px; top:-9px; z-index:1;">
    											<label style="background:#FFF; border:0;">
                                                    <input type="checkbox" name="checkbox-0" title='<s:property value="ordetail.o_id"/>' value="<s:property value="commodity.c_jg"/>" id="checks<s:property value="sc_id"/>" onclick="onselects(<s:property value="sc_id"/>)"/>
                                                </label>
                                        </div> --%>
                                                     <input type="checkbox"  title='<s:property value="ordetail.o_id"/>' value="<s:property value="commodity.c_jg"/>" id="checks<s:property value="sc_id"/>" onclick="onselects(<s:property value="sc_id"/>)" class="selec"  >
                                	</td>
                                    <td  valign="top">
                                    	<div class="Mian_GwcCpmian_font">
                                        	<table cellpadding="0" cellspacing="0" class="Mian_GwcCpmian_font_table">
                                            	<tr>
                                            		<td width="80" height="80" style="position:relative; min-height:80px;"><div class="Mian_GwcCpmian_font_tableCPImg"><img src="${pageContext.request.contextPath }/imgss.jsp?file=<s:property value="commodity.c_sltimg"/> " width="80" height="80"></div></td>
                                                    <td valign="top" class="Mian_GwcCpmian_font_tableCPFont"><s:property value="commodity.c_name"/> </td>
                                                </tr>
                                            </table>
                                            <div class="Mian_GwcCpmian_font_jg">
                                            	￥<s:property value="commodity.c_jg"/>
                                                <div class="Mian_GwcCpmian_font_jgButton">
                                                	<div class="Mian_GwcCpmian_font_jgButtonT"><img src="${pageContext.request.contextPath }/100nnwx/img/jian.jpg" width="43" height="45" id="jian<s:property value="sc_id"/>" onclick="sh(1,<s:property value="sc_id"/>);" style="cursor: pointer;"></div>
                                                    <div class="Mian_GwcCpmian_font_jgButtons" style="width: 50px;"><input type="text" style="width: 50px;vertical-align:middle;" value='<s:property value="ordetail.o_num"/>' id="ds<s:property value="sc_id"/>" onblur="sh(3,<s:property value="sc_id"/>)"   onkeyup="value=value.replace(/[^\d]/g,'')" onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d]/g,''))" readonly="readonly"></div>
                                                    <div class="Mian_GwcCpmian_font_jgButtonT"><img src="${pageContext.request.contextPath }/100nnwx/img/jia_1.jpg" width="43" height="45" id="jia<s:property value="sc_id"/>" onclick="sh(2,<s:property value="sc_id"/>);" style="cursor: pointer;"></div>
                                                </div>
                                            </div>
                                        </div>
                                    </td>
                                <tr>
                            </table>
                        </td>
                    </tr>
                    
				</table>
				</s:iterator>
				</s:if>
				<s:else>
				<div style="text-align: center;margin-top: 45px;margin-bottom: 20px;" id="zwid"><a  href="${pageContext.request.contextPath }/towxpage.jsp" target="_parent">购物车暂无商品，马上去逛逛？</a></div>
				</s:else>
			</form>
		</div>
<!--         <div class="Mian_GwcCpfg"></div> -->
     <!--    <div class="Mian_GwcCpFootn">
        	<table style="width: 100%;">					
					<tr>
						<td>
                        	<div class="Mian_GwcCpTitle" style="border-bottom:0;" >
                            	<div class="ui-checkbox" style="margin:0;">
                                <form>
                                	<label style="background:#FFF; border:0;">
        								<input type="checkbox" name="checkbox-0 ">力拓农产品
    								</label>
                                </form>                               
            					</div>
                            </div>
						</td>
					</tr>
             </table>
        </div> -->
         <div class="Mian_GwcCpFootJs">
        	<table cellpadding="0" cellspacing="0">
            	<tr>
                	<td>
                    	<div class="Mian_GwcCpFootJs_title">
                        	<div class="Mian_GwcCpFootJs_titleLeft">总金额</div>
                            <div class="Mian_GwcCpFootJs_titleLeft1"><label style="float: left;">￥</label><label style="float: left;" id="zje">0.0</label></div>
                        </div>
                        <div class="Mian_GwcCpFootJs_title"><span><label style="float: left;">已选出</label><label id="zsl" style="float: left;">0</label><label style="float: left;">件商品</label></span></div>
                    </td>
                    <td width="100">
                    	<div class="Mian_GwcCpFootJs_button" style="text-shadow: 0 0 0 #000;"><a href="javascript:void(-1);"  id="jsid" onclick="jsbutton();" target="_self" data-rel="dialog">结算</a></div>
                    </td>
                </tr>
            </table>
        </div> 
<!--        <div data-role="footer">
		</div>-->
	</div>
</body>
<script type="text/javascript" src="${pageContext.request.contextPath }/100nnwx/js/jquery-1.8.3.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/100nnwx/js/jquerymobile/jquery.mobile-1.4.0.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	var flog=0;
	var _jq_chk = $("#qx");
	var _jqitems = $("input[type='checkbox']");
	//全选与全不选一体实现
	_jq_chk.click(function(){
		//列表中选框和全选选框统一状态
		
		if(flog==0){
	    _jqitems.add(_jq_chk).attr('checked','checked');
	    flog=1;
		}else{
			 _jqitems.add(_jq_chk).attr('checked',false);
			flog=0;
		}
		onqx();
	});

	//选框的点击事件
	_jqitems.click(function(e){
	    //阻止冒泡,避免行点击事件中,直接选择选框无效
	    e.stopPropagation();
		//判断选中个数与实际个数是否相同,以确定全选/全不选状态
	    _jq_chk.attr('checked', _jqitems.size() == _jqitems.filter(':checked').size());
	});
});
function onqx(){
	var i=0;
	var zje="0";
	$(".selec").each(function() {
		
		var  lsidstr=(($(this).attr("id")).split("checks"))[1];
		 var lsid=lsidstr.split(",");
		if($(this).attr("checked")=="checked"){
			i=Number(i)+Number(1);
			var gdj=$(this).val();
			var gds=$("#ds"+lsid).val();
            var qtje=Number(gdj)*Number(gds);
			zje=Number(zje)+Number(qtje);	
		}
	});
	if(i==0){
		$("#zje").html("0");
		$(".Mian_GwcCpFootJs_button").css("background","#ddd");
		$(".Mian_GwcCpFootJs_button a").css("color","#000000");
	}else{
		$(".Mian_GwcCpFootJs_button").css("background","#8ac463");
		$(".Mian_GwcCpFootJs_button a").css("color","#FFF");
		
	}
    var	lszje=Number(~~(zje * 100) / 100);
	$("#zje").html(lszje);
	$("#zsl").html(i);//总数量
}
//单选商品复选框事件
function onselects(id){
	var dj=$("#checks"+id).val();//单价
	var ds=$("#ds"+id).val();//单数
	var zje=$("#zje").text();//总金额
	var zsl=$("#zsl").text();//总数量
	if($("#checks"+id).attr("checked")=="checked"){
		var lszje=Number(dj)*Number(ds);
		lszje=Number(lszje)+Number(zje);
		$("#zje").html(~~(lszje * 100) / 100);
		var lszsl=Number(1)+Number(zsl);
		$("#zsl").html(lszsl);
	}else {
		if(Number(zje)>0){
		var lszje=Number(dj)*Number(ds);
		lszje=Number(zje)-Number(lszje);
		$("#zje").html( ~~(lszje * 100) / 100);
		var lszsl=Number(zsl)-Number(1);
		$("#zsl").html(lszsl);
		}
	}
	zsl=$("#zsl").text();
	if(zsl=="0"){
		$("#zje").html("0");
		$(".Mian_GwcCpFootJs_button").css("background","#ddd");
		$(".Mian_GwcCpFootJs_button a").css("color","#000000");
	}else{
		$(".Mian_GwcCpFootJs_button").css("background","#8ac463");
		$(".Mian_GwcCpFootJs_button a").css("color","#FFF");
		
	}
	
}
//点击加减  算数量
function sh(num,id){
	var ds=$("#ds"+id).val();//单数
	var dj=$("#checks"+id).val();//单价
	var zje=$("#zje").text();//总金额
	var zsl=$("#zsl").text();//总数量'
	var lszje="0";
	if(num==1){
		//减数
		if(ds>1){
		$("#ds"+id).val(Number(ds)-Number(1));
		}else{
			$("#ds"+id).val(1);
		}
		var ds=$("#ds"+id).val();//单数
		if($("#checks"+id).attr("checked")=="checked"){
			lszje=Number(dj)*Number(ds); //单个商品价格
		}
		var zje="0";
		$(".selec").each(function() {
			var  lsidstr=(($(this).attr("id")).split("checks"))[1];
			 var lsid=lsidstr.split(",");
			if($(this).attr("checked")=="checked"){
				var gdj=$(this).val();
				var gds=$("#ds"+lsid).val();
                var qtje=Number(gdj)*Number(gds);
				zje=Number(zje)+Number(qtje);	
			}
		});
		lszje=Number(~~(zje * 100) / 100);
		$("#zje").html(lszje);
	}else if(num==2){
		//加数量
		$("#ds"+id).val(Number(ds)+Number(1));
		ds=$("#ds"+id).val();//单数
		var lszje="0";
		if($("#checks"+id).attr("checked")=="checked"){
			lszje=Number(dj)*Number(ds);
		}
			var zje="0";
			$(".selec").each(function() {
				var  lsidstr=(($(this).attr("id")).split("checks"))[1];
				 var lsid=lsidstr.split(",");
				if($(this).attr("checked")=="checked"){
					if(("checks"+id)!=$(this).attr("id")){
					var gdj=$(this).val();
					var gds=$("#ds"+lsid).val();
                    var qtje=Number(gdj)*Number(gds);
					zje=Number(zje)+Number(qtje);	
					}
				}
			});
			zje=Number(zje)+Number(lszje);
			lszje=Number(~~(zje * 100) / 100);
			$("#zje").html(lszje);
	}else if(num==3){
		//直接输入数字
		if(Number(ds)<=Number(0)){
			$("#ds"+id).val(1);
			var ds=$("#ds"+id).val();//单数
			if($("#checks"+id).attr("checked")=="checked"){
				var lszje=Number(dj)*Number(ds);
				lszje=Number(~~(lszje * 100) / 100);
				$("#zje").html(lszje);
			}
		}else{
			var ds=$("#ds"+id).val();//单数
			if($("#checks"+id).attr("checked")=="checked"){
				var lszje=Number(dj)*Number(ds);
				lszje=Number(~~(lszje * 100) / 100);
				$("#zje").html(lszje);
			}
		}
		
	}	
}
//结算
function jsbutton(){
	var zje=$("#zje").text();//总金额
	var zsl=$("#zsl").text();//总数量
	if(zsl=="0"&&(zje=="0.0"||zje=="0")){
		alert("请选择需要结算的商品");
	}else{
		 var checklist = document.getElementsByTagName("input");
		 var id = "";
		 var mark = false;
		 var num="";//选中结算的商品数量
		 var numstr="";
		 for ( var i = 0; i < checklist.length; i++) {
		 if (checklist[i].type == "checkbox"
		 && checklist[i].checked == true) {
		 if (checklist[i].value != "" && checklist[i].value != "0") {	
			 var  lsidstr=((checklist[i].id).split("checks"))[1];
			 var lsid=lsidstr.split(","); 
			 var lsids="ds"+lsid; 
			
			 
			 var d="#"+(checklist[i].id);
			 var ds=$(d).attr("title");
			 lsid=ds;
			 
			 if (id == "") {
				 id = lsid;
				 mark = true;
				 } else {
				 id += "," + lsid;
				 }
			
			 var lsnum=$("#"+lsids).val();
			 if(numstr==""){
			 	numstr=lsnum;
			 	mark= true;
			 }else{
				 numstr+=","+lsnum; 
			 }
				 
		 }
		 }
		 }
		if(mark){
			location.href="wxshoppingcar_qrorder?c_id="+id+"&numid="+numstr;
		}else{
			alert("请选择需要结算的商品");
		}
	}
}
</script>
</html>