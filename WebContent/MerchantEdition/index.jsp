<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>商家版－首页</title>
        <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
        <!-- bootstrap 3.0.2 -->
        <link href="${pageContext.request.contextPath }/MerchantEdition/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
        <!-- font Awesome -->
        <link href="${pageContext.request.contextPath }/MerchantEdition/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
        <!-- Ionicons -->
        <link href="${pageContext.request.contextPath }/MerchantEdition/css/ionicons.min.css" rel="stylesheet" type="text/css" />
        <!-- Morris chart -->
        <link href="${pageContext.request.contextPath }/MerchantEdition/css/morris/morris.css" rel="stylesheet" type="text/css" />
        <!-- jvectormap -->
        <link href="${pageContext.request.contextPath }/MerchantEdition/css/jvectormap/jquery-jvectormap-1.2.2.css" rel="stylesheet" type="text/css" />
        <!-- Date Picker -->
        <link href="${pageContext.request.contextPath }/MerchantEdition/css/datepicker/datepicker3.css" rel="stylesheet" type="text/css" />
        <!-- Daterange picker -->
        <link href="${pageContext.request.contextPath }/MerchantEdition/css/daterangepicker/daterangepicker-bs3.css" rel="stylesheet" type="text/css" />
        <!-- bootstrap wysihtml5 - text editor -->
        <link href="${pageContext.request.contextPath }/MerchantEdition/css/bootstrap-wysihtml5/bootstrap3-wysihtml5.min.css" rel="stylesheet" type="text/css" />
        <!-- Theme style -->
        <link href="${pageContext.request.contextPath }/MerchantEdition/css/AdminLTE.css" rel="stylesheet" type="text/css" />

        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
          <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
          <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
        <![endif]-->
    </head>
    <body class="skin-blue">
    
      <header class="header">
            <a href="index.html" class="logo">
                <!-- Add the class icon to your logo image or logo icon to add the margining -->
                CisoftOnline
            </a>
            <!-- Header Navbar: style can be found in header.less -->
            <nav class="navbar navbar-static-top" role="navigation">
                <!-- Sidebar toggle button-->
            
               <form class="navbar-form navbar-left" role="search">
            <div class="form-group">
              <input type="text" class="form-control" placeholder="商城商品搜索">
            </div>
            <button type="submit" class="btn btn-default">搜索</button>
          </form> 
          <ul class="nav navbar-nav" style="margin-left: 5px;">
            <li class="active"><a href="#">首页</a></li>
            <li><a href="#">商品</a></li>
            <li><a href="#">订单</a></li>
             <li><a href="#">促销</a></li>
              <li><a href="#">店铺</a></li>
               <li><a href="#">售后服务</a></li>
                <li><a href="#">结算统计</a></li>
                 <li><a href="#">客服消息</a></li>
                  <li><a href="#">账号</a></li>
          </ul>
         
                <div class="navbar-right">
                    <ul class="nav navbar-nav">
                        <!-- Messages: style can be found in dropdown.less-->
                        <li class="dropdown messages-menu">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                <i class="fa fa-envelope"></i>
                                <span class="label label-success">4</span>
                            </a>
                            <ul class="dropdown-menu">
                                <li class="header">您有4条未读消息</li>
                                <li>
                                    <!-- inner menu: contains the actual data -->
                                    <ul class="menu">
                                        <li><!-- start message -->
                                            <a href="#">
                                                <div class="pull-left">
                                                    <img src="img/avatar3.png" class="img-circle" alt="User Image"/>
                                                </div>
                                                <h4>
                                                    Support Team
                                                    <small><i class="fa fa-clock-o"></i> 5 mins</small>
                                                </h4>
                                                <p>Why not buy a new awesome theme?</p>
                                            </a>
                                        </li><!-- end message -->
                                        
                                    </ul>
                                </li>
                                <li class="footer"><a href="#">查看所有消息</a></li>
                            </ul>
                        </li>
                        <!-- Notifications: style can be found in dropdown.less -->
                        <li class="dropdown notifications-menu">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                <i class="fa fa-warning"></i>
                                <span class="label label-warning">10</span>
                            </a>
                            <ul class="dropdown-menu">
                                <li class="header">您有10条未读系统通知</li>
                                <li>
                                    <!-- inner menu: contains the actual data -->
                                    <ul class="menu">
                                        <li>
                                            <a href="#">
                                                <i class="ion ion-ios7-people info"></i> 5 new members joined today
                                            </a>
                                        </li>
                                       
                                    </ul>
                                </li>
                                <li class="footer"><a href="#">查看所有系统通知</a></li>
                            </ul>
                        </li>
                        <!-- User Account: style can be found in dropdown.less -->
                        <li class="dropdown user user-menu">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                <i class="glyphicon glyphicon-user"></i>
                                <span>刘贵成 <i class="caret"></i></span>
                            </a>
                            <ul class="dropdown-menu">
                                <!-- User image -->
                                <li class="user-header bg-light-blue">
                                    <img src="img/avatar3.png" class="img-circle" alt="User Image" />
                                    <p>
                                       刘贵成－天立商铺
                                        <small>创立于2015年</small>
                                    </p>
                                </li>
                                <!-- Menu Body -->
                                <li class="user-body">
                                    <div class="col-xs-4 text-center">
                                        <a href="#">会员</a>
                                    </div>
                                    <div class="col-xs-4 text-center">
                                        <a href="#">商品</a>
                                    </div>
                                    <div class="col-xs-4 text-center">
                                        <a href="#">订单</a>
                                    </div>
                                </li>
                                <!-- Menu Footer-->
                                <li class="user-footer">
                                    <div class="pull-left">
                                        <a href="#" class="btn btn-default btn-flat">详细信息</a>
                                    </div>
                                    <div class="pull-right">
                                        <a href="#" class="btn btn-default btn-flat">登  出</a>
                                    </div>
                                </li>
                            </ul>
                        </li>
                    </ul>
                </div>
            </nav>
        </header>
    <!-- 头部结束 -->
        
        <div class="wrapper row-offcanvas row-offcanvas-left">
            <!-- Left side column. contains the logo and sidebar -->
            <aside class="left-side sidebar-offcanvas">
                <!-- sidebar: style can be found in sidebar.less -->
                    <!-- Sidebar user panel -->
                    <div class="user-panel">
                        <div class="pull-left image">
                            <img src="img/avatar3.png" class="img-circle" alt="User Image" />
                        </div>
                        <div class="pull-left info">
                            <p>您好, 刘贵成</p>

                            <a href="#"><i class="fa fa-circle text-success"></i> 在线</a>
                        </div>
                    </div>
                    <hr />
         		<div style="margin: 10px 20px auto;">
         		<p class="text-muted">店铺名称：<span class="text-info">天立店铺</span></p>
         		<p class="text-muted">权限：<span class="text-info">管理员</span></p>
         		<p class="text-muted">网址：<span class="text-info">www.100nn.cn</span></p>
         		<p class="text-muted">最后登录时间：<span class="text-info">2015-12-12</span></p>
                <p class="text-muted">有效期：<span class="text-info">2017-12-12</span></p>
                <p class="text-muted">备案号：<span class="text-info">12002922号-1</span></p>
                  <hr/>
                  <address>
  <strong style="font-size: 20px;">联系我们</strong><br/>
