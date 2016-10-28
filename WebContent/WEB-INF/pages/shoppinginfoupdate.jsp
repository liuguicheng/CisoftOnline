<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>100南宁－商品发布</title>
<link type="text/css" href="${pageContext.request.contextPath }/css/shopping.css" rel="Stylesheet" />
<link type="text/css" href="${pageContext.request.contextPath }/css/shopping_panel.css" rel="Stylesheet" />
<link type="text/css" href="${pageContext.request.contextPath }/css/shopping_asyncbox.css" rel="Stylesheet" />
<link type="text/css" href="${pageContext.request.contextPath }/css/shopping_default.css" rel="Stylesheet">
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/jquery-1.8.3.js"></script>
<%-- <script type="text/javascript" src="${pageContext.request.contextPath }/js/shopping/zh_CN.js"></script> --%>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/shopping/AsyncBox.v1.4.5.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/shopping/FunLib.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/shopping/AjaxFileUpload.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/shopping/Product.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/shopping/ProductSpecAttr.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath }/KindEditor/themes/default/default.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/KindEditor/plugins/code/prettify.css" />
<script charset="utf-8" src="${pageContext.request.contextPath }/KindEditor/kindeditor.js"></script>
<script charset="utf-8" src="${pageContext.request.contextPath }/KindEditor/lang/zh_CN.js"></script>
<script charset="utf-8" src="${pageContext.request.contextPath }/KindEditor/plugins/code/prettify.js"></script>
<script type="text/javascript">
	var proID = '';
	/* var domain = 'weigouyi.com'; */
	var act = 'add';
	/* ProductSpec.Domain = domain; //给商品规格类赋予域名 */
	/*   ProductSpec.ProductID = proID; */
	ProductImage.ProductID = proID;
	$(function() {
		
		if($("#splx_id").val()!=""){
			 $("#ggids").css("display",""); 
			 $("#spggid_id").val($("#splx_id").val());
		}
	      /**
	      *选择商品类型，显示商品规格
	      */
		 $("#splx_id").change(function(){
			 if($(this).val()==""){
				 $("#ggids").css("display","none");
			 }else{
				 $("#ggids").css("display",""); 
				 $("#spggid_id").val($(this).val());
				
				 
			 }

		 });
		/*  $('#btnEnter').click(function () { 
		 	if(SaveCheck()){
		 		return $("#form1").submit();
		 	}
		 	
		 	/* if(SaveCheck()){
		 		alert(1);
		 	$.ajax({
		         cache: true,
		         type: "POST",
		         url:"commodity_save",
		         data:$('#form1').serialize(),// 你的formid
		         async: false,
		         error: function(request) {
		             alert("添加失败");
		         },
		         success: function(data) {
		         	alert("添加成功");
		         	location.reload(); 
		         }
		     });
		 	} */
		/*  });  */
		$("#txtNo").blur(ProductNoOnlyCheck);
		ProductImage.Init(); //获取商品相册
		/*   $('#skuContainer').click(function () {//规格区
		      var num = parseInt($('#SpecClickNum').val());
		      $('#SpecClickNum').val(num + 1);
		  }); */
		/*  //商品名,销售价
		 $("#txtName,#txtShopPrice").blur(function () {
		     if ($.trim(this.value).length > 0)
		         TdTips.clearTdErr(this.id);
		     else
		         TdTips.showTdErr(this.id, '不能为空');
		 });
		 //品牌,分类
		 $('#ddlClass,#ddlBrand').change(function () {
		     if ($(this).val().length > 0)
		         TdTips.clearTdErr(this.id);
		     else
		         TdTips.showTdErr(this.id, '请选择');
		 });
		 //运费
		 $('#ddlFree').change(function () {
		     if ($(this).val() == "0")
		         $('#freight').show();
		     else
		         $('#freight').hide();
		 }).trigger('change');
		 //支持货到付款、兑换商品
		 $('#cbEnabledCod,#cbIsPoints').change(function () {
		     if (this.checked)
		         $(this).parent().find('span.subitem').show();
		     else
		         $(this).parent().find('span.subitem').hide();
		 }).trigger('change');
		 //显示编辑数据
		 if (act == 'update') {
		   /*   ProductSpec.InitSpec.Init(); //获取商品规格 */
		//  ProductImage.Init(); //获取商品相册
		/*     } */
	});

	//商品编号唯一性验证
	function ProductNoOnlyCheck() {
		var $this = $("#txtNo");
		var preVal = $this.attr('pre'); //上一次离开的值
		var val = $.trim($this.val());
		if (preVal == null || preVal == 'undefined')
			preVal = '';

		if (val.length > 0 && val != preVal) {
			$.ajax({
				type : "POST",
				url : "commodity_pncheck",
				data : "g_id=" + $this.val(),
				cache : false,
				async : false,
				dataType : "json",
				success : function(msg) {
					if (msg == "1")//1-唯一 0-编号已存在
					{
						$this.attr('only', 1);
						TdTips.clearTdErr('txtNo', "编号可用");
					} else {
						$this.attr('only', 0);
						TdTips.showTdErr('txtNo', '编号已存在');
					}
				}
			});
		}
		$this.attr('pre', val);
	}

	//表单验证
	function SaveCheck() {
		var flag = true;
		if ($("#txtNo").attr("only") == '0') {
			return false;
		}
		if ($.trim($('#c_name').val()).length < 1) {
			TdTips.showTdErr('c_name', '不能为空');
			flag = false;
		} else {
			TdTips.clearTdErr('c_name');
		}
		if ($.trim($('#txtNo').val()).length < 1) {
			TdTips.showTdErr('txtNo', '不能为空');
			flag = false;
		} else {
			TdTips.clearTdErr('txtNo');
		}
		if ($('#sc_id').val() == '0') {
			TdTips.showTdErr('sc_id', '请选择商品分类');
			flag = false;
		} else {
			TdTips.clearTdErr('sc_id');
		}
		if ($('#cb_id').val() == '0') {
			TdTips.showTdErr('cb_id', '请选择商品品牌');
			flag = false;
		} else {
			TdTips.clearTdErr('cb_id');
		}
		if ($('#gysid').val() == '0') {
			TdTips.showTdErr('gysid', '请选择商品供应商');
			flag = false;
		} else {
			TdTips.clearTdErr('gysid');
		}
		if ($('#gysid').val() == '0') {
			TdTips.showTdErr('gysid', '请选择商品供应商');
			flag = false;
		} else {
			TdTips.clearTdErr('gysid');
		}
		if ($('#ztid').val() == '0') {
			TdTips.showTdErr('ztid', '请选择商品状态');
			flag = false;
		} else {
			TdTips.clearTdErr('ztid');
		}

		if ($.trim($('#c_jg').val()).length == '0') {
			TdTips.showTdErr('c_jg', '不能为空');
			flag = false;
		} else {
			TdTips.clearTdErr('c_jg');
		}
		if ($.trim($('#c_psjg').val()).length < 1) {
			TdTips.showTdErr('c_psjg', '不能为空');
			flag = false;
		} else {
			TdTips.clearTdErr('c_psjg');
		}
		if ($.trim($('#c_zl').val()).length == '0') {
			TdTips.showTdErr('c_zl', '不能为空');
			flag = false;
		} else {
			TdTips.clearTdErr('c_zl');
		}
		if ($.trim($('#c_jldw').val()) < 1) {
			TdTips.showTdErr('c_jldw', '不能为空');
			flag = false;
		} else {
			TdTips.clearTdErr('c_jldw');
		}
		if ($.trim($('#c_ck').val()) == '0') {
			TdTips.showTdErr('c_ck', '不能为空');
			flag = false;
		} else {
			TdTips.clearTdErr('c_ck');
		}
		/* if ($.trim($('#c_xl').val()).length < 1) {
		    TdTips.showTdErr('c_xl', '不能为空');
		    flag = false;
		} else {
		    TdTips.clearTdErr('c_xl');
		}
		if ($.trim($('#c_cd').val()).length < 1) {
		    TdTips.showTdErr('c_cd', '不能为空');
		    flag = false;
		} else {
		    TdTips.clearTdErr('c_cd');
		} */
		/*  if ($.trim($('#c_bzq').val()).length=='0') {
		     TdTips.showTdErr('c_bzq', '不能为空');
		     flag = false;
		 } else {
		     TdTips.clearTdErr('c_bzq');
		 } */
		/*  if ($.trim($('#c_ccfs').val()).length < 1) {
		     TdTips.showTdErr('c_ccfs', '不能为空');
		     flag = false;
		 } else {
		     TdTips.clearTdErr('c_ccfs');
		 } */
		/* if ($.trim($('#c_zzfs').val()).length < 1) {
		    TdTips.showTdErr('c_zzfs', '不能为空');
		    flag = false;
		} else {
		    TdTips.clearTdErr('c_zzfs');
		} */
		/* if ($.trim($('#c_gg').val()).length < 1) {
		    TdTips.showTdErr('c_gg', '不能为空');
		    flag = false;
		} else {
		    TdTips.clearTdErr('c_gg');
		} */
		/* if ($.trim($('#c_dj').val()).length < 1) {
		    TdTips.showTdErr('c_dj', '不能为空');
		    flag = false;
		} else {
		    TdTips.clearTdErr('c_dj');
		}
		if ($.trim($('#c_pl').val()).length < 1) {
		    TdTips.showTdErr('c_pl', '不能为空');
		    flag = false;
		} else {
		    TdTips.clearTdErr('c_pl');
		}
		if ($.trim($('#c_px').val()).length=='0') {
		    TdTips.showTdErr('c_px', '不能为空');
		    flag = false;
		} else {
		    TdTips.clearTdErr('c_px');
		} */
		if (flag) {
			ProductImage.Save(); //保存相册
			return true;
		}
		$(window).scrollTop($('#TableList').offset().top);
		return false;
	}

	/*  KindEditor.ready(function(K) {
		var editor1 = K.create('textarea[name="c_spms"]', {
			cssPath : 'KindEditor/plugins/code/prettify.css',
			uploadJson : 'KindEditor/jsp/upload_json.jsp',
			fileManagerJson : 'KindEditor/jsp/file_manager_json.jsp',
			allowFileManager : true,
			afterCreate : function() {
				var self = this;
				K.ctrl(document, 13, function() {
					self.sync();
					document.forms['example'].submit();
				});
				K.ctrl(self.edit.doc, 13, function() {
					self.sync();
					document.forms['example'].submit();
				});
			}
		});
		prettyPrint();
	}); */
	KindEditor.ready(function(K) {
		var editor1 = K.create('textarea[name="c_spms"]', {
			cssPath : 'KindEditor/plugins/code/prettify.css',
			uploadJson : 'KindEditor/jsp/upload_json.jsp',
			fileManagerJson : 'KindEditor/jsp/file_manager_json.jsp',
			allowFileManager : true,
			afterCreate : function() {
				var self = this;
				K.ctrl(document, 13, function() {
					self.sync();
					document.forms['example'].submit();
				});
				K.ctrl(self.edit.doc, 13, function() {
					self.sync();
					document.forms['example'].submit();
				});
			}
		});
		prettyPrint();
	});
