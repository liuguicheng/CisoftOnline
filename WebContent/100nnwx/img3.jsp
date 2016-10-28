<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<input type="hidden" id="urlid" value="wxcommodity_querycommdityListajax?commodity.rows=10&commodity.page=<%=request.getParameter("id")%>">
	<div id="imgidss"></div>
	<%-- <s:iterator value="pageResponse.rows">
		<div class="pin wfc wft" id="imgid">

			<a class="img  x" href="/pins/60411540/" target="_self"> <img
				src="imgss.jsp?fiel=<s:property value="c_splbms"/>" width="192"
				height="235"> <span style="display: none" class="stop"></span>
			</a>
			<p class="description"></p>
			<p class="stats less"></p>
			<div class="convo attribution clearfix">
				<p></p>
			</div>
			<div style="display: none" class="comments muted"></div>
			<div style="display: none" class="write convo clearfix"></div>
		</div>
	</s:iterator> --%>
</body>
  <script src="js/jquery-1.8.3.js" type="text/javascript"></script>
<script type="text/javascript">
$(document).ready(function() {
	var imghtml="";
	var nextHref=$("#urlid").val();
	var pageid=$("#pageid").val();
	var imgoldhtml=$("#imgidss").html();
	nextHref=nextHref+pageid;
	alert(imgoldhtml);
	$.ajax( {
        url: nextHref,
        type: "POST",
        success: function(data) {
			$.each(data.rows, function (i, item) {
	   		imghtml+="<div class=\"pin wfc wft\" id=\"imgid\">"+
"<a class=\"img  x\" href=\"/pins/60411540/\" target=\"_self\">"+
  "  <img  src=\"../imgss.jsp?file="+item.c_sltimg+"\" width=\"192\" height=\"235\">"+
   " <span style=\"display: none\" class=\"stop\"></span>"+
" </a>"+
"   <p class=\"description\">  </p>"+
"  <p class=\"stats less\">"+
"  </p> "+
"  <div class=\"convo attribution clearfix\">"+
"      <p></p>"+
"  </div> "+
" <div style=\"display: none\" class=\"comments muted\">"+
"  </div>"+
"   <div style=\"display: none\" class=\"write convo clearfix\">"+
" </div> "+
" </div>";
});
			var i=imgoldhtml+imghtml;
			$("#imgidss").appendTo(i);
        }
});
});
</script>
</html>