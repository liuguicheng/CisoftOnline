function validate(){
	var ua_shName=$("#ua_shName").val();
	var ua_shDh=$("#ua_shDh").val();
	var ua_address=$("#ua_address").val();
	var ua_yb=$("#ua_yb").val();
	var flag1=true,flag2=true,flag3=true,flag4=true;
	if($.trim(ua_shName).length==0){
		flag1=false;
		$("#spanpassword").show();
	}else{
		flag1=true;
		$("#spanpassword").hide();
	}
	
	if($.trim(ua_shDh).length==0){
		flag2=false;
		$("#spantruename").show();
	}else{
		flag2=true;
		$("#spantruename").hide();
	}
	
	if($.trim(ua_address).length==0){
		flag3=false;
		$("#uaaddressid").show();
	}else{
		flag3=true;
		$("#uaaddressid").hide();
	}
	
	if($.trim(ua_yb).length==0){
		flag4=false;
		$("#ybid").show();
		
	}else{
		flag4=true;
		$("#ybid").hide();
	}
	
	
	if(flag1==false||flag2==false||flag3==false||flag4==false){
		return false;
	}
}