</script>
</head>
<body style="overflow:scroll;">
	<form name="form1" method="post" action="commodity_save" id="form1"
		enctype="multipart/form-data" onsubmit="return SaveCheck();">
		<input type="hidden" name="c_id" value="${c_id }" id="c_id" /> <input
			type="hidden" name="c_sj" value="${c_sj }" /> <input type="hidden"
			name="c_scbs" value="${c_scbs }" />
			<input type="hidden" name="c_djs" value="${c_djs }">

		<div>
			<input type="hidden" name="_MYVIEWSTATE" id="_MYVIEWSTATE"
				value="H4sIAAAAAAAEAO29B2AcSZYlJi9tynt/SvVK1+B0oQiAYBMk2JBAEOzBiM3mkuwdaUcjKasqgcplVmVdZhZAzO2dvPfee++999577733ujudTif33/8/XGZkAWz2zkrayZ4hgKrIHz9+fB8/Iv7vX/M3/e1+zV/3F/z+v/9JtWzrqmxe5b9oXdT5y6ppn2TTt79Xfv37//6/za//6/4m08mXy5Oszcrq4kV+9ev+Vt7fL+tqUbVFtfx1f/3p5Kz5dtX+ur8Bvn6dlTl+O2s+L87bX/c3mk5Ol9mkzGcn1ezXTfD5y6pYts1v+uv+2N6D/f2DB/cOHv6ms9/m1zr/TX+bX+sX/Pr5ctper/Jf97dcrMu2WGV1e/e8qhfbM+r0t/n1zm3DX+dN/q79dX+9/+LP/6v+83/gb5j9Wr/Ob/qbzX6z3/rX/S22t9P//E//I/7zP/UP/s//qD/iv/yb/950e/s3+s//6L/xv/5L/8L/8m/5G/6Lv+Xv/rH/+m/58/6Lv+DP+6/+tL/uN/ov/sy//D//4/6M//JP+6uo8Y/9V//gn/uf/4l/6X/9h/8pv/Wv+2v8Frv7O/d29nc/vX9v5+D+vf2dvT356GD3/t7u/v3d/b17B95H9Nn+/f0H9x+6j+7tHuwcPNj79NPf6pNf+9e9wDOb/Vq/LqP4a3ko/ql/8H/5R/9xhOJvsbuz85//8X/mf/43/MH/1R/51/xXf9Jf/p//PX/mb/1rdfG4T3gQuF8LsP4fns2Vn78BAAA=" />
			<input type="hidden" name="__VIEWSTATE" id="
