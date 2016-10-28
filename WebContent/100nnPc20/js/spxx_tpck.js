
$(document).ready(function(){


var browse = window.navigator.appName.toLowerCase();

var myObj;

var waitTime = 28500;//延长时间
//var spec = 1; //每次滚动的间距, 越大滚动越快
var minOpa = 30; //滤镜最小值
var maxOpa = 100; //滤镜最大值
var spa = 2; //缩略图区域补充数值
var w = 0;

//临时标示，图片数量
var flag = 0;
var flag2 = 0;

//spec = (browse.indexOf("microsoft") > -1) ? spec : ((browse.indexOf("opera") > -1) ? spec * 10 : spec * 20);
//function $(e) { return document.getElementById(e); }
//function goleft() { $('photos').scrollLeft -= spec; }
//function goright() { $('photos').scrollLeft += spec; }
function setOpacity(e, n) {

    if (e) {
        if (browse.indexOf("microsoft") > -1) {
            e.style.filter = 'alpha(opacity=' + n + ')';
        }
        else {
            e.style.opacity = n / 100;
        }
    }
}

document.getElementById("goleft").style.cursor = 'pointer';
document.getElementById("goright").style.cursor = 'pointer';
document.getElementById("mainphoto").style.cursor = 'pointer';

document.getElementById('goleft').onmouseout = function() {
myObj = setInterval(goright2, waitTime);
}
document.getElementById('goleft').onmouseover = function() {
clearInterval(myObj);
}



document.getElementById('goleft').onclick = function() {

clearInterval(myObj);

    if (flag > 0) {
        flag--;

    }
    if (flag < flag2) {
        flag--;
        flag2 = 0;
    }
    var divImg = document.getElementById("divImg").getElementsByTagName('img');

    //当是第三个图片的时候才开始滚动
    if (flag >= 3) {
    	document.getElementById('photos').scrollLeft -= 106;
    }


    if (flag < divImg.length) {

        var p = document.getElementById('showArea').getElementsByTagName('img');
        //设置前一个不透明
        setOpacity(divImg[flag + 1], minOpa);
        setOpacity(p[flag + 1], minOpa);

        SetShowImgAndText(divImg, p);

    } else {
        flag--;
    }

}
document.getElementById('goright').onmouseover = function() { clearInterval(myObj); }
document.getElementById('goright').onmouseout = function() { myObj = setInterval(goright2, waitTime); }
document.getElementById('goright').onclick = function() {

    var divImg = document.getElementById("divImg").getElementsByTagName('img');

    goright2();

    clearInterval(myObj);

    if (flag >= divImg.length) {

        myObj = setInterval(goright2, waitTime);
    }

}




window.onload = function() {
    var rHtml = '';
    var p = document.getElementById('showArea').getElementsByTagName('img');
    for (var i = 0; i < p.length; i++) {

        w += parseInt(p[i].getAttribute('width')) + spa;

        setOpacity(p[i], minOpa);

        p[i].onclick = function() { }
        p[i].style.cursor = 'pointer';
        p[i].onmouseover = function() {

            setOpacity(this, maxOpa);
            document.getElementById('mainphoto').src = this.getAttribute('rel');
            document.getElementById('mainphoto').setAttribute('name', this.getAttribute('name'));

            document.getElementById("newPage").href = this.getAttribute('name');

            clearInterval(myObj);
        }
        p[i].onmouseout = function() {
            setOpacity(this, minOpa);
            myObj = setInterval(goright2, waitTime);
        }
        rHtml += '<img src="' + p[i].getAttribute('rel') + '" name="' + p[i].getAttribute('name') + '" width="0" height="0" alt="" />';
        rHtml += '<span >' + p[i].getAttribute('alt') + '</span>';
    }

    document.getElementById('showArea').style.width = parseInt(w) + 'px';

    var rLoad = document.createElement("div");
    document.getElementById('photos').appendChild(rLoad);
    rLoad.id = "divImg";
    rLoad.style.width = "1px";
    rLoad.style.height = "1px";
    rLoad.style.overflow = "hidden";
    rLoad.innerHTML = rHtml;

}

//设置该显示的大图、小图和文字
function SetShowImgAndText(pDaTu, pXiaoTu) {
    //设置大图透明
    setOpacity(pDaTu[flag], maxOpa);
    //设置小图透明
    setOpacity(pXiaoTu[flag], maxOpa);

    //填充大图
    document.getElementById('mainphoto').src = pDaTu[flag].getAttribute('src');
    //大图链接
    document.getElementById("newPage").href = pDaTu[flag].getAttribute("name");

    //填充文字
    var spanText = document.getElementById("divImg").getElementsByTagName('span');
}

function goright2() {

    var divImg = document.getElementById("divImg");
    if (divImg) {
        clearInterval(myObj);

        divImg = divImg.getElementsByTagName('img');
        if (flag >= divImg.length) {
            flag = 0;
        }
        if (flag < 3) {
        	document.getElementById('photos').scrollLeft = 0;
        }

        //如果右边是最后一个图片，设置右边按钮不可用
        if (flag == divImg.length - 1)
        	document.getElementById('goright').disabled = "disabled";
        else
        	document.getElementById('goright').disabled = "";

        //当是第三个图片的时候才开始滚动
        if (flag > 3) {

            if (document.getElementById('photos').scrollLeft < (divImg.length - 3) * 62)
                document.getElementById('photos').scrollLeft += 62;
        }
        else {
        	document.getElementById('photos').scrollLeft = 0;
        }

        var p = document.getElementById('showArea').getElementsByTagName('img');


        if (flag < divImg.length) {
            if (flag > 0) {

                setOpacity(divImg[flag - 1], minOpa);
                setOpacity(p[flag - 1], minOpa);
            }
            SetShowImgAndText(divImg, p);

            flag++;
        }


        flag2 = flag;
        myObj = setInterval(goright2, 6000);
    }
}
myObj = setInterval(goright2, 10); //比如加在这个地方
//JavaScript Document


$(".content_top_con_gm1")
.click(
		function() {
			var c_id = $("#c_id").val();
			var num = $("#num").val();
			var type = "1";//1标示加入购物车
			if(num>0){
			$
					.ajax({
						type : "POST",
						url : "shoppingcar_save",
						data : "c_id=" + c_id
								+ "&num=" + num
								+ "&type="
								+ type,
						success : function(msgs) {
							if (msgs == "1") {
								$
								.ajax({
									type : "POST",
									url : "shoppingcar_querygwccount",
									success : function(msgs) {
										var hm="";
										if(msgs=="登录超时,请重新登录"){
											hm="我的快递超市购物车"+0+"件";
										}else{
											if(msgs==0){
												hm="我的快递超市购物车"+0+"件";
											}else{
											hm="<a href='shoppingcar_querygwclist' class='tcdiv'  style='color: #FFF;' target='_blank'>我的快递超市购物车"+msgs+"件</a>";
											}
											$(".cumu").html(msgs);
										}
										$(".MianRight_mianTitleRight").html(hm);
										
									}
								});
								
								 layer.msg('添加购物车成功',2,1,"100px");

							} else if (msgs == "2") {
								location.href = "${pageContext.request.contextPath}/shoppingcar_querygwclist";
							
							}else{
								//未登录
	   $("#emample9").attr("display","block");
	   $(".coreMian_jgk").css("display","none");
		$("#u_email").val("");
		$("#password").val("");
		$("#code").val("");
	   loginlayer=  $.layer({
			    type: 1,
			    title: "登录",
			    area: ['408px', '410px'],
			    shade: [0.5, '#000'],
			    shift: 'top', //从左动画弹出
			    page: {
			        dom: '#emample9'
			    },
			   
			});
	
							}
						}
					});
			}else{
				layer.msg("请输入购买数量");
				
			}
		});
		

$("#jsid")
.click(
		function() {
			var c_id = $("#c_id").val();
			var num = $("#num").val();
			var type = "2";//1标示结算
			if(num>0){
			$
					.ajax({
						type : "POST",
						url : "shoppingcar_save",
						data : "c_id=" + c_id
								+ "&num=" + num
								+ "&type="
								+ type,
						 success : function(msgs) {
							if (msgs == "1") {
							} else if (msgs == "2") {
								$(".cumu").html(msgs);
								location.href = "../shoppingcar_querygwclist";
							}else{
								//未登录
								   $("#emample9").attr("display","block");
								   $(".coreMian_jgk").css("display","none");
									$("#u_email").val("");
									$("#password").val("");
									$("#code").val("");
								   loginlayer=  $.layer({
										    type: 1,
										    title: "登录",
										    area: ['408px', '410px'],
										    shade: [0.5, '#000'],
										    shift: 'top', //从左动画弹出
										    page: {
										        dom: '#emample9'
										    },
										   
										});
							}
						}
					});
					
					
					
		}else{
			layer.msg("请输入购买数量");
			
		}
		});


});

