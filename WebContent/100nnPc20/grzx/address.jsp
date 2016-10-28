<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="s" uri="/struts-tags"%> 
 <%@ page import="com.cisoft.model.User"%>     
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>100南宁－快递超市</title>
<link href="${pageContext.request.contextPath }/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath }/100nn/Supermarket/css/AddressManagement.css" type="text/css" rel="stylesheet" />
<link href="${pageContext.request.contextPath }/100nn/Supermarket/css/jiaofei.css" rel="stylesheet" type="text/css" />

</head>

<body >
<div style="margin-bottom: 3px;">
 <%@ include file="top_address.jsp"%>
 </div>
  <div style="margin: 0 auto; width: 1002px; height: auto;">
<!--[if !IE]> 内容|导航结束 <![endif]-->
    <!--[if !IE]> 内容|主内容开始 <![endif]-->
    <div id="MianRight" style="overflow-x:hidden;border-top:0px;height: auto;">
      <% 
       User users = (User) request.getSession().getAttribute("usersession");
       int ids=0;
 			if (users != null) {
 				ids=users.getU_id();
 			}
 		%>
 	
       <input id="idss" type="hidden" value="<%=ids %>"/>
        <div id="MianRight_z" style="margin: 10px 14px 0;width: auto; height: auto;min-height: 420px;">
      <div id="MianRight_wz" style="margin-top:5px;  border-top: 1px solid #bd0200;background: #fff;height: auto;">
      <table class="MianRight_mianTitlesNavBJn" style="border:0; font-weight:bold;margin-bottom: 10px;background:#f0e9e3;" cellspacing="0" cellpadding="0" >
                    	<tr style="height:36px;">
                        	<td style=" text-align:center;" width="150">姓名</td>
                            <td style=" text-align:center;" width="150">地址</td>
                            <td style=" text-align:center;" width="200">邮编</td>
                            <td style=" text-align:center;" width="200">电话</td>
                            <td style=" text-align:center;" width="200">是否默认地址</td>
                            <td style=" text-align:center;" width="200">操作</td>
                        </tr>
                    </table>
                <div class="MianRight_mianTitlesNav" style="height: auto;" >
                	
                    <div id="tbs" >
                    <table class="MianRight_mianTitlesNavBJn"  cellspacing="0" cellpadding="0">
                    	<s:if test="#useraddress.size()>0">
                    	<s:iterator value="#useraddress" var="u">
                        <tr class="odd" id='<s:property value="#u.ua_id"/>'>
                        	<td style="border-top:#dadada solid 1px; text-align:center; color:#7b7b7b;" width="150"><s:property value="#u.ua_shName"/> </td>
                            <td style="border-top:#dadada solid 1px; text-align:center; color:#7b7b7b;" width="150"><s:property value="#u.ua_address"/></td>
                            <td style="border-top:#dadada solid 1px; text-align:center; color:#7b7b7b;" width="200">530000</td>
                            <td style="border-top:#dadada solid 1px; text-align:center; color:#7b7b7b;" width="200" ><div style="margin-top: 1px;margin-bottom: 1px;"><s:property value="#u.ua_shDh"/><div style="margin-top: 4px;clear: both;"></div><s:property value="#u.ua_shGddh"/></div></td>
                            <td style="border-top:#dadada solid 1px; text-align:center; color:#7b7b7b;" width="200" ><s:if test="#u.ua_status==1">默认地址</s:if><div class="de" style="display: none;"><s:else><a href="">设为默认</a></s:else> </idv></td>
                            <td style="border-top:#dadada solid 1px; text-align:center; color:#a2c314;" width="200"><a id="updateuseraddress" onclick="updateuseraddress('<s:property value="#u.ua_id"/>');" style="color:#ff9c00;" href="#" title="" target="_self">修改</a> | <a id="deleteuseraddress" href="#" title="" onclick="deleteuseraddress('<s:property value="#u.ua_id"/>');" target="_self" style="color: #ff9c00;">删除</a></td>
                        </tr>
                        </s:iterator>
                        </s:if>
                        <s:else>
                          <tr style="background:#FFF; height:36px; border:0;">
                           <td colspan="6" align="center">暂无收货地址，马上添加？</td>
                          </tr>
                        </s:else>
                    </table>
                    </div>
                </div> 
                <div style="margin-top: 20px;"></div>
                 <ul id="myTab" class="nav nav-tabs" role="tablist" style="background: #fff;height: auto;">
     				 <li class="active"><a href="#home" id="homea" role="tab" data-toggle="tab">新增收货地址</a></li>
      				 <li><a href="#profile"  id="profilea" role="tab" data-toggle="tab">修改收货地址</a></li>
    			</ul>    
                <div class="MianRight_mianTitlesNav ab-pane fade in active" id="home" >
                <!-- 	<div class="MianRight_mianTitlesNavBJ" style="border-bottom:#bbb7b8 dotted 1px;">新增收货地址</div> -->
                    <div class="MianRight_mianTitlesNavBJn1"  id="homeadiv">
                    <form action="" id="formids" method="post">
                    	<div class="MianRight_mianTitlesNavBJn_mian">
                        	<div class="MianRight_mianTitlesNavBJn_mianSpantitle">所在地区</div>
                        	<input type="hidden" id="useraddressids" name="ua_address" value=""/>
                        	<input type="hidden" id="useraddress_quids"  value=""/>
                        	<input type="hidden"  id="ua_scbsids" name="ua_scbs" value="${ua_scbs}"/>
                        	<input type="hidden" id="user_idids" name="user.u_id" value="${ usersession.u_id}"/>
                        	
                        	<input type="hidden" id="u_idids" name="ua_id" value="${ua_id }"/>
                            <div class="MianRight_mianTitlesNavBJn_mianSpangh">
                                <div class="MianRight_mianTitlesNavBJn_mianSpangh_cs">南宁市</div>
                                <div class="MianRight_mianTitlesNavBJn_mianSpangh_cs nav_button1">青秀区</div>
                                <ul id="birthday_type_ul1" class="left_nav_mian_tz2">
                                    <li id="birthday_0" value="青秀区" class="left_nav_mian_tz3">青秀区</li>
                                    <li id="birthday_1" value="兴宁区" class="left_nav_mian_tz3">兴宁区</li>
                                    <li id="birthday_2" value="江南区" class="left_nav_mian_tz3">江南区</li>
                                    <li id="birthday_3" value="西乡塘区" class="left_nav_mian_tz3">西乡塘区</li>
                                    <li id="birthday_4" value="邕宁区" class="left_nav_mian_tz3">邕宁区</li>
                                    <li id="birthday_5" value="良庆区" class="left_nav_mian_tz3">良庆区</li>
                            	</ul>
                            </div>
                        </div>
                        <div class="MianRight_mianTitlesNavBJn_mian1">
                        	<div class="MianRight_mianTitlesNavBJn_mianSpantitle1">街道地址</div>
                            <div class="MianRight_mianTitlesNavBJn_mianSpangh">
                            	<div class="MianRight_mianTitlesNavBJn_mianSpangh_dq1"><textarea id="jdids" name="" rows="10" cols="30"  placeholder="不需要重复填写省份"></textarea></div>
                            </div>
                        </div>
                        <div class="MianRight_mianTitlesNavBJn_mian">
                        	<div class="MianRight_mianTitlesNavBJn_mianSpantitle">收货人姓名</div>
                            <div class="MianRight_mianTitlesNavBJn_mianSpangh">
                            	<div class="MianRight_mianTitlesNavBJn_mianSpangh_dq"><input id="shnameids" type="text" name="ua_shName" value="" value="${ useraddressinfo.ua_shName}"/></div>
                            </div>
                        </div>
                        <div class="MianRight_mianTitlesNavBJn_mian">
                        	<div class="MianRight_mianTitlesNavBJn_mianSpantitle">手机号码</div>
                            <div class="MianRight_mianTitlesNavBJn_mianSpangh">
                            	<div class="MianRight_mianTitlesNavBJn_mianSpangh_dq"><input id="sjhmids" type="text" name="ua_shDh" value="" value="${ ua_shDh}"/></div>
                            </div>
                        </div>
                        <div class="MianRight_mianTitlesNavBJn_mian">
                        	<div class="MianRight_mianTitlesNavBJn_mianSpantitle">固定电话</div>
                        	<input type="hidden" name="ua_shGddh" value="" id="gddhid"/>
                            <div class="MianRight_mianTitlesNavBJn_mianSpangh">
                            	<div class="MianRight_mianTitlesNavBJn_mianSpangh_dq2" style="width: 40px;"><input type="text" id="qhids" value="" style="width: 31px;" /></div>
                                <div class="MianRight_mianTitlesNavBJn_mianSpangh_dq2" style="width: 95px;"><input type="text" id="dhids" value="" style="width: 86px;"/></div>
                               <!--  <div class="MianRight_mianTitlesNavBJn_mianSpangh_dq2"><input type="text" value="分机" /></div> -->
                            </div>
                        </div>
                        <div class="MianRight_mianTitlesNavBJn_mian" style="margin: 5px 0; line-height: 20xp; height: 20px;">
                        	<div class="MianRight_mianTitlesNavBJn_mianSpantitle"></div>
                            <div class="MianRight_mianTitlesNavBJn_mianSpangh"><input type="hidden" name="ua_status" value="" id="statusddds"/><input id="mrs" type="checkbox" name="bike" />设置为默认收货地址</div>
                        </div>
                        <div class="MianRight_mianTitlesNavBJn_mian"  >
                        	<div class="MianRight_mianTitlesNavBJn_mianSpantitle"></div>
                            <div class="MianRight_mianTitlesNavBJn_mianSpangh">
                                <div class="MianRight_mianTitlesNavBJn_mianSpangh_text" ><img src="100nnPc20/images/gg_14.png" width="120" height="38" onclick="adduseraddresss();" /></div>
                            </div>
                        </div>
                        </form>
                    </div>
                </div>
                <!-- 修改开始 -->
                <div class="ab-pane fade" id="profile">
                
                <div class="MianRight_mianTitlesNavBJn1" id="profileadiv" style="display:none;">
                    <form action="" id="formidss" method="post">
                    	<div class="MianRight_mianTitlesNavBJn_mian">
                        	<div class="MianRight_mianTitlesNavBJn_mianSpantitle">所在地区</div>
                        	<input type="hidden" id="useraddressid" name="ua_address" value=""/>
                        	<input type="hidden" id="useraddress_quid"  value=""/>
                        	<input type="hidden"  id="ua_scbsid" name="ua_scbs" value="${ua_scbs}"/>
                        	<input type="hidden" id="user_idid" name="user.u_id" value="${ usersession.u_id}"/>
                        	
                        	<input type="hidden" id="u_idid" name="ua_id" value="${ua_id }"/>
                            <div class="MianRight_mianTitlesNavBJn_mianSpangh">
                                <div class="MianRight_mianTitlesNavBJn_mianSpangh_cs">南宁市</div>
                                <div class="MianRight_mianTitlesNavBJn_mianSpangh_cs nav_button1">青秀区</div>
                                <ul id="birthday_type_ul1" class="left_nav_mian_tz2">
                                    <li id="birthday_0" value="青秀区" class="left_nav_mian_tz3">青秀区</li>
                                    <li id="birthday_1" value="兴宁区" class="left_nav_mian_tz3">兴宁区</li>
                                    <li id="birthday_2" value="江南区" class="left_nav_mian_tz3">江南区</li>
                                    <li id="birthday_3" value="西乡塘区" class="left_nav_mian_tz3">西乡塘区</li>
                                    <li id="birthday_4" value="邕宁区" class="left_nav_mian_tz3">邕宁区</li>
                                    <li id="birthday_5" value="良庆区" class="left_nav_mian_tz3">良庆区</li>
                            	</ul>
                            </div>
                        </div>
                        <div class="MianRight_mianTitlesNavBJn_mian1">
                        	<div class="MianRight_mianTitlesNavBJn_mianSpantitle1">街道地址</div>
                            <div class="MianRight_mianTitlesNavBJn_mianSpangh">
                            	<div class="MianRight_mianTitlesNavBJn_mianSpangh_dq1"><textarea id="jdid" name="" rows="10" cols="30"  placeholder="不需要重复填写省份"></textarea></div>
                            </div>
                        </div>
                        <div class="MianRight_mianTitlesNavBJn_mian">
                        	<div class="MianRight_mianTitlesNavBJn_mianSpantitle">收货人姓名</div>
                            <div class="MianRight_mianTitlesNavBJn_mianSpangh">
                            	<div class="MianRight_mianTitlesNavBJn_mianSpangh_dq"><input id="shnameid" type="text" name="ua_shName" value="" value="${ useraddressinfo.ua_shName}"/></div>
                            </div>
                        </div>
                        <div class="MianRight_mianTitlesNavBJn_mian">
                        	<div class="MianRight_mianTitlesNavBJn_mianSpantitle">手机号码</div>
                            <div class="MianRight_mianTitlesNavBJn_mianSpangh">
                            	<div class="MianRight_mianTitlesNavBJn_mianSpangh_dq"><input id="sjhmid" type="text" name="ua_shDh" value="" value="${ ua_shDh}"/></div>
                            </div>
                        </div>
                        <div class="MianRight_mianTitlesNavBJn_mian">
                        	<div class="MianRight_mianTitlesNavBJn_mianSpantitle">固定电话</div>
                        	<input type="hidden" name="ua_shGddh" value="" id="gddhid"/>
                            <div class="MianRight_mianTitlesNavBJn_mianSpangh">
                            	<div class="MianRight_mianTitlesNavBJn_mianSpangh_dq2" style="width: 40px;"><input type="text" id="qhid" value="" style="width: 31px;" /></div>
                                <div class="MianRight_mianTitlesNavBJn_mianSpangh_dq2" style="width: 95px;"><input type="text" id="dhid" value="" style="width: 86px;"/></div>
                               <!--  <div class="MianRight_mianTitlesNavBJn_mianSpangh_dq2"><input type="text" value="分机" /></div> -->
                            </div>
                        </div>
                        <div class="MianRight_mianTitlesNavBJn_mian" style="margin: 5px 0; line-height: 20xp; height: 20px;">
                        	<div class="MianRight_mianTitlesNavBJn_mianSpantitle"></div>
                            <div class="MianRight_mianTitlesNavBJn_mianSpangh"><input type="hidden" name="ua_status" value="" id="statusddd"/><input id="mr" type="checkbox" name="bike" />设置为默认收货地址</div>
                        </div>
                        <div class="MianRight_mianTitlesNavBJn_mian"  >
                        	<div class="MianRight_mianTitlesNavBJn_mianSpantitle"></div>
                            <div class="MianRight_mianTitlesNavBJn_mianSpangh">
                                <div class="MianRight_mianTitlesNavBJn_mianSpangh_text" ><img src="100nnPc20/images/gg_14.png" width="120" height="38" onclick="adduseraddress();" /></div>
                            </div>
                        </div>
                        </form>
                    </div>
                
                </div>
                <!-- 修改结束 -->
            </div>
        </div>
    </div>
    </div>
    
    <div style="margin-top: 10px;">
		<%@ include file="../foot.jsp"%>
	</div>
