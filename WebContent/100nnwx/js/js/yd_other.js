//引导页
$(document).ready(function(){
	
	$.ajax({
		   type: "POST",
		   async:false,
		   url: "wxdevelop_yzsfgz",
		   success: function(msg){
			   alert(msg);
			    //0 未关注
			   if(msg==0){
				   $('.zz').fadeIn(200);
				   $('.zz_img').fadeIn(400);
				   $('.zz_tg').fadeIn(400);
			   }else{
				   //1 已关注
				   $('.zz_img').fadeOut(500);
					  $('.zz_tg').fadeOut(500);
					  $('.zz').fadeOut(600); 
			   }
		   }
	});

  var t=0;
  $('.zz').click(function(){
	  if(t==0){
		  t=1;
		  $('.zz_img').fadeOut(400);
		  $('.zz_tg').fadeOut(400);
		  $('.footer').fadeIn(600);
		  }else if(t==1){
		  t=2
		  $('.zz_img').fadeOut(500);
	      $('.zz_tg').fadeOut(500);
	      $('.zz').fadeOut(600);
		  $('.footer').fadeOut(500);
		  var s=$("#footer").find("div").eq(1);
		  
          var ss=s.find("a");
		  ss.bind("click",function(){
			window.location.href="http://mp.weixin.qq.com/s?__biz=MzA3NTM1MDMzMA==&mid=200727107&idx=1&sn=c8fad1b48c1e868bcfbbba50c0eb67c4#rd";
		  })
          ss.trigger("click");
			  }
		});
  var s=0;
  $('.zz_img').click(function(){
	  if(s==0){
		  s=1;
		  $('.zz_img').fadeOut(400);
		  $('.zz_tg').fadeOut(400);
		  $('.footer').fadeIn(600);
		  }else if(s==1){
		  s=2
		  $('.zz_img').fadeOut(500);
	      $('.zz_tg').fadeOut(500);
	      $('.zz').fadeOut(600);
		  $('.footer').fadeOut(500);
		  var s=$("#footer").find("div").eq(1);
		  
          var ss=s.find("a");
		  ss.bind("click",function(){
			window.location.href="http://mp.weixin.qq.com/s?__biz=MzA5NjY0ODcwOA==&mid=200215673&idx=1&sn=f97d1e93e3b7b29aed1f148e966dba2a#rd";
		  })
          ss.trigger("click");
			  }
		});
   $('#footer_t_font').click(function(){
	  $('.zz').fadeOut(600);
		  $('.footer').fadeOut(500);
		  var s=$("#footer").find("div").eq(1);
		  
          var ss=s.find("a");
		  ss.bind("click",function(){
			window.location.href="http://mp.weixin.qq.com/s?__biz=MzA5NjY0ODcwOA==&mid=200215673&idx=1&sn=f97d1e93e3b7b29aed1f148e966dba2a#rd";
		  })
          ss.trigger("click");
	  });
	  $('.footer_t_img').click(function(){
	  $('.zz').fadeOut(600);
		  $('.footer').fadeOut(500);
		  var s=$("#footer").find("div").eq(1);
		  
          var ss=s.find("a");
		  ss.bind("click",function(){
			window.location.href="http://mp.weixin.qq.com/s?__biz=MzA5NjY0ODcwOA==&mid=200215673&idx=1&sn=f97d1e93e3b7b29aed1f148e966dba2a#rd";
		  })
          ss.trigger("click");
	  });
  //跳过引导
  $('.zz_tg').click(function(){
	  $('.zz_img').fadeOut(500);
	  $('.zz_tg').fadeOut(500);
	  $('.zz').fadeOut(600);
	  });

	
	});