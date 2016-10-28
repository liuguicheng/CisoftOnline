<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>广西100南宁商家订单系统</title>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-1.8.3.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/easyui/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/ztree/jquery.ztree.core-3.5.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/highcharts.js"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/js/easyui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/js/easyui/themes/icon.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/js/ztree/zTreeStyle.css">

<!-- <link href="css/base.css" rel="stylesheet" type="text/css" />
<link href="css/font.css" rel="stylesheet" type="text/css" />
<link href="css/index.css" rel="stylesheet" type="text/css" /> -->
<script type="text/javascript">	
	var setting={
			callback:{
				onClick:onclick
			},
			data:{
				key:{
					name:"menuname"//重点啊！！！
				},
				simpleData:{
					enable:true,
					idKey:"id",
					pIdKey:"pId",
					rootPId:0
				}
			}
	};	
		
		/////////////////////////////////////////////////////////////////////////////////////////////////////////
		$(function(){	
		var menus=$(".firstMenu");
		//二级菜单
		$.each(menus,function(){
			var id=$(this).attr("id"); 
			$.post("${pageContext.request.contextPath}/menu_getMenu",{"id":id},function(data){
				var tree1=$("#ul"+id);
				$.fn.zTree.init(tree1,setting,data);
			});
		});
		
		//退出
		$("#btnexit").click(function(){
			$.messager.confirm("退出","真的要退出吗?",function(r){
				if(r){
					location.href="${pageContext.request.contextPath}/user_exit";
				}
			});
		});
		//获取数量统计
		$.ajax({
			   type: "POST",
			   url: "htorderdetail_querycount?order.o_status="+'-1'+"&order.o_sort=1&kddh=0",
			   success: function(msg){
				    //获取数量
					$("#ddid span").html(msg);
			   }
		});
		//待付款
		$.ajax({
			   type: "POST",
			   url: "htorderdetail_querycount?order.o_status=8&order.o_sort=1",
			   success: function(msg){
				    //获取数量
					$("#dfkid span").html(msg);
			   }
		});
		//待发货
		$.ajax({
			   type: "POST",
			   url: "htorderdetail_querycount?order.o_status=0&order.o_sort=1",
			   success: function(msg){
				    //获取数量
					$("#dfhid span").html(msg);
			   }
		});
		//已发货
		$.ajax({
			   type: "POST",
			   url: "htorderdetail_querycount?order.o_status=1&order.o_sort=1",
			   success: function(msg){
				    //获取数量
					$("#yfhid span").html(msg);
			   }
		});
		
		//微信统计
		//获取数量统计
		$.ajax({
			   type: "POST",
			   url: "htorderdetail_querycount?order.o_status="+'-1'+"&order.o_sort=2&kddh=0",
			   success: function(msg){
				    //获取数量
					$("#wxddid span").html(msg);
			   }
		});
		//待付款
		$.ajax({
			   type: "POST",
			   url: "htorderdetail_querycount?order.o_status=8&order.o_sort=2",
			   success: function(msg){
				    //获取数量
					$("#wxdfkid span").html(msg);
			   }
		});
		//待发货
		$.ajax({
			   type: "POST",
			   url: "htorderdetail_querycount?order.o_status=0&order.o_sort=2",
			   success: function(msg){
				    //获取数量
					$("#wxdfhid span").html(msg);
			   }
		});
		//已发货
		$.ajax({
			   type: "POST",
			   url: "htorderdetail_querycount?order.o_status=1&order.o_sort=2",
			   success: function(msg){
				    //获取数量
					$("#wxyfhid span").html(msg);
			   }
		});
		
		//待上架商品
		$.ajax({
			   type: "POST",
			   url: "commodity_querycount?c_sj=2",
			   success: function(msg){
				    //获取数量
					$("#dsjid span").html(msg);
			   }
		});
		//售卖中商品
		$.ajax({
			   type: "POST",
			   url: "commodity_querycount?c_sj=1",
			   success: function(msg){
				    //获取数量
					$("#ysjid span").html(msg);
			   }
		});
		//今日成交额
		
		$.ajax({
			   type: "POST",
			   url: "htorderdetail_querysumprice?order.o_status=0&order.o_sort=0&kddh=0",
			   success: function(msg){
				    //获取交易额
					$("#todayjye span").html(msg);
			   }
		});
		
//查询统计图片数据
		var ordernum = new Array(12);
		var wharr = new Array(12);
		var dfknum = new Array(12);
		var dfhnum = new Array(12);
		var yfhnum = new Array(12);

		var wdd="[]";//所有订单
		var dfk="";//待付款
		var dfh="";//待发货
		var yfh="";//已发货
		$.ajax({
			   type: "POST",
			   async: false, 
			   url: "htorder_queryTjsj?o_status=-1",
			   success: function(msg){
				   
				   wdd=msg;
			   }
		});
		$.ajax({
			   type: "POST",
			   async: false, 
			   url: "htorder_queryTjsj?o_status=8",
			   success: function(msg){
				   
				   dfk=msg;
			   }
		});
		$.ajax({
			   type: "POST",
			   async: false, 
			   url: "htorder_queryTjsj?o_status=0",
			   success: function(msg){
				   
				   dfh=msg;
			   }
		});
		$.ajax({
			   type: "POST",
			   async: false, 
			   url: "htorder_queryTjsj?o_status=1",
			   success: function(msg){
				   
				   yfh=msg;
			   }
		});
		ordernum=wdd.split(",");
		for ( i=0;i<wharr.length;i++){
			wharr[i]=parseFloat(ordernum[i]);
		}
		dfknum=dfk.split(",");
		for ( i=0;i<dfknum.length;i++){
			dfknum[i]=parseFloat(dfknum[i]);
		}
		dfhnum=dfh.split(",");
		for ( i=0;i<dfhnum.length;i++){
			dfhnum[i]=parseFloat(dfhnum[i]);
		}
		yfhnum=yfh.split(",");
		for ( i=0;i<yfhnum.length;i++){
			yfhnum[i]=parseFloat(yfhnum[i]);
		}
		//统计图表
		 $('#container').highcharts({
			 chart: {
		            type: 'column'
		        },
		        title: {
		            text: '报表统计',
		            x: -20 //center
		        },
		        subtitle: {
		            text: '2014年订单统计',
		            x: -20
		        },
		        xAxis: {
		            categories: ['一月', '二月', '三月', '四月', '五月', '六月','七月', '八月', '九月', '十月', '十一月', '十二月']
		        },
		        yAxis: {
		            title: {
		                text: '单位（单）'
		            },
		            plotLines: [{
		                value: 0,
		                width: 1,
		                color: '#808080'
		            }]
		        },
		        tooltip: {
		            valueSuffix: '单'
		        },
	            credits: {
	           	 text: 'www.cisoft.cn',
	           	 href: 'http://www.cisoft.cn'
	       	 	},
		        legend: {
		            layout: 'vertical',
		            align: 'right',
		            verticalAlign: 'middle',
		            borderWidth: 0
		        },
		        series: [{
		            name: '订单完结',
		            data: wharr
		        }, {
		            name: '待付款订单',
		            data: dfknum
		        }, {
		            name: '待发货订单',
		            data: dfhnum
		        }, {
		            name: '已发货订单',
		            data: yfhnum
		        }]
		    });
	});
	
	function onclick(event,treeId,treeNode){
		var name=treeNode.menuname;
		var url=treeNode.page;
		if(url!=null){
			open(name,url);
		}
	}
	
	/**     
	 * 刷新tab 
	 * @cfg  
	 *example: {tabTitle:'tabTitle',url:'refreshUrl'} 
	 *如果tabTitle为空，则默认刷新当前选中的tab 
	 *如果url为空，则默认以原来的url进行reload 
	 */  
	function refreshTab(cfg){  
	    var refresh_tab = cfg.tabTitle?$('#tabs').tabs('getTab',cfg.tabTitle):$('#tabs').tabs('getSelected');  
	    if(refresh_tab && refresh_tab.find('iframe').length > 0){  
	    var _refresh_ifram = refresh_tab.find('iframe')[0];  
	    var refresh_url = cfg.url?cfg.url:_refresh_ifram.src;  
	    //_refresh_ifram.src = refresh_url;  
	    _refresh_ifram.contentWindow.location.href=refresh_url;  
	    }  
	}  
	function open(name, url) {		
		if ($("#tabs").tabs('exists', name)) {
		
			$('#tabs').tabs('select', name);
			refreshTab({tabTitle:name,url:url});
		} else {
			var content ='<div style="width:100%;height:100%;">'
					      /* +'<div  class="forward" name="d"><a onclick="open1(id)" id='+url+'>'+name+'></a></div>' */
					      +'<iframe class="if" src="${pageContext.request.contextPath}/'+url+'" style="width:100%;height:100%;border:none;" ></iframe>'
					+'</div>';
					
			var s = '<iframe name="mainFrame" scrolling="no" frameborder="0"  src="${pageContext.request.contextPath}/'+url+'" style="width:100%;height:100%;"></iframe>';
			$('#tabs').tabs('add', {
				title : name,
				content : s,
				closable : true
			});
		}
		/*  if ($("#tabs").tabs('exists', name)) {
			$('#tabs').tabs('select', name);
		} else {
			var content ='<div style="width:100%;height:96%;">'
					      +'<div  class="forward" name="d"><a onclick="open1(id)" id='+url+'>'+name+'></a></div>'
					      +'<iframe class="if" src="${pageContext.request.contextPath}/'+url+'" style="width:100%;height:100%;border:none;" ></iframe>'
					+'</div>';
			$('#tabs').tabs('add', {
				title : name,
				content : content,
				closable : true
			});
		}  */
		/* $("#tabs").tabs('close',1); 
		var content ='<div style="width:100%;height:96%;">'
		      +'<div  class="forward" name="d"><a onclick="open1(id)" id='+url+'>'+name+'></a></div>'
		      +'<iframe class="if" src="${pageContext.request.contextPath}/'+url+'" style="width:100%;height:100%;border:none;" ></iframe>'
		+'</div>';
		$('#tabs').tabs('add', {
			title : name,
			content : content,
			closable : true
		}); */
	}
	
	//////////////////////////////////////////////////////////////////////////////////////////////////////
	//增加导航
	function forward(n,url){
		var a=$("<a  onclick='open1(id)' id="+url+">"+n+"></a>");
		$(".forward").append(a);//多个
		
		var arrs=$(".forward a");
		for(var i=0;i<arrs.length;i++){
			if(i!=arrs.length-1){
				$(arrs[i]).attr("href","#");
			}
		}
	}
	//点击导航
	function open1(id){
		$(".if").attr("src","${pageContext.request.contextPath}/"+id);
		$("a[id='"+id+"']").nextAll().addClass("hh");
		$("a").remove(".hh");
		
		var arrs=$(".forward a");
		for(var i=0;i<arrs.length;i++){
			if(i==(arrs.length-1)){
				$(arrs[i]).removeAttr("href");
			}
		}
	}
	//删除某个导航
	function deleteforward(id){
		$("a[id='"+id+"']").prev().removeAttr("href");
		$("a[id='"+id+"']").addClass("hh");
		$("a").remove(".hh");
	}
	////////////////////////////////////////首页导航////////////////////////////////////////////////////////
	//增加导航
	function firstforward(n,url){
		var a=$("<a  onclick='firstopen1(id)' id="+url+">"+n+"></a>");
		$(".firstforward").append(a);
		
		var arrs=$(".firstforward a");
		for(var i=0;i<arrs.length;i++){
			if(i!=arrs.length-1){
				$(arrs[i]).attr("href","#");
			}
		}
	}
	//点击导航
	function firstopen1(id){
		$(".firstiframe").attr("src","${pageContext.request.contextPath}/"+id);
		$("a[id='"+id+"']").nextAll().addClass("hh");
		$("a").remove(".hh");
		
		var arrs=$(".firstforward a");
		for(var i=0;i<arrs.length;i++){
			if(i==(arrs.length-1)){
				$(arrs[i]).removeAttr("href");
			}
		}
	}
	function shows(){
		$("#divfuceng").show();
		var h = $(document).height();
		$(".overlay").css({"height": h });
		$(".overlay").css({'display':'block','opacity':'0.8'});
		$(".showbox").stop(true).animate({'margin-top':'300px','opacity':'1'},200);
	}
	
	function cancels(){
	   	$("#divfuceng").hide();
	    $(".showbox").stop(true).animate({'margin-top':'250px','opacity':'0'},400);
		$(".overlay").css({'display':'none','opacity':'0'});
	}
	function toorders(id,o_status){
	    var url="";
		if(id==1){
			if(o_status==-1){
			url="pages_pcorders?kddh=0";
			}else if(o_status==8){
				url="pages_pcorders?o_status=8";
			}else if(o_status==0){
				url="pages_pcorders?o_status=0";
			}else if(o_status==1){
				url="pages_pcorders?o_status=1";
			}
			
			open("pc端订单管理",url);
		}else if(id==2){
			if(o_status==-1){
				url="pages_wxorders?kddh=0";
				}else if(o_status==8){
					url="pages_wxorders?o_status=8";
				}else if(o_status==0){
					url="pages_wxorders?o_status=0";
				}else if(o_status==1){
					url="pages_wxorders?o_status=1";
				}
			open("微信端订单管理",url);
			
		}
		
	}
	//跳转商品管理列表
	function tospinfo(id){
		var url="pages_shoppinginfo?c_sj="+id;
		open("商品资料管理",url);
	}
