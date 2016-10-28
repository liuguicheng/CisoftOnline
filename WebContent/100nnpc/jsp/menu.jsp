<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title></title>
<link href="${pageContext.request.contextPath }/100nnpc/css/bootstap.cerulean.min.css" rel="stylesheet" type="text/css" />
</head>
<body>
<!--导航开始  -->
<nav class="navbar navbar-default navbar-static-top" role="navigation">
  <div class="container">
    <div class="navbar-header" >
      <!--当屏幕小于一定宽度显示缩略 开始  -->
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <!-- 屏幕小于一定宽度显示缩略 结束 -->
      <a class="navbar-brand" href="#">
        <span class="glyphicon glyphicon-home"></span>
      </a>
      <a class="navbar-brand" href="#"></a>
    </div>

    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav" >
         <li class="active"><a href="index.jsp">100商城</a></li>
         <li><a href="system.jsp">系统设置</a></li>
         <li><a href="#">系统设置</a></li>
         <li><a href="#">系统设置</a></li>
         <li><a href="#">系统设置</a></li>
         <li><a href="#">系统设置</a></li>
         <li><a href="#">系统设置</a></li>
      </ul>
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
</nav>
<!-- 导航结束 -->
</body>
<script type="text/jscript" src="${pageContext.request.contextPath }/js/jquery-1.8.3.js"></script>
<script type="text/jscript" src="${pageContext.request.contextPath }/js/bootstrap.min.js"></script>

</html>