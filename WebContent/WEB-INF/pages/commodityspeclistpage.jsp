<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	    <%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>广西100南宁商家订单系统</title>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/jquery-1.8.3.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/css/bootstrap.min.css">
<style type="text/css">
.middle {
	margin: 20px 20px auto;
}
 a{
    	cursor:pointer;
    }
    .file_td input {
	vertical-align:middle;
	margin:0;
	padding:0
}
.file_td {
	position:relative;
	/* width:235px */
}
.file_td .file_txt {
	height:26px;
	border:1px solid #9b9b9b;
	width:55px;
	display: none;
}
.file_td .file_btn {
	border:1px solid #9b9b9b;
	height:28px;
	line-height:28px;
	width:50px;
}
.file_td .file_file {
	position:absolute;
	top:0;
	right:100;
	height:28px;
filter:alpha(opacity:0);
	opacity: 0;
	
</style>
<script type="text/javascript">
	$(function() {
		//点击选择规格值  js
       $(".xzggzid").click(function(){
    	 var namestr=$(this).attr("name");
    	 var ggidstr=namestr.split(",");
    	 var ggname=ggidstr[0];
    	 var ggid=ggidstr[1];
    	 var bsid=ggidstr[2];
    	 if($("#tr"+ggid).length>0){
    		 alert("已存在，不能重复添加");
    	 }else{
    		 
    	 
    	   var ds=" <tr id='tr"+ggid+"'>"+
    	         " <td ><input type='hidden' value='"+ggid+"'/>"+
           "<div style=\"border: 1px solid #AEEAF5; background:#fff;float: left;margin-left:3px;padding:4px;text-align: center;font-size:10px;\">"+ggname+"</div>"+
           "</td>"+
           "<td ><input type=\"text\" style=\"height:28px;\" class=\"form-control\" placeholder=\"\" value=\"\"> </td>"+
           "<td width='80px;'><input type=\"text\" style=\"height:28px;\" class=\"form-control\" placeholder=\"\" value=\"\"> </td>"+
           "<td width='80px;'><input type=\"text\" style=\"height:28px;\" class=\"form-control\" placeholder=\"\" value=\"\"> </td>"+
           "<td width='80px;'><input type=\"text\" style=\"height:28px;\" class=\"form-control\" placeholder=\"\" value=\"\"> </td>"+
          " <td>"+
            " <div class=\"file_td\">"+
           "<input type=\"text\" name=\'textfield\' id='textfield' class='file_txt' />  "+
    "<input type='button' class='file_btn btn btn-primary btn-sm' value='上传' />"+
   " <input type=\"file\" name=\"fileProductPic\" class=\"file_file\" id=\"fileField\" size=\"28\" onchange=\"document.getElementById('textfield').value=this.value\" />"+
         "</div>"+
          " </td>"+
          " <td><span class=\"glyphicon glyphicon-remove\" aria-hidden=\"true\" onclick='ondel("+ggid+")'></span></td>"+
        " </tr>";
         $(".gg"+bsid).append(ds);
    	 }
       });
	});
	
	//移除一行
	function ondel(id){
		$("#tr"+id).remove();
	}
	function onbj(){
		var widoid="gedisssd";
		 var iWidth="768"; //弹出窗口的宽度;
		 var iHeight="334"; //弹出窗口的高度;
		 var iTop = (window.screen.availHeight-30-iHeight)/2; //获得窗口的垂直位置;
		 var iLeft = (window.screen.availWidth-10-iWidth)/2; //获得窗口的水平位置;
	 window.open('${pageContext.request.contextPath }/pages_commodityspec',widoid,'height='+iHeight+',width='+iWidth+',top='+iTop+',left='+iLeft+',toolbar=no,menubar=no,scrollbars=no,resizable=no,location=no,status=no');
		
		
	}
	
	//根据规格生成货品
	function sphp(id){
		 $.ajax({
		       /*  cache: true, */
		        type: "POST",
		        url:"commodityimg_addspecimg",
		        data:$('#form'+id).serialize(),// 你的formid
		       /*  async: false, */
		        error: function(request) {
		            alert("添加失败");
		        },
		        success: function(data) {
		        	alert(data);
		        
		        }
		    });
	}
	
</script>
</head>
<body class="easyui-layout">
	<div region="center" border="false">
		<div class="middle" id="tb">
			1.增加规格项或选择规格标签 》2.添加需要的规格值 》自定义规格值或关联相册 》 发布货品 <!-- <a class="btn btn-primary" style="float: right;">增加规格项</a> -->
		</div>
		<hr>
		<div class="middle">

			<div class="bs-example bs-example-tabs" role="tabpanel"
				data-example-id="togglable-tabs">
				<input type="hidden" value="<%=request.getParameter("result") %>" id="spid">
				<ul id="myTab" class="nav nav-tabs" role="tablist">
				    <s:iterator value="ctlist" status="s" var="sd">
				     <s:iterator value="#sd.cslist" status="ss">
				    	<s:if test="#ss.index==0">
				    <li role="presentation" class="active">
					  <a href="#home<s:property value='cp_id'/>"
						id="home-tab<s:property value='cp_id'/>" role="tab" data-toggle="tab" aria-controls="home<s:property value='cp_id'/>"
						aria-expanded="true"><s:property value="cp_name"/> </a></li>
				    </s:if>
					<s:else>
					<li role="presentation" >
					  <a href="#home<s:property value='cp_id'/>"
						id="home-tab<s:property value='cp_id'/>" role="tab" data-toggle="tab" aria-controls="home<s:property value='cp_id'/>"
						aria-expanded="true"><s:property value="cp_name"/> </a></li>
					</s:else>
					</s:iterator>
						</s:iterator>
					<!-- <li role="presentation"><a href="#profile" role="tab"
						id="profile-tab" data-toggle="tab" aria-controls="profile">颜色</a></li> -->

				</ul>
				<div id="myTabContent" class="tab-content">
					  <s:iterator value="ctlist" status="s" var="sd">
					  <s:iterator value="#sd.cslist" status="ss" var="sdd">
					  <s:if test="#ss.index==0">
					    <div role="tabpanel" class="tab-pane fade in active" id="home<s:property value='cp_id'/>"
						aria-labelledby="home-tab<s:property value='cp_id'/>">
						<form action="commodityimg_addspecimg.action" method="post" enctype="multipart/form-data" id="form<s:property value='cp_id'/>">
						
						
						
						<div style="padding: 10px;">
						<div style="width: 20%;float: left;">
						   <div style="margin-right: 10px;font-size: 12px;">
						   请点击右侧，添加本商品需要的<s:property value="cp_name"/> 
						   </div>
						</div>
						<div style="float: left;margin-left: 20px;font-size: 12px;border-left: 1px solid #E2E2E2;">
						   <div style="float: left;margin-left: 20px;">
						      <div><%-- <a id=""> 添加全部<s:property value="cp_name"/> </a> <br/> --%></div>
						      <div style="margin-top: 0px;">
						            <s:iterator value="#sdd.scvlist">
						             <div style="float: left;">
						     		 <div style="border: 1px solid #AEEAF5; background:#fff;float: left;margin-left:3px;padding:4px;text-align: center;font-size:10px;"><s:property value="cpv_name"/> </div>
						     		 <div style="clear: both;margin-left: 7px;"><a style="cursor:pointer;" class="xzggzid" name="<s:property value="cpv_name"/>,<s:property value="cpv_id"/>,<s:property value="cp_id"/>">选择</a></div>
						     		 </div>
						     		 </s:iterator>
						      </div>
						   </div>
						    <div style="float: left;margin-left: 50px;">
						    	没有您需要的<s:property value="cp_name"/> ？立刻<a href="javascript:onbj();">编辑<s:property value="cp_name"/> </a>
						    </div>
						</div>
						 <div style="clear: both;margin-top: 80px;">
						    <table class="table table-bordered"  >
      <thead>
        <tr>
          <th>规格值</th>
          <th>货号</th>
          <th>库存</th>
          <th>销售价</th>
           <th>成本价</th>
          <th>关联商品相册图片</th>
          <th>操作</th>
        </tr>
      </thead>
      <tbody class="gg<s:property value='cp_id'/>">
           <s:iterator value="#sdd.scvlist" status="vd">
           <input type="hidden" value="<%=request.getParameter("result") %>" name="cilist[<s:property value="#vd.index"/>].commodity.c_id">
           <input type="hidden" value="<s:property value='cpv_name'/>" name="cilist[<s:property value="#vd.index"/>].commodityspec.cp_name">
            <input type="hidden" name="csllist[<s:property value="#vd.index"/>].csl_name" value="<s:property value='cpv_name'/>">
            <input type="hidden" value="<%=request.getParameter("result") %>" name="csllist[<s:property value="#vd.index"/>].commodity.c_id">
              <tr id="tr<s:property value='cpv_id'/>">
    	         <td ><input type='hidden' value="<s:property value='cpv_id'/>" name='cilist[<s:property value="#vd.index"/>].commodityspec.cp_id'/>
    	       
           <div style="border: 1px solid #AEEAF5; background:#fff;float: left;margin-left:3px;padding:4px;text-align: center;font-size:10px;"><s:property value='cpv_name'/></div>
           </td>
          <td ><input type="text" style="height:28px;"name="csllist[<s:property value="#vd.index"/>].cls_hh" class="form-control" placeholder="" value=""> </td>
           <td width='80px;'><input type="text" name="csllist[<s:property value="#vd.index"/>].csl_kc" style="height:28px;" class="form-control" placeholder="" value=""> </td>
           <td width='80px;'><input type="text" name="csllist[<s:property value="#vd.index"/>].cls_xsjg" style="height:28px;" class="form-control" placeholder="" value=""> </td>
           <td width='80px;'><input type="text" name="csllist[<s:property value="#vd.index"/>].cls_jhjg" style="height:28px;" class="form-control" placeholder="" value=""> </td>
           <td>
             <div class="file_td">
           <input type="text" name='textfield<s:property value='cpv_id'/>' id='textfield<s:property value='cpv_id'/>' class='file_txt' />  
    <input type='button' class='file_btn btn btn-primary btn-sm' value='上传' />
    <input type="file" name="fileProductPic" class="file_file" id="fileField<s:property value='cpv_id'/>" size="28" onchange="document.getElementById('textfield<s:property value='cpv_id'/>').value=this.value" />
         </div>
           </td>
          <td><span class="glyphicon glyphicon-remove" aria-hidden="true" onclick='ondel(<s:property value='cpv_id'/>)'></span></td>
        </tr>
           </s:iterator>
      </tbody>
    </table>
						    </div>
						</div>
						<div style="clear: both;"></div>
		 <div style="margin: 0px 290px auto;">
		    <button type="submit" <%-- onclick="sphp(<s:property value='cp_id'/>);" --%> class="btn btn-primary">生成所有货品</button><!-- <a class="btn btn-primary" style="margin-left: 10px;">保存</a> -->
		
		 </div>
					</form>	
					</div>
					  </s:if>
					  <s:else>
					    <div role="tabpanel" class="tab-pane fade" id="home<s:property value='cp_id'/>"
						aria-labelledby="home-tab<s:property value='cp_id'/>">
						<form action="commodityimg_addspecimg.action" method="post" enctype="multipart/form-data" id="form<s:property value='cp_id'/>">
						
						
						
						<div style="padding: 10px;">
						<div style="width: 20%;float: left;">
						   <div style="margin-right: 10px;font-size: 12px;">
						   请点击右侧，添加本商品需要的<s:property value="cp_name"/> 
						   </div>
						</div>
						<div style="float: left;margin-left: 20px;font-size: 12px;border-left: 1px solid #E2E2E2;">
						   <div style="float: left;margin-left: 20px;">
						      <div><%-- <a id=""> 添加全部<s:property value="cp_name"/> </a> <br/> --%></div>
						      <div style="margin-top: 0px;">
						            <s:iterator value="#sdd.scvlist">
						             <div style="float: left;">
						     		 <div style="border: 1px solid #AEEAF5; background:#fff;float: left;margin-left:3px;padding:4px;text-align: center;font-size:10px;"><s:property value="cpv_name"/> </div>
						     		 <div style="clear: both;margin-left: 7px;"><a style="cursor:pointer;" class="xzggzid" name="<s:property value="cpv_name"/>,<s:property value="cpv_id"/>,<s:property value="cp_id"/>">选择</a></div>
						     		 </div>
						     		 </s:iterator>
						      </div>
						   </div>
						    <div style="float: left;margin-left: 50px;">
						    	没有您需要的<s:property value="cp_name"/> ？立刻<a href="javascript:onbj();">编辑<s:property value="cp_name"/> </a>
						    </div>
						</div>
						 <div style="clear: both;margin-top: 80px;">
						    <table class="table table-bordered"  >
      <thead>
        <tr>
          <th>规格值</th>
          <th>货号</th>
          <th>库存</th>
          <th>销售价</th>
           <th>成本价</th>
          <th>关联商品相册图片</th>
          <th>操作</th>
        </tr>
      </thead>
      <tbody class="gg<s:property value='cp_id'/>">
           <s:iterator value="#sdd.scvlist" status="vd">
           <input type="hidden" value="<%=request.getParameter("result") %>" name="cilist[<s:property value="#vd.index"/>].commodity.c_id">
           <input type="hidden" value="<s:property value='cpv_name'/>" name="cilist[<s:property value="#vd.index"/>].commodityspec.cp_name">
            <input type="hidden" name="csllist[<s:property value="#vd.index"/>].csl_name" value="<s:property value='cpv_name'/>">
            <input type="hidden" value="<%=request.getParameter("result") %>" name="csllist[<s:property value="#vd.index"/>].commodity.c_id">
              <tr id="tr<s:property value='cpv_id'/>">
    	         <td ><input type='hidden' value="<s:property value='cpv_id'/>" name='cilist[<s:property value="#vd.index"/>].commodityspec.cp_id'/>
    	       
           <div style="border: 1px solid #AEEAF5; background:#fff;float: left;margin-left:3px;padding:4px;text-align: center;font-size:10px;"><s:property value='cpv_name'/></div>
           </td>
          <td ><input type="text" style="height:28px;"name="csllist[<s:property value="#vd.index"/>].cls_hh" class="form-control" placeholder="" value=""> </td>
           <td width='80px;'><input type="text" name="csllist[<s:property value="#vd.index"/>].csl_kc" style="height:28px;" class="form-control" placeholder="" value=""> </td>
           <td width='80px;'><input type="text" name="csllist[<s:property value="#vd.index"/>].cls_xsjg" style="height:28px;" class="form-control" placeholder="" value=""> </td>
           <td width='80px;'><input type="text" name="csllist[<s:property value="#vd.index"/>].cls_jhjg" style="height:28px;" class="form-control" placeholder="" value=""> </td>
           <td>
             <div class="file_td">
           <input type="text" name='textfield<s:property value='cpv_id'/>' id='textfield<s:property value='cpv_id'/>' class='file_txt' />  
    <input type='button' class='file_btn btn btn-primary btn-sm' value='上传' />
    <input type="file" name="fileProductPic" class="file_file" id="fileField<s:property value='cpv_id'/>" size="28" onchange="document.getElementById('textfield<s:property value='cpv_id'/>').value=this.value" />
         </div>
           </td>
          <td><span class="glyphicon glyphicon-remove" aria-hidden="true" onclick='ondel(<s:property value='cpv_id'/>)'></span></td>
        </tr>
           </s:iterator>
      </tbody>
    </table>
						    </div>
						</div>
						<div style="clear: both;"></div>
		 <div style="margin: 0px 290px auto;">
		    <button type="submit" <%-- onclick="sphp(<s:property value='cp_id'/>);" --%> class="btn btn-primary">生成所有货品</button><!-- <a class="btn btn-primary" style="margin-left: 10px;">保存</a> -->
		
		 </div>
					</form>	
					</div>
					  
					  </s:else>
					</s:iterator>
					</s:iterator>

				</div>
			</div>
			
		<div style="clear: both;"></div>
		</div>
		<!--  <hr>
		<div class="middle">
		<div style="float: left;"><h4>规格</h4></div> <div style="float: right;"> <a class="btn btn-primary" >添加一条货品</a></div>
		</div>
		<div class="middel" style="padding-top: 10px; ">
		  <table class="table table-bordered"  >
      <thead>
        <tr>
          <th>货号</th>
          <th>规格值</th>
          <th>库存</th>
          <th>销售价</th>
           <th>成本价</th>
        </tr>
      </thead>
      <tbody>
        <tr>
          <td><input type="text" class="form-control" placeholder="" value=""></td>
          <td><input type="text" class="form-control" placeholder="" value=""></td>
          <td><input type="text" class="form-control" placeholder="" value=""></td>
          <td><input type="text" class="form-control" placeholder="" value=""></td>
          <td><input type="text" class="form-control" placeholder="" value=""></td>
        </tr>
            
        
      </tbody>
    </table>
		
		</div>
		<hr> -->
<!-- 			<hr>
		<a class="btn btn-primary" style="margin: 0px 310px auto;margin-bottom: 10px;">发布所有商品</a> -->
	</div>

</body>
</html>