</script>
<style type="text/css">
	*{margin:0;padding:0;list-style-type:none;}
	a,img{border:0;}
	.demo{margin:100px auto 0 auto;width:400px;text-align:center;font-size:18px;}
	.demo .action{color:#3366cc;text-decoration:none;font-family:"微软雅黑","宋体";}
	.overlay{position:fixed;top:0;right:0;bottom:0;left:0;z-index:998;width:100%;height:100%;_padding:0 20px 0 0;background:#f6f4f5;display:none;}
	.showbox{position:fixed;top:0;left:50%;z-index:9999;opacity:0;filter:alpha(opacity=0);margin-left:-80px;}
	*html,*html body{background-image:url(about:blank);background-attachment:fixed;}
	*html .showbox,*html .overlay{position:absolute;top:expression(eval(document.documentElement.scrollTop));}
	#AjaxLoading{border:1px solid #8CBEDA;color:#37a;font-size:12px;font-weight:bold;}
	#AjaxLoading div.loadingWord{width:180px;height:50px;line-height:50px;border:2px solid #D6E7F2;background:#fff;}
	#AjaxLoading img{margin:10px 15px;float:left;display:inline;}

	.forward{
		height:25px;
		line-height:25px;
		text-align:left;
		background: url('img/forward.gif') repeat-x;
	}
	.firstforward{
		height:25px;
		line-height:25px;
		text-align:left;
		background: url('img/forward.gif') repeat-x;
	}
	
	.contextid a{
	    text-decoration: none;
	    color: black;
	}
	.contextid a:hover{
	    text-decoration: none;
	    color: red;
	}
	.contextid a:hover span{
	    text-decoration: none;
	    color: #95B8E7;
	}
	.contextid span{
	    color: red;
	}
	.contextid div{
	   line-height: 24px;
	}
	
</style>
</head>
<body class="easyui-layout">
		<div data-options="region:'north',title:'',split:false" style="height: 104px;">
			<div style="height:80px;"class="top_logoall">
				<div class="top_logoleft"></div>
				<div class="top_logoright"></div>
			</div>
			<div style="height: 22px;background: #eff4fa;">
				<div style="float: left;margin-left: 30px;">
					<img alt="" src="img/touxiang.gif">
				</div>
				<div style="float: left;margin: 0 auto;line-height: 22px;margin-left: 5px;">
					你好,
					<font style="color: red;padding-top: 0px;">
				        ${usersession.u_zsName }
				    </font>
				</div>
				<div style="float:right;margin-right: 40px;">
					<a href="#" id="btnexit">
						<div style="float: left;">
							<img alt="" src="img/exit.gif">
						</div>
						<div style="float: left;margin: 0 auto;line-height: 22px;">
							[安全退出]
						</div>
					</a>
				</div>
			</div>
		</div> 
	<div data-options="region:'west',iconCls:'icon-yw',title:'菜单项',split:true" style="width:220px;">
		<div id="aa" class="easyui-accordion">
			<s:iterator value="#menus" var="m">
				<div title='${menuname }' id='${id }' class="firstMenu" data-options="iconCls:'icon-yw',selected:true" style="padding:10px;"> 
					<ul id="ul${m.id}" class="ztree"></ul>
				</div>	
			</s:iterator>
		</div> 
	</div> 
	<div  data-options="region:'center'" style="padding:5px;background:#eee;">
		<div id="tabs" fit="true" class="easyui-tabs" border="false">
			<div title="首页" id="subWarp">
				<div  class="firstforward" name="d"></div>
				<div>
				   <div style="margin: 30px 50px 20px 50px;width: 450px;float: left; ">
				      <div style="border-bottom: 1px #c5c5c5 dashed;padding-bottom: 5px;font-size: 14px;">温馨提醒：</div>
				      <br/>
				      <div class="contextid">
				          <div>订单提醒：<a id="ddid" href="javascript:toorders(1,-1);">今日pc版订单 &nbsp;<span>0</span></a> ｜ <a id="dfkid" href="javascript:toorders(1,8)">待付款订单 <span>0</span></a> ｜ <a id="dfhid" href="javascript:toorders(1,0)">待发货订单 <span>0</span></a> | <a id="yfhid" href="javascript:toorders(1,1)">已发货订单 <span>0</span></a></div>
				          <div style="padding-left: 60px;"><a id="wxddid" href="javascript:toorders(2,-1);">今日wx版订单 &nbsp;<span>0</span></a> ｜ <a id="wxdfkid" href="javascript:toorders(2,8);">待付款订单 <span>0</span></a> ｜ <a id="wxdfhid" href="javascript:toorders(2,0);">待发货订单 <span>0</span></a> | <a id="wxyfhid" href="javascript:toorders(2,1);">已发货订单 <span>0</span></a></div>
				          <div>商品提醒：<a href="javascript:tospinfo(2);" id="dsjid">待上架商品 <span>0</span></a> ｜ <a id="ysjid" href="javascript:tospinfo(1);">出售中商品 <span>0</span></a></div>
				          <div>当天销量：<a id="todayjye" href="">今日成交  ¥ <span> 0.0</span> 金额</a></div>
				      </div>
				   </div>
				   <div style="margin: 30px 50px 20px 50px;width: 450px;float: left;">
				     <div style="font-size: 14px;">
				      <div style="float: left;border-bottom: 1px #c5c5c5 dashed;padding-bottom: 5px;width: 400px;">最新留言：</div>
				      <div style="float: right;border-bottom: 1px #c5c5c5 dashed;padding-bottom: 5px;width: 46px;;"><a href="" style="text-decoration: none;">更多...</a></div>
				      </div>
				      <br/>
				      <div class="contextid">
				        <div style="padding: 10px 0px;line-height: 10px;margin-top: 10px;">
				          <ul style="line-height: 20px;">
				           <li><a href="">刚刚下单请及时发货...</a></li>
				           <li><a href="">请问问题是什么...</a></li>
				           <li><a href="">问题是一个很高深的问题...</a></li>
				           <li><a href="">这是一个留言记录样本...</a></li>
				            <li><a href="">留言记录是用户下单发送的留言...</a></li>
				            
				          </ul>
				          </div>
				      </div>
				   </div>
				   <div style="clear: both;margin: 0px 50px;width: 1000px;border: 1px #ccc solid;height: 300px;">
				   <div id="container" style="min-width:700px;height:300px"></div>
				   
				   </div>
				</div>
				
			</div>
		</div>
	</div> 
	
	
	<div id="divfuceng" style="display: none;">
		<div class="overlay"></div>	 
		<div id="AjaxLoading" class="showbox">
			<div class="loadingWord"><img src="img/loading.gif">正在处理，请稍等...</div>
		</div> 
		<div style="height:1200px;"></div>
	</div>
</body>
</html>