function validate(){
	var examinedate=$("#examinedate").datebox('getValue');
	var enddate=$("#enddate").datebox('getValue');
	var flag1=true,flag2=true;
	if($.trim(examinedate).length==0){
		flag1=false;
		$("#spanexaminedate").show();
	}else{
		$("#spanexaminedate").hide();						
	}
	if($.trim(enddate).length==0){
		flag2=false;
		$("#spanenddate").show();
	}else{
		$("#spanenddate").hide();						
	}
	if(flag1==false||flag2==false){
		return false;
	}
}