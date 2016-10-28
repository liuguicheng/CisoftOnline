function validate(){
	var username=$("#username").val();
	var password=$("#password").val();
	var truename=$("#truename").val();
	var email=$("#email").val();
	var flag1=true,flag2=true,flag3=true,flag4=true;
	if($.trim(username).length==0){
		flag1=false;
		$("#spanusername").show();
	}else{
		flag1=true;
		$("#spanusername").hide();
	}
	
	if($.trim(password).length==0){
		flag2=false;
		$("#spanpassword").show();
	}else{
		flag2=true;
		$("#spanpassword").hide();
	}
	
	if($.trim(truename).length==0){
		flag3=false;
		$("#spantruename").show();
	}else{
		flag3=true;
		$("#spantruename").hide();
	}
	
	if($.trim(email).length==0){
		flag4=false;
		$("#spanemail").show();
		$("#spanemail1").hide();
	}else{
		flag4=true;
		$("#spanemail").hide();
		var reg=new RegExp(/^[a-zA-Z0-9_-]+@[a-zA-Z0-9_-]+(\.[a-zA-Z0-9_-]+)+$/);
		if(!reg.test(email)){
			$("#spanemail1").show();
			flag4=false;
		}else{
			flag4=true;
			$("#spanemail1").hide();
		}
	}
	
	
	if(flag1==false||flag2==false||flag3==false||flag4==false){
		return false;
	}
}