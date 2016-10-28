function validate(){
	
	var name=$("#name").val();
	var parentid=$("#parentid").val();
//	var unitid=$("#unitid").val();
	var flag1=true,flag2=true,flag3=true,flag4=true,flag5=true;
	
	
	if($.trim(name).length==0){
		flag3=false;
		$("#spanname").show();
	}else{
		$("#spanname").hide();
	}
	
//	if($.trim(unitid).length==0){
//		flag4=false;
//		$("#spanunitid").show();
//	}else{
//		$("#spanunitid").hide();
//	}
	
	if($.trim(parentid).length==0){
		flag5=false;
		$("#spanparentid").show();
	}else{
		$("#spanparentid").hide();
	}
	if(flag1==false||flag2==false||flag3==false||flag4==false||flag5==false){
		return false;
	}
}