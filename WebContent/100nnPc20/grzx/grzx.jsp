<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="s" uri="/struts-tags"%>   
 <%@ page import="com.cisoft.model.User"%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>100南宁－快递超市</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="${pageContext.request.contextPath}/100nn/Supermarket/css/SecurityCenter.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/100nn/Supermarket/css/jiaofei.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/100nn/css/nav_style.css" rel="stylesheet" type="text/css" />
</head>
 <style type="text/css">
        .file_td input {
	vertical-align:middle;
	margin:0;
	padding:0
}
.file_td {
	position:relative;
	width:302px
}
.file_td .file_txt {
	height:30px;
	border:1px solid #9b9b9b;
	width:175px;
}
.file_td .file_btn {
	background-color:#FFF;
	border:1px solid #9b9b9b;
	height:32px;
	line-height:32px;
	width:50px;
}
.file_td .file_file {
	position:absolute;
	top:0;
	right:0;
	height:32px;
filter:alpha(opacity:0);
	opacity: 0;
	
        </style>
<body>
<div style="margin-bottom: 3px;">
 <%@ include file="top_grzx.jsp"%>
 </div>
  <div style="margin: 0 auto; width: 1002px;">
<!--[if !IE]> 头部|开始 <![endif]-->
<!--[if !IE]> 头部|结束 <![endif]-->
<!--[if !IE]> 内容|开始 <![endif]-->
<div id="Mian" style="min-height: 340px;">


<!--[if !IE]> 内容|导航结束 <![endif]-->
<!--[if !IE]> 内容|主内容开始 <![endif]-->

<div id="MianRight" style="border-top: 0px;overflow-y:visible;min-height: 200px;">
  <div id="MianRight_z" style="height: auto;min-height: 200px;" >
      
       <div class="MianRight_mianN">
       <% 
       User users = (User) request.getSession().getAttribute("usersession");
       int ids=0;
 			if (users != null) {
 				ids=users.getU_id();
 			}
 		%>
 	
       				<form method="post" action="qtuser_saveUserInfo" id="form1" enctype="multipart/form-data">
       				 <input name="u_id" type="hidden" value="<%=ids %>"/>
                	<table cellpadding="0" cellspacing="0">
                	
                	<tr>
                        	<td width="124" class="MianRight_mianN_td1" style="padding-right:10px;">真实姓名</td>
                            <td width="305"><div class="MianRight_mianN_td2"><input  type="text" name="u_zsName" value='<%=user.getU_zsName() %>'/></div></td>
                            <td width="140" id="oldid"></td>
                        </tr>
                        <tr>
                        	<td width="124" class="MianRight_mianN_td1" style="padding-right:10px;">昵称</td>
                            <td width="305"><div class="MianRight_mianN_td2"><input  type="text" name="u_nickname" value="<%=user.getU_nickname() %>" /></div></td>
                            <td width="140" id="newpwdid1"></td>
                        </tr>
                        <tr>
                        	<td width="124" class="MianRight_mianN_td1" style="padding-right:10px;">性别</td>
                            <td width="305">
                            <% if(user.getU_xb()==0){ %>
                            <input  type="radio" name="u_xb" value="0" checked="checked"/>男
                            <input  type="radio" name="u_xb" value="1"/>女
                            <%}else{ %>
                             <input  type="radio" name="u_xb" value="0" />男
                            <input  type="radio" name="u_xb" value="1" checked="checked"/>女
                            <%} %>
                            </td>
                            <td width="140" id="newpwdid">
                            </td>
                        </tr>
                         <tr>
                        	<td width="124" class="MianRight_mianN_td1" style="padding-right:10px;">出生年月</td>
                            <td width="305"><div class="MianRight_mianN_td2"><div style="float: left;"><input  type="text" name="u_csny" value="<%=user.getU_csny() %>"/></div><div style="float: left;"></div></div></td>
                            <td width="140" id="newpwdid">
                            格式:"19910326"
                            </td>
                        </tr>
                         <tr>
                        	<td width="124" class="MianRight_mianN_td1" style="padding-right:10px;">头像</td>
                            <td width="305">
                            <div width="302" class="file_td">
                            <input type="text" name='textfield' id='textfield' class='file_txt' />  
    <input type='button' class='file_btn btn btn-primary btn-sm' value='上传' />
    <input type="file" name="fileProductPic" class="file_file" id="fileField" size="28" onchange="document.getElementById('textfield').value=this.value" />
  <img alt="" src="${pageContext.request.contextPath}/imgss.jsp?file=<%=user.getTximgurl() %>" width="30" height="30" style="position:absolute;top:0;left:250px;height:32px;">
  </div>
                            </td>
                            <td width="140" id="newpwdid">
                            </td>
                        </tr>
                        <tr>
                        	<td width="124" class="MianRight_mianN_td1" style="padding-right:10px;"></td>
                            <td width="305">
                            <input type="submit" style="background: url(100nnPc20/images/gg_14.png) no-repeat; width:120px; height:38px;border: 0px;" value="">
                            </td>
                            <td width="140"></td>
                        </tr>
                    </table>
                    </form>
                </div>
      
       
   </div>
 </div>
	
<!--[if !IE]> 内容|主内容开始 <![endif]-->
</div>

 </div>
	<div >
	<%@ include file="../foot.jsp"%>
	</div>
</body>
<script type="text/javascript">
$(document).ready(function(){
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
});


	
		function uppwd(){
		/* 	var id=$("#oldpsd").val();
			var pwd=$("#newpsd").val();
			var pwd2=$("#newpsd2").val();
			if(id==""){
				var str=" <div class=\"MianRight_mianN_td3\">"+
            	"<div class=\"\"style=\"color:red;\">原密码错误</div>"+
                "</div>";
				$("#oldid").html(str);
			}
			else if(pwd!=pwd2){
			 var str=" <div class=\"MianRight_mianN_td3\">"+
         	"<div class=\"\"style=\"color:red;\">新密码两次输入不一致</div>"+
             "</div>";
				$("#newpwdid").html(str);
			}else{ */
				/* var str=" <div class=\"MianRight_mianN_td3\">"+
            	"<div class=\"MianRight_mianN_td3Left1\"></div>"+
                "</div>";
				$("#oldid").html(str);
				$("#newpwdid").html(str);
				$("#newpwdid1").html(str); */
			 $
				.ajax({
					type : "POST",
					url : "qtuser_saveUserInfo",
				    data:$('#form1').serialize(),// 你的formid
					success : function(msgs) {
							
							layer.msg(msgs,2,1,"100px");
							
					}
				});
			}
		/* } */
</script>

</html>