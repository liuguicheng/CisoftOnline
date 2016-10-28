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
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/js/easyui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/js/easyui/themes/icon.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/panel.css">
<script type="text/javascript">
	$(function(){	
		
	})
	 var second =4;
   
    setInterval("redirect()", 1000); //每1秒钟调用redirect()方法一次
    function redirect()
    {
        if (second <= 0)
        {
            //location.href = 'b.html';
            window.close();
        } else
        {
        	--second;
        	
              $("#sec").html(",页面在"+second+"秒后自动关闭");
        }
    }
</script>
</head>
<body class="easyui-layout">	
	<div region="center">
			<div style="height: 40px; text-align: center;line-height: 40px;background: #e0edff;font-family: '黑体';font-size: large;font-weight: bolder;">
					操作提示
			</div>
			<div style="height: 100px;font-size: 14px;">
			     <div style="margin: 20px 280px auto;">
				<div style="float: left;">${result}</div><div style="float: left;" id="sec">,页面在3秒后自动关闭</div>
				</div>
		</div>
	</div>
</body>
</html>