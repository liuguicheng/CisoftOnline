<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
</head>
<body>
	<div style="width: 900px;margin: 0 auto;height: 352px;border:1px solid #e0e0e0;margin-top: 10px;">
		<div style="height: 30px;background: url('img/selecttitle.gif') repeat-x;">
			<div style="height: 40px;width:190px;background: url('img/titleleft.gif') no-repeat;"></div>
		</div>
		<div style="height: 310px;text-align: center;">
			<div style="width: 100%;text-align: center;padding-top: 10px;">
				<span style="color:red;">
					<s:property value="exception.message"/>
		  			<s:actionerror/>
		  		</span>
		  	</div>
			<div>
				<img alt="" src="img/error.gif">
			</div>
		</div>
	</div>
</body>
</html>