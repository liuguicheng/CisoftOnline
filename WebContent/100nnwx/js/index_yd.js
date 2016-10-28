// JavaScript Document
$(document).ready(function(){
  var wh=$(window).height();
  $("#MianNav").css("height",wh);
  $("#Mian").css("height",wh);
  
  var ww=$("#MianTop").width();
  ww=ww-90;
  $("#MianTop_search").css("width",ww)
  $(".zz_search").css("width",ww)
  
  var wr=$("#MianTop_search").width();
  wr=wr-20;
  $(".MianTop_search_k").css("width",wr)
  
  var wt=$("#Mian").width();
  wt=wt-12;
  $(".MianContent").css("width",wt)
  
  var wy=$(".MianContent_td").width();
  wy=wy-8;
  $(".MianContent_table_font").css("width",wy)
  
  var wu=$(".MianContent_td1").width();
  wu=wu-8;
  $(".MianContent_table_font").css("width",wu)
  //引导页
  $('.zz').fadeIn(200);
  $('.zz_img').fadeIn(400);
  var t=0;
  $('.zz').click(function(){
	  if(t==0){
		  t=1;
		  $('.zz_img').fadeOut(400);
		  $('.zz_tg').fadeOut(400);
		  $('.zz_font1').fadeIn(600);
		  $('.zz_top').fadeIn(600);
		  $('.zz_search').fadeIn(600);
		  }else if(t==1){
	  t=2;
	  //$("#Mian").animate({left:"230px"},250);
      //$('.zz').fadeOut(400);
	  $('.zz_font1').fadeOut(400);
	  $('.zz_search').fadeOut(400);
	  $('.zz_font2').fadeIn(600);
	  $('.cid').fadeIn(600);
    }else if(t==2){
	  t=3;
	  $('.zz_font2').fadeOut(200);
	  $('.cid').fadeOut(200);
	  $("#Mian").animate({left:"230"},250);
	  $('.zz_font3').fadeIn(600);
	  $('.cip').fadeIn(600);
    }else if(t==3){
	  t=4;
	  $('.zz_font3').fadeOut(200);
	  $('.cip').fadeOut(200);
	  $("#Mian").animate({left:""},250);
	  $('.zz_font4').fadeIn(600);
	  $('.foot_tindex_t').fadeIn(600);
    }else if(t==4){
	  t=5;
	  $('.zz_font4').fadeOut(600);
	  $('.foot_tindex_t').fadeOut(600);
	  $('.foot_tgz_t').fadeIn(600);
	  $('.zz_font5').fadeIn(600);
    }else if(t==5){
	  t=6;
	  $('.zz_font5').fadeOut(600);
	  $('.foot_tgz_t').fadeOut(600);
	  $('.foot_tgwc_t').fadeIn(600);
	  $('.zz_font6').fadeIn(600);
    }else if(t==6){
	  t=7;
	  $('.zz_font6').fadeOut(600);
	  $('.foot_tgwc_t').fadeOut(600);
	  $('.foot_tmy_t').fadeIn(600);
	  $('.zz_font7').fadeIn(600);
    }
	else if(t==7){
	  t=8;
	  $('.foot_tmy_t').fadeOut(600);
	  $('.zz_font7').fadeOut(600);
	  $('.zz').fadeOut(600);
    }
	  }); 
  //引导页标题文字
  var k=0;
  $('.zz_img').click(function(){
	  if(k==0){
	  k=1;
	  //$("#Mian").animate({left:"230px"},250);
      //$('.zz').fadeOut(400);
	  $('.zz_img').fadeOut(400);
		  $('.zz_tg').fadeOut(400);
		  $('.zz_font1').fadeIn(600);
		  $('.zz_top').fadeIn(600);
		  $('.zz_search').fadeIn(600);
    }else{
		$(".zz").fadeOut(200);}
	  });  
  //引导页搜索框
  var y=0;
  $('.zz_search').click(function(){
	  if(y==0){
	  y=1;
	  //$("#Mian").animate({left:"230px"},250);
      //$('.zz').fadeOut(400);
	  $('.zz_font1').fadeOut(400);
	  $('.zz_search').fadeOut(400);
	  $('.zz_font2').fadeIn(600);
	  $('.cid').fadeIn(600);
    }else{
		$(".zz").fadeOut(200);}
	  });  
  //引导页搜索注解文字
  var u=0;
  $('.zz_font1').click(function(){
	  if(u==0){
	  u=1;
	  //$("#Mian").animate({left:"230px"},250);
      //$('.zz').fadeOut(400);
	  $('.zz_font1').fadeOut(400);
	  $('.zz_search').fadeOut(400);
	  $('.zz_font2').fadeIn(600);
	  $('.cid').fadeIn(600);
    }else{
		$(".zz").fadeOut(200);}
	  });  
  //引导页导航图标
  var q=0;
  $('.zz_button').click(function(){
	  if(q==0){
	  q=1;
	  $('.zz_font2').fadeOut(200);
	  $('.cid').fadeOut(200);
	  $("#Mian").animate({left:"230"},250);
	  $('.zz_font3').fadeIn(600);
	  $('.cip').fadeIn(600);
    }else{
		$(".zz").fadeOut(200);}
	  }); 
  //引导页导航文字
  var w=0;
  $('.zz_font2').click(function(){
	  if(w==0){
	  w=1;
	  $('.zz_font2').fadeOut(200);
	  $('.cid').fadeOut(200);
	  $("#Mian").animate({left:"230"},250);
	  $('.zz_font3').fadeIn(600);
	  $('.cip').fadeIn(600);
    }else{
		$(".zz").fadeOut(200);}
	  }); 
  //引导页导航图标
  var e=0;
  $('.cip').click(function(){
	  if(e==0){
	  e=1;
	 $('.zz_font3').fadeOut(200);
	  $('.cip').fadeOut(200);
	  $("#Mian").animate({left:""},250);
	  $('.zz_font4').fadeIn(600);
	  $('.foot_tindex_t').fadeIn(600);
    }else{
		$(".zz").fadeOut(200);}
	  }); 
  //引导页导航提示文字
  var r=0;
  $('.zz_font3').click(function(){
	  if(r==0){
	  r=1;
	 $('.zz_font3').fadeOut(200);
	  $('.cip').fadeOut(200);
	  $("#Mian").animate({left:""},250);
	  $('.zz_font4').fadeIn(600);
	  $('.foot_tindex_t').fadeIn(600);
    }else{
		$(".zz").fadeOut(200);}
	  }); 
  //引导页首页提示图片
  var a=0;
  $('.foot_tindex_t').click(function(){
	  if(a==0){
	  a=1;
	 $('.zz_font4').fadeOut(600);
	  $('.foot_tindex_t').fadeOut(600);
	  $('.foot_tgz_t').fadeIn(600);
	  $('.zz_font5').fadeIn(600);
    }else{
		$(".zz").fadeOut(200);}
	  }); 
  //引导页首页提示文字
  var d=0;
  $('.zz_font4').click(function(){
	  if(d==0){
	  d=1;
	 $('.zz_font4').fadeOut(600);
	  $('.foot_tindex_t').fadeOut(600);
	  $('.foot_tgz_t').fadeIn(600);
	  $('.zz_font5').fadeIn(600);
    }else{
		$(".zz").fadeOut(200);}
	  }); 
  //引导页关注页面提示图片
  var s=0;
  $('.foot_tgz_t').click(function(){
	  if(s==0){
	  s=1;
	 $('.zz_font5').fadeOut(600);
	  $('.foot_tgz_t').fadeOut(600);
	  $('.foot_tgwc_t').fadeIn(600);
	  $('.zz_font6').fadeIn(600);
    }else{
		$(".zz").fadeOut(200);}
	  }); 
  //引导页关注页面提示文字
  var s=0;
  $('.zz_font5').click(function(){
	  if(s==0){
	  s=1;
	 $('.zz_font5').fadeOut(600);
	  $('.foot_tgz_t').fadeOut(600);
	  $('.foot_tgwc_t').fadeIn(600);
	  $('.zz_font6').fadeIn(600);
    }else{
		$(".zz").fadeOut(200);}
	  }); 
  //引导页购物车提示图片
  var f=0;
  $('.foot_tgwc_t').click(function(){
	  if(f==0){
	  f=1;
	 $('.zz_font6').fadeOut(600);
	  $('.foot_tgwc_t').fadeOut(600);
	  $('.foot_tmy_t').fadeIn(600);
	  $('.zz_font7').fadeIn(600);
    }else{
		$(".zz").fadeOut(200);}
	  });
  //引导页购物车提示文字
   var g=0;
  $('.zz_font6').click(function(){
	  if(g==0){
	  g=1;
	 $('.zz_font6').fadeOut(600);
	  $('.foot_tgwc_t').fadeOut(600);
	  $('.foot_tmy_t').fadeIn(600);
	  $('.zz_font7').fadeIn(600);
    }else{
		$(".zz").fadeOut(200);}
	  });
  //引导页我的100提示图片
   var h=0;
  $('.foot_tmy_t').click(function(){
	  if(h==0){
	  h=1;
	 $('.foot_tmy_t').fadeOut(600);
	  $('.zz_font7').fadeOut(600);
	  $('.zz').fadeOut(600);
    }else{
		$(".zz").fadeOut(200);}
	  });
  //引导页我的100提示文字
   var j=0;
  $('.zz_font7').click(function(){
	  if(j==0){
	  j=1;
	 $('.foot_tmy_t').fadeOut(600);
	  $('.zz_font7').fadeOut(600);
	  $('.zz').fadeOut(600);
    }else{
		$(".zz").fadeOut(200);}
	  });
  //跳过引导
  $('.zz_tg').click(function(){
	  $('.zz_img').fadeOut(600);
	  $('.zz').fadeOut(600);
	  });
  //导航
  var i=0;
  $(".s1").click(function(){
	if(i==0){
	  i=1;
      $("#Mian").animate({left:"230px"},250);
	}else{
	  i=0;
      $("#Mian").animate({left:""},250);
    }
	$("#MianNav").click(function(){
		$("#Mian").animate({left:""},250);
		});
  });
});