__VIEWSTATE" value="" />
		</div>


		<div id="mainer" >

			<script type="text/javascript">
				$(function() {
					var currKey = 'ProductEdit';
					if (currKey == "" || currKey == "None") {
						$(".menubox .mtitle").first().find("a").removeClass(
								"close").addClass("open").parent().nextUntil(
								".mtitle").show();
					} else {
						var $curr = $(".menubox ul li a[menuKey='" + currKey
								+ "']");
						$curr.addClass("curr");
						var $currParent = $curr.parent().prevAll(".mtitle")
								.first();
						$currParent.find("a").removeClass("close").addClass(
								"open");
						$currParent.nextUntil(".mtitle").show();
					}

					$(".menubox .mtitle a").click(
							function() {
								if ($(this).hasClass("close")) {
									//$(".menubox ul li:not('.mtitle')").hide();
									//$(".menubox ul li .open").removeClass("open").addClass("close");
									$(this).parent().find("a").removeClass(
											"close").addClass("open");
									$(this).parent().nextUntil(".mtitle")
											.show();
								} else {
									$(this).removeClass("open").addClass(
											"close");
									$(this).parent().nextUntil(".mtitle")
											.hide();
								}
							});
				});
			</script>
			<div class="mainbox">
				<div class="mform">
					<h4>
						发布商品<span><em>*</em>为必填项！</span>
					</h4>
					<table id="TableList" width="100%"
						class="tbmodify tbmodify-mulcols" border="0" cellspacing="0"
						cellpadding="0">
						<tbody>
							<tr>
								<td class="tdtitle"><span class="red">*</span>商品名称：</td>
								<td colspan="5"><input name="c_name" type="text"
									value="${c_name }" maxlength="100" id="c_name" class="txt350" /></td>
							</tr>
								<tr>
								<td class="tdtitle"><span class="red"></span>商品简短名称：</td>
								<td colspan="5"><input name="c_jdname" type="text"
									value="${c_jdname }" maxlength="100"  class="txt350" />(<a href="#">最长10个汉字</a>)</td>
							</tr>
							<tr>
								<td class="tdtitle">商品标签说明：</td>
								<td colspan="5"><input name="c_splbms" type="text"
									value="${c_splbms }" maxlength="100" id="c_splbms"
									class="txt350" /></td>
							</tr>
							<tr>
								<td class="tdtitle"><span class="red">*</span>商品条码：</td>
								<td colspan="5"><input name="c_spbh" type="text"
									maxlength="100" id="txtNo" class="txt190" only="1"
									value="${c_spbh }" />(<a href="#">根据条码输入或扫描商品的条形码</a>)</td>
							</tr>
							<tr>
								<td class="tdtitle"><span class="red">*</span>商品品牌：</td>
								<td colspan="5"><select name="commodityBrand.cb_id"
									id="cb_id" class="ddl200">
										<option value="">-- 商品品牌 --</option>
										<s:iterator value="#brandlist" var="b">
											<s:if test="#b.cb_id==commodityBrand.cb_id">
												<option value="<s:property value="#b.cb_id"/>"
													selected="selected"><s:property value="#b.cb_name" />
												</option>
											</s:if>
											<s:else>
												<option value="<s:property value="#b.cb_id"/>"><s:property
														value="#b.cb_name" />
												</option>
											</s:else>
										</s:iterator>

								</select> <span class="gray">(<a href="javascript:openpp();">如果没有商品品牌点此添加</a>)
								</span></td>
							</tr>
							<tr>
								<td class="tdtitle"><span class="red">*</span>商品供应商：</td>
								<td colspan="5"><select name="gysInfo.g_id" id="gysid"
									class="ddl200">
										<option value="">-- 商品供应商 --</option>
										<s:iterator value="#gyslist" var="g">
											<s:if test="#g.g_id==gysInfo.g_id">
												<option value="<s:property value="#g.g_id"/>"
													selected="selected"><s:property value="#g.g_name" />
												</option>
											</s:if>
											<s:else>
												<option value="<s:property value="#g.g_id"/>"><s:property
														value="#g.g_name" />
												</option>
											</s:else>
										</s:iterator>

								</select> <span class="gray">(<a href="javascript:opengys();">如果没有商品供应商点此添加</a>)
								</span></td>
							</tr>
							<tr>
								<td class="tdtitle">商品状态：</td>
								<td colspan="5"><select name="commodityStatus.cs_id"
									id="ztid" class="ddl200">
										<option value="">-- 商品状态 --</option>
										<s:iterator value="#statuslist" var="s">
											<s:if test="#s.cs_id==commodityStatus.cs_id">
												<option value="<s:property value="#s.cs_id"/>"
													selected="selected"><s:property value="#s.cs_name" />
												</option>
											</s:if>
											<s:else>
												<option value="<s:property value="#s.cs_id"/>"><s:property
														value="#s.cs_name" />
												</option>
											</s:else>
										</s:iterator>
								</select> <span class="gray">(<a href="javascript:openzt();">如果没有商品状态此添加</a>)
								</span></td>
								<!-- <td class="tdtitle">是否上架：</td>
                            <td><input id="cbOnSale" type="checkbox" name="c_sj" checked="checked" /></td> -->
								<!--  <td class="tdtitle">是否赠品：</td>
                            <td><input id="cbIsGift" type="checkbox" name="cbIsGift" /></td> -->
							</tr>
							<tr>
								<td class="tdtitle"><span class="red">*</span>商品分类：</td>
								<td colspan="5"><select name="commoditySort.cs_id"
									id="sc_id" class="ddl200">
										<option value="">-- 商品分类 --</option>
										<s:iterator value="#sortlist" var="s">
											<s:if test="#s.cs_id==commoditySort.cs_id">
												<option value="<s:property value="#s.cs_id"/>"
													selected="selected"><s:property value="#s.cs_name" />
												</option>
											</s:if>
											<s:else>
												<option value="<s:property value="#s.cs_id"/>"><s:property
														value="#s.cs_name" />
												</option>
											</s:else>
										</s:iterator>

								</select> <span class="gray">(<a href="javascript:openfl();">如果没有商品分类点此添加</a>)
								</span>
							</td>
							</tr>
							<tr>
								<td class="tdtitle"><span class="red">*</span>商品标签：</td>
								<td colspan="5"><select name="commodlabel.cl_id"
									id="spbq_id" class="ddl200">
										<option value="">-- 商品标签 --</option>
										<s:iterator value="#cllist" var="s">
											<s:if test="#s.cl_id==commodlabel.cl_id">
												<option value="<s:property value="#s.cl_id"/>"
													selected="selected"><s:property value="#s.cl_name" />
												</option>
											</s:if>
											<s:else>
												<option value="<s:property value="#s.cl_id"/>"><s:property
														value="#s.cl_name" />
												</option>
											</s:else>
										</s:iterator>

								</select> <span class="gray">(<a href="javascript:opens();">如果没有商品标签点此添加</a>)
								</span>
							</td>
							</tr>
							<tr>
								<td class="tdtitle"><span class="red">*</span>商品类型：</td>
								<td colspan="5"><select name="commoditytype.ct_id"
									id="splx_id" class="ddl200">
										<option value="">-- 商品类型 --</option>
										<s:iterator value="#ctlist" var="s">
											<s:if test="#s.ct_id==commoditytype.ct_id">
												<option value="<s:property value="#s.ct_id"/>"
													selected="selected"><s:property value="#s.ct_name" />
												</option>
											</s:if>
											<s:else>
												<option value="<s:property value="#s.ct_id"/>"><s:property
														value="#s.ct_name" />
												</option>
											</s:else>
										</s:iterator>

								</select> <span class="gray">(<a href="javascript:opensplx();">如果没有商品类型点此添加</a>)
								</span>
							</td>
							</tr>
							<tr id="ggids" style="display: none;">
							
								<td class="tdtitle"><span class="red">*</span>商品规格：</td>
								<td colspan="5">
								<!-- 商品类型id -->
								<input type="hidden" id="spggid_id" value="">
								<!-- 生成的商品id -->
								<input type="hidden" id="spid_id" value="">
								<button class=" btn_submit" onclick="openspgg();" style="border: 0px;" type="button" >开启商品规格</button>(<a href="＃">如此商品有多个规格，请点击“开启商品规格”</a>)
							</td>
							</tr>
							<tr>
							
								<td class="tdtitle"><span class="red">*</span>商品属性：</td>
								<td colspan="5">
								<input type="hidden" id="wxms" value="" name="c_wxms">
								<button class="layer_notice btn_submit" style="border: 0px;" type="button" >添加商品属性</button>(<a href="#">如商品熟悉特殊，请点击“添加商品属性”进行添加</a>)
							</td>
							</tr>
							<tr>
								<td class="tdtitle" width="90"><span class="red">*</span>本店售价：</td>
								<td width="180"><input name="c_jg" value="${c_jg }"
									type="text" maxlength="8" id="c_jg" class="txt100"
									onkeyup="value=value.replace(/[^\d\.]/g,'')" /></td>
								<td class="tdtitle" width="90">市场售价：</td>
								<td width="170"><input name="c_scjg" value="${c_scjg }"
									type="text" maxlength="8" id="c_scjg" class="txt100"
									onkeyup="value=value.replace(/[^\d\.]/g,'')" /></td>
								<td class="tdtitle" width="90">成本价格：</td>
								<td width="150"><input name="c_jhjg" value="${c_jhjg }"
									type="text" value="0" maxlength="8" id="c_jhjg" class="txt100"
									onkeyup="value=value.replace(/[^\d\.]/g,'')" /></td>
							</tr>
							<tr>
								<td class="tdtitle"><span class="red">*</span>运费：</td>
								<td><input name="c_psjg" value="${c_psjg }" id="c_psjg"
									type="text" value="0" maxlength="7" class="txt100"
									onkeyup="value=value.replace(/[^\d]/g,'');" /> <span
									class="gray"></span></td>
								<td class="tdtitle"><span class="red">*</span>商品重量：</td>
								<td><input name="c_zl" value="${c_zl }" type="text"
									value="0" maxlength="7" id="c_zl" class="txt100" /> <select
									name="ddlUnit" id="ddlUnit" class="ddl50">
										<option value="1">千克</option>
										<option value="0">克</option>

								</select></td>
								<td class="tdtitle"><span class="red">*</span>计量单位：</td>
								<td><input name="c_jldw" value="${c_jldw }" type="text"
									maxlength="10" id="c_jldw" class="txt100" /></td>
							</tr>
							<tr>
								<td class="tdtitle"><span class="red">*</span>库存数量：</td>
								<td><input name="c_ck" value="${c_ck }" type="text"
									value="0" maxlength="7" id="c_ck" class="txt100"
									onkeyup="value=value.replace(/[^\d]/g,'');" /></td>
								<td class="tdtitle">库存预警：</td>
								<td><input name="c_ckyj" value="${c_ckyj }" type="text"
									value="0" maxlength="7" id="c_ckyj" class="txt100"
									onkeyup="value=value.replace(/[^\d]/g,'');" /></td>
								<td class="tdtitle">赠送积分：</td>
								<td><input name="c_jf" value="${c_jf }" type="text"
									value="0" maxlength="7" id="c_jf" class="txt100" /></td>
							</tr>
							<%--  <tr>
                            <td class="tdtitle"><span class="red">*</span>商品等级：</td>
                            <td>
                                <input name="c_dj"  value="${c_dj }" type="text" value="0" maxlength="7" id="c_dj" class="txt100"  />
                            </td>
                            <td class="tdtitle"><span class="red">*</span>商品系列：</td>
                            <td><input name="c_xl" value="${c_xl }" type="text" value="0" maxlength="7" id="c_xl" class="txt100"  /></td>
                            <td class="tdtitle"><span class="red">*</span>商品产地：</td>
                            <td><input name="c_cd" value="${c_cd }" type="text" value="0" maxlength="7" id="c_cd" class="txt100" /></td>                        
                        </tr>
                         <tr>
                            <td class="tdtitle"><span class="red">*</span>商品保质期：</td>
                            <td>
                                <input name="c_bzq"  value="${c_bzq }" type="text" value="0" maxlength="7" id="c_bzq" class="txt100" onkeyup="value=value.replace(/[^\d]/g,'');" />
                                <span class="gray">个月</span>
                            </td>
                            <td class="tdtitle"><span class="red">*</span>商品存储方式：</td>
                            <td><input name="c_ccfs" value="${c_ccfs }" type="text" value="0" maxlength="7" id="c_ccfs" class="txt100"/></td>
                            <td class="tdtitle"><span class="red">*</span>商品种植方式：</td>
                            <td><input name="c_zzfs" value="${c_zzfs }" type="text" value="0" maxlength="7" id="c_zzfs" class="txt100"/></td>
                        </tr>
                          <tr>
                            <td class="tdtitle"><span class="red">*</span>商品规格：</td>
                            <td>
                                <input name="c_gg"  value="${c_gg }" type="text" value="0" maxlength="7" id="c_gg" class="txt100"/>
                            </td>
                            <td class="tdtitle"><span class="red">*</span>商品配料：</td>
                            <td><input name="c_pl" value="${c_pl }" type="text" value="0" maxlength="7" id="c_pl" class="txt100"/></td>
                       <td class="tdtitle"><span class="red">*</span>商品排序：</td>
                            <td >
                                <input name="c_px" value="${c_px }" type="text" value="0" maxlength="7" id="c_px" class="txt100" />
                                <span class="gray"></span>
                            </td>
                        </ --%>
							<!--增加一个最小购买数量 begin-->
							<tr>
								<td class="tdtitle">最小购买数量：</td>
								<td><input name="c_zxgmnum" value="${c_zxgmnum }"
									type="text" value="0" maxlength="7" id="c_zxgmnum"
									class="txt100" onkeyup="value=value.replace(/[^\d]/g,'');" />
									<span class="gray">0表示不限制</span></td>
								<td class="tdtitle">最大购买数量：</td>
								<td colspan="2"><input name="c_zxzdnum"
									value="${c_zxzdnum }" type="text" value="0" maxlength="7"
									id="c_zxzdnum" class="txt100"
									onkeyup="value=value.replace(/[^\d]/g,'');" /> <span
									class="gray">0表示不限制</span></td>
							</tr>
							<!--增加一个最小购买数量 end-->

							<%-- <tr>
                            <td class="tdtitle">货到付款：</td>
                            <td>
                                <input id="cbEnabledCod" type="checkbox" name="cbEnabledCod" />
                                <span class="subitem">
                                    <em>快递到付手续费：</em>
                                    <input name="txtCodFee" type="text" value="0" maxlength="8" id="txtCodFee" class="txt50" onkeyup="value=value.replace(/[^\d\.]/g,'')" />
                                </span>
                            </td>
                            <td class="tdtitle">兑换商品：</td>
                            <td colspan="3">
                                <input id="cbIsPoints" type="checkbox" name="cbIsPoints" />
                                <span class="subitem">
                                    <em>兑换所需积分：</em>
                                    <input name="txtPoints" type="text" value="0" maxlength="7" id="txtPoints" class="txt50" onkeyup="value=value.replace(/[^\d]/g,'');" />
                                </span>
                            </td>
                        </tr> --%>
							<!--  <tr>
                            <td class="tdtitle">商品规格：</td>
                            <td colspan="5">
                                <div id="skuContainer">
                                    <div><input type="button" onclick="ProductSpec.AddRow();" value="添加货品" class="button BtnAdd" /> <input type="button" onclick="ProductSpec.ShowSelectContainer();" value="选择规格项" class="button BtnAdd" /> <input type="button" value="关闭规格" onclick="ProductSpec.Close();" class="button BtnDel" /></div>
                                    <table class="tblist" width="100%" cellspacing="0" cellpadding="0" border="0"></table>
                                    <input type="hidden" id="SpecTempContainer" value="" />
                                    <input name="SpecSelItemRuleTxt" type="hidden" id="SpecSelItemRuleTxt" />选择的规格文本集合,格式(<***><***>)(<***><***>)
                                    <input name="SpecProductItems" type="hidden" id="SpecProductItems" />规格商品集合
                                    <input name="SpecProductDelIDs" type="hidden" id="SpecProductDelIDs" />删除规格库存集合
                                    <input name="SpecClickNum" type="hidden" id="SpecClickNum" value="0" />操作统计,用于作编辑标识
                                </div>
                            </td>
                        </tr> -->
							<tr>
								<td class="tdtitle"><span class="red">*</span>商品缩略图：</td>
								<td colspan="5"><input name="fileProductPic" type="file"
									id="fileProductPic" size="40"
									style="border: darkgray 1px solid; height: 22px; line-height: 20px; width: 320px;" />
									<s:if test="c_sltimg!=''">
										<input type="hidden" name="c_sltimg" value="${c_sltimg }" />
										<a href="imgss.jsp?file=${c_sltimg }" target="_blank"> <img
											title="浏览图片" src="imgss.jsp?file=${c_sltimg }"
											style="cursor: hand; border: 0;" width="30px" height="30px"></a>
									</s:if>
									<div class="gray">（列表展示，宽为250像素，高不能超过500像素，图片文件大小不能超过100K）</div>
								</td>
							</tr>
							<tr>
								<td class="tdtitle"><span class="red">*</span>商品形象图：</td>
								<td colspan="5"><input name="spxximg" type="file"
									id="spxximg" size="40"
									style="border: darkgray 1px solid; height: 22px; line-height: 20px; width: 320px;" />
									<s:if test="c_spxximg!=''">
										<input type="hidden" name="c_spxximg" value="${c_spxximg }" />
										<a href="imgss.jsp?file=${c_spxximg }" target="_blank"> <img
											title="浏览图片" src="imgss.jsp?file=${c_spxximg }"
											style="cursor: hand; border: 0;" width="30px" height="30px"></a>
									</s:if>
									<div class="gray">（列表展示，宽为250像素，高不能超过500像素，图片文件大小不能超过100K）</div>
								</td>
							</tr>
							<tr>
								<td class="tdtitle"><span class="red">*</span>商品相册图：</td>
								<td colspan="5">
									<div id="upPhoto">
										<input type="file" name="AjaxProductPic" id="AjaxProductPic"
											size="40"
											style="border: darkgray 1px solid; height: 22px; line-height: 20px; width: 320px;" />
										<input type="button" value="上 传" class="button"
											id="btnProductPicUpload" onclick="ProductImage.UploadFile();" />
										<input name="c_spimg" type="hidden" id="ProductImageRuleTxt" />
										<!--图片文本集合,格式(<***><***>)(<***><***>)-->
										<input name="ProductImageDelItems" type="hidden"
											id="ProductImageDelItems" />
										<!--删除图片集合,格式(<***><***>)(<***><***>)-->
										<input name="AlbumClickNum" type="hidden" id="AlbumClickNum"
											value="0" />
										<!--操作统计,用于作编辑标识-->
										<div class="gray">（详情页相册，宽高均为250像素，图片文件大小不能超过100K，图片上传数量不能超过5张）</div>
									</div>
									<div id="photoAlbum">
										<ul class="imagelist"></ul>
									</div>
								</td>
							</tr>
							<%--                          <tr>
                            <td class="tdtitle"><span class="red">*</span>商品属性描述：</td>
                            <td colspan="5">
                                <form name="example2" method="post" action="KindEditor/jsp/demo.jsp" enctype="multipart/form-data">
		<textarea name="c_spsxms" cols="100" rows="8" style="width:700px;height:200px;visibility:hidden;">${c_spsxms}</textarea>
	</form>
                            </td>
                        </tr> --%>
							<tr>
								<td class="tdtitle"><span class="red">*</span>商品描述：</td>
								<td colspan="5">
									<form name="example" method="post"
										action="KindEditor/jsp/demo.jsp" enctype="multipart/form-data">
										<textarea name="c_spms" cols="100" rows="8"
											style="width: 700px; height: 200px; visibility: hidden;">${c_spsxms},${c_spms}</textarea>
									</form>
								</td>
							</tr>
							<tr>
								<td class="tdtitle">&nbsp;</td>
								<td colspan="5"><input type="submit" name="btnEnter"
									value=" 确 定 " id="btnEnter" class="btn btn_submit" />&nbsp; <input
									type="submit" name="btnCancel" value=" 取 消 " id="btnCancel"
									class="btn btn_cannel" /></td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>