</body>

<script type="text/javascript" src="${pageContext.request.contextPath }/js/bootstrap.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
  $(".left_nav_mian_tz1").hide();
  $(".nav_button").click(function(){
	$(".left_nav_mian_tz1").hide();
    $(this).next(".left_nav_mian_tz1").slideDown(100);
  });
  $(".left_nav_mian_tz").click(function(){
    //var p_html = $(".left_nav_mian_tz").html();
    var p_html = $(this).html();
	$(".nav_button").html(p_html);
    $(".left_nav_mian_tz1").slideUp(100); 
  });
  $(document).mouseup(function(event){
	if($(event.target).parents("#birthday_type_ul").length==0){
	$("#birthday_type_ul").slideUp(100);
	}
	});
  
  $('#myTab a').click(function (e) {
	  e.preventDefault();
	  $(this).tab('show');
	  var s=$(this).attr("id");
	  if(s=="profilea"){
		  $("#profileadiv").css("display","block");
		  $("#homeadiv").css("display","none");
	  }else{
		  $("#profileadiv").css("display","none");
		  $("#homeadiv").css("display","block"); 
	  }
	  
	})
});
</script>
<script type="text/javascript">
$(document).ready(function(){
  $(".left_nav_mian_tz2").hide();
  $(".nav_button1").click(function(){
	$(".left_nav_mian_tz2").hide();
    $(this).next(".left_nav_mian_tz2").slideDown(100);
  });
  $(".left_nav_mian_tz3").click(function(){
    //var p_html = $(".left_nav_mian_tz").html();
    var p_html = $(this).html();
	$(".nav_button1").html(p_html);
    $(".left_nav_mian_tz2").slideUp(100); 
    $("#useraddress_quid").val(p_html);
  });
  $(document).mouseup(function(event){
	if($(event.target).parents("#birthday_type_ul1").length==0){
	$("#birthday_type_ul1").slideUp(100);
	}
	});
  //-隔行,滑动,点击 变色
  $('#tbs table tr').hover(
   function() {$(this).addClass('highlight');},
   function() {$(this).removeClass('highlight');}
  );
  $('#tbs table   tr').click(
   function() {
	 
   })
   
});
</script>
<script>
$().ready(function(){
	var loginid=$("#idss").val();
	if(loginid=="0"){
		//未登录
		   $("#emample9").attr("display","block");
		   $(".coreMian_jgk").css("display","block");
		   $(".coreMian_jgkText").html("登录超时，请重新登录");
			$("#u_email").val("");
			$("#password").val("");
			$("#code").val("");
		   loginlayer=  $.layer({
				    type: 1,
				    title: "登录",
				    area: ['408px', '410px'],
				    shade: [0.5, '#000'],
				    shift: 'top', //从左动画弹出
				    page: {
				        dom: '#emample9'
				    },
				   
				});
		
	}
     $
		.ajax({
			type : "POST",
			url : "shoppingcar_querygwccount",
			success : function(msgs) {
					$("#gwcid").html(msgs);
			}
		});
	});
