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


</head>
<body>
	<div data-role="page" style="background:#FFF;">
		<div data-role="header" class="Top" style=" background:#8bc563; color:#FFF;text-shadow: 0 0 0 #eee;">
        <div class="Top_return"><a href="javascript:history.go(-1);" target="_self"><img src="${pageContext.request.contextPath }/100nnwx/img/return_button.gif" width="57" height="24"></a></div>
        地址管理
        <div class="Top_user_center"><a href="wxshoppingcar_getList" target="_self"><img src="${pageContext.request.contextPath }/100nnwx/img/user_center.gif" width="32" height="30"></a></div>
        </div>
		<div role="main" class="ui-content" style="padding-top:0;">
			<form id="formid">
			<!-- 用户id -->
			<input type="hidden" id="uaid" name="useraddress.ua_id" value='<s:property value='useraddress.ua_id'/>'>
			<input type="hidden" name="useraddress.ua_scbs" value='<s:property value='useraddress.ua_scbs'/>'>  
			<input type="hidden" name="useraddress.user.u_id" value='<s:property value='useraddress.user.u_id'/>'> 
			<input type="hidden" id="uid" name="id" value='<s:property value='useraddress.user.u_id'/>'> 
			<input type="hidden" name="useraddress.ua_address" value='<s:property value='useraddress.ua_address'/>' id="addressid"> 
			<div class="Mian_dzgl_m1">
            	<div class="Mian_dzgl_m1Title">收货地址管理</div>
                <div class="Mian_dzgl_mt1">
                	<label for="text-1">所在地区</label>
     				<input type="text" name="text-1" id="dz1" value="广西壮族自治区" readonly="readonly" style="color:#979797;">
     			</div>
			</div>
            <table width="100%">
            	<tr>
                	<td valign="top" width="50%">
                    	<select id="dz2">  
                          <option value ="南宁市">南宁市</option>  
                       <!--    <option value ="桂林市">桂林市</option>  
                          <option value="柳州市">柳州市</option>  
                          <option value="梧州市">梧州市</option>  --> 
                        </select>
                    </td>
                    <td valign="top" width="50%">
                    	<select id="dz3">  
                    	<s:if test="quString=='青秀区'">
                    	<option value ="青秀区" selected="selected">青秀区</option>  
                          <option value ="江南区">江南区</option>  
                          <option value="良庆区">良庆区</option>  
                          <option value="西乡塘区">西乡塘区</option> 
                    	</s:if>
                    	<s:elseif test="quString=='江南区'">
                    	<option value ="青秀区" >青秀区</option>  
                          <option value ="江南区"selected="selected">江南区</option>  
                          <option value="良庆区">良庆区</option>  
                          <option value="西乡塘区">西乡塘区</option> 
                    	</s:elseif>
                    	<s:elseif test="quString=='良庆区'">
                    	<option value ="青秀区" >青秀区</option>  
                          <option value ="江南区">江南区</option>  
                          <option value="良庆区"selected="selected">良庆区</option>  
                          <option value="西乡塘区">西乡塘区</option> 
                    	</s:elseif>
                    	<s:elseif test="quString=='西乡塘区'">
                    	<option value ="青秀区" >青秀区</option>  
                          <option value ="江南区">江南区</option>  
                          <option value="良庆区">良庆区</option>  
                          <option value="西乡塘区" selected="selected">西乡塘区</option> 
                    	</s:elseif>
                           
                        </select>
                    </td>
                </tr>
            </table>
            <div class="Mian_dzgl_m1">
            	<div class="Mian_dzgl_mt1">
                	<label for="text-1">街道地址</label>
     				<input type="text" name="text-1" id="dz4" value='<s:property value='jdString'/>' style="color:#979797;">
     			</div>
			</div>
            <div class="Mian_dzgl_m1">
            	<div class="Mian_dzgl_mt1">
                	<label for="text-1">收货人姓名</label>
     				<input type="text" name="useraddress.ua_shName" id="ua_shName" value='<s:property value='useraddress.ua_shName'/>' style="color:#979797;">
     			</div>
			</div>
            <div class="Mian_dzgl_m1">
            	<div class="Mian_dzgl_mt1">
                	<label for="text-1">手机号码</label>
     				<input type="text" name="useraddress.ua_shDh" id="ua_shDh" value='<s:property value='useraddress.ua_shDh'/>' style="color:#979797;">
     			</div>
			</div>
			   <div class="Mian_dzgl_m1">
            	<div class="Mian_dzgl_mt1">
                	<label for="text-1">固定号码</label>
     				<input type="text" name="useraddress.ua_shGddh" id="ua_shGddh" value='<s:property value='useraddress.ua_shGddh'/>' style="color:#979797;">
     			</div>
			</div>
            <div class="Mian_dzgl_m1">
            	<div class="Mian_dzgl_mt1">
                	<label for="text-1">邮箱编码</label>
     				<input type="text" name="useraddress.ua_yb" id="ua_yb" value='<s:property value='useraddress.ua_yb'/>' style="color:#979797;">
     			</div>
			</div>
            <div class="Mian_dzgl_m1">
            	<div class="Mian_dzgl_mt1">
                        <input  type="hidden" name="useraddress.ua_status" value='<s:property value='useraddress.ua_status'/>'  id="ua_statusid">
                          <div style="float: left;"><input type="checkbox"    id="ua_status"></div><div style="float: left;margin-left: 13%;">设为默认地址</div>
     			</div>
			</div>
            <div class="Mian_dzgl_m1">
            	<div class="Mian_dzgl_mt1">
            	 <button style="background:#8ac463; color:#FFF; font-weight:100; font-family:'黑体'; font-size:18px; font-weight:bold; text-shadow : 0 0 1px #000;"
            	    id="btnlogin" type="button">保存</button>  
            	     <button style="background:red; color:#FFF; font-weight:100; font-family:'黑体'; font-size:18px; font-weight:bold; text-shadow : 0 0 1px #000;"
            	    id="del" type="button">删除</button> 
     			</div>
			</div>
			</form>
		</div>