<div id="add" style="display: none;margin-left: 10px;">
	<div style="float: left;padding-top: 5px;">
	<button type="button"  style="border: 0px;cursor: pointer;width: 60px;height: 20px" id="bu">点击添加</button>
	<button type="button" id="save"  style="border: 0px;cursor: pointer;width: 60px;height: 20px">保存</button>
	</div>
	<div style="color: red;float: left;font-size: 12px;margin-left: 10px;margin-top: 5px;">*最多只能添加9个属性</div>
	<br/>
	
<div id="divstrs" style="clear: both;padding-top: 5px;">
<s:iterator value="sxmaps" id="id" status="st">
	 <div style="padding-top: 5px;">属性名称：<input type="text" width="100px" value="<s:property value="key"/>" >：属性值：<input type="text" width="100px" value="<s:property value="value"/>"><a href="javascript:od(<s:property value="#st.index"/>);" id="sc<s:property value="#st.index"/>">删除</a><br></div>
</s:iterator>
</div>

</div>
		<script type="text/javascript">
			//var _bdhmProtocol = (("https:" == document.location.protocol) ? " https://" : " http://");
			//document.write(unescape("%3Cscript src='" + _bdhmProtocol + "hm.baidu.com/h.js%3F77ddb869760b9470c0239ceba15dc2f5' type='text/javascript'%3E%3C/script%3E"));
		</script>

	</form>