</address>
<address>
  <strong>联系地址:</strong><span style="font-size: 10px;">广西南宁市厢竹大道7号天立·TT国际A座18层</span>
</address>
    <address>
  <strong>客服电话:</strong><span style="font-size: 10px;"> 0771－3830582</span>
</address>
<address>
  <strong>技术客服QQ:</strong><span style="font-size: 10px;">282303392</span>
</address>
<address>
  <strong>联系邮箱:</strong><span style="font-size: 10px;">282303392@qq.com</span>
</address>
                </div>
                <!-- /.sidebar -->
            </aside>
             <!-- 左边导航结束 -->
             
            <!-- Right side column. Contains the navbar and content of the page -->
            <aside class="right-side">
                <!-- Content Header (Page header) -->
                <section class="content-header">
                     <h1>
                        商家中心
                        <small>首页</small>
                    </h1> 
                    <ol class="breadcrumb">
                        <li><a href="#"><i class="fa fa-dashboard"></i>商家中心</a></li>
                        <li class="active">首页</li>
                    </ol>
                </section>

                <!-- Main content -->
                <section class="content">  
                   <div class="col-md-8">
                            <!-- Info box -->
                            <div class="box box-info">
                                <div class="box-header">
                                    <h3 class="box-title">温馨提示</h3>
                                    <div class="box-tools pull-right">
                                        <div class="label bg-aqua">new</div>
                                    </div>
                                </div>
                                <div class="box-body">
                                    <p>
                                        
                                    </p>
                                </div><!-- /.box-body -->
                                
                            </div><!-- /.box -->
                        </div>
                        <div class="col-md-4">
                            <!-- Info box -->
                            <div class="box box-info">
                                <div class="box-header">
                                    <h3 class="box-title">系统公告</h3>
                                    <div class="box-tools pull-right">
                                        <div class="label bg-aqua">Label</div>
                                    </div>
                                </div>
                                <div class="box-body">
                                    Box class: <code>.box.box-info</code>
                                    <p>
                                        amber, microbrewery abbey hydrometer, brewpub ale lauter tun saccharification oxidized barrel.
                                        berliner weisse wort chiller adjunct hydrometer 
                                    </p>
                                </div><!-- /.box-body -->
                                <div class="box-footer">
                                    <code>.box-footer</code>
                                </div><!-- /.box-footer-->
                            </div><!-- /.box -->
                        </div>  
                         <div class="col-md-8">
                            <!-- Info box -->
                            <div class="box box-info">
                                <div class="box-header">
                                    <h3 class="box-title">交易提示</h3>
                                    <div class="box-tools pull-right">
                                        <div class="label bg-aqua">Label</div>
                                    </div>
                                </div>
                                <div class="box-body">
                                    Box class: <code>.box.box-info</code>
                                    <p>
                                        amber, microbrewery abbey hydrometer, brewpub ale lauter tun saccharification oxidized barrel.
                                        berliner weisse wort chiller adjunct hydrometer alcohol aau!
                                        sour/acidic sour/acidic chocolate malt ipa ipa hydrometer.
                                    </p>
                                </div><!-- /.box-body -->
                                <div class="box-footer">
                                    <code>.box-footer</code>
                                </div><!-- /.box-footer-->
                            </div><!-- /.box -->
                        </div>                    
						<div class="col-md-4">
                            <!-- Info box -->
                            <div class="box box-info">
                                <div class="box-header">
                                    <h3 class="box-title">最新用户留言及评价</h3>
                                    <div class="box-tools pull-right">
                                        <div class="label bg-aqua">Label</div>
                                    </div>
                                </div>
                                <div class="box-body">
                                </div>    
                            </div><!-- /.box -->
                        </div>  
                         <div class="col-md-8">
                            <!-- Info box -->
                            <div class="box box-info">
                                <div class="box-header">
                                    <h3 class="box-title">销售统计</h3>
                                    <div class="box-tools pull-right">
                                        <div class="label bg-aqua">Label</div>
                                    </div>
                                </div>
                                <div class="box-body">
                                    Box class: <code>.box.box-info</code>
                                    <p>
                                        amber, microbrewery abbey hydrometer, brewpub ale lauter tun saccharification oxidized barrel.
                                        berliner weisse wort chiller adjunct hydrometer alcohol aau!
                                        sour/acidic sour/acidic chocolate malt ipa ipa hydrometer.
                                    </p>
                                </div><!-- /.box-body -->
                                <div class="box-footer">
                                    <code>.box-footer</code>
                                </div><!-- /.box-footer-->
                            </div><!-- /.box -->
                        </div> 
                         <div class="col-md-4">
                            <!-- Info box -->
                            <div class="box box-info">
                                <div class="box-header">
                                    <h3 class="box-title">销售商品排行榜</h3>
                                    <div class="box-tools pull-right">
                                        <div class="label bg-aqua">Label</div>
                                    </div>
                                </div>
                                <div class="box-body">
                                    Box class: <code>.box.box-info</code>
                                    <p>
                                        amber, microbrewery abbey hydrometer, brewpub ale lauter tun saccharification oxidized barrel.
                                        berliner weisse wort chiller adjunct hydrometer alcohol aau!
                                        sour/acidic sour/acidic chocolate malt ipa ipa hydrometer.
                                    </p>
                                </div><!-- /.box-body -->
                                <div class="box-footer">
                                    <code>.box-footer</code>
                                </div><!-- /.box-footer-->
                            </div><!-- /.box -->
                        </div> 
				</section>
            </aside><!-- /.right-side -->
        </div><!-- ./wrapper -->

        <!-- add new calendar event modal -->


        <!-- jQuery 2.0.2 -->
        <script src="${pageContext.request.contextPath }/MerchantEdition/js/jquery.js"></script>
        <!-- jQuery UI 1.10.3 -->
        <script src="${pageContext.request.contextPath }/MerchantEdition/js/jquery-ui-1.10.3.min.js" type="text/javascript"></script>
        <!-- Bootstrap -->
        <script src="${pageContext.request.contextPath }/MerchantEdition/js/bootstrap.min.js" type="text/javascript"></script>
        <!-- Morris.js charts -->
        <script src="//cdnjs.cloudflare.com/ajax/libs/raphael/2.1.0/raphael-min.js"></script>
        <script src="${pageContext.request.contextPath }/MerchantEdition/js/plugins/morris/morris.min.js" type="text/javascript"></script>
        <!-- Sparkline -->
        <script src="${pageContext.request.contextPath }/MerchantEdition/js/plugins/sparkline/jquery.sparkline.min.js" type="text/javascript"></script>
        <!-- jvectormap -->
        <script src="${pageContext.request.contextPath }/MerchantEdition/js/plugins/jvectormap/jquery-jvectormap-1.2.2.min.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath }/MerchantEdition/js/plugins/jvectormap/jquery-jvectormap-world-mill-en.js" type="text/javascript"></script>
        <!-- jQuery Knob Chart -->
        <script src="${pageContext.request.contextPath }/MerchantEdition/js/plugins/jqueryKnob/jquery.knob.js" type="text/javascript"></script>
        <!-- daterangepicker -->
        <script src="${pageContext.request.contextPath }/MerchantEdition/js/plugins/daterangepicker/daterangepicker.js" type="text/javascript"></script>
        <!-- datepicker -->
        <script src="${pageContext.request.contextPath }/MerchantEdition/js/plugins/datepicker/bootstrap-datepicker.js" type="text/javascript"></script>
        <!-- Bootstrap WYSIHTML5 -->
        <script src="${pageContext.request.contextPath }/MerchantEdition/js/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.all.min.js" type="text/javascript"></script>
        <!-- iCheck -->
        <script src="${pageContext.request.contextPath }/MerchantEdition/js/plugins/iCheck/icheck.min.js" type="text/javascript"></script>

        <!-- AdminLTE App -->
        <script src="${pageContext.request.contextPath }/MerchantEdition/js/AdminLTE/app.js" type="text/javascript"></script>

        <!-- AdminLTE dashboard demo (This is only for demo purposes) -->
        <script src="${pageContext.request.contextPath }/MerchantEdition/js/AdminLTE/dashboard.js" type="text/javascript"></script>

        <!-- AdminLTE for demo purposes -->
        <script src="${pageContext.request.contextPath }/MerchantEdition/js/AdminLTE/demo.js" type="text/javascript"></script>

    </body>
</html>