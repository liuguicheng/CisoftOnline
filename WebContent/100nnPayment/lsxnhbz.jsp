<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"  %>
<%@ page import="java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
	<head>
	<title>灵山新农合报账系统－支付宝缴费</title>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<style>
*{
	margin:0;
	padding:0;
}
ul,ol{
	list-style:none;
}
.title{
    color: #ADADAD;
    font-size: 14px;
    font-weight: bold;
    padding: 8px 16px 5px 10px;
}
.hidden{
	display:none;
}

.new-btn-login-sp{
	border:1px solid #D74C00;
	padding:1px;
	display:inline-block;
	margin: 15px;
	margin-left: 100px;
}

.new-btn-login{
    background-color: transparent;
    background-image: url("../Images/new-btn-fixed.png");
    border: medium none;
    
}
.new-btn-login{
    background-position: 0 -198px;
    width: 82px;
	color: #FFFFFF;
    font-weight: bold;
    height: 28px;
    line-height: 28px;
    padding: 0 10px 3px;
}
.new-btn-login:hover{
	background-position: 0 -167px;
	width: 82px;
	color: #FFFFFF;
    font-weight: bold;
    height: 28px;
    line-height: 28px;
    padding: 0 10px 3px;
}
.bank-list{
	overflow:hidden;
	margin-top:5px;
}
.bank-list li{
	float:left;
	width:153px;
	margin-bottom:5px;
}

#main{
	width:750px;
	margin:0 auto;
	font-size:14px;
	font-family:'宋体';
}
#logo{
	background-color: transparent;
    background-image: url("../Images/new-btn-fixed.png");
    border: medium none;
	background-position:0 0;
	width:166px;
	height:35px;
    float:left;
}
.red-star{
	color:#f00;
	width:10px;
	display:inline-block;
}
.null-star{
	color:#fff;
}
.content{
	margin-top:5px;
}

.content dt{
	width:160px;
	display:inline-block;
	text-align:right;
	float:left;
	
}
.content dd{
	margin-left:100px;
	margin-bottom:5px;
}
#foot{
	margin-top:10px;
}
.foot-ul li {
	text-align:center;
}
.note-help {
    color: #999999;
    font-size: 12px;
    line-height: 130%;
    padding-left: 3px;
}

.cashier-nav {
    font-size: 14px;
    margin: 15px 0 10px;
    text-align: left;
    height:30px;
    border-bottom:solid 2px #CFD2D7;
}
.cashier-nav ol li {
    float: left;
}
.cashier-nav li.current {
    color: #AB4400;
    font-weight: bold;
}
.cashier-nav li.last {
    clear:right;
}
.alipay_link {
    text-align:right;
}
.alipay_link a:link{
    text-decoration:none;
    color:#8D8D8D;
}
.alipay_link a:visited{
    text-decoration:none;
    color:#8D8D8D;
}
input{
height: 25px;
width: 260px;
border: 1px bule solid;;
}
</style>
<script type="text/javascript" src="${pageContext.request.contextPath }/100nnwx/js/jquery-1.8.3.js"></script>
<script type="text/javascript">
$(document).ready(function(){});

		function ons(){
			var nums=$("#selpriceid").val();
			if(nums==0){
				$("#addpriceid").css("display","");
				$("#selpriceid").css("display","none");
				$("#fhid").css("display","");
			}else if(nums==300){
				$("#priceid").val("300");
			}
		}
		function os(){
			var ns=$("#addpriceid").val();
			$("#priceid").val(ns);
		}
		function fhff(){
			$("#fhid").css("display","none");
			$("#addpriceid").css("display","none");
			$("#selpriceid").css("display","");
			$("#priceid").val("300");
			$("#selpriceid option[value=300]").attr("selected", true); 
		}
		function otf(){
			var jeiva=$("#priceid").val();
			var cyxm=$("#cyxm").val();
			var cysjhm=$("#cysjhm").val();
			if(!/\S/.test(cyxm)){
				alert("请填写缴费村医姓名");
				return false;
			}
			if(!/\S/.test(cysjhm)){
				alert("请填写报账手机号码");
				return false;
				
			}
			if(!/^(13[0-9]|15[0-9]|18[0-9])\d{8}$/.test(cysjhm)){
				alert("请填写正确的报账手机号码");
				return false;
			}
			if(!/\S/.test(jeiva)){
				alert("请填写缴费金额");
				return false;
				
			}
			if(!/^([0-9.]+)$/.test(jeiva)){
				alert("输入金额只能为数字");
				$("#priceid").val("");
				return false;	
			}
			return true;
		}
		function checkradio(){ 
			var item = $(":radio:checked"); 
			var len=item.length; 
			if(len>0){ 
				var s=$(":radio:checked").val();
				if(s=="0"){
					$("#priceid").val("");
				}else{
					$("#priceid").val("300.00");
				}
			} 
			} 
		