</body>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/layer.min.js"> </script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/layer.ext.js"> </script>
<script type="text/javascript">
$(document).ready(function(){
	var i=0;
	$("#bu").click(function(){
		var lunm=$("#divstrs input[type='text']").length;
		if(lunm>=18){
			layer.alert('最多只能添加9个属性噢', 8); //风格一
		}else{
		i++;
		if(i<9){
		$("#divstrs").append(" <div style=\"padding-top: 7px;\">属性名称：<input type=\"text\" width=\"100px\">：属性值：<input type=\"text\" width=\"100px\"><a href=\"javascript:od("+i+");\" id=\"sc"+i+"\">删除</a><br></div>");
		}else{
			layer.alert('最多只能添加9个属性噢', 8); //风格一
		}
		}
		});
	var index="";
	$(".layer_notice").click(function(){
		index=$.layer({
	    type: 1,
	    shade: [0.5, '#000'],
	    area: ['430px', '300px'],
	    title: "添加商品属性信息",
	    fix: true,
	    fadeIn: 300,
	    border: [10, 0.3, '#000'],
	    closeBtn: [1, true],
	    page: {dom : '#add'}
	});
	});
	
	$("#save").click(function(){
		var alstr="";
		var is=0;
		var iis=0;
		$("#divstrs input[type='text']").each(function(i, item){  
			if($(item).val()==""){
				iis=1;
			}
			if(is==0){
				is=1;
				alstr+=$(item).val()+":";
			}else{
				is=0;
			   alstr+=$(item).val()+",";
			}
		});
		alstr= alstr.substring(0, alstr.length - 1); 
		if(iis==1){
			layer.alert('属性名称或值不能为空', 8); //风格8 错误脸
		}else{
			$("#wxms").val(alstr);	
			layer.close(index);
			layer.alert('保存商品属性成功', 1);//风格一 绿色勾
		
		}
	});
});
function od(id){
	$("#sc"+id).parent("div").remove();
	
}
//打开标签管理页面
function opens(){
	var widoid="123";
	 var iWidth="768"; //弹出窗口的宽度;
	 var iHeight="334"; //弹出窗口的高度;
	 var iTop = (window.screen.availHeight-30-iHeight)/2; //获得窗口的垂直位置;
	 var iLeft = (window.screen.availWidth-10-iWidth)/2; //获得窗口的水平位置;
    window.open('${pageContext.request.contextPath}/pages_commoditylabel',widoid,'height='+iHeight+',width='+iWidth+',top='+iTop+',left='+iLeft+',toolbar=no,menubar=no,scrollbars=no,resizable=no,location=no,status=no');
	
}
//打开pinp
function openpp(){
	var widoid="12353";
	 var iWidth="768"; //弹出窗口的宽度;
	 var iHeight="334"; //弹出窗口的高度;
	 var iTop = (window.screen.availHeight-30-iHeight)/2; //获得窗口的垂直位置;
	 var iLeft = (window.screen.availWidth-10-iWidth)/2; //获得窗口的水平位置;
    window.open('${pageContext.request.contextPath}/pages_commoditybrand',widoid,'height='+iHeight+',width='+iWidth+',top='+iTop+',left='+iLeft+',toolbar=no,menubar=no,scrollbars=no,resizable=no,location=no,status=no');
	
}

