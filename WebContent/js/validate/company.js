function validate(){
	var companyname=$("#companyname").val();
	var applytype=$("#applytype").val();
	var applyunit=$("#applyunit").val();
	var linkman=$("#linkman").val();
	var telephone=$("#telephone").val();
	var email=$("#email").val();
	var flag1=true;flag2=true;flag3=true;flag4=true;flag5=true;flag6=true;
	if($.trim(companyname).length==0){
		flag1=false;
		$("#spancompanyname").show();
	}else{
		$("#spancompanyname").hide();
	}
	
	if($.trim(applytype).length==0){
		flag2=false;
		$("#spanapplytype").show();
	}else{
		$("#spanapplytype").hide();
	}
	
	if($.trim(applyunit).length==0){
		flag3=false;
		$("#spanapplyunit").show();
	}else{
		$("#spanapplyunit").hide();
	}
	
	if($.trim(linkman).length==0){
		flag4=false;
		$("#spanlinkman").show();
	}else{
		$("#spanlinkman").hide();
	}
	
	if($.trim(telephone).length==0){
		flag5=false;
		$("#spantelephone").show();
	}else{
		$("#spantelephone").hide();
	}
	
	if($.trim(email).length==0){
		flag6=false;
		$("#spanemail").show();
		$("#spanemail1").hide();
	}else{
		$("#spanemail").hide();
		var reg=new RegExp(/^[a-zA-Z0-9_-]+@[a-zA-Z0-9_-]+(\.[a-zA-Z0-9_-]+)+$/);
		if(!reg.test(email)){
			$("#spanemail1").show();
			flag6=false;
		}else{
			$("#spanemail1").hide();
		}
	}
	if(flag1==false||flag2==false||flag3==false||flag4==false||flag5==false||flag6==false){
		return false;
	}
}