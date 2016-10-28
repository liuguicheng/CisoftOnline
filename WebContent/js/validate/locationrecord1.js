function validate(){
	var longitude=$("#longitude").val();
	
	var latitude=$("#latitude").val();
	
	var flag1=true,flag2=true,flag3=true,flag4=true,flag5=true;
	if($.trim(longitude).length==0){
		flag1=false;
		$("#spanlongitude").show();
	}else{
		$("#spanlongitude").hide();
	}
	
	
	
	if($.trim(latitude).length==0){
		flag3=false;
		$("#spanlatitude").show();
	}else{
		$("#spanlatitude").hide();
	}
	
	
	
	
	if(flag1==false||flag2==false||flag3==false||flag4==false||flag5==false){
		return false;
	}
}