function opengys(){
	
	var widoid="12351dd";
	 var iWidth="768"; //弹出窗口的宽度;
	 var iHeight="334"; //弹出窗口的高度;
	 var iTop = (window.screen.availHeight-30-iHeight)/2; //获得窗口的垂直位置;
	 var iLeft = (window.screen.availWidth-10-iWidth)/2; //获得窗口的水平位置;
   window.open('${pageContext.request.contextPath}/pages_gysList',widoid,'height='+iHeight+',width='+iWidth+',top='+iTop+',left='+iLeft+',toolbar=no,menubar=no,scrollbars=no,resizable=no,location=no,status=no');
	
}

function openzt(){
	
	var widoid="93jjd";
	 var iWidth="768"; //弹出窗口的宽度;
	 var iHeight="334"; //弹出窗口的高度;
	 var iTop = (window.screen.availHeight-30-iHeight)/2; //获得窗口的垂直位置;
	 var iLeft = (window.screen.availWidth-10-iWidth)/2; //获得窗口的水平位置;
   window.open('${pageContext.request.contextPath}/pages_commoditystatus',widoid,'height='+iHeight+',width='+iWidth+',top='+iTop+',left='+iLeft+',toolbar=no,menubar=no,scrollbars=no,resizable=no,location=no,status=no');
	
}

