//引导页
$(document).ready(function(){
  var msg=$("#bsidsss").val();
			    //0 未关注
			   if(msg==0){
				   $('.zz').css("display","block");
//				   $('.zz_img').css("display","block");
				   $('#wk').css("display","block");
				   $('.zz').fadeIn(200);
				   $('.wk_1').click(function(){
					   $(".wk_1").animate({left:'100%'});
				   });
				   $('.wk_2').click(function(){
					   $(".wk_2").animate({right:'100%'});
				   });
				   $('.wk_3').click(function(){
					   $("#wk").fadeOut(400);
					   $('.footer').fadeIn(600);
				   });
			   }else{
				   $('.zz').css("display","none");
//				   $('.zz_img').css("display","none");
				   $('#wk').css("display","none");
			   }
	$('.zz').click(function(){
		$('.zz').fadeOut(600);
		  $('.footer').fadeOut(500);
		  var s=$("#footer").find("div").eq(1);
		  
          var ss=s.find("a");
		  ss.bind("click",function(){
			window.location.href="http://mp.weixin.qq.com/s?__biz=MzA3NTM1MDMzMA==&mid=200727107&idx=1&sn=c8fad1b48c1e868bcfbbba50c0eb67c4#rd";
		  })
          ss.trigger("click");
		});
	$('#footer_t_font').click(function(){
	  $('.zz').fadeOut(600);
		  $('.footer').fadeOut(500);
		  var s=$("#footer").find("div").eq(1);
		  
          var ss=s.find("a");
		  ss.bind("click",function(){
			window.location.href="http://mp.weixin.qq.com/s?__biz=MzA3NTM1MDMzMA==&mid=200727107&idx=1&sn=c8fad1b48c1e868bcfbbba50c0eb67c4#rd";
		  })
          ss.trigger("click");
	  });
	  $('.footer_t_img').click(function(){
	  $('.zz').fadeOut(600);
		  $('.footer').fadeOut(500);
		  var s=$("#footer").find("div").eq(1);
		  
          var ss=s.find("a");
		  ss.bind("click",function(){
			window.location.href="http://mp.weixin.qq.com/s?__biz=MzA3NTM1MDMzMA==&mid=200727107&idx=1&sn=c8fad1b48c1e868bcfbbba50c0eb67c4#rd";
		  })
          ss.trigger("click");
	  });
		
});