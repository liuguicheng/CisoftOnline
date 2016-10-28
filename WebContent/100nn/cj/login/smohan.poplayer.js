/*
 @ Smohan's PopLayer
 @ Author: Smohan,水墨寒
 @ http://www.smohan.net
 @ 2013-05-30
*/
;(function($){
  $.fn.smohanpoplayer = function(options){
    var items = {
        events: "click", //绑定事件
        shadow: true,  //开启遮罩层
		drag: true,  //开启拖动功能 true|false
        content: "#smohan-div", //弹出层内容
        title: "www.smohan.net", //显示标题
    };
    var config = $.extend(items,options);
	var $btn = $(this);
    //获取内容层相关
    var content = $(config.content);
    var layer_width = content.width();
    var layer_height = content.height();
    var layer_top = (layer_height+12)/2;
    var layer_left = (layer_width+12)/2;
	var cW = layer_width-20;
	var cH = layer_height-56;
    //判断content是以id形式还是class形式出现
    var colsplit = (config.content).substr(0,1);  // # 或者 .
	var colname = (config.content).split(''+colsplit+'');
    var col = (colsplit=='#') ? "id="+colname[1] : "class="+colname[1];     
	var _html = content.html();
	var _move = false;
	var _x,_y;  
   //创建layer
    var shadow_show = (config.shadow == true) ? "block" : "none";
    var layer = '';
        layer += '<div id="smohan-poplayer-shadow" style="display:'+ shadow_show +'"></div>';
        layer += '<div id="smohan-poplayer" style="width:'+layer_width+'px;height:'+layer_height+'px; margin-top:-'+layer_top+'px;margin-left:-'+layer_left+'px">';
        layer += '<div class="title">'+config.title+'<a href="javascript:void(0);" title="关闭" class="close">X</a></div>';
        layer += '<div class="content" style="width:'+cW+'px;height:'+cH+'px"><div '+ col +'>'+_html+'</div></div>';
        layer += '</div>';
		$('body').prepend(layer);
		$('#smohan-poplayer-shadow,#smohan-poplayer').css("display",'none');
   //通过绑定的事件弹出layer层
   $btn.on(config.events,function(e){
	  $('#smohan-poplayer-shadow').fadeIn("fast");
	  $('#smohan-poplayer').slideDown("slow");
   });
   //关闭layer
    $('#smohan-poplayer .title a.close').click(function(e) {
      $('#smohan-poplayer-shadow').fadeOut("slow");
	  $('#smohan-poplayer').slideUp("slow");
   });
    //拖动layer
   if(config.drag == true) {
     var titbar = $('#smohan-poplayer .title');
         titbar.css({"cursor":"move"}); 
	    titbar.mousedown(function(e) {
          _move = true;
	      _x = e.pageX-parseInt($("#smohan-poplayer").css("left"));
	      _y = e.pageY-parseInt($("#smohan-poplayer").css("top"));     
          $("#smohan-poplayer").fadeTo(36,0.36); 
	    });
        titbar.mousemove(function(e){
         if(_move){
            var x = e.pageX - _x;
            var y = e.pageY - _y;
            $("#smohan-poplayer").css({top:y,left:x});
          }
       }).mouseup(function(){
      _move = false;
      $("#smohan-poplayer").fadeTo("fast", 1);
  });
  } 
 };   	
})(jQuery);