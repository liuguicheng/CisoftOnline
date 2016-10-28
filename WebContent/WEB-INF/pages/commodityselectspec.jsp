<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib prefix="s" uri="/struts-tags"%>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>广西100南宁商家订单系统</title>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-1.8.3.js"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/panel.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/bootstrap.min.css">

<script type="text/javascript"> 
	$(function(){
		//获取id
		$("#ctypid").val(window.opener.document.getElementById("xzggid").value);
		var item = $(":radio:checked"); 
		var len=item.length; 
		if(len>0){ 
			var id=item.val();
			$("#xzggss").val(id);
			 $.ajax({
				   type: "POST",
				   url: "commodityspec_doselectspecandval",
				   data: "cp_id="+id,
				   success: function(msg){
					   var s=msg.split("|");
					   var ss=s[0];
					   var s2="";
					   if(s[2]==1){
						   s2="显示方式:下拉显示";
					   }else{
						   s2="显示方式:平铺显示";
					   }
					   var sss=s[1];
					   if(sss==""){
						   sss="[暂无备注]";
					   }
					   var s2d="["+s2+"]";
					   var ssss=s[3];
					   var ggz=$('<div></div>');//规格值
					   if(ssss!=""){
						   var sd=ssss.split(",");
						   ggz.html("");				
						   $.each(sd,function(n,value) { 
							   
							   var ggzss=$("<div style='border: 1px solid #AEEAF5; background:#fff;float: left;margin-left:3px;padding:4px;text-align: center;font-size:10px;'>"+value+"<div>");//规格值
							   ggz.append(ggzss);
						   });
					   }
					   var shtml=$("<div style='font-size: 14px;'><div style='font-weight: bold;font-size:15px;'>"+ss+"</div><br/><div style='float: left;margin-top:3px;'>"+sss+"</div><div style='margin-left:5px;float: left;margin-top:3px;'>"+s2d+"</div><br/><br/><div style='clear:both;' id='dis'></div></div>");
					 
					   
					   $("#ggzid").append(shtml);
					   $("#dis").append(ggz);
					  
				   }
			});
		}
	   $("input:radio[name='lexid']").change(function(){
		   $("#ggzid").html("");
		   $("dis").html("");
		  var id=$(this).val();
			$("#xzggss").val(id);
		   $.ajax({
			   type: "POST",
			   url: "commodityspec_doselectspecandval",
			   data: "cp_id="+id,
			   success: function(msg){
				   var s=msg.split("|");
				   var ss=s[0];
				   var s2="";
				   if(s[2]==1){
					   s2="显示方式:下拉显示";
				   }else{
					   s2="显示方式:平铺显示";
				   }
				   var sss=s[1];
				   if(sss==""){
					   sss="[暂无备注]";
				   }
				   var s2d="["+s2+"]";
				   var ssss=s[3];
				   var ggz=$('<div></div>');//规格值
				   if(ssss!=""){
					   var sd=ssss.split(",");
					   ggz.html("");				
					   $.each(sd,function(n,value) { 
						   
						   var ggzss=$("<div style='border: 1px solid #AEEAF5; background:#fff;float: left;margin-left:3px;padding:4px;text-align: center;font-size:10px;'>"+value+"<div>");//规格值
						   ggz.append(ggzss);
					   });
				   }
				   var shtml=$("<div style='font-size: 14px;'><div style='font-weight: bold;font-size:15px;'>"+ss+"</div><br/><div style='float: left;margin-top:3px;'>"+sss+"</div><div style='margin-left:5px;float: left;margin-top:3px;'>"+s2d+"</div><br/><br/><div style='clear:both;' id='dis'></div></div>");
				 
				   
				   $("#ggzid").append(shtml);
				   $("#dis").append(ggz);
				  
			   }
		});
	   });
	   
	   $("#save").click(function(){
		  var sd= $("#ctypid").val();
		  var specid=$("#xzggss").val();
		  //添加
		  $.ajax({
			   type: "POST",
			   url: "${pageContext.request.contextPath}/ctype_addspecandtype",
			   data: "ct_id="+sd+"&cspec.cp_id="+specid,
			   success: function(msg){
				   alert("保存成功");
				   window.close();
				   window.opener.location.href="${pageContext.request.contextPath}/ctype_editView?ct_id="+sd;
			   }
		});
		  
	   });
		
	});
	function addgg(){
		var widoid="add123ddd";
		  var iWidth="768"; //弹出窗口的宽度;
			 var iHeight="468"; //弹出窗口的高度;
			 var iTop = (window.screen.availHeight-30-iHeight)/2; //获得窗口的垂直位置;
			 var iLeft = (window.screen.availWidth-10-iWidth)/2; //获得窗口的水平位置;
	         window.open('${pageContext.request.contextPath}/commodityspec_addView',widoid,'height='+iHeight+',width='+iWidth+',top='+iTop+',left='+iLeft+',toolbar=no,menubar=no,scrollbars=no,resizable=no,location=no,status=no');
	
	}
	
	
</script>
</head>
<body class="easyui-layout">
<input type="hidden" id="xzggss" value="">
<input type="hidden" id="ctypid" value="">
	<div  style="background: rgba(192, 188, 188, 0.32);padding: 10px 20px;width: 80%;height: 330px;margin: 20px auto; ">
			<div style="float: left;width: 40%;">
			    <div style="font-weight: bold;font-size: 14px;padding: 5px;">请选择规格</div>
			    <div style="border: 1px solid #fff;height: 250px; background: #fff;padding: 8px; overflow-y:auto;">
			       <s:iterator value="cs">
			          <input style="font-size: 14px;" name="lexid" type="radio" value='<s:property value="cp_id"/>' checked="checked"/> <s:property value="cp_name"/><br/> 
			       </s:iterator>
			    </div>
			</div>
			<div style="float: left;width: 50%;margin-left: 20px;">
			     <div style="font-weight: bold;font-size: 14px;padding: 5px;">规格预览区</div>
			    <div style="border: 1px solid #fff;height: 250px; background: #fff;padding: 8px;" id="ggzid">
			       
			    </div>
			</div>
			<div style="clear: both;margin-top: 10px;font-size: 10px;padding-top: 5px;">
			没有找到需要的规格？<a id="savetr" icon="icon-add" href="javascript:addgg();"  >添加规格</a>
			</div>
	</div>
	<div style="background: rgba(181, 231, 247, 0.73);padding-top:10px; 100%;height: 40px;text-align: center;margin-top: 20px;">
	    <a id="save" icon="icon-save" href="#" class="easyui-linkbutton"  >保存</a>
	</div>
	
</body>
</html>