<!--        <div data-role="footer">
		</div>-->
	</div>
</body>
<script type="text/javascript" src="${pageContext.request.contextPath }/100nnwx/js/jquery-1.8.3.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/100nnwx/js/jquerymobile/jquery.mobile-1.4.0.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	var stid=$("#ua_statusid").val();
	if(stid==1){
		$("#ua_status").attr("checked",true);
  	}
	
	//修改
    $("#btnlogin").click(function(){
    	
  	  var dz1 = $("#dz1").val();
  	 var dz2= $("#dz2").val();//市
  	 var dz3=$("#dz3").val();//区
  	 var dz4=$("#dz4").val();//街道
  	 
  	var ajaxCallUrl="wxuseraddress_save";
  	if(dz1!=""&&dz2!=""&&dz3!=""&&dz4!=""){
  	$("#addressid").val(dz1+"-"+dz2+"-"+dz3+"-"+dz4);
  	}
  	if($("#ua_status").attr("checked")){
  		$("#ua_statusid").val(1);
  	}else{
  		$("#ua_statusid").val(0);
  	}
  	var dh= $("#ua_shGddh").val();//电话
  	var shname=$("#ua_shName").val();//收货人
  	var sjhm=$("#ua_shDh").val();//手机号码
  	var d=/^[0-9]+$/;
	if(!d.test(sjhm)){
  		alert("电话只能为数字");
  		return;
  	}
  	if(sjhm.length!=11){
  		alert("电话只能为11位");
  		return ;
  	}
  	if(!d.test(dh)){
  		alert("电话只能为数字");
  		return;
  	}
  	if(dh.length!=7){
  		alert("电话只能为7位");
  		return ;
  	}
  	var yb=$("#ua_yb").val();
  	if(yb!=""){
  	if(!d.test(yb)){
  		alert("邮编只能为数字");
  		return;
  	}
  	if(yb.length!=6){
  		alert("邮编只能为6位");
  		return ;
  	}
  	}
  	if(shname!=""){
  		if(dh!=""||sjhm!=""){
  	$.ajax({
      cache: true,
      type: "POST",
      url:ajaxCallUrl,
      data:$('#formid').serialize(),// 你的formid
      async: false,
      error: function(request) {
          alert("添加失败");
      },
      success: function(data) {
    	  if(data!=null){
    		  alert("添加成功");
          	  window.location.href="wxuseraddress_getList?id="+data;
    	  }else{
    		  alert("添加失败");
    	  }
      	  
      }
      
  });
  		}else{
  			alert("收货人电话或手机必须填写一个");
  		}
  	}else{
  		alert("请填写收货人地址和收货人姓名");
  	}
    	
    });
	
	//删除
	
	$("#del").click(function(){
		$.ajax({
		      type: "POST",
		      url:"wxuseraddress_delete?id="+$("#uaid").val(),
		      success: function(data) {
		    	  if(data!=null){
		    		  alert("删除成功");
		          	  window.location.href="wxuseraddress_getList?id="+$("#uid").val();
		    	  }else{
		    		  alert("删除失败");
		    	  }
		      	  
		      }
		      
		  });
	});
	
});


</script>
</html>