function openfl(){
	
	var widoid="fl123";
	 var iWidth="768"; //弹出窗口的宽度;
	 var iHeight="334"; //弹出窗口的高度;
	 var iTop = (window.screen.availHeight-30-iHeight)/2; //获得窗口的垂直位置;
	 var iLeft = (window.screen.availWidth-10-iWidth)/2; //获得窗口的水平位置;
   window.open('${pageContext.request.contextPath}/pages_commoditysort',widoid,'height='+iHeight+',width='+iWidth+',top='+iTop+',left='+iLeft+',toolbar=no,menubar=no,scrollbars=no,resizable=no,location=no,status=no');
	
}


function opensplx(){
	var widoid="fl123sfd";
	 var iWidth="768"; //弹出窗口的宽度;
	 var iHeight="334"; //弹出窗口的高度;
	 var iTop = (window.screen.availHeight-30-iHeight)/2; //获得窗口的垂直位置;
	 var iLeft = (window.screen.availWidth-10-iWidth)/2; //获得窗口的水平位置;
  window.open('${pageContext.request.contextPath}/pages_commoditytype',widoid,'height='+iHeight+',width='+iWidth+',top='+iTop+',left='+iLeft+',toolbar=no,menubar=no,scrollbars=no,resizable=no,location=no,status=no');
	
}

function openspgg(){
	var spid="";
	 //生成基础商品信息
	 $.ajax({
        cache: true,
        type: "POST",
        url:"commodity_scsave",
        data:$('#form1').serialize(),// 你的formid
        async: false,
        error: function(request) {
            alert("添加失败");
        },
        success: function(data) {
       	 //$("#spid_id").val(data);
       	 //$("#c_id").val(data);
       	  spid=data;
        }
    });
	var id=$("#spggid_id").val();
	var widoid="gedid";
	 var iWidth="768"; //弹出窗口的宽度;
	 var iHeight="634"; //弹出窗口的高度;
	 var iTop = (window.screen.availHeight-30-iHeight)/2; //获得窗口的垂直位置;
	 var iLeft = (window.screen.availWidth-10-iWidth)/2; //获得窗口的水平位置;
 window.open('${pageContext.request.contextPath}/commodity_toCommoditySpecpage?g_id='+id+"&result="+spid,widoid,'height='+iHeight+',width='+iWidth+',top='+iTop+',left='+iLeft+',toolbar=no,menubar=no,scrollbars=no,resizable=no,location=no,status=no');
	
}
</script>
</html>