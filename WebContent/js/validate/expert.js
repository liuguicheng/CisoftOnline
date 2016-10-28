function validate(){
	var name=$("#name").val();
	var zw=$("#zw").val();
	var workunit=$("#workunit").val();
	var idcard=$("#idcard").val();
	var telephone=$("#telephone").val();
	
	var isjiliang=$("#isjiliang").attr("checked");
	var isjiliangrenzheng=$("#isjiliangrenzheng").attr("checked");
	var isshenchacenter=$("#isshenchacenter").attr("checked");
	var isjiandu=$("#isjiandu").attr("checked");
	
	var birthday=$("#birthday").datebox('getValue');
	var flag1=true,flag3=true,flag4=true,flag5=true,flag6=true,flag7=true,flag8=true;
	if($.trim(name).length==0){
		flag1=false;
		$("#spanname").show();
	}else{
		$("#spanname").hide();		
	}
	
	if($.trim(zw).length==0){
		flag3=false;
		$("#spanzw").show();
	}else{
		$("#spanzw").hide();		
	}
	
	if($.trim(workunit).length==0){
		flag4=false;
		$("#spanworkunit").show();
	}else{
		$("#spanworkunit").hide();		
	}
	
	if($.trim(idcard).length==0){
		flag5=false;
		$("#spanidcard").show();
		$("#spanidcard1").hide();
	}else{
		$("#spanidcard").hide();		
		var reg=new RegExp(/^[1-9]\d{5}[1-9]\d{3}((0\d)|(1[0-2]))(([0|1|2]\d)|3[0-1])\d{4}$/);
		if(!reg.test(idcard)){
			$("#spanidcard1").show();
			flag5=false;
		}else{
			$("#spanidcard1").hide();
		}
	}
	
	if($.trim(telephone).length==0){
		flag6=false;
		$("#spantelephone").show();
	}else{
		$("#spantelephone").hide();		
	}
	if(isjiliang!="checked"&&isjiliangrenzheng!="checked"&&isshenchacenter!="checked"&&isjiandu!="checked"){
		flag7=false;
		$("#spanchu").show();
	}else{
		$("#spanchu").hide();		
	}
	if($.trim(birthday).length==0){
		flag8=false;
		$("#spanbirthday").show();
	}else{
		$("#spanbirthday").hide();		
	}
	if(flag1==false||flag3==false||flag4==false||flag5==false||flag6==false||flag7==false||flag8==false){
		return false;
	}
}


