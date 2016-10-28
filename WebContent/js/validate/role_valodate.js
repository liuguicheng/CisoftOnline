function validate(){
	var username=$("#rolename").val();
	var flag1=true;
	if($.trim(username).length==0){
		flag1=false;
		$("#spanrolename").show();
	}else{
		flag1=true;
		$("#spanrolename").hide();
	}
	
	
	
	if(flag1==false){
		return false;
	}
}