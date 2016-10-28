<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>CisoftOnline</title>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/jquery-1.8.3.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/easyui/jquery.easyui.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/easyui/easyui-lang-zh_CN.js"></script>
<script
	src="${pageContext.request.contextPath }/js/yj/js/jquery.contextmenu.js"></script>
<script src="${pageContext.request.contextPath }/js/yj/js/gb.js"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/js/yj/css/jquery.contextmenu.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/js/easyui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/js/easyui/themes/icon.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/css/panel.css">
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/jsformat.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/htmlformat.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/layer/layer.js"></script>



<script type="text/javascript">
function do_js_beautify() {
        document.getElementById('beautify').disabled = true;
        js_source = document.getElementById('content').value.replace(/^\s+/, '');
        tabsize = document.getElementById('tabsize').value;
        tabchar = ' ';
        if (tabsize == 1) {
            tabchar = '\t';
        }
        if (js_source && js_source.charAt(0) === '<') {
            document.getElementById('content').value = style_html(js_source, tabsize, tabchar, 80);
        } else {
            document.getElementById('content').value = js_beautify(js_source, tabsize, tabchar);
        }
        document.getElementById('beautify').disabled = false;
        return false;
    }
    function pack_js(base64) {
        var input = document.getElementById('content').value;
        var packer = new Packer;
        if (base64) {
            var output = packer.pack(input, 1, 0);
        } else {
            var output = packer.pack(input, 0, 0);
        }
        document.getElementById('content').value = output;
    }
    function Empty() {
        document.getElementById('content').value = '';
        document.getElementById('content').select();
    }
    function GetFocus() {
        document.getElementById('content').focus();
    }
</script>
<script type="text/javascript">
	$(function(){		
		$("#save").click(function(){
			$("#form1").form('submit',{
				url:'${pageContext.request.contextPath}/pagelayout_save',
				onSubmit:function(){
				},
				success:function(data){
					$.messager.alert("提示",eval("("+data+")"),"info");
					window.opener.location.href = window.opener.location.href;
					window.opener.location.reload();
					window.close(); 
				}
			});
		});
		$("#parentid").change(function(){
			//alert($(this).children('option:selected').val()); 
			var p1=$(this).children('option:selected').val();//这就是selected的值 
			$.ajax({
				   type: "POST",
				   url: "pagelayout_selectTemplate",
				   data: "result="+p1,
				   success: function(msg){
				   		$("#content").val(msg);
				   }
			});
		});
		 $('#content').contextPopup({
	          title: '功能菜单',
	          items: [
	            {label:'选择标签',     icon:'${pageContext.request.contextPath }/js/yj/icons/shopping-basket.png',             action:function() {
	            		//$("#content").insert({"text":"脚本之家"});
	            		//iframe层
	            		layer.open({
	            		    type: 2,
	            		    title: '请选择标签',
	            		    shadeClose: true,
	            		    shade: 0.8,
	            		    id:123,
	            		    area: ['380px', '90%'],
	            		    content: '${pageContext.request.contextPath}/pagelayout_selecttemplelable' //iframe的url
	            		}); 

	            	
	            } },
	            /* {label:'Another Thing', icon:'${pageContext.request.contextPath }/js/yj/icons/receipt-text.png',                action:function() { alert('clicked 2') } },
	            {label:'Blah Blah',     icon:'${pageContext.request.contextPath }/js/yj/icons/book-open-list.png',              action:function() { alert('clicked 3') } },
	            null, // divider
	            {label:'Sheep',         icon:'${pageContext.request.contextPath }/js/yj/icons/application-monitor.png',         action:function() { alert('clicked 4') } },
	            {label:'Cheese',        icon:'${pageContext.request.contextPath }/js/yj/icons/bin-metal.png',                   action:function() { alert('clicked 5') } },
	            {label:'Bacon',         icon:'${pageContext.request.contextPath }/js/yj/icons/magnifier-zoom-actual-equal.png', action:function() { alert('clicked 6') } },
	            null, // divider
	            {label:'Onwards',       icon:'${pageContext.request.contextPath }/js/yj/icons/application-table.png',           action:function() { alert('clicked 7') } },
	            {label:'Flutters',      icon:'${pageContext.request.contextPath }/js/yj/icons/cassette.png',                    action:function() { alert('clicked 8') } }
	          ] */
	          ]
	        });
	})
</script>
</head>
<body class="easyui-layout">
	<div region="center">
		<div
			style="height: 40px; text-align: center; line-height: 40px; background: #e0edff; font-family: '黑体'; font-size: large; font-weight: bolder;">
			<s:if test="pl_id!=0">
					修改页面布局信息
				</s:if>
			<s:else>
					添加页面布局信息
				</s:else>
		</div>
		<div>
			<form id="form1" method="post">
				<table style="">
					<tr>
						<td style="width: 20%; text-align: right;">页面名称</td>
						<td style="text-align: left; padding-left: 20px;"><input
							type="hidden" id="id" name="pl_id" value="${pl_id}">
							<input type="hidden" id="isdelete" name="pl_scbs" value="${pl_scbs}">
							<input type="hidden"  name="pl_url" value="${pl_url}">
							<input type="text" id="unitname" name="pl_name" class="txt200"
							value="${pl_name }"> <span id="spanunitname"
							style="color: red; display: none;">不能为空</span></td>
					</tr>

					<%-- <tr>
							<td style="width: 20%;text-align: right;">上传模版</td>
							<td style="text-align: left;padding-left: 20px;">
								<input name="fileProductPicst" type="file"
									id="fileProductPicst" size="40"
									style="border: darkgray 1px solid; height: 22px; line-height: 20px; width: 180px;" />
									<s:if test="t_url!=''">
										<input type="hidden" name="t_url" value="${t_url }" />
										<a href="${t_url }" target="_blank">${t_url }</a>
									</s:if>
								
							</td>
						</tr> --%>

					<tr>
						<td style="width: 20%; text-align: right;">请选择页面模版</td>
						<td style="text-align: left; padding-left: 20px;">
						<select
							id="parentid" name="pl_templateid" class="select_d">
								<option value="0">无</option>
							
								<s:iterator value="#telist" var="u">
								<s:if test="#u.t_id==pl_templateid">
									<option value="${t_id}" selected="selected">${t_name }</option>
								</s:if>
								<s:else>
									<option value="${t_id}">${t_name }</option>
								</s:else>
									
								</s:iterator>
						</select></td>
					</tr>

					<tr>
						<td style="width: 20%; text-align: right;">页面详细</td>
						<td style="text-align: left; padding-left: 20px;">
							<div style="float: left;">
								<button style="" class="btn btn-primary" type="button"
									id="beautify" onclick="do_js_beautify();">格式化</button>
								<select id="tabsize" name="tabsize"><option value="1">制表符缩进</option>
									<option value="2">2个空格缩进</option>
									<option selected="selected" value="4">4个空格缩进</option>
									<option value="8">8个空格缩进</option></select>
							</div>
							<div style="float: left; margin-top: 5px; color: red;">＊请右击文本框选择标签</div>
							<textarea rows="50" cols="100" name="pl_context" id="content"
								style="margin-top: 10px; clear: both;">${pl_context }</textarea>

						</td>
					</tr>

					<tr>
						<td style="width: 20%; text-align: right;"></td>
						<td style="text-align: left; padding-left: 20px;"><a
							id="save" icon="icon-save" href="#" class="easyui-linkbutton">保存</a>
						</td>
					</tr>
				</table>
			</form>
		</div>
	</div>
</body>
</html>