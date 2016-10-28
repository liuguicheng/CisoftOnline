
	$(document)
			.ready(
					function() {
						
						
						
						$(".MianRight_mianN_right_xqk_topT:first")
								.css("background",
										"url(100nn/Supermarket/images/tb_bj.gif) repeat-x");
						$(".MianRight_mianN_right_xqk_topT:first").css("color",
								"#8bb401");
						$(".MianRight_mianN_right_xqk_topT")
								.click(
										function() {
											$(".MianRight_mianN_right_xqk_topT")
													.css("background", "none");
											$(".MianRight_mianN_right_xqk_topT")
													.css("color", "#000");
											$(this)
													.css("background",
															"url(100nn/Supermarket/images/tb_bj.gif) repeat-x");
											$(this).css("color", "#8bb401");
										});
						$("#a2").hide();
						$(".a3").hide();
						$("#s1").click(function() {
							
							$("#a2").hide();
							$(".a3").hide();
							$("#a1").show();
						});
						$("#s2").click(function() {
							$("#a1").hide();
							$(".a3").hide();
							$("#a2").show();
						});
						$("#s3").click(function() {
							$("#a2").hide();
							$("#a1").hide();
							$(".a3").show();
						});
						$
						.ajax({
							type : "POST",
							url : "shoppingcar_querygwccount",
							success : function(msgs) {
								var hm="";
								if(msgs=="登录超时,请重新登录"){
									layer.msg(msgs);
									hm="我的快递超市购物车"+0+"件";
								}else{
									if(msgs==0){
										hm="我的快递超市购物车"+0+"件";
									}else{
									hm="<a href='shoppingcar_querygwclist' class='tcdiv'  style='color: #FFF;' target='_blank'>我的快递超市购物车"+msgs+"件</a>";
									}
									$(".cumu").html(msgs);
								}
								$(".MianRight_mianTitleRight").html(hm);
							}
						});
						$(".MianRight_mianN_right_btMianTs_zlTLeft")
								.click(
										function() {
											var c_id = $("#c_id").val();
											var num = $("#num").val();
											var type = "1";//1标示加入购物车
											if(num>0){
											$
													.ajax({
														type : "POST",
														url : "shoppingcar_save",
														data : "c_id=" + c_id
																+ "&num=" + num
																+ "&type="
																+ type,
														success : function(msgs) {
															if (msgs == "1") {
																$
																.ajax({
																	type : "POST",
																	url : "shoppingcar_querygwccount",
																	success : function(msgs) {
																		var hm="";
																		if(msgs=="登录超时,请重新登录"){
																			hm="我的快递超市购物车"+0+"件";
																		}else{
																			if(msgs==0){
																				hm="我的快递超市购物车"+0+"件";
																			}else{
																			hm="<a href='shoppingcar_querygwclist' class='tcdiv'  style='color: #FFF;' target='_blank'>我的快递超市购物车"+msgs+"件</a>";
																			}
																			$(".cumu").html(msgs);
																		}
																		$(".MianRight_mianTitleRight").html(hm);
																		
																	}
																});
																
																 layer.msg('添加购物车成功',2,1,"100px");

															} else if (msgs == "2") {
																location.href = "/shoppingcar_querygwclist";
															
															}else{
																//未登录
									   $("#emample9").attr("display","block");
									   $(".coreMian_jgk").css("display","none");
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
														}
													});
											}else{
												layer.msg("请输入购买数量");
												
											}
										});
										

						$("#jsid")
								.click(
										function() {
											var c_id = $("#c_id").val();
											var num = $("#num").val();
											var type = "2";//1标示结算
											if(num>0){
											$
													.ajax({
														type : "POST",
														url : "shoppingcar_save",
														data : "c_id=" + c_id
																+ "&num=" + num
																+ "&type="
																+ type,
														 success : function(msgs) {
															if (msgs == "1") {
															} else if (msgs == "2") {
																$(".cumu").html(msgs);
																location.href = "/shoppingcar_querygwclist";
															}else{
																//未登录
																   $("#emample9").attr("display","block");
																   $(".coreMian_jgk").css("display","none");
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
														}
													});
													
													
													
										}else{
											layer.msg("请输入购买数量");
											
										}
										});
						
						/**
						 * 自动结算
						 */
						//var num=$("#num").val();
						//var  jg=$("#jg").val();
						//var psjg=$("#psjg").val();
						//var zj=Number(num)*Number(psjg)+Number(jg);
						//$(".MianRight_mianN_right_btMianTBsl_leftJs1").html("¥ "+jg.toFixed(2));
						
						//查询畅销
						$
						.ajax({
							type : "POST",
							url : "qtcommodity_houtcommodity",
							success : function(msgs) {
								var htmlstr = "";
						     	for ( var o in msgs) {
						     		
						     		htmlstr+="<div class=\"MianRight_mianN_leftSpf2_nr\">"+
									"<div class=\"MianRight_mianN_leftSpf2_nrImg\">"+
									"<a href=\"qtcommodity_querycommodityinfo?c_id="+msgs[o].c_id+"\">"+
										"<img src=\"imgss.jsp?file="+msgs[o].c_sltimg+"\" width=\"78\" height=\"73\" />"+
												"</a>"+
									"</div>"+
									"<div class=\"MianRight_mianN_leftSpf2_nrFont\">"+
									"	<div class=\"MianRight_mianN_leftSpf2_nrFont_title\"><a href=\"commodity_querycommodityinfo?c_id="+msgs[o].c_id+"\">"+msgs[o].c_name+"</a></div>"+
									"	<div class=\"MianRight_mianN_leftSpf2_nrFont_qb\">￥"+msgs[o].c_jg+"</div>"+
									"</div>"+
								"</div>";
						     	}
								$("#rexiaoid").html(htmlstr);
								
							}
						});
						
					})
function onjs(ids){
		var num=$("#num").val();
		
		if(ids==0){
			
		}else if(ids==1){
			num=Number(num)+1;
			$("#num").val(num);
			
		}else{
			if(num==1){
			}else{
			num=Number(num)-1;
			$("#num").val(num);
			}
		}
		
		if(num<1){
			$("#num").val(1);
			num=1;
		}
		
		var  jg=$("#jg").val();
		var psjg=$("#psjg").val();
		var zj=Number(num)*Number(jg)+Number(psjg);
		if(num!=0){
		$(".MianRight_mianN_right_btMianTBsl_leftJs1").html("¥"+zj.toFixed(2));
		}else{
			$(".MianRight_mianN_right_btMianTBsl_leftJs1").html("¥0");
		}
	}
	 function selectd(id){
		 
		 var cs_id=id;
			var url="";
			if(cs_id==0){
				url="commoditySort="+null;
			}else{
				url="commoditySort.cs_id="+cs_id;
			}
			window.location.href="qtcommodity_querycommdityList?"+url;
		}
	 // 验证收入数量
	 function onnum(){
		 var num=$("#num").val();
		 if(num<1){
			 $("#num").val(1);
		 }
	 }
	
	 
