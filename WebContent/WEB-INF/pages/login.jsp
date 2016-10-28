<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>广西100南宁商家订单系统</title>
<link href="css/base.css" rel="stylesheet" type="text/css" />
<link href="css/index.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/jquery-1.8.3.js"></script>
<script>
	function  change(){	
		document.getElementById("image").src="${pageContext.request.contextPath}/image.jsp?"+Date.parse(new Date());	
	}
	$(function(){
		var nologin="${nologinmessage}";
		if(nologin!=null&&$.trim(nologin).length!=0){
			$(".sr4").text(nologin);
			$(".sr4").show();
		}
		var error="${error}";
    	if(error!=null&&$.trim(error).length!=0){
       		$(".sr4").text(error);
       		$(".sr4").show();
    	}
    	$(".sr5").click(function(){
			var username=$("#username").val();
			var password=$("#password").val();
			var code=$("#code").val();
			var flag1=true;
			var flag2=true;
			var flag3=true;
			var warning1="";
			var warning2="";
			var warning3="";
			if($.trim(username).length==0){
				flag1=false;
				warning1="用户名不能为空";
			}else{
			}
			if($.trim(password).length==0){
				flag2=false;
				warning2="密码不能为空";
			}else{
			}
			if($.trim(code).length==0){
				flag3=false;
				warning3="验证码不能为空";
			}else{
			}
			if(flag1==false||flag2==false||flag3==false){
				var w="";
				if(warning1!=""){
					w=warning1;
				}
				if(warning2!=""){
					if(w==""){
						w=warning2;
					}else{
						w=w+","+warning2;
					}
				}
				if(warning3!=""){
					if(w==""){
						w=warning3;
					}else{
						w=w+","+warning3;
					}
				}
				$(".sr4").text(w);
				$(".sr4").show();
				return false;
			}
		});
	})
</script>
</head>

<body>
<!--[if !IE]>网页开始<![endif]-->
<div class="box"> 
  <!--[if !IE]>主体开始<![endif]-->
  <div class="min"> 
    <!--[if !IE]>头部开始<![endif]-->
    <div class="top">
      <iframe src="pages_top" width="1002" height="99" frameborder="0" scrolling="no"></iframe>
    </div>
    <!--[if !IE]>头部结束<![endif]--> 
    <!--[if !IE]>中部开始<![endif]-->
    <div class="content">
        <div class="content_min">
            <div class="content_con">
            	<form action="user_login" method="post" target="_top">
	                <div class="sr1">
	                     <input type="text" id="username" name=u_name value="${u_name}">
	                </div>
	                <div class="sr2">
	                    <input type="password" id="password" name="u_pwd" value="${u_pwd}"> 
	                </div>
	                <div class="sr3">
	                    <input type="text" id="code" name="code">
	                </div>
	                <img id="image" src="${pageContext.request.contextPath}/image.jsp" alt="暂无图片"  width="68" height="33" style="margin-top:13px;float:left;" onClick="change()"/>
	                <!-- <img src="makeCertPic.jsp" id="code1" onclick="reloadcode()" style="cursor: pointer;margin-top:13px;float:left;" alt="看不清楚,换一张">					
					<script type="text/javascript">
					  function reloadcode(){
			                var verify=document.getElementById('code1');
			                verify.setAttribute('src','makeCertPic.jsp?it='+Math.random());
			          } 
					</script>-->
					<!-- <img id="kaptchaImage" src="kaptcha.jpg" />
				    <script type="text/javascript">
				    	$('#kaptchaImage').click(function () { 
				    		$(this).hide().attr('src', 'kaptcha.jpg?' + Math.floor(Math.random()*100)).fadeIn(); 
				    	});   	
				    </script> -->
					
	                <div class="sr4">
	                </div>
	                <input type="submit" class="sr5" value="">            
	                <!-- <div class="sr3">
	                	<a href="#">找回用户和密码</a>	                
	                </div> -->
                </form>
               	<!-- <div style="text-align: right;">
	                <img src="img/weixinsaosao.png" alt="" />
               	</div> -->
            </div>
        </div>
    </div>
    <!--[if !IE]>中部结束<![endif]--> 
    <!--[if !IE]>脚部开始<![endif]-->
    <div class="foot">
      <iframe src="pages_foot" width="100%" height="160" frameborder="0" scrolling="no"></iframe>
    </div>
    <!--[if !IE]>脚部结束<![endif]--> 
  </div>
  <!--[if !IE]>主体结束<![endif]--> 
</div>
<!--[if !IE]>网页结束<![endif]-->

</body>
</html>
