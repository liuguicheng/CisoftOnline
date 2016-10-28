<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>网友水墨寒分享Jquery可拖动带动画弹出层插件</title>
<link href="100nn/cj/login/smohan.poplayer.css" type="text/css" rel="stylesheet">
</head>

<body>

 <a href="javascript:void(0)" id="pp" class="demo">点我弹出登录</a>
<div id="pop-login" style="display:none">
<form>
   <dl>
     <dt>
          <label> 账号：</label>
          <input type="text" name="uemail" id="rt-email" class="text" placeholder="Your Email...">
     </dt>
     <dt>
          <label> 密码：</label>
          <input name="upaswd" type="password" class="text" id="rt-paswd" maxlength="20" placeholder="Password...">
     </dt>
     <dt style="margin-top:-15px;"><label></label>
      <input name="remblog" id="rt-rem" type="checkbox"  checked value="1">10天内免登录
      <a href="" style="margin-left:50px; line-height:36px;" title="点击找回密码">忘记密码？</a>
     </dt>
     <dt style="margin-top:-15px;"><label></label>
         <button type="submit" class="login" id="rt-submit">登 录</button>
         <a href="" class="reg">注册</a>
     </dt>
  </dl>
</form>
<div class="footer">
 <h3><span class="fl">使用合作账号登录：</span>
  <a href="" class="sns_qq fl" title="QQ账号登录">QQ账号登录</a>
  <a href="" class="sns_sina fl" title="新浪微博登录">新浪微博登录</a>
  </h3>
</div>
</div>
<script type="text/javascript" src="js/jquery-1.8.3.js"></script>
<script type="text/javascript" src="100nn/cj/login/smohan.poplayer.js"></script>
<script type="text/javascript">
$(document).ready(function(e) {
  $('a#pp').smohanpoplayer({
    events: "click", //绑定事件
    shadow: true,  //开启遮罩层
	drag : true,
    content: "#pop-login", //弹出层内容
    title: "登录Smohan.net", //显示标题
   })  
});
</script>
</body>
</html>
