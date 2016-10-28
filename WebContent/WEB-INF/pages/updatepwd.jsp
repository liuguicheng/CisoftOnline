<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		bind(-1,'d');
		//给就密码赋值
		var username="${usersession.u_name}";
		/* var userpwd="${usersession.u_pwd}"; */
		var userid="${usersession.u_id}";
		
		if(userid!=""){
			$("#id").val(userid);
			$("#username").val(username);
			/* 	$("#passwordold").val(userpwd);	 */
		}
		
		//修改密码
		$("#save").click(function(){
			var id=$("#id").val();
			var username=$("#username").val(); 
			var password=$("#password").val();
			var passwordsecond=$("#passwordsecond").val();
			var passwordold=$("#passwordold").val();
			var flag1=true,flag2=true,flag3=true;
			if($.trim(passwordold).length==0){
				flag1=false;
				$("#passwordidid").show();
			}else{
				$("#passwordidid").hide();
			}
			 
			if($.trim(password).length==0){
				flag2=false;
				$("#spanpassword").show();
			}else{
				$("#spanpassword").hide();
			}
			
			if($.trim(passwordsecond).length==0){
				flag3=false;
				$("#spanpasswordsecond").show();
				$("#spanpasswordsecond1").hide();
			}else{
				$("#spanpasswordsecond").hide();
				if(password!=passwordsecond){
					flag3=false;
					$("#spanpasswordsecond1").show();
				}else{
					$("#spanpasswordsecond1").hide();
				}
			}
			if(flag1==false||flag2==false||flag3==false){
				return false;
			}
			
			var arr={"u_id":id,"u_name":username,"u_pwd":password,"result":passwordold};
			if(userid!=""){
				$.post("${pageContext.request.contextPath}/user_updatepwd",arr,function(data){
					$.messager.alert("提示",data,"info");
				});
			}
		});
		//查询
		$("#btnsearch").click(function(){
			var shenfen=$("#shenfen").val();
			var name=$("#name").val();
			bind(shenfen,name);
		})
	})
	function bind(shenfen,name){
		$('#grid').datagrid({
			iconCls : 'icon-forward',
			fit : true,
			border : false,
			striped : true,
			rownumbers : true,
			singleSelect:true,
			url : "${pageContext.request.contextPath}/user_selectlist",
			queryParams: {  		
			    "shenfen":shenfen,		
			    "u_name":name  	
			},  
			idField : 'u_id',
			columns : [[
			 	{
			 		field:'u_id',
			 		checkbox:true
			 	},{
			 		field:'u_zsName',
			 		title:'姓名',
			 		align:'center',
			 		width:120
			 	},{
			 		field:'u_name',
			 		title:'用户名',
			 		align:'center',
			 		width:120
			 	},{
			 		field:'u_pwd',
			 		title:'密码',
			 		align:'center',
			 		width:120
			 	},{
			 		field:'caozuo',
			 		title:'操作',
			 		align:'center',
			 		width:200,
			 		formatter:function(value,row,index){
			 			return "<a href='#' onclick='reset("+row.id+","+row.flag+")'>重置</a>";
			 		}
			 	}           
			 ]]
		});
	}
	function reset(id,flag){
		$.messager.confirm("提示","真的要重置吗?",function(r){
			if(r){
				var arr={"u_id":id,"shenfen":flag};
				$.post("user_reset",arr,function(data){
					$.messager.alert("提示",data,"info");
					$("#grid").datagrid('reload');
				})
			}
		});
	}
</script>
</head>
<body class="easyui-layout">	
	<div region="center">
			<!-- <div style="height: 28px; background: url('img/titleall.gif') repeat-x;">
				<div class="titleleft"></div>
				<div class="titleright"></div>
			</div> -->
			<div style="height: 40px; text-align: center;line-height: 40px;background: #e0edff;font-family: '黑体';font-size: large;font-weight: bolder;margin-top: 10px;">
				修改密码
			</div>
			<div style="height: 330px;">
				<form id="form1" method="post">
					<table style="margin: 0 auto;">
					<!-- 	<tr>
							<td style="width: 100px;">用户名</td>
							<td style="width: 255px;">
								<input type="hidden" id="id" >
								<input type="text" id="username"  style="width: 250px;">
							</td>
							<td style="width: 150px;">
								<span id="spanusername" style="color: red;display: none;">不能为空</span>
							</td>
						</tr> -->
						
						<tr>
							<td>原密码</td>
							<td>
							<input type="hidden" id="id" >
								<input type="hidden" id="username"  >
								<input type="password" id="passwordold"  class="txt200">
								
							</td>
							<td>
							<span id="passwordidid" style="color: red;display: none;">不能为空</span>
							</td>
						</tr>
						<tr>
							<td>新密码</td>
							<td>
								<input type="password" id="password"  class="txt200" value="">
							</td>
							<td>
								<span id="spanpassword" style="color: red;display: none;">不能为空</span>
							</td>
						</tr>
						<tr>
							<td>确认新密码</td>
							<td>
								<input type="password" id="passwordsecond" class="txt200" value="">
							</td>
							<td>
								<span id="spanpasswordsecond" style="color: red;display: none;">不能为空</span>
								<span id="spanpasswordsecond1" style="color: blue;display: none;">两次输入密码不一样</span>
							</td>
						</tr>
						<tr>
							<td></td>
							<td><a id="save" icon="icon-save" href="#" class="easyui-linkbutton"  >保存</a></td>
						</tr>
					</table>
				</form>
				
			</div>
	</div>
</body>
</html>