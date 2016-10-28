<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
<script type="text/javascript" src="js/jquery-1.8.3.js"></script>
<script type="text/javascript">
function oncl(){
	/* var code=$("#code").val(); */
	//var  url="https://api.weixin.qq.com/sns/oauth2/access_token?callback=?";
//	var  par={"appid":"wxac6fc2bbd219962b","secret":"c659ae8a8aa4d525b80630a1282d5885","code":"0188456e77da3efd16a336b6d4ff537b","grant_type":"authorization_code"};
/* 	$.getJSON(url,par,function(data){
		alert(1);
		}); */
		window.location.href="http://www.100nn.cn/100nn/wxdevelop_sendtosocket?code="+$("#codeis").val()+"&state="+$("#stateid").val();
	}
</script>
</head>
<body onload="oncl()">
<input type="hidden" value="<%=request.getParameter("code") %>" id="codeis">
<input  type="hidden" value="<%=request.getParameter("state") %>" id="stateid">
</body>
</html>