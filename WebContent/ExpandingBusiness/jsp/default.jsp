<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
<base href="<%=basePath%>">

<!-- jsp文件头和头部 -->
<%@ include file="top.jsp"%>

</head>
<body>

	<div class="container-fluid" id="main-container">


		<div id="page-content" class="clearfix">

			<div class="page-header position-relative">
				<h1>
					商家中心 <small><i class="icon-double-angle-right"></i> </small>
				</h1>
			</div>
			<!--/page-header-->

			<div class="row-fluid">

				<div id="page-content" class="clearfix">

					<div class="row-fluid">
						<!-- PAGE CONTENT BEGINS HERE -->
						<div class="alert alert-block alert-success">
							<button type="button" class="close" data-dismiss="alert">
								<i class="icon-remove"></i>
							</button>
							<i class="icon-ok green"></i> 欢迎登陆Ciosft电商平台－商家版
						</div>
						<div class="space-6"></div>
						<div class="row-fluid">
							<div class="span7 infobox-container">

								<div class="infobox infobox-green">
									<div class="infobox-icon">
										<i class="icon-comments"></i>
									</div>
									<div class="infobox-data">
										<span class="infobox-data-number" onclick="s();">32</span> <span
											class="infobox-content">最新评论</span>
									</div>
									<div class="stat stat-success">8%</div>
								</div>
								<div class="infobox infobox-blue">
									<div class="infobox-icon">
										<i class="icon-twitter"></i>
									</div>
									<div class="infobox-data">
										<span class="infobox-data-number">11</span> <span
											class="infobox-content">新会员</span>
									</div>
									<div class="badge badge-success">+32%</div>
								</div>
								<div class="infobox infobox-pink">
									<div class="infobox-icon">
										<i class="icon-shopping-cart"></i>
									</div>
									<div class="infobox-data">
										<span class="infobox-data-number">8</span> <span
											class="infobox-content">今日新订单</span>
									</div>
									<div class="stat stat-important">4%</div>
								</div>
								<div class="infobox infobox-red">
									<div class="infobox-icon">
										<i class="icon-beaker"></i>
									</div>
									<div class="infobox-data">
										<span class="infobox-data-number">7</span> <span
											class="infobox-content">最新活动</span>
									</div>
								</div>
								<div class="infobox infobox-orange2">
									<div class="infobox-chart">
										<span class="sparkline"
											data-values="196,128,202,177,154,94,100,170,224"><canvas
												width="44" height="24"
												style="display: inline-block; width: 44px; height: 24px; vertical-align: top;"></canvas></span>
									</div>
									<div class="infobox-data">
										<span class="infobox-data-number">6,251</span> <span
											class="infobox-content">综合访问量</span>
									</div>
									<div class="badge badge-success">
										7.2% <i class="icon-arrow-up"></i>
									</div>
								</div>


								<div class="infobox infobox-blue2">
									<div class="infobox-progress">
										<div class="easy-pie-chart percentage easyPieChart"
											data-percent="42" data-size="46"
											style="width: 46px; height: 46px; line-height: 46px;">
											<span class="percent">42</span>%
											<canvas width="92" height="92"
												style="width: 46px; height: 46px;"></canvas>
										</div>
									</div>

									<div class="infobox-data">
										<span class="infobox-text">使用量</span> <span
											class="infobox-content"><span class="approx">~</span>
											剩余50g可用</span>
									</div>
								</div>

								<div class="space-6"></div>


								<div class="infobox infobox-small infobox-dark infobox-green">
									<div class="infobox-progress">
										<div class="easy-pie-chart percentage easyPieChart"
											data-percent="61" data-size="39"
											style="width: 39px; height: 39px; line-height: 39px;">
											<span class="percent">61</span>%
											<canvas width="78" height="78"
												style="width: 39px; height: 39px;"></canvas>
										</div>
									</div>
									<div class="infobox-data">
										<span class="infobox-content"><b>销售任务</b></span> <br> <span
											class="infobox-content">完成量</span>
									</div>
								</div>

								<div class="infobox infobox-small infobox-dark infobox-blue">
									<div class="infobox-chart">
										<span class="sparkline" data-values="3,4,2,3,4,4,2,2"><canvas
												width="39" height="14"
												style="display: inline-block; width: 39px; height: 14px; vertical-align: top;"></canvas></span>
									</div>
									<div class="infobox-data">
										<span class="infobox-content"><b>本月盈余</b></span> <br>
										<span class="infobox-content">$32,000</span>
									</div>
								</div>

								<div class="infobox infobox-small infobox-dark infobox-grey">
									<div class="infobox-icon">
										<i class="icon-download-alt"></i>
									</div>
									<div class="infobox-data">
										<span class="infobox-content"><b>app下载量</b></span> <br>
										<span class="infobox-content">1,205</span>
									</div>
								</div>
							</div>
							<div class="vspace"></div>
							<div class="span5">
								<div class="widget-box">
									<div
										class="widget-header widget-header-flat widget-header-small">
										<h5>
											<i class="icon-signal"></i> 订单来源
										</h5>
									</div>

									<div class="widget-body">
										<div class="widget-main">
											<div id="piechart-placeholder"
												style="width: 90%; min-height: 150px; padding: 0px; position: relative;">
												<canvas class="flot-base" width="828" height="300"
													style="direction: ltr; position: absolute; left: 0px; top: 0px; width: 414px; height: 150px;"></canvas>
												<canvas class="flot-overlay" width="828" height="300"
													style="direction: ltr; position: absolute; left: 0px; top: 0px; width: 414px; height: 150px;"></canvas>
												<div class="legend">
													<div
														style="position: absolute; width: 108px; height: 110px; top: 15px; right: -30px; opacity: 0.85; background-color: rgb(255, 255, 255);">
													</div>
													<table
														style="position: absolute; top: 15px; right: -30px;; font-size: smaller; color: #545454">
														<tbody>
															<tr>
																<td class="legendColorBox"><div
																		style="border: 1px solid null; padding: 1px">
																		<div
																			style="width: 4px; height: 0; border: 5px solid #68BC31; overflow: hidden"></div>
																	</div></td>
																<td class="legendLabel">pc官网</td>
															</tr>
															<tr>
																<td class="legendColorBox"><div
																		style="border: 1px solid null; padding: 1px">
																		<div
																			style="width: 4px; height: 0; border: 5px solid #2091CF; overflow: hidden"></div>
																	</div></td>
																<td class="legendLabel">移动手机端</td>
															</tr>
															<tr>
																<td class="legendColorBox"><div
																		style="border: 1px solid null; padding: 1px">
																		<div
																			style="width: 4px; height: 0; border: 5px solid #AF4E96; overflow: hidden"></div>
																	</div></td>
																<td class="legendLabel">移动app</td>
															</tr>
															<tr>
																<td class="legendColorBox"><div
																		style="border: 1px solid null; padding: 1px">
																		<div
																			style="width: 4px; height: 0; border: 5px solid #DA5430; overflow: hidden"></div>
																	</div></td>
																<td class="legendLabel">微信端</td>
															</tr>
															<tr>
																<td class="legendColorBox"><div
																		style="border: 1px solid null; padding: 1px">
																		<div
																			style="width: 4px; height: 0; border: 5px solid #FEE074; overflow: hidden"></div>
																	</div></td>
																<td class="legendLabel">其他</td>
															</tr>
														</tbody>
													</table>
												</div>
											</div>

											<div class="hr hr8 hr-double"></div>

											<div class="clearfix">
												<div class="grid3">
													<span class="grey"><i
														class="icon-facebook-sign icon-2x blue"></i> &nbsp; likes</span>
													<h4 class="bigger pull-right">1,255</h4>
												</div>

												<div class="grid3">
													<span class="grey"><i
														class="icon-twitter-sign icon-2x purple"></i> &nbsp;
														tweets</span>
													<h4 class="bigger pull-right">941</h4>
												</div>

												<div class="grid3">
													<span class="grey"><i
														class="icon-pinterest-sign icon-2x red"></i> &nbsp; pins</span>
													<h4 class="bigger pull-right">1,050</h4>
												</div>
											</div>
										</div>
										<!--/widget-main-->
									</div>
									<!--/widget-body-->
								</div>
								<!--/widget-box-->
							</div>
							<!--/span-->

						</div>
						<!--/row-->
						<div class="hr hr32 hr-dotted"></div>
						<div class="row-fluid">
							<div class="span5">
								<div class="widget-box transparent">
									<div class="widget-header widget-header-flat">
										<h4 class="lighter">
											<i class="icon-star orange"></i>最新订单
										</h4>
										<div class="widget-toolbar">
											<a href="#" data-action="collapse"><i
												class="icon-chevron-up"></i></a>
										</div>
									</div>

									<div class="widget-body">
										<div class="widget-body-inner">
											<div class="widget-main no-padding">
												<table id="table_bug_report"
													class="table table-bordered table-striped">
													<thead>
														<tr>
															<th><i class="icon-caret-right blue"></i>商品名称</th>
															<th><i class="icon-caret-right blue"></i>订单金额</th>
															<th class="hidden-phone"><i
																class="icon-caret-right blue"></i>订单状态</th>
														</tr>
													</thead>
													<tbody>
														<tr>
															<td class="">罗汉果 </td>
															<td><small><s class="red">$29.99</s></small> <b
																class="green">$19.99</b></td>
															<td class="hidden-phone"><span
																class="label label-info arrowed-right arrowed-in">on
																	sale</span></td>
														</tr>

														<tr>
															<td class="">古象天然香米 </td>
															<td><b class="blue">$16.45</b></td>
															<td class="hidden-phone"><span
																class="label label-success arrowed-in arrowed-in-right">approved</span></td>
														</tr>

														<tr>
															<td class="">进口泰国榴莲 </td>
															<td><b class="blue">$15.00</b></td>
															<td class="hidden-phone"><span
																class="label label-important arrowed">pending</span></td>
														</tr>
														<tr>
															<td class="">美即面膜保湿祛痘 </td>
															<td><small><s class="red">$19.95</s></small> <b
																class="green">$14.99</b></td>
															<td class="hidden-phone"><span class="label arrowed"><s>out
																		of stock</s></span></td>
														</tr>

														<tr>
															<td class="">美即面膜保湿祛痘 </td>
															<td><b class="blue">$12.00</b></td>
															<td class="hidden-phone"><span
																class="label label-warning arrowed arrowed-right">SOLD</span></td>
														</tr>
													</tbody>
												</table>
											</div>
											<!--/widget-main-->
										</div>
									</div>
									<!--/widget-body-->
								</div>
								<!--/widget-box-->
							</div>

							<div class="span7">
								<div class="widget-box transparent">
									<div class="widget-header widget-header-flat">
										<h4 class="lighter">
											<i class="icon-signal"></i>销售统计
										</h4>
										<div class="widget-toolbar">
											<a href="#" data-action="collapse"><i
												class="icon-chevron-up"></i></a>
										</div>
									</div>

									<div class="widget-body">
										<div class="widget-body-inner">
											<div class="widget-main padding-5">
												<div id="sales-charts"
													style="width: 100%; height: 220px; padding: 0px; position: relative;">
													<canvas class="flot-base" width="1386" height="440"
														style="direction: ltr; position: absolute; left: 0px; top: 0px; width: 693px; height: 220px;"></canvas>
													<div class="flot-text"
														style="position: absolute; top: 0px; left: 0px; bottom: 0px; right: 0px; font-size: smaller; color: rgb(84, 84, 84);">
														<div class="flot-x-axis flot-x1-axis xAxis x1Axis"
															style="position: absolute; top: 0px; left: 0px; bottom: 0px; right: 0px; display: block;">
															<div class="flot-tick-label tickLabel"
																style="position: absolute; top: 199px; left: 32px;">0.0</div>
															<div class="flot-tick-label tickLabel"
																style="position: absolute; top: 199px; left: 135px;">1.0</div>
															<div class="flot-tick-label tickLabel"
																style="position: absolute; top: 199px; left: 239px;">2.0</div>
															<div class="flot-tick-label tickLabel"
																style="position: absolute; top: 199px; left: 343px;">3.0</div>
															<div class="flot-tick-label tickLabel"
																style="position: absolute; top: 199px; left: 447px;">4.0</div>
															<div class="flot-tick-label tickLabel"
																style="position: absolute; top: 199px; left: 551px;">5.0</div>
															<div class="flot-tick-label tickLabel"
																style="position: absolute; top: 199px; left: 655px;">6.0</div>
														</div>
														<div class="flot-y-axis flot-y1-axis yAxis y1Axis"
															style="position: absolute; top: 0px; left: 0px; bottom: 0px; right: 0px; display: block;">
															<div class="flot-tick-label tickLabel"
																style="position: absolute; top: 184px; left: 1px;">-2.000</div>
															<div class="flot-tick-label tickLabel"
																style="position: absolute; top: 161px; left: 1px;">-1.500</div>
															<div class="flot-tick-label tickLabel"
																style="position: absolute; top: 138px; left: 1px;">-1.000</div>
															<div class="flot-tick-label tickLabel"
																style="position: absolute; top: 115px; left: 1px;">-0.500</div>
															<div class="flot-tick-label tickLabel"
																style="position: absolute; top: 92px; left: 5px;">0.000</div>
															<div class="flot-tick-label tickLabel"
																style="position: absolute; top: 69px; left: 5px;">0.500</div>
															<div class="flot-tick-label tickLabel"
																style="position: absolute; top: 46px; left: 5px;">1.000</div>
															<div class="flot-tick-label tickLabel"
																style="position: absolute; top: 23px; left: 5px;">1.500</div>
															<div class="flot-tick-label tickLabel"
																style="position: absolute; top: 0px; left: 5px;">2.000</div>
														</div>
													</div>
													<canvas class="flot-overlay" width="1386" height="440"
														style="direction: ltr; position: absolute; left: 0px; top: 0px; width: 693px; height: 220px;"></canvas>
													<div class="legend">
														<div
															style="position: absolute; width: 73px; height: 66px; top: 15px; right: 14px; opacity: 0.85; background-color: rgb(255, 255, 255);">
														</div>
														<table
															style="position: absolute; top: 15px; right: 14px;; font-size: smaller; color: #545454">
															<tbody>
																<tr>
																	<td class="legendColorBox"><div
																			style="border: 1px solid #ccc; padding: 1px">
																			<div
																				style="width: 4px; height: 0; border: 5px solid rgb(237, 194, 64); overflow: hidden"></div>
																		</div></td>
																	<td class="legendLabel">Domains</td>
																</tr>
																<tr>
																	<td class="legendColorBox"><div
																			style="border: 1px solid #ccc; padding: 1px">
																			<div
																				style="width: 4px; height: 0; border: 5px solid rgb(175, 216, 248); overflow: hidden"></div>
																		</div></td>
																	<td class="legendLabel">Hosting</td>
																</tr>
																<tr>
																	<td class="legendColorBox"><div
																			style="border: 1px solid #ccc; padding: 1px">
																			<div
																				style="width: 4px; height: 0; border: 5px solid rgb(203, 75, 75); overflow: hidden"></div>
																		</div></td>
																	<td class="legendLabel">Services</td>
																</tr>
															</tbody>
														</table>
													</div>
												</div>
											</div>
											<!--/widget-main-->
										</div>
									</div>
									<!--/widget-body-->
								</div>
								<!--/widget-box-->
							</div>
						</div>
						<!-- PAGE CONTENT ENDS HERE -->
					</div>
					<!--/row-->
				</div>
			</div>
		</div>
		<!--/row-->
	<!-- #main-content -->
	</div>
	<!--/.fluid-container#main-container-->
	<a href="#" id="btn-scroll-up" class="btn btn-small btn-inverse"> <i
		class="icon-double-angle-up icon-only"></i>
	</a>
	<!-- basic scripts -->
	<script src="${pageContext.request.contextPath }/ExpandingBusiness/static/1.9.1/jquery.min.js"></script>
	<script type="text/javascript">
		window.jQuery
				|| document
						.write("<script src='${pageContext.request.contextPath }/ExpandingBusiness/static/js/jquery-1.9.1.min.js'>\x3C/script>");
	</script>

	<script src="${pageContext.request.contextPath }/ExpandingBusiness/static/js/bootstrap.min.js"></script>
	<!-- page specific plugin scripts -->

	<!--[if lt IE 9]>
		<script type="text/javascript" src="static/js/excanvas.min.js"></script>
		<![endif]-->
	<script type="text/javascript"
		src="${pageContext.request.contextPath }/ExpandingBusiness/static/js/jquery-ui-1.10.2.custom.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath }/ExpandingBusiness/static/js/jquery.ui.touch-punch.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/ExpandingBusiness/static/js/jquery.slimscroll.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath }/ExpandingBusiness/static/js/jquery.easy-pie-chart.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/ExpandingBusiness/static/js/jquery.sparkline.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/ExpandingBusiness/static/js/jquery.flot.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/ExpandingBusiness/static/js/jquery.flot.pie.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath }/ExpandingBusiness/static/js/jquery.flot.resize.min.js"></script>
	<!-- ace scripts -->
	<script src="${pageContext.request.contextPath }/ExpandingBusiness/static/js/ace-elements.min.js"></script>
	<script src="${pageContext.request.contextPath }/ExpandingBusiness/static/js/ace.min.js"></script>
	<!-- inline scripts related to this page -->


	<script type="text/javascript">
		$(top.hangge());

		$(function() {
			$('.dialogs,.comments').slimScroll({
				height : '300px'
			});

			$('#tasks').sortable();
			$('#tasks').disableSelection();
			$('#tasks input:checkbox').removeAttr('checked').on('click',
					function() {
						if (this.checked)
							$(this).closest('li').addClass('selected');
						else
							$(this).closest('li').removeClass('selected');
					});
			var oldie = $.browser.msie && $.browser.version < 9;
			$('.easy-pie-chart.percentage')
					.each(
							function() {
								var $box = $(this).closest('.infobox');
								var barColor = $(this).data('color')
										|| (!$box.hasClass('infobox-dark') ? $box
												.css('color')
												: 'rgba(255,255,255,0.95)');
								var trackColor = barColor == 'rgba(255,255,255,0.95)' ? 'rgba(255,255,255,0.25)'
										: '#E2E2E2';
								var size = parseInt($(this).data('size')) || 50;
								$(this).easyPieChart({
									barColor : barColor,
									trackColor : trackColor,
									scaleColor : false,
									lineCap : 'butt',
									lineWidth : parseInt(size / 10),
									animate : oldie ? false : 1000,
									size : size
								});
							})
			$('.sparkline').each(
					function() {
						var $box = $(this).closest('.infobox');
						var barColor = !$box.hasClass('infobox-dark') ? $box
								.css('color') : '#FFF';
						$(this).sparkline('html', {
							tagValuesAttribute : 'data-values',
							type : 'bar',
							barColor : barColor,
							chartRangeMin : $(this).data('min') || 0
						});
					});

			var data = [ {
				label : "Pc客户端",
				data : 38.7,
				color : "#68BC31"
			}, {
				label : "移动手机端",
				data : 24.5,
				color : "#2091CF"
			}, {
				label : "手机app端",
				data : 8.2,
				color : "#AF4E96"
			}, {
				label : "微信端",
				data : 18.6,
				color : "#DA5430"
			}, {
				label : "其他",
				data : 10,
				color : "#FEE074"
			} ];
			var placeholder = $('#piechart-placeholder').css({
				'width' : '90%',
				'min-height' : '150px'
			});
			$.plot(placeholder, data, {

				series : {
					pie : {
						show : true,
						tilt : 0.8,
						highlight : {
							opacity : 0.25
						},
						stroke : {
							color : '#fff',
							width : 2
						},
						startAngle : 2

					}
				},
				legend : {
					show : true,
					position : "ne",
					labelBoxBorderColor : null,
					margin : [ -30, 15 ]
				},
				grid : {
					hoverable : true,
					clickable : true
				},
				tooltip : true, //activate tooltip
				tooltipOpts : {
					content : "%s : %y.1",
					shifts : {
						x : -30,
						y : -50
					}
				}

			});

			var $tooltip = $(
					"<div class='tooltip top in' style='display:none;'><div class='tooltip-inner'></div></div>")
					.appendTo('body');
			placeholder.data('tooltip', $tooltip);
			var previousPoint = null;
			placeholder.on('plothover', function(event, pos, item) {
				if (item) {
					if (previousPoint != item.seriesIndex) {
						previousPoint = item.seriesIndex;
						var tip = item.series['label'] + " : "
								+ item.series['percent'] + '%';
						$(this).data('tooltip').show().children(0).text(tip);
					}
					$(this).data('tooltip').css({
						top : pos.pageY + 10,
						left : pos.pageX + 10
					});
				} else {
					$(this).data('tooltip').hide();
					previousPoint = null;
				}

			});
			var d1 = [];
			for (var i = 0; i < Math.PI * 2; i += 0.5) {
				d1.push([ i, Math.sin(i) ]);
			}
			var d2 = [];
			for (var i = 0; i < Math.PI * 2; i += 0.5) {
				d2.push([ i, Math.cos(i) ]);
			}
			var d3 = [];
			for (var i = 0; i < Math.PI * 2; i += 0.2) {
				d3.push([ i, Math.tan(i) ]);
			}

			var sales_charts = $('#sales-charts').css({
				'width' : '100%',
				'height' : '220px'
			});
			$.plot("#sales-charts", [ {
				label : "Domains",
				data : d1
			}, {
				label : "Hosting",
				data : d2
			}, {
				label : "Services",
				data : d3
			} ], {
				hoverable : true,
				shadowSize : 0,
				series : {
					lines : {
						show : true
					},
					points : {
						show : true
					}
				},
				xaxis : {
					tickLength : 0
				},
				yaxis : {
					ticks : 10,
					min : -2,
					max : 2,
					tickDecimals : 3
				},
				grid : {
					backgroundColor : {
						colors : [ "#fff", "#fff" ]
					},
					borderWidth : 1,
					borderColor : '#555'
				}
			});
			$('[data-rel="tooltip"]').tooltip();
		})
	</script>
</body>
</html>