$(function(){
});
	function deleteuseraddress(id){
		$.ajax({
			   type: "POST",
			   url: "useraddress_delete",
			   data: "id="+id,
			   success: function(msgs){
				   if(msgs=="删除成功"){
					   layer.msg('删除成功',2,1,"100px");
					   location.reload();   
				   }else{
					   layer.msg(msgs);
				   } 
			   }
		});
	}
	
	function updateuseraddress(id){
		  $("#profilea").trigger("click");
		$.ajax({
			   type: "POST",
			   url: "useraddress_toadduser",
			   data: "ua_id="+id,
			   success: function(msgs){
				   		//收货地址
					   $("#shnameid").val(msgs.ua_shName);
					   //手机号码
					   $("#sjhmid").val(msgs.ua_shDh); 
					   
					   //固定电话
					   var  dh=msgs.ua_shGddh;
					   if(dh!=""){
					    var ss= dh.split("-");
					   $("#qhid").val(ss[0]); 
					   $("#dhid").val(ss[1]);
					   }
					   //是否默认
					   var s=msgs.ua_status;
					   if(s==1){
						   $("#mr").attr("checked","checked"); 
					   }else{
						   $("#mr").attr("checked",null); 
					   }
					   $("#ua_statusddd").val(s);
					 
					   //区
					   var dz=msgs.ua_address;
					   
					   if(dz!=""){
					   var sss= dz.split(" ");
					   $(".nav_button1").html(sss[1]);
					   //街道
					   $("#jdid").val(sss[2]);
					   }
					   //收货地址id
					   $("#u_idid").val(msgs.ua_id);
					   
					   //
					   $("#ua_scbsid").val(msgs.ua_scbs);
                   	
			   }
		});
	}
	$("#mr").click(function(){
		if(undefined==$(this).attr("checked")){
			$(this).attr("checked",true);
		}else{
			$(this).attr("checked",false);
		}
		if($(this).attr("checked")){
			$("#statusddd").val("1");
		}else{
			$("#statusddd").val("0");	
		}
	});
	$("#mrs").click(function(){
		if(undefined==$(this).attr("checked")){
			$(this).attr("checked",true);
		}else{
			$(this).attr("checked",false);
		}
		if($(this).attr("checked")){
			$("#statusddds").val("1");
		}else{
			$("#statusddds").val("0");	
		}
	});
	function adduseraddress(){
		  var p_html = $(".left_nav_mian_tz3").html();
		 var qu= $("#useraddress_quid").val();//区
		 if(qu==""){
			 $("#useraddress_quid").val(p_html);
			 qu= $("#useraddress_quid").val();
		 }
		 var jd=$("#jdid").val();//街道
		 
		var ajaxCallUrl="useraddress_save";
		var useraddresshtml="南宁市"+" "+qu+" "+jd;
	    $("#useraddressid").val(useraddresshtml);
		var qh=$("#qhid").val();
		var dh=$("#dhid").val();
		if(qh!=""&&dh!=""){
		$("#gddhid").val(qh+"-"+dh);
		}
		var dh= $("#gddhid").val();//电话
		var shname=$("#shnameid").val();//收货人
		var sjhm=$("#sjhmid").val();//手机号码
		if(qu!=""&&jd!=""&&shname!=""){
			if(dh!=""||sjhm!=""){
		$.ajax({
            cache: true,
            type: "POST",
            url:ajaxCallUrl,
            data:$('#formidss').serialize(),// 你的formid
            async: false,
            error: function(request) {
                layer.msg('添加失败');
                
            },
            success: function(data) {
            
            	layer.msg('添加成功',2,1,"100px");
            	location.reload(); 
            }
            
        });
			}else{
				layer.msg("收货人电话或手机必须填写一个");
			}
		}else{
			layer.msg("请填写收货人地址和收货人姓名");
		}
	}
	function adduseraddresss(){
		  var p_html = $(".left_nav_mian_tz3").html();
		 var qu= $("#useraddress_quids").val();//区
		 if(qu==""){
			 $("#useraddress_quids").val(p_html);
			 qu= $("#useraddress_quids").val();
		 }
		 var jd=$("#jdids").val();//街道
		 
		var ajaxCallUrl="useraddress_save";
		var useraddresshtml="南宁市"+" "+qu+" "+jd;
	    $("#useraddressids").val(useraddresshtml);
		var qh=$("#qhids").val();
		var dh=$("#dhids").val();
		if(qh!=""&&dh!=""){
		$("#gddhids").val(qh+"-"+dh);
		}
		var dh= $("#gddhids").val();//电话
		var shname=$("#shnameids").val();//收货人
		var sjhm=$("#sjhmids").val();//手机号码
		if(qu!=""&&jd!=""&&shname!=""){
			if(dh!=""||sjhm!=""){
		$.ajax({
          cache: true,
          type: "POST",
          url:ajaxCallUrl,
          data:$('#formids').serialize(),// 你的formid
          async: false,
          error: function(request) {
              layer.msg('添加失败');
              
          },
          success: function(data) {
          
          	layer.msg('添加成功',2,1,"100px");
          	location.reload(); 
          }
          
      });
			}else{
				layer.msg("收货人电话或手机必须填写一个");
			}
		}else{
			layer.msg("请填写收货人地址和收货人姓名");
		}
	}
	//设为默认
function domr(){
	 if(confirm("是否设为默认？")){
		  var ua_id=$(this).attr('id');
		  $
			.ajax({
				type : "POST",
				url : "useraddress_toswmr?ua_id="+ua_id,
				success : function(msgs) {
					if(msgs=="操作成功"){
						   layer.msg('设置成功',2,1,"100px");
						   location.reload();   
					   }else{
						   layer.msg(msgs);
					   } 
				}
			});
	   }
}
</script>
</body>
</html>