<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>在线编辑模版</title>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-1.8.3.js"></script>

<script type="text/javascript" src="${pageContext.request.contextPath }/js/jsformat.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/htmlformat.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/css/bootstrap.min.css">
<script type="text/javascript">
$(function(){
	
});
function dind(){ 
    var s=$("#texid").html(); 
   
    s=s.replace(/<\/?(\w+[\s\S]*?)>/gi,function(a){return a.replace(/[\r\n]/gi,"")}); 
    $("#texid").html(s); 
} 
</script>
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
</head>
<body>
<div style="margin: 10px 20px auto;">
	<form action="templad_savemb" method="post">
	<input name="t_id" type="hidden" value="${t_id }">
	<button class="btn btn-primary" type="submit">保存</button><button style="margin-left: 10px;" class="btn btn-primary" type="button" id="beautify" onclick="do_js_beautify();">格式化</button>
	 <select id="tabsize" name="tabsize" ><option value="1">制表符缩进</option><option value="2">2个空格缩进</option><option selected="selected" value="4">4个空格缩进</option><option value="8">8个空格缩进</option></select>
	
	<textarea rows="50" cols="100" style="margin-top: 10px;" id="content" name="result">${result }</textarea>
	</form>
</div>
</body>
</html>