</script>
</head>
<body text=#000000 bgColor="#ffffff" leftMargin=0 topMargin=4>
	<div id="main">
		<div id="head">
            <span class="title"><h1>灵山新农合报账系统中心-支付快捷通道</h1></span>
		</div>
        <div class="cashier-nav">
            <ol>
				<li class="current">1、确认信息 →</li>
				<li>2、点击确认 →</li>
				<li class="last">3、确认完成</li>
            </ol>
        </div>
        <form name="alipayment" action="payment_addPayment" method="post" onsubmit="return otf();">
      	    <input name="payment.paymentType" type="hidden" value="4"/>
         	<input name="payment.paymentFs" type="hidden" value="1"/>
            <input name="payment.paymentZt" type="hidden" value="3"/>
             <input name="payment.c_scbs" type="hidden" value="1"/>
            <% UUID uuid = UUID.randomUUID();  %>
		    <input size="30" name="payment.paymentBh" value="<%=uuid%>" readonly="readonly" style="display: none;"/>
		    <input size="30" name="payment.paymentName" value="灵山新农合报账系统使用费" readonly="readonly" style="display: none;"/>
            <div id="body" style="clear:left">
             <dl class="content">
            
					<%-- <dt>缴费订单号：</dt>
					<dd>
						<span class="null-star">*</span>
						<% UUID uuid = UUID.randomUUID();  %>
						<input size="30" name="payment.paymentBh" value="<%=uuid%>" readonly="readonly"/>
						<span>
</span>
					</dd> --%>
					<dt>缴费名称：</dt>
					<dd>
						<span class="null-star">*</span>
						灵山新农合报账系统使用费
						<span>
</span>
					</dd>
					<dt style="margin-top: 5px;"><span style="color: red;">*</span>缴费村医姓名：</dt>
					<dd style="margin-top: 5px;">
						<span class="null-star">*</span>
						<input size="30" name="payment.paymentXingMin" id="cyxm" />
						<span>必填
</span>
					</dd>
					<dt style="margin-top: 5px;"><span style="color: red;">*</span>报账手机号码：</dt>
					<dd style="margin-top: 5px;">
						<span class="null-star">*</span>
						<input size="30" name="payment.paymentZhanghao" id="cysjhm" />
						<span>必填
</span>
					</dd>
					<dt style="margin-top: 5px;"><span style="color: red;">*</span>缴费金额：</dt>
					<dd>
						<span class="null-star">*</span>
						<!-- <select id="selpriceid" onchange="ons();">
							<option value="300" selected="selected">年费／300</option>
							<option value="0">其他</option>
						</select>
						
						<input size="30" value=""  id="addpriceid" style="display: none;" onblur="os();" />
						<span>
						<a href="javascript:fhff();" id="fhid" style="display: none;">返回选择</a>
						</span> -->
						<div style="float: left;margin-left: 9px;">
						<input name="payment.paymentPrice" type="text" id="priceid"  value="300.00"  style="width: 70px;"/> 
						</div>
						<div style="float: left;margin-left: 5px;">
						<input type="radio" name="green" value="300" checked="checked" style="width: 20px;" onclick="checkradio();"/>300.00/年费
     					<input type="radio" name="green" value="0" style="width: 20px;margin-left: 15px;" onclick="checkradio();"/>其他
     					<span style="margin-left: 15px;">  必填</span>
     					</div>
						
					</dd>
					<dt style="clear: both;margin-top: 10px;">备  &nbsp;注：</dt>
					<dd style="clear: both;margin-left: 160px;margin-top: -5px;">
						<span class="null-star"></span>
						<textarea  name="payment.bz" style="width: 260px;height: 100px;margin-left: 10px;"></textarea>
					</dd>
					 <dd>
                        <span class="new-btn-login-sp">
                            <button class="new-btn-login" type="submit" style="text-align:center;">确 认</button>
                        </span>
                    </dd>
                </dl>
            </div>
		</form>
        <!-- <div id="foot">
			<ul class="foot-ul">
				<li><font class="note-help">如果您点击“确认”按钮，即表示您同意该次的执行操作。 </font></li>
				<li>
					支付宝版权所有 2011-2015 ALIPAY.COM 
				</li>
			</ul>
		</div> -->
	</div>
</body>
</html>