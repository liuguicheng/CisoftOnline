function validate(){
	var name=$("#name").val();
	var jiage=$("#jiage").val();
	var quanzhong=$("#quanzhong").val();
	
	var flag1=true,flag2=true,flag3=true,flag4=true,flag5=true;
	if($.trim(name).length==0){
		flag1=false;
		$("#spanname").show();
	}else{
		$("#spanname").hide();
	}
	
	if($.trim(jiage).length==0){
		flag2=false;
		$("#spanjiage").show();
	}else{
		$("#spanjiage").hide();
	}
	
	if($.trim(quanzhong).length==0){
		flag3=false;
		$("#spanquanzhong").show();
	}else{
		$("#spanquanzhong").hide();
	}
	
	
	
	
	if(flag1==false||flag2==false||flag3==false||flag4==false||flag5==false){
		return false;
	}
}