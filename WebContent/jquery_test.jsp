<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>jquer效果测试</title>
<script type="text/jscript" src="100nn/js/jquery-1.8.0.min.js"></script>
<style>
/*  div { margin:3px; width:40px; height:40px;
        position:absolute; left:0px; top:30px; 
        background:green;  }
  div.newcolor { background:blue; }
  span { color:red; } */
.focused {
	border: 1px #abcdef scrollbar;
}
</style>
<script type="text/javascript">
	$(function() {


		$("#selectid").change(function() {
			var id=$(this).val();
			if(id==1){
			var str="<table><tr>"
			  +"<td>商品规格</td>"
			  +" <td><input type=\"text\" value=\"\" name=\"gg\"/> </td>"
			  +" </tr>"
			  +" <tr>"
			  +" <td>种植方式</td>"
			  +" <td><input type=\"text\" value=\"\" name=\"zzl\"/></td>"
			  +" </tr>"
			  +"</table>";
			$(".ids").html(str);
			}else{
				var str="<table><tr>"
					  +"<td>商品品牌</td>"
					  +" <td><input type=\"text\" value=\"\" name=\"gg\"/> </td>"
					  +" </tr>"
					  +" <tr>"
					  +" <td>供应商</td>"
					  +" <td><div style=\"position: relative;\">"
					  +"<span style=\"margin-left: 100px; width: 18px; overflow: hidden;\">"
					  +"<select id=\"inseleet\" style=\"width: 148px; margin-left: -100px; onchange=\"this.parentNode.nextSibling.value=this.value\">"
					  +"		<option value=\"0\">请选择</option>"
					  +"		<option value=\"www.eWebSoft.com\">eWebSoft</option>"
					  +"	<option value=\"WEB开发者\">WEB开发者</option>"
					  +"</select>"
					  +"</span><input id=\"intext\" name=\"box\" style=\"width: 130px; position: absolute; left: 0px;\" />"
					  +"</div></td>"
					  +" </tr>"
					  +"</table>";
					$(".ids").html(str);
					$("#inseleet").live("change",function(){
						$("#intext").val($(this).val());
					});
					
				    $("#intext").live("change",function(){
				    	$("#inseleet").val(0);
				    });
			}
			
		}); 
		
		$("#buttonid").click(function(){
			alert($("#intext").val());
			alert($("#inseleet").val());
		});

		
	});
</script>
<body> 
	<select id="selectid" >
	 <option value="1">test1</option>
	 <option value="2">test2</option>
	</select><br/>
	<div class="ids"></div><br/>
	<input type="button" id="buttonid" value="点击" >
	
</BODY>
</HTML>
