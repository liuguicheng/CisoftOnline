/***************************************
--------------- 商品相册 ---------------
------------ Write by Gibil ------------
----------- Time:2012-04-18 ------------
***************************************/
var ProductImage = {
    ContainerID: 'photoAlbum',
    ProductID: '',
    OptNum: 0, //操作统计
    //显示初始化
    Init: function () {
       //获取已上传的图片
        var c=$("#c_id").val();
        if(c!=0){
        $.ajax({
            type: "POST",
            url: "commodity_queryimglist",
            data: "c_id="+$("#c_id").val(),
            cache: false,
            async: false,
            dataType: "json",
            success: function (jsons) {
                if (jsons != null && jsons.length > 0) {
                    for (var i = 0; i < jsons.length; i++) {
                        ProductImage.AddImage(jsons[i], jsons[i], jsons[i], jsons[i], 1, "");
                    }
                }

                $("#" + ProductImage.ContainerID).attr("hasContent", 1);
            }
        });
        }
    },
    //添加图片
    AddImage: function (fullurl, picurl, thumburl, remark, sys, itemid) {
        var itemHTML = '<li sys="' + sys + '" itemid="' + itemid + '" picurl="' + picurl + '">';
        itemHTML += '<div><a target="_blank" href="imgss.jsp?file=' + fullurl + '"><img height="100" border="0" src="imgss.jsp?file=' + thumburl + '"></a></div>';
        itemHTML += '<div class="del"><a class="delphoto" onclick="ProductImage.Delete(this);" href="javascript:void(0);">删除</a></div>';
        itemHTML += '</li>';
        $("#" + ProductImage.ContainerID + " ul.imagelist").append(itemHTML);
        ProductImage.OptNum += 1;
        $('#AlbumClickNum').val(ProductImage.OptNum);
    },
    //上传文件
    UploadFile: function () {
        if ($("#AjaxProductPic").val().length == 0) {
            asyncbox.tips("请选择图片", 'error'); return;
        }
        $.ajaxFileUpload({
            url: 'commodity_douplodimg',
            secureuri: false,
            fileElementId: 'AjaxProductPic',
            dataType: 'json',
            success: function (data, status) {
                if (data!=null) {
                    ProductImage.AddImage(data, data, data, $("#txtImageDesc").val(), 0, '');
                    $("#AjaxProductPic,#txtImageDesc").val('');
                	alert("上传成功");
                }
                else {
                    asyncbox.error(data.error, '上传失败');
                }
            },
            error: function (data, status, e) {
                asyncbox.error(e, '上传失败');
            }
        });
    },
    //删除图片
    Delete: function (obj) {
        asyncbox.confirm("确定删除图片吗 ?", "温馨提示", function (action) {
            if (action == "ok") {
                var $li = $(obj).parent().parent();
                if ($li.attr('sys') == '1') {//已存在的图片需要加入删除集合
                    var delItems = $("#ProductImageDelItems").val();
                    delItems += '(<id:' + $li.attr('itemid') + '><picurl:' + $li.attr('picurl') + '>)';
                    $("#ProductImageDelItems").val(delItems);
                }
                $li.remove();
                ProductImage.OptNum += 1;
                $('#AlbumClickNum').val(ProductImage.OptNum);
            }
        });
    },
    //保存规则文本
    Save: function () {
        var result = '';
        $("#" + ProductImage.ContainerID + " ul.imagelist li").each(function (i, n) {
            var $li = $(n);
//           result += '(';
//         result += '<id:' + $li.attr('itemid') + '>';
//           result += '<picurl:' + $li.attr('picurl') + '>';
//         result += ')';
            result+=$li.attr('picurl')+",";
        });
        $("#ProductImageRuleTxt").val(result);
    }
}