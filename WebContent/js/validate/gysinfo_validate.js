function validate(){
	var unitname=$("#unitname").val();
	var lxr=$("#lxr").val();
	var lxfs=$("#lxfs").val();
	var address=$("#address").val();
	var zycp=$("#zycp").val();
	var xh=$("#xh").val();
	var flag1=true,flag2=true,flag3=true,flag4=true;flag5=true,flag6=true;
	if($.trim(unitname).length==0){
		flag1=false;
		$("#spanunitname").show();
	}else{
		flag1=true;
		$("#spanunitname").hide();
	}
	
	if($.trim(lxr).length==0){
		flag2=false;
		$("#lxrid").show();
	}else{
		flag2=true;
		$("#lxrid").hide();
	}
	
	if($.trim(lxfs).length==0){
		flag3=false;
		$("#lxfsid").show();
	}else{
		flag3=true;
		$("#lxfsid").hide();
	}
	
	if($.trim(address).length==0){
		flag4=false;
		$("#addressid").show();
	}else{
		flag4=true;
		$("#addressid").hide();
	}
	
	if($.trim(zycp).length==0){
		flag5=false;
		$("#zycpid").show();
	}else{
		flag5=true;
		$("#zycpid").hide();
	}
	
	if($.trim(xh).length==0){
		flag6=false;
		$("#xhid").show();
		$("#xhidid").hide();
	}else{
		if($.trim(xh)==0){
			flag6=false;
			$("#xhidid").show();
			$("#xhid").hide();
		}else{
			
				flag6=true;
				$("#xhid").hide();
				$("#xhidid").hide();	
				
			
		}
		
	}
	
	
	if(flag1==false||flag2==false||flag3==false||flag4==false||flag5==false||flag6==false){
		return false;
	}
}