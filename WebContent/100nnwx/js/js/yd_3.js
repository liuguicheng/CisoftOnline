//引导页
$(document).ready(function(){
  var msg=$("#bsidsss").val();
			    //0 未关注
			   if(msg==0){
				   $("#wrapper").css("display","black");
				   onewh("wrapper",function(){
						/*滑到头了*/
						window.location.href="http://mp.weixin.qq.com/s?__biz=MzA3NTM1MDMzMA==&mid=200727107&idx=1&sn=c8fad1b48c1e868bcfbbba50c0eb67c4#rd";
					}); 
			   }else{
				   $("#wrapper").css("display","none");
			   }
	
});
