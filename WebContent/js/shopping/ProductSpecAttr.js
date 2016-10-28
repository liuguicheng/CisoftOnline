/***************************************
--------------- 商品属性 ---------------
------------ Write by Gibil ------------
------------ Time:2011-11-25 -----------
***************************************/
var ProductAttr = {
    //商品ID,不为空时表示商品编辑操作
    ProductID: '',
    //已绑定的属性Json
    BindInfo: [],
    //商品分类绑定的属性Json
    ClassBindInfo: [],
    //检验是否存在于数组中
    IsExistInArray: function(myArray, item) {
        for (var i = 0; i < myArray.length; i++) {
            if (item == myArray[i])
                return true;
        }
        return false;
    },
    //获取商品绑定的属性Json
    GetBindInfo: function() {
        if ($("#tbinfo_4").attr("hasContent") == 1 || ProductAttr.ProductID.length == 0)//防止重复获取数据
            return;

        $.ajax({
            type: "Get",
            url: "/Ajax/Ajax_ProductAttr.aspx",
            data: { "act": "GetProductAttrs", "id": ProductAttr.ProductID },
            cache: false,
            async: false,
            dataType: "json",
            success: function(msg) {
                ProductAttr.BindInfo = msg;
            }
        });
    },
    //获取商品分类绑定的属性Json
    GetClassBindInfo: function() {
        var classid = $("#selectproclass").val();
        if (classid == null || classid == 'undefined' || classid.length == 0 || classid == "0") {
            ProductAttr.ClassBindInfo = [];
            return;
        }

        $.ajax({
            type: "Get",
            url: "/Ajax/Ajax_ProductAttr.aspx",
            data: { "act": "GetClassAttrs", "classid": classid },
            cache: false,
            async: false,
            dataType: "json",
            success: function(msg) {
                ProductAttr.ClassBindInfo = msg;
            }
        });
    },
    //获取商品分类绑定的属性
    GetClassAttr: function() {
        var classid = $("#selectproclass").val();
        if (classid == null || classid == 'undefined' || classid.length == 0 || classid == "0") {
            $("#tbinfo_4").empty();
            return;
        }

        ProductAttr.GetBindInfo();
        ProductAttr.GetClassBindInfo();
        ProductAttr.ShowAttr();
        ProductAttr.ShowBind();
        $("#tbinfo_4").attr("hasContent", 1);
        $("#AttrTabClick").val(parseInt($("#AttrTabClick").val()) + 1); //选项卡点击统计
    },
    //获取商品绑定属性
    GetAttr: function() {
        if ($("#tbinfo_4").attr("hasContent") == 1)//防止重复获取数据
            return;
        if (ProductAttr.ProductID.length == 0) {//添加而且分类没有改变时,点击属性选项卡需要获取当前选择分类的属性
            ProductAttr.GetClassAttr();
            return;
        }

        ProductAttr.GetBindInfo();
        ProductAttr.ClassBindInfo = ProductAttr.BindInfo;
        ProductAttr.ShowAttr();
        ProductAttr.ShowBind();
        $("#tbinfo_4").attr("hasContent", 1);
        $("#AttrTabClick").val(parseInt($("#AttrTabClick").val()) + 1); //选项卡点击统计
    },
    //显示属性
    ShowAttr: function() {
        $("#tbinfo_4").empty();
        if (ProductAttr.ClassBindInfo != null && ProductAttr.ClassBindInfo.length > 0) {
            for (var i = 0; i < ProductAttr.ClassBindInfo.length; i++) {
                var tempTr = "";
                switch (ProductAttr.ClassBindInfo[i].inputtype) {
                    case 1: //下拉框
                        tempTr += "<tr inputtype=\"1\" attrid=\"" + ProductAttr.ClassBindInfo[i].attrid + "\" isshow=\"" + ProductAttr.ClassBindInfo[i].isshow + "\" hasval=\"" + (ProductAttr.ClassBindInfo[i].valueid.length > 0 ? "1" : "0") + "\">"
                            + "<td class=\"tid\" width=\"20%\">" + ProductAttr.ClassBindInfo[i].attrname + "： </td><td class=\"tid2\">";
                        tempTr += "<select id=\"sel" + ProductAttr.ClassBindInfo[i].attrid + "\" tag=\"productattr\">";
                        tempTr += "<option value=\"\"> -- 请选择 -- </option>";
                        var valList = ProductAttr.ClassBindInfo[i].valuelist;
                        for (var j = 0; j < valList.length; j++) {
                            tempTr += "<option value=\"" + valList[j].id + "\"> " + valList[j].value + " </option>";
                        }
                        tempTr += "</select>";
                        if (ProductAttr.ClassBindInfo[i].isshow == 1) {//前台显示提示
                            tempTr += "<span class=\"txtTip\"> 该属性在前台显示，请选择。</span>";
                        }
                        tempTr += "</td></tr>";
                        break;
                    case 2: //复选框
                        tempTr += "<tr inputtype=\"2\" attrid=\"" + ProductAttr.ClassBindInfo[i].attrid + "\" isshow=\"" + ProductAttr.ClassBindInfo[i].isshow + "\" hasval=\"" + (ProductAttr.ClassBindInfo[i].valueid.length > 0 ? "1" : "0") + "\">"
                            + "<td class=\"tid\" width=\"20%\">" + ProductAttr.ClassBindInfo[i].attrname + "： </td><td class=\"tid2\">";
                        tempTr += "<ul>";
                        var valList = ProductAttr.ClassBindInfo[i].valuelist;
                        for (var j = 0; j < valList.length; j++) {
                            tempTr += "<li><input type=\"checkbox\" name=\"cb" + ProductAttr.ClassBindInfo[i].attrid + "\" value=\"" + valList[j].id + "\" /> " + valList[j].value + "</li>";
                        }
                        tempTr += "</ul>";
                        if (ProductAttr.ClassBindInfo[i].isshow == 1) {//前台显示提示
                            tempTr += "<div class=\"txtTip\" style=\"clear:both;\"> 该属性在前台显示，请选择。</div>";
                        }
                        tempTr += "</td></tr>";
                        break;
                    case 3: //手工录入
                        tempTr += "<tr inputtype=\"3\" attrid=\"" + ProductAttr.ClassBindInfo[i].attrid + "\" isshow=\"" + ProductAttr.ClassBindInfo[i].isshow + "\" hasval=\"" + (ProductAttr.ClassBindInfo[i].txtvalue.length > 0 ? "1" : "0") + "\">"
                            + "<td class=\"tid\" width=\"20%\">" + ProductAttr.ClassBindInfo[i].attrname + "： </td><td class=\"tid2\">";
                        if (ProductAttr.ClassBindInfo[i].attrcode.toLowerCase() == 'diamondcarat') {//钻石重量
                            tempTr += "<input type=\"text\" id=\"txt" + ProductAttr.ClassBindInfo[i].attrid + "\" class=\"txt100\" tag=\"productattr\" value=\"\" "
                                + "onkeyup=\"this.value=this.value.replace(/[^\\d\\.]/g,'');if($.trim(this.value).length==0){this.value=0;}\" />";
                            tempTr += "<span class=\"txtTip\"> 单位为克拉。</span>";
                        }
                        else if (ProductAttr.ClassBindInfo[i].attrcode.toLowerCase() == 'diamondcertno') {//钻石证书编号
                            tempTr += "<input type=\"text\" id=\"txt" + ProductAttr.ClassBindInfo[i].attrid + "\" class=\"txt150\" tag=\"productattr\" value=\"\" />";
                        }
                        else {
                            tempTr += "<textarea id=\"txta" + ProductAttr.ClassBindInfo[i].attrid + "\" rows=\"3\" class=\"txt\" style=\"height:50px; width:400px; margin:2px 0 0 0;\" tag=\"productattr\" "
                                + "onkeyup=\"if(this.value.length > 500){this.value = this.value.substr(0,500);}\"></textarea>";
                            if (ProductAttr.ClassBindInfo[i].isshow == 1) {//前台显示提示
                                tempTr += "<div class=\"txtTip\"> 该属性在前台显示，请填写(最多能输入500字)。</div>";
                            } else {
                                tempTr += "<div class=\"txtTip\"> 最多能输入500字。</div>";
                            }
                        }
                        tempTr += "</td></tr>";
                        break;
                    default:
                        break;
                }
                $("#tbinfo_4").append(tempTr);
            }
        }
    },
    //显示绑定值
    ShowBind: function() {
        $("#tbinfo_4 tr").each(function(i, n) {
            var attrID = $(n).attr("attrid"); //ID
            var attrJson = null;
            for (var i = 0; i < ProductAttr.BindInfo.length; i++) {
                if (attrID == ProductAttr.BindInfo[i].attrid) {
                    attrJson = ProductAttr.BindInfo[i];
                    break;
                }
            }
            if (attrJson != null) {
                switch (attrJson.inputtype) {
                    case 1: //下拉框
                        if (attrJson.valueid.length > 0)
                            $(n).find("[tag='productattr'] option[value='" + attrJson.valueid[0] + "']").attr("selected", "selected");
                        break;
                    case 2: //复选框
                        for (var i = 0; i < attrJson.valueid.length; i++) {
                            $(n).find("input[type='checkbox'][value='" + attrJson.valueid[i] + "']").attr("checked", "checked");
                        }
                        break;
                    case 3: //手工录入
                        $(n).find("[tag='productattr']").val(attrJson.txtvalue);
                        break;
                    default: break;
                }
            }
        });
    },
    //保存属性
    SaveAttr: function() {
        var vals = '';
        $("#tbinfo_4 tr").each(function(i, n) {
            var inputType = $(n).attr("inputtype"); //属性输入类型
            var attrID = $(n).attr("attrid"); //ID
            var isShow = $(n).attr("isshow"); //是否前台显示
            var hasVal = $(n).attr("hasval"); //是否已经绑定过值
            if (inputType == 1) {//下拉框
                if ($(n).find("[tag='productattr']").val().length > 0 || isShow == 1 || hasVal == 1)
                    vals += "{[AttrID:" + attrID + "][AttrInputType:" + inputType + "][IsShow:" + isShow + "][ValueIDs:" + "<" + $(n).find("[tag='productattr']").val() + ">" + "][TxtValue:]}";
            } else if (inputType == 2) {//复选框
                if ($(n).find("input:checked").length > 0 || isShow == 1 || hasVal == 1) {
                    vals += "{[AttrID:" + attrID + "][AttrInputType:" + inputType + "][IsShow:" + isShow + "][ValueIDs:";
                    $(n).find("input:checked").each(function(j, m) {//遍历选中框
                        vals += "<" + $(m).val() + ">";
                    });
                    if ($(n).find("input:checked").length == 0 && (isShow == 1 || hasVal == 1))//没选中记录并且要在前台显示
                        vals += "<>";
                    vals += "][TxtValue:]}";
                }
            } else if (inputType == 3) {//文本框
                if ($.trim($(n).find("[tag='productattr']").val()).length > 0 || isShow == 1 || hasVal == 1)
                    vals += "{[AttrID:" + attrID + "][AttrInputType:" + inputType + "][IsShow:" + isShow + "][ValueIDs:][TxtValue:" + $.trim($(n).find("[tag='productattr']").val()) + "]}";
            }
        });
        $("#txtattrvalue").val(vals);
    }
}
/***************************************
--------------- 商品规格 ---------------
------------ Write by Gibil ------------
------------ Time:2011-12-5 ------------
***************************************/
var ProductSpec = {
    ProductID: '', //商品ID
    Domain: '', //域名
    SpecContainerID: "skuContainer", //规格容器ID
    TempContainerID: "SpecTempContainer", //临时容器的ID
    SpecSelItemJson: [], //选择的规格JSON
    //获取元素的全部HTML
    OuterHtml: function (obj) {
        return $("<div></div>").append(obj.clone()).html();
    },
    //获取完整路径
    GetFullUrl: function (url) {
        return "http://image." + ProductSpec.Domain + url.replace("{0}", "");
    },
    //显示选择规格容器
    ShowSelectContainer: function () {
        var tempLength = $("#" + ProductSpec.TempContainerID).val().length;
        var container;
        if (tempLength < 1) {//临时规格选择容器没有内容
            container = "<div id=\"divSpecSelContainer\">"
                + "<div class=\"containerTop\">"
                    + "<span>增加规格项或选择规格标签 » 添加需要的规格值 » 自定义规格值或关联相册 » 确定保存</span>"
                    + "<input type=\"button\" onclick=\"ProductSpec.SelectSpec.ShowSpec();\" value=\"增加规格项\" class=\"BtnAdd\" />"
                    + "<div class=\"clear\"></div>"
                + "</div>"
                + "<div class=\"clear blank\"></div>"
                + "<div id=\"divSpecSelTab\" class=\"SpecSelTab\"></div>"
                + "<div id=\"divSpecSelValue\" class=\"SpecSelVal\"><div class=\"clear\"></div></div>"
                + "<div class=\"selItemBottom\">"
                    + "<input id=\"GenSpecPdt\" type=\"button\" class=\"opbutton\" onclick=\"ProductSpec.SelectItem.GenerateSpecProduct();\" value=\"生成货品\" />"
                    + "<input type=\"button\" class=\"opbutton\" onclick=\"if(ProductSpec.SelectItem.SaveItem()){$.close('selectSpecItem');}\" value=\"确定\" />"
                    + "<input type=\"button\" class=\"opcancel\" onclick=\"$.close('selectSpecItem');\" value=\"取消\" />"
                + "</div>"
                + "</div>";
        } else {
            container = $("#" + ProductSpec.TempContainerID).val();
        }

        asyncbox.open({
            id: "selectSpecItem",
            title: "选择规格项",
            html: container,
            width: 750,
            height: 450,
            scrolling: 'auto'
        });

        //需要重新绑定点击事件
        if (tempLength > 0) {
            $("#divSpecSelTab span[tag='seltab']").each(function (i, n) {
                $this = $(n);
                $this.click(function () {
                    ProductSpec.SelectItem.TabChange($(n).attr("specid"));
                });
            });
        } else {
            //存在选择规格项的JSON则加载数据,编辑时会出现此情况
            if (ProductSpec.SpecSelItemJson != null && ProductSpec.SpecSelItemJson.length > 0) {
                if ($("#divSpecSelTab span[tag='seltab']").length == 0) {//不存在选项卡即没执行任何绑定操作
                    for (var i = 0; i < ProductSpec.SpecSelItemJson.length; i++) {
                        $("#divSpecSelTab").append("<span id=\"specTabsub_" + ProductSpec.SpecSelItemJson[i].specid + "\" tag=\"seltab\" specname=\"" + ProductSpec.SpecSelItemJson[i].specname
                            + "\" showtype=\"" + ProductSpec.SpecSelItemJson[i].showtype + "\" specid=\"" + ProductSpec.SpecSelItemJson[i].specid
                            + "\" showway=\"" + ProductSpec.SpecSelItemJson[i].showway + "\" class=\"speTab\" onclick=\"ProductSpec.SelectItem.TabChange('"
                            + ProductSpec.SpecSelItemJson[i].specid + "');\">" + ProductSpec.SpecSelItemJson[i].specname
                            + "<label onclick=\"ProductSpec.SelectItem.DeleteItem('" + ProductSpec.SpecSelItemJson[i].specid + "');\" class=\"tabdel\" title=\"删除\">X</label>" + "</span>");
                    }
                    //触发选项卡获取已绑定的规格值
                    $("#divSpecSelTab span[tag='seltab']").each(function (i, n) {
                        $(n).trigger("click");
                    });
                    $("#divSpecSelTab span[tag='seltab']:first").trigger("click"); //再次触发第一个令其显示
                }
            }
        }
        //判断是否显示生成货品按钮
        if ($("#" + ProductSpec.SpecContainerID + " table.tblist tr[tag='data']").length > 0) {
            $("#GenSpecPdt").hide();
        } else {
            $("#GenSpecPdt").show();
        }
    },
    /**************************
    -------- 编辑初始化 -------
    **************************/
    InitSpec: {
        //初始化
        Init: function () {
            ProductSpec.InitSpec.GetSelSpec();
            ProductSpec.InitSpec.ShowSpecProductTable();
        },
        //获取选择的规格数据
        GetSelSpec: function () {
            //获取数据
            $.ajax({
                type: "POST",
                url: "/Ajax/ProductSpec.ashx",
                data: { "act": "getselspeclist", "pid": ProductSpec.ProductID },
                dataType: "json",
                cache: false,
                async: false,
                success: function (msg) {
                    if (msg != null && msg.length > 0) {
                        ProductSpec.SpecSelItemJson = msg;
                    }
                }
            });
        },
        //显示规格商品列表
        ShowSpecProductTable: function () {
            if (ProductSpec.SpecSelItemJson.length > 0) {
                var specTH = "<thead><tr class=\"tblist_th\">";
                specTH += "<th tag=\"sno\" width=\"150\">货号</th>";
                for (var i = 0; i < ProductSpec.SpecSelItemJson.length; i++) {
                    specTH += "<th tag=\"spec\" specid=\"" + ProductSpec.SpecSelItemJson[i].specid + "\">" + ProductSpec.SpecSelItemJson[i].specname + "</th>";
                }
                specTH += "<th tag=\"sku\">库存</th>";
                specTH += "<th tag=\"saleprice\">销售价</th>";
                specTH += "<th tag=\"costprice\">成本价</th>";
                specTH += "<th tag=\"weight\">重量</th>";
                specTH += "<th tag=\"onsale\">是否上架</th>";
                specTH += "<th tag=\"opt\">操作</th>";
                specTH += "</tr></thead>";
                specTH += "<tbody></tbody>";
                $("#" + ProductSpec.SpecContainerID + " table.tblist").html(specTH);
                //获取数据
                $.ajax({
                    type: "POST",
                    url: "/Ajax/ProductSpec.ashx",
                    data: { "act": "getprosku", "pid": ProductSpec.ProductID },
                    dataType: "json",
                    cache: false,
                    async: false,
                    success: function (msg) {
                        if (msg != null && msg.length > 0) {
                            for (var j = 0; j < msg.length; j++) {
                                var specTR = "<tr tag=\"data\" skuid=\"" + msg[j].C_SkuID + "\">";
                                $("#" + ProductSpec.SpecContainerID + " table.tblist tr:first").find("th").each(function (i, n) {
                                    var $this = $(n);
                                    switch ($this.attr("tag")) {
                                        case "sno":
                                            specTR += "<td><input type=\"text\" class=\"txt100\" value=\"" + msg[j].C_SkuNo + "\" name=\"sno\" /></td>";
                                            break;
                                        case "spec": //规格
                                            var index = -1;
                                            index = $this.parent().find("th[tag='spec']").index($this);
                                            specTR += ProductSpec.InitSpec.GetSpecValHTML(index, msg[j].C_SpecValueIDList);
                                            break;
                                        case "sku":
                                            specTR += "<td><input type=\"text\" class=\"txt50\" value=\"" + msg[j].C_Stocks + "\" name=\"sku\" onbeforepaste=\"clipboardData.setData('text',clipboardData.getData('text').replace(/[^(\\d)]/g,''))\" onkeyup=\"value=value.replace(/[^(\\d)]/g,'')\" /></td>";
                                            break;
                                        case "saleprice":
                                            specTR += "<td><input type=\"text\" class=\"txt50\" value=\"" + msg[j].C_SalePrice + "\" name=\"saleprice\" onbeforepaste=\"clipboardData.setData('text',clipboardData.getData('text').replace(/[^(\\d\\.)]/g,''))\" onkeyup=\"value=value.replace(/[^(\\d\\.)]/g,'')\" /></td>";
                                            break;
                                        case "costprice":
                                            specTR += "<td><input type=\"text\" class=\"txt50\" value=\"" + msg[j].C_CostPirce + "\" name=\"costprice\" onbeforepaste=\"clipboardData.setData('text',clipboardData.getData('text').replace(/[^(\\d\\.)]/g,''))\" onkeyup=\"value=value.replace(/[^(\\d\\.)]/g,'')\" /></td>";
                                            break;
                                        case "weight":
                                            specTR += "<td><input type=\"text\" class=\"txt50\" value=\"" + msg[j].C_Weight + "\" name=\"weight\" onbeforepaste=\"clipboardData.setData('text',clipboardData.getData('text').replace(/[^(\\d\\.)]/g,''))\" onkeyup=\"value=value.replace(/[^(\\d\\.)]/g,'')\" /></td>";
                                            break;
                                        case "onsale":
                                            specTR += "<td><input type=\"checkbox\"" + (msg[j].C_OnSale ? " checked=\"checked\"" : "") + " name=\"onsale\" /></td>";
                                            break;
                                        case "opt":
                                            specTR += "<td><a href=\"javascript:void(0);\" onclick=\"ProductSpec.DeleteRow(this);\">删除</a></td>";
                                            break;
                                        default: break;
                                    }
                                });
                                specTR += "</tr>";
                                $("#" + ProductSpec.SpecContainerID + " table.tblist tbody").append(specTR);
                            }
                        }
                    }
                });
            }
        },
        //获取已选规格值的HTML
        GetSpecValHTML: function (index, idsList) {
            var result = "<td tag=\"spec\"";
            if (index >= 0) {
                var idArray = new Array(); //定义一数组
                idArray = idsList.split(","); //字符分割
                if (index <= idArray.length && index <= ProductSpec.SpecSelItemJson.length) {
                    var selVal;
                    //查找值
                    for (var i = 0; i < ProductSpec.SpecSelItemJson[index].selvalues.length; i++) {
                        if (ProductSpec.SpecSelItemJson[index].selvalues[i].valueid == idArray[index]) {
                            selVal = ProductSpec.SpecSelItemJson[index].selvalues[i]; break;
                        }
                    }
                    result += " specid=\"" + ProductSpec.SpecSelItemJson[index].specid + "\" valueid=\"" + idArray[index] + "\" valtext=\""
                            + (selVal != null ? (selVal.ctmtext.length > 0 ? selVal.ctmtext : selVal.valtext) : "") + "\">";
                    result += "<span class=\"hand\" onclick=\"ProductSpec.SelectSpecValue(this);\">";
                    if (selVal != null) {
                        if (ProductSpec.SpecSelItemJson[index].showtype == 1) {//图片
                            if ((selVal.ctmimg != null && selVal.ctmimg.length > 0) || (selVal.specimg != null && selVal.specimg.length > 0)) {//有规格图片
                                result += "<img" + " src=\"" + (selVal.ctmimg != null && selVal.ctmimg.length > 0 ? selVal.ctmimg : selVal.specimg) + "\" height=\"22\""
                                    + " title=\"" + selVal.valtext + "\" alt=\"" + selVal.valtext + "\" />";
                            } else {
                                result += selVal.ctmtext.length > 0 ? selVal.ctmtext : selVal.valtext; //没规格图片则直接显示文本
                            }
                        } else {
                            result += selVal.ctmtext.length > 0 ? selVal.ctmtext : selVal.valtext;
                        }
                    }
                    result += "</span>";
                } else {
                    result += ">";
                }
            } else {
                result += ">";
            }
            result += "</td>";
            return result;
        }
    },
    /**************************
    --------- 选择规格 --------
    **************************/
    SelectSpec: {
        //显示所有规格
        ShowSpec: function () {
            if ($("#" + ProductSpec.SpecContainerID + " table.tblist tr[tag='data']").length > 0) {
                asyncbox.tips("请先删除所有货品再新增规格", 'error');
                return;
            }

            var container = "<div class=\"divItemSearch\">请选择规格</div><div id=\"divSpecContainer\" class=\"speccontainer\"></div>"
                    + "<div class=\"selItemBottom\">"
                    + "<input type=\"button\" class=\"opbutton\" onclick=\"ProductSpec.SelectSpec.Confirm();\" value=\"确定\" />"
                    + "<input type=\"button\" class=\"opcancel\" onclick=\"$.close('selectSpec');\" value=\"取消\" />"
                    + "</div>";
            asyncbox.open({
                id: "selectSpec",
                title: "选择规格",
                html: container,
                width: 500,
                height: 200,
                scrolling: 'auto'
            });
            //获取数据
            $.ajax({
                type: "POST",
                url: "/Ajax/ProductSpec.ashx",
                data: { "act": "getspeclist" },
                dataType: "json",
                cache: false,
                success: function (msg) {
                    if (msg != null && msg.length > 0) {
                        for (var i = 0; i < msg.length; i++) {
                            $("#divSpecContainer").append("<input type=\"checkbox\" name=\"productspecsel\" value=\"" + msg[i].C_SpecID
                                + "\" text=\"" + msg[i].C_SpecName + "\" showtype=\"" + msg[i].C_ShowType + "\" showway=\"" + msg[i].C_ShowWay + "\" />" + msg[i].C_SpecName
                                + (msg[i].C_Description == null || msg[i].C_Description.length == 0 ? "" : " [" + msg[i].C_Description + "]"));
                        }
                    }
                }
            });
        },
        //确定
        Confirm: function () {
            if ($("#divSpecContainer input[name='productspecsel']:checked").length > 0) {
                $("#divSpecContainer input[name='productspecsel']:checked").each(function (i, n) {
                    if ($("#divSpecSelTab").find("#specTabsub_" + $(n).val()).length == 0) {
                        var tabClass = "speTab";
                        if ($("#divSpecSelTab span[tag='seltab']").length == 0 && i == 0) {//还没选择规格时选中第一个
                            tabClass = "speTabSel";
                        }
                        $("#divSpecSelTab").append("<span id=\"specTabsub_" + $(n).val() + "\" tag=\"seltab\" specname=\"" + $(n).attr("text")
                            + "\" showtype=\"" + $(n).attr("showtype") + "\" specid=\"" + $(n).val()
                            + "\" showway=\"" + $(n).attr("showway") + "\" class=\"" + tabClass + "\" onclick=\"ProductSpec.SelectItem.TabChange('" + $(n).val() + "');\">" + $(n).attr("text")
                            + "<label onclick=\"ProductSpec.SelectItem.DeleteItem('" + $(n).val() + "');\" class=\"tabdel\" title=\"删除\">X</label>" + "</span>");
                    }
                });
                //如果选择第一个则触发选项卡切换事件
                if ($("#divSpecSelTab span[tag='seltab']").length > 0) {
                    var $selTab = $("#divSpecSelTab span.speTabSel");
                    if ($("#divSpecSelTab span[tag='seltab']").index($selTab) == 0) {
                        $selTab.trigger("click");
                    }
                }
                $.close('selectSpec');
            } else {
                asyncbox.tips("请选择规格", 'error');
            }
        }
    },
    /**************************
    -------- 选择规格项 -------
    **************************/
    SelectItem: {
        //关联商品相册图片
        RelationProductImg: function (specid) {

        },
        //上传自定义规格图片
        UploadCtmSpecImg: function (specid) {
            $("table[tag='SpecValueTable']:visible tr[valueid=" + specid + "] span[tag='ctmImg']").attr("uploadimg", "1"); //置上传标识
            var upContainer = "<div class=\"ajaxup\"><input id=\"AjaxUpload\" name=\"AjaxUpload\" type=\"file\" />"
                    + "<input id=\"btnCtmUploadd\" type=\"button\" class=\"button\" value=\"上 传\" onclick=\"ProductSpec.SelectItem.UploadFile();\"/></div>";
            asyncbox.open({
                id: "upSpecCtmImg",
                title: "上传自定义图片",
                html: upContainer,
                width: 320,
                height: 150,
                scrolling: 'auto',
                callback: function (action) {//回调事件取消标志
                    switch (action) {
                        case "ok":
                        case "cancel":
                        case "close":
                            if ($("table[tag='SpecValueTable']:visible tr span[uploadimg='1']").length > 0)
                                $("table[tag='SpecValueTable']:visible tr span[uploadimg='1']").removeAttr("uploadimg");
                            break;
                        default: break;
                    }
                }
            });
        },
        //上传文件
        UploadFile: function () {
            if ($("#AjaxUpload").val().length == 0) {
                asyncbox.tips("请选择图片", 'error'); return;
            }
            $.ajaxFileUpload({
                url: '/Ajax/FileUpload.ashx?act=UploadProductPic',
                secureuri: false,
                fileElementId: 'AjaxUpload',
                dataType: 'json',
                success: function (data, status) {
                    if (data.success == 1) {
                        var $span = $("table[tag='SpecValueTable']:visible tr span[uploadimg='1']"); //自定义图片元素span

                        if ($span.length > 0)
                            $span.removeAttr("uploadimg");
                        $span.attr("imgsrc", data.result);
                        $span.find("img").attr("src", data.fullurl);

                        $.close('upSpecCtmImg'); //关闭窗口
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
        //删除选项卡的项
        DeleteItem: function (specid) {
            if ($("#" + ProductSpec.SpecContainerID + " table.tblist tr[tag='data']").length > 0) {
                asyncbox.tips("请先删除所有货品后再关闭规格", 'error');
                return;
            }

            asyncbox.confirm("删除不可恢复,确定吗 ?", "温馨提示", function (action) {
                if (action == "ok") {
                    $("#specTabsub_" + specid).remove();
                    $("#specValueList_" + specid).remove();
                    //存在规格时,显示第一个规格为选中项
                    if ($("#divSpecSelTab span[tag='seltab']").length > 0) {
                        ProductSpec.SelectItem.TabChange($("#divSpecSelTab span[tag='seltab']:first").attr("specid"));
                    }
                }
            });
        },
        //删除值
        DeleteRow: function (valueid) {
            if ($("#" + ProductSpec.SpecContainerID + " table.tblist tr[tag='data'] td[valueid=" + valueid + "]").length > 0) {
                asyncbox.tips("已有货品使用此规格值,请先删除相关货品", 'error');
                return;
            }

            asyncbox.confirm("删除不可恢复,确定吗 ?", "温馨提示", function (action) {
                if (action == "ok") {
                    var $tbValue = $("table[tag='SpecValueTable']:visible"); //获取值表格
                    $tbValue.find("tr[valueid='" + valueid + "']").remove(); //删除行
                }
            });
        },
        //添加规格值
        AddSpecValue: function (obj) {
            var $obj = $(obj);
            var $tbValue = $("table[tag='SpecValueTable']:visible"); //获取值表格
            if ($tbValue.find("tr[valueid='" + $obj.attr("valueid") + "']").length == 0) {//未存在该值则添加行
                var valueTR = "<tr tag=\"vData\" valueid=\"" + $obj.attr("valueid") + "\" valtext=\"" + $obj.attr("valtext") + "\" specimg=\"" + $obj.attr("specimg") + "\">";
                if ($tbValue.attr("showtype") == 1) {//图片类型
                    valueTR += "<td>" + ($obj.attr("specimg").length > 0 ? "<img src=\"" + $obj.attr("specimg") + "\" height=\"22\" />" : $obj.attr("valtext")) + "</td>";
                    valueTR += "<td><input type=\"text\" class=\"txt80\" tag=\"ctmValue\" value=\"" + $obj.attr("valtext") + "\" /></td>"
                            + "<td>"
                                + "<span tag=\"ctmImg\" imgsrc=\"" + $obj.attr("specimg") + "\">" + ($obj.attr("specimg").length > 0 ? "<img src=\"" + $obj.attr("specimg") + "\" height=\"22\" />" : $obj.attr("valtext")) + "</span>"
                                + "<a href=\"javascript:void(0);\" onclick=\"ProductSpec.SelectItem.UploadCtmSpecImg('" + $obj.attr("valueid") + "');\">上传</a>"
                            + "</td>"
                            + "<td><span tag=\"rltProImg\"></span><a href=\"javascript:void(0);\" onclick=\"ProductSpec.SelectItem.RelationProductImg('" + $obj.attr("valueid") + "');\">选择</a></td>"
                            + "<td><a href=\"javascript:void(0);\" onclick=\"ProductSpec.SelectItem.DeleteRow('" + $obj.attr("valueid") + "');\">删除</a></td>";
                }
                else {//文字类型
                    valueTR += "<td>" + $obj.attr("valtext") + "</td>"
                            + "<td><input type=\"text\" class=\"txt80\" tag=\"ctmValue\" value=\"" + $obj.attr("valtext") + "\" /></td>"
                            + "<td><span tag=\"rltProImg\"></span><a href=\"javascript:void(0);\" onclick=\"ProductSpec.SelectItem.RelationProductImg('" + $obj.attr("valueid") + "');\">选择</a></td>"
                            + "<td><a href=\"javascript:void(0);\" onclick=\"ProductSpec.SelectItem.DeleteRow('" + $obj.attr("valueid") + "');\">删除</a></td>";
                }
                valueTR += "</tr>";
                $tbValue.append(valueTR);
            }
        },
        //添加所有规格值
        AddAllValue: function () {
            $("ul[tag='ulValueList']:visible").find("li").each(function (i, n) {
                ProductSpec.SelectItem.AddSpecValue(n);
            });
        },
        //选择卡切换
        TabChange: function (specid) {
            var $obj = $("#specTabsub_" + specid);
            if ($obj.length == 0) return; //该选项卡被删除则不执行下面代码

            //选项卡选中
            $("#divSpecSelTab span[tag='seltab']").removeClass("speTabSel").addClass("speTab");
            $obj.removeClass("speTab").addClass("speTabSel");
            //隐藏规格
            $("#divSpecSelValue div[tag='valuelist']").hide();
            //还没获取规格的值列表
            if ($("#divSpecSelValue").find("#specValueList_" + specid).length == 0) {
                var valueList = "";
                var valueSelList = "";
                var showType = $obj.attr("showtype"); //显示类型 0-文字 1-图片
                //获取规格值列表
                $.ajax({
                    type: "POST",
                    url: "/Ajax/ProductSpec.ashx",
                    data: { "act": "getspecvaluelist", "specid": specid },
                    dataType: "json",
                    cache: false,
                    async: false,
                    success: function (msg) {
                        if (msg != null && msg.length > 0) {
                            //值列表
                            valueList += "<div class=\"addAllSpec\"><a href=\"javascript:void(0);\" onclick=\"ProductSpec.SelectItem.AddAllValue();\">添加全部" + $obj.attr("specname") + "</a></div>";
                            valueList += "<ul class=\"specbox\" tag=\"ulValueList\">";
                            for (var i = 0; i < msg.length; i++) {
                                valueList += "<li onclick=\"ProductSpec.SelectItem.AddSpecValue(this);\" valueid=\"" + msg[i].C_ValueID + "\" valtext=\""
                                        + msg[i].C_Text + "\" specimg=\"" + msg[i].C_SpecImg + "\">";
                                if (showType == 1) {//图片
                                    valueList += "<span class=\"specimg\">";
                                    if (msg[i].C_SpecImg != null && msg[i].C_SpecImg.length > 0) {
                                        valueList += "<img src=\"" + msg[i].C_SpecImg + "\" height=\"22\" alt=\""
                                            + msg[i].C_Text + "\" title=\"" + msg[i].C_Text + "\" />";
                                    } else {
                                        valueList += msg[i].C_Text; //没规格图片直接显示文本
                                    }
                                    valueList += "</span>";
                                } else {//文字
                                    valueList += "<span>" + msg[i].C_Text + "</span>";
                                }
                                valueList += "<label>添加</label>";
                                valueList += "</li>";
                            }
                            valueList += "</ul>";
                            valueList += "<div class=\"clear\"></div>";
                        }
                    }
                });
                //表格
                valueSelList += "<table id=\"tbSpecValueList_" + specid + "\" tag=\"SpecValueTable\" class=\"tblist\" specid=\"" + specid + "\" specname=\"" + $obj.attr("specname") + "\" showtype=\""
                        + $obj.attr("showtype") + "\" showway=\"" + $obj.attr("showway") + "\" cellspacing=\"0\" cellpadding=\"0\" border=\"0\" width=\"95%\">";
                if (showType == 1) {
                    valueSelList += "<tr class=\"tblist_th\">";
                    valueSelList += "<td width=\"15%\">系统规格</td>";
                    valueSelList += "<td width=\"25%\">自定义规格值</td>";
                    valueSelList += "<td width=\"25%\">自定义规格图片</td>";
                    valueSelList += "<td width=\"25%\">关联商品相册图片</td>";
                    valueSelList += "<td width=\"10%\">操作</td>";
                    valueSelList += "</tr>";
                } else {
                    valueSelList += "<tr class=\"tblist_th\">";
                    valueSelList += "<td width=\"15%\">系统规格</td>";
                    valueSelList += "<td width=\"35%\">自定义规格值</td>";
                    valueSelList += "<td width=\"35%\">关联商品相册图片</td>";
                    valueSelList += "<td width=\"15%\">操作</td>";
                    valueSelList += "</tr>";
                }

                //该规格的选择值列表还没创建并且存在规格项选择JSON,从JSON数据中初始化选择值列表,规格编辑时出现此情况
                if ($("#divSpecSelValue #tbSpecValueList_" + specid).length == 0 && ProductSpec.SpecSelItemJson.length > 0) {
                    var ThisValSelList;
                    //查找已选值数组
                    for (var i = 0; i < ProductSpec.SpecSelItemJson.length; i++) {
                        if (ProductSpec.SpecSelItemJson[i].specid == specid) {
                            ThisValSelList = ProductSpec.SpecSelItemJson[i].selvalues; break;
                        }
                    }
                    //循环数组显示列表
                    if (ThisValSelList != null && ThisValSelList.length > 0) {
                        for (var i = 0; i < ThisValSelList.length; i++) {
                            var valueTR = "<tr tag=\"vData\" valueid=\"" + ThisValSelList[i].valueid + "\" valtext=\""
                                    + ThisValSelList[i].valtext + "\" specimg=\"" + ThisValSelList[i].specimg + "\">";
                            if (showType == 1) {//图片类型
                                valueTR += "<td>" + (ThisValSelList[i].specimg.length > 0 ? "<img src=\"" + ThisValSelList[i].specimg + "\" height=\"22\" />" : ThisValSelList[i].valtext) + "</td>"
                                    + "<td><input type=\"text\" class=\"txt80\" tag=\"ctmValue\" value=\"" + ThisValSelList[i].ctmtext + "\" /></td>"
                                    + "<td>"
                                        + "<span tag=\"ctmImg\" imgsrc=\"" + ThisValSelList[i].ctmimg + "\">" + (ThisValSelList[i].ctmimg.length > 0 ? "<img src=\"" + ThisValSelList[i].ctmimg + "\" height=\"22\" />" : ThisValSelList[i].valtext) + "</span>"
                                        + "<a href=\"javascript:void(0);\" onclick=\"ProductSpec.SelectItem.UploadCtmSpecImg('" + ThisValSelList[i].valueid + "');\">上传</a>"
                                    + "</td>"
                                    + "<td><span tag=\"rltProImg\"></span><a href=\"javascript:void(0);\" onclick=\"ProductSpec.SelectItem.RelationProductImg('" + ThisValSelList[i].valueid + "');\">选择</a></td>"
                                    + "<td><a href=\"javascript:void(0);\" onclick=\"ProductSpec.SelectItem.DeleteRow('" + ThisValSelList[i].valueid + "');\">删除</a></td>";
                            }
                            else {//文字类型
                                valueTR += "<td>" + ThisValSelList[i].valtext + "</td>"
                                    + "<td><input type=\"text\" class=\"txt80\" tag=\"ctmValue\" value=\"" + ThisValSelList[i].ctmtext + "\" /></td>"
                                    + "<td><span tag=\"rltProImg\"></span><a href=\"javascript:void(0);\" onclick=\"ProductSpec.SelectItem.RelationProductImg('" + ThisValSelList[i].valueid + "');\">选择</a></td>"
                                    + "<td><a href=\"javascript:void(0);\" onclick=\"ProductSpec.SelectItem.DeleteRow('" + ThisValSelList[i].valueid + "');\">删除</a></td>";
                            }
                            valueTR += "</tr>";
                            valueSelList += valueTR; //添加到表格
                        }
                    }
                }

                valueSelList += "</table>";
                valueSelList += "<div class=\"clear blank\"></div>";

                $("#divSpecSelValue").append("<div id=\"specValueList_" + $obj.attr("specid") + "\" tag=\"valuelist\">" + valueList + valueSelList + "</div>");
            }
            $("#divSpecSelValue").find("#specValueList_" + specid).show(); //当前规格显示
        },
        //保存当前选择规格容器的HTML
        SaveHTML: function () {
            $("#" + ProductSpec.TempContainerID).val(ProductSpec.OuterHtml($('#divSpecSelContainer')));
        },
        //保存选择规格项
        SaveItem: function () {
            //检验是否都选择了规格值
            if ($("table[tag='SpecValueTable']").length != $("table[tag='SpecValueTable']:has(tr[tag='vData'])").length) {
                asyncbox.tips("请选择规格", 'error'); return false;
            }

            ProductSpec.SelectItem.SaveHTML();
            if ($("#" + ProductSpec.SpecContainerID + " table.tblist tr[tag='data']").length < 1) {
                var specTH = "<thead><tr class=\"tblist_th\">";
                specTH += "<th tag=\"sno\" width=\"150\">货号</th>";
                $("table[tag='SpecValueTable']").each(function (i, n) {
                    specTH += "<th tag=\"spec\" specid=\"" + $(n).attr("specid") + "\">" + $(n).attr("specname") + "</th>";
                });
                specTH += "<th tag=\"sku\">库存</th>";
                specTH += "<th tag=\"saleprice\">销售价</th>";
                specTH += "<th tag=\"costprice\">成本价</th>";
                specTH += "<th tag=\"weight\">重量</th>";
                specTH += "<th tag=\"opt\">操作</th>";
                specTH += "</tr></thead>";
                specTH += "<tbody></tbody>";
                $("#" + ProductSpec.SpecContainerID + " table.tblist").html(specTH);
            }

            //保存规格Json
            var JsonString = "[";
            $("table[tag='SpecValueTable']").each(function (i, n) {
                if (i > 0)
                    JsonString += ",";
                var $this = $(n);
                JsonString += "{\"specid\":\"" + $this.attr("specid") + "\",\"specname\":\"" + $this.attr("specname")
                            + "\",\"showtype\":" + $this.attr("showtype") + ",\"showway\":" + $this.attr("showtype") + ",\"selvalues\":[";

                //获取规格选择的值
                $this.find("tr[tag='vData']").each(function (j, o) {
                    var valArrayItem = "";
                    if (j > 0)
                        valArrayItem += ",";
                    var $obj = $(o);

                    //自定义图片
                    var ctmImage = "";
                    if ($obj.find("span[tag='ctmImg']").length > 0) {
                        ctmImage = $obj.find("span[tag='ctmImg']").attr("imgsrc");
                    }

                    valArrayItem += "{";
                    valArrayItem += "\"valueid\":\"" + $obj.attr("valueid") + "\",\"valtext\":\"" + $obj.attr("valtext") + "\",\"specimg\":\"" + $obj.attr("specimg") + "\",";
                    valArrayItem += "\"ctmtext\":\"" + $.trim($obj.find("input[tag='ctmValue']").val()) + "\",\"ctmimg\":\"" + ctmImage + "\",";

                    //获取关联的商品图片
                    valArrayItem += "\"productpics\":[";
                    $obj.find("span[tag='rltProImg'] img").each(function (k, m) {
                        $m = $(m);
                        if (k > 0)
                            valArrayItem += ",";
                        valArrayItem += "{\"picid\":\"" + $m.attr("picid") + "\",\"picurl\":\"" + $m.attr("picurl") + "\"}";
                    });
                    valArrayItem += "]";

                    valArrayItem += "}";
                    JsonString += valArrayItem;
                });

                JsonString += "]";
                JsonString += "}";
            });
            JsonString += "]";

            ProductSpec.SpecSelItemJson = $.parseJSON(JsonString);

            return true;
        },
        //生成规格商品
        GenerateSpecProduct: function () {
            if ($("#" + ProductSpec.SpecContainerID + " table.tblist tr[tag='data']").length > 0) {
                asyncbox.tips("请删除所有货品再生成", 'error'); return;
            } else {
                if (ProductSpec.SelectItem.SaveItem()) {//先保存JSON
                    var SpecCombine = new Array();
                    SpecCombine = ProductSpec.SpecArray.GetCombineResult(); //组合规格

                    if (SpecCombine.length > 0) {
                        //添加表头
                        var specTH = "<thead><tr class=\"tblist_th\">";
                        specTH += "<th tag=\"sno\" width=\"150\">货号</th>";
                        for (var i = 0; i < ProductSpec.SpecSelItemJson.length; i++) {
                            specTH += "<th tag=\"spec\" specid=\"" + ProductSpec.SpecSelItemJson[i].specid + "\">" + ProductSpec.SpecSelItemJson[i].specname + "</th>";
                        }
                        specTH += "<th tag=\"sku\">库存</th>";
                        specTH += "<th tag=\"saleprice\">销售价</th>";
                        specTH += "<th tag=\"costprice\">成本价</th>";
                        specTH += "<th tag=\"weight\">重量</th>";
                        specTH += "<th tag=\"onsale\">是否上架</th>";
                        specTH += "<th tag=\"opt\">操作</th>";
                        specTH += "</tr></thead>";
                        specTH += "<tbody></tbody>";
                        $("#" + ProductSpec.SpecContainerID + " table.tblist").html(specTH);

                        //循环组合规格数组
                        for (var i = 0; i < SpecCombine.length; i++) {
                            //获取组合ID的值集合
                            var idArray = SpecCombine[i].split(",");
                            var valArray = []; //值集合
                            for (var j = 0; j < idArray.length; j++) {
                                var ThisVal;
                                //查找值
                                for (var k = 0; k < ProductSpec.SpecSelItemJson[j].selvalues.length; k++) {
                                    if (idArray[j] == ProductSpec.SpecSelItemJson[j].selvalues[k].valueid) {
                                        ThisVal = ProductSpec.SpecSelItemJson[j].selvalues[k]; break;
                                    }
                                }
                                valArray[valArray.length] = ThisVal;
                            }

                            //添加货号
                            var specTR = "<tr tag=\"data\">";
                            $("#" + ProductSpec.SpecContainerID + " table.tblist tr:first").find("th").each(function (i, n) {
                                var $this = $(n);
                                switch ($this.attr("tag")) {
                                    case "sno":
                                        specTR += "<td><input type=\"text\" class=\"txt100\" value=\"" + $.trim($("#txtgoodNO").val()) + "\" name=\"sno\" /></td>";
                                        break;
                                    case "spec": //规格
                                        var specTD = "";
                                        var index = $this.parent().find("th[tag='spec']").index($this);

                                        specTD += "<td tag=\"spec\"";
                                        specTD += " specid=\"" + ProductSpec.SpecSelItemJson[index].specid + "\" valueid=\"" + valArray[index].valueid + "\" valtext=\""
                                                    + (valArray[index].ctmtext.length > 0 ? valArray[index].ctmtext : valArray[index].valtext) + "\">";
                                        specTD += "<span class=\"hand\" onclick=\"ProductSpec.SelectSpecValue(this);\">";
                                        if (ProductSpec.SpecSelItemJson[index].showtype == 1) {//图片
                                            if ((valArray[index].ctmimg != null && valArray[index].ctmimg.length > 0) || (valArray[index].specimg != null && valArray[index].specimg.length > 0)) {
                                                specTD += "<img" + " src=\"" + (valArray[index].ctmimg != null && valArray[index].ctmimg.length > 0 ? valArray[index].ctmimg : valArray[index].specimg) + "\" height=\"22\""
                                                    + " title=\"" + valArray[index].valtext + "\" alt=\"" + valArray[index].valtext + "\" />";
                                            } else {
                                                specTD += valArray[index].ctmtext.length > 0 ? valArray[index].ctmtext : valArray[index].valtext; //没规格图片直接显示文本
                                            }
                                        } else {
                                            specTD += valArray[index].ctmtext.length > 0 ? valArray[index].ctmtext : valArray[index].valtext;
                                        }
                                        specTD += "</span></td>";
                                        specTR += specTD; //规格单元格添加到行
                                        break;
                                    case "sku":
                                        specTR += "<td><input type=\"text\" class=\"txt50\" value=\"\" name=\"sku\" onbeforepaste=\"clipboardData.setData('text',clipboardData.getData('text').replace(/[^(\\d)]/g,''))\" onkeyup=\"value=value.replace(/[^(\\d)]/g,'')\" /></td>";
                                        break;
                                    case "saleprice":
                                        specTR += "<td><input type=\"text\" class=\"txt50\" value=\"" + $("#txtShopPrice").val() + "\" name=\"saleprice\" onbeforepaste=\"clipboardData.setData('text',clipboardData.getData('text').replace(/[^(\\d\\.)]/g,''))\" onkeyup=\"value=value.replace(/[^(\\d\\.)]/g,'')\" /></td>";
                                        break;
                                    case "costprice":
                                        specTR += "<td><input type=\"text\" class=\"txt50\" value=\"" + $("#txtCostPrice").val() + "\" name=\"costprice\" onbeforepaste=\"clipboardData.setData('text',clipboardData.getData('text').replace(/[^(\\d\\.)]/g,''))\" onkeyup=\"value=value.replace(/[^(\\d\\.)]/g,'')\" /></td>";
                                        break;
                                    case "weight":
                                        specTR += "<td><input type=\"text\" class=\"txt50\" value=\"" + $("#txtWeight").val() + "\" name=\"weight\" onbeforepaste=\"clipboardData.setData('text',clipboardData.getData('text').replace(/[^(\\d\\.)]/g,''))\" onkeyup=\"value=value.replace(/[^(\\d\\.)]/g,'')\" /></td>";
                                        break;
                                    case "onsale":
                                        specTR += "<td><input type=\"checkbox\" checked=\"checked\" name=\"onsale\" /></td>";
                                        break;
                                    case "opt":
                                        specTR += "<td><a href=\"javascript:void(0);\" onclick=\"ProductSpec.DeleteRow(this);\">删除</a></td>";
                                        break;
                                    default: break;
                                }
                            });
                            specTR += "</tr>";
                            $("#" + ProductSpec.SpecContainerID + " table.tblist tbody").append(specTR);
                        }
                        $.close('selectSpecItem'); //关闭层
                    } else {
                        asyncbox.tips('请选择规格', 'error');
                    }
                }
            }
        }
    },
    /*******************
    -- 规格数组处理类 --
    *******************/
    SpecArray: {
        //组合
        CombineArray: function (arr1, arr2) {
            var arrResultSub = new Array();
            for (var i = 0; i < arr1.length; i++) {
                for (var k = 0; k < arr2.length; k++) {
                    arrResultSub[arrResultSub.length] = arr1[i] + "," + arr2[k].valueid;
                }
            }
            return arrResultSub;
        },
        //获取组合结果
        GetCombineResult: function () {
            var arrResult = new Array();
            if (ProductSpec.SpecSelItemJson != null && ProductSpec.SpecSelItemJson.length > 0) {
                //将第一个数组写入结果数组
                for (var z = 0; z < ProductSpec.SpecSelItemJson[0].selvalues.length; z++) {
                    arrResult[arrResult.length] = ProductSpec.SpecSelItemJson[0].selvalues[z].valueid;
                }
                //将第二个以后的数组与第一个数组组合存入结果数组
                for (var i = 1; i < ProductSpec.SpecSelItemJson.length; i++) {
                    arrResult = ProductSpec.SpecArray.CombineArray(arrResult, ProductSpec.SpecSelItemJson[i].selvalues);
                }
            }
            return arrResult;
        }
    },
    //删除行
    DeleteRow: function (obj) {
        asyncbox.confirm("删除不可恢复,确定吗 ?", "温馨提示", function (action) {
            if (action == "ok") {
                var $TR = $(obj).parent().parent();
                //有库存ID的将其添加到删除集合
                if ($TR.attr("skuid") != null && $TR.attr("skuid").length > 0) {
                    var DelIdList = $("#SpecProductDelIDs").val();
                    if (DelIdList.length > 0) {
                        $("#SpecProductDelIDs").val(DelIdList + "," + "'" + $TR.attr("skuid") + "'");
                    } else {
                        $("#SpecProductDelIDs").val("'" + $TR.attr("skuid") + "'");
                    }
                }
                $TR.remove();
            }
        });
    },
    //选择值
    SelVaule: function (obj) {
        $td = $("#" + ProductSpec.SpecContainerID + " table.tblist tr td[select='1']");
        $obj = $(obj);
        $td.attr("valueid", $obj.attr("valueid")).attr("valtext", $obj.attr("valtext")).html("<span class=\"hand\" onclick=\"ProductSpec.SelectSpecValue(this);\">" + $obj.html() + "</span>");
        $td.removeAttr("select"); //删除选择标志
        $.close('selectSpecValue');
    },
    //选择规格值
    SelectSpecValue: function (obj) {
        var $obj = $(obj).parent(); //取单元格对象
        var specid = $obj.attr("specid");
        $obj.attr("select", "1"); //标识选择标志
        if (ProductSpec.SpecSelItemJson != null && ProductSpec.SpecSelItemJson.length > 0) {//有选择的规格值

            var $TR = $obj.parent(); //所在行
            var IsLastSpecTD = false;
            if ($TR.find("td[tag='spec']").not($obj).has("span.hand").length == ($TR.find("td[tag='spec']").length - 1)) {//判断此行中其余规格单元格是否已经选择了规格值,重复则不能选择
                IsLastSpecTD = true;
            }

            var valuesContainer = "<div class=\"selSpecValue\">";
            //循环选择的规格值JSON
            for (var i = 0; i < ProductSpec.SpecSelItemJson.length; i++) {
                if (ProductSpec.SpecSelItemJson[i].specid == specid) {//找出该规格的选择值
                    var selVals = ProductSpec.SpecSelItemJson[i].selvalues;
                    var showType = parseInt(ProductSpec.SpecSelItemJson[i].showtype);
                    if (selVals != null && selVals.length > 0) {
                        for (var j = 0; j < selVals.length; j++) {//循环选择值                            
                            var enableClick = true; //是否能点击
                            if (IsLastSpecTD) {
                                //判断组合规格是否存在
                                if ($("#" + ProductSpec.SpecContainerID + " table.tblist tr[tag='data']").not($TR).length > 0) {
                                    var CurTRidList = "";
                                    $TR.find("td[tag='spec']").each(function (x, o) {//获取由该规格值组合成的规格ID集合
                                        if (x > 0) {
                                            CurTRidList += ",";
                                        }
                                        if ($(o).attr("select") == "1") {//选择规格值的单元格
                                            CurTRidList += selVals[j].valueid;
                                        } else {
                                            CurTRidList += $(o).attr("valueid");
                                        }
                                    });

                                    $("#" + ProductSpec.SpecContainerID + " table.tblist tr[tag='data']").not($TR).each(function (k, n) {
                                        var $n = $(n);
                                        if ($n.find("td[tag='spec']").has("span.hand").length == $n.find("td[tag='spec']").length) {//当前行是否全部选择了规格值
                                            var thisTRidList = "";
                                            $n.find("td[tag='spec']").each(function (y, m) {//获取该行的规格ID集合
                                                if (y > 0) {
                                                    thisTRidList += ",";
                                                }
                                                thisTRidList += $(m).attr("valueid");
                                            });

                                            if (thisTRidList == CurTRidList) {
                                                enableClick = false;
                                                return false; //退出循环
                                            }
                                        }
                                    });
                                }
                            }

                            var rstText = (selVals[j].ctmtext != null && selVals[j].ctmtext.length > 0) ? selVals[j].ctmtext : selVals[j].valtext; //有自定义值则取自定义值,否则取系统的规格值
                            if (showType == 1) {//图片
                                valuesContainer += "<span ";
                                if (enableClick) {
                                    valuesContainer += "onclick=\"ProductSpec.SelVaule(this);\" ";
                                }
                                else {
                                    valuesContainer += "class=\"disable\" "; //不能点击
                                }
                                valuesContainer += "valtext=\"" + rstText
                                    + "\" valueid=\"" + selVals[j].valueid + "\">";
                                if ((selVals[j].ctmimg != null && selVals[j].ctmimg.length > 0) || (selVals[j].specimg != null && selVals[j].specimg.length > 0)) {
                                    valuesContainer += "<img" + " src=\"" + (selVals[j].ctmimg != null && selVals[j].ctmimg.length > 0 ? selVals[j].ctmimg : selVals[j].specimg) + "\" height=\"22\""
                                    + " title=\"" + selVals[j].valtext + "\" alt=\"" + selVals[j].valtext + "\" />";
                                } else {
                                    valuesContainer += rstText; //没规格图片直接显示文本
                                }
                                valuesContainer += "</span>";
                            } else {//文字
                                valuesContainer += "<span ";
                                if (enableClick) {
                                    valuesContainer += "onclick=\"ProductSpec.SelVaule(this);\" ";
                                }
                                else {
                                    valuesContainer += "class=\"disable\" "; //不能点击
                                }
                                valuesContainer += "valtext=\"" + rstText
                                    + "\" valueid=\"" + selVals[j].valueid + "\">" + rstText + "</span>";
                            }
                        }
                    }
                    break;
                }
            }
            valuesContainer += "</div>";
            //显示选择层
            asyncbox.open({
                id: "selectSpecValue",
                title: "选择规格值",
                html: valuesContainer,
                width: 350,
                height: 150,
                scrolling: 'auto',
                callback: function (action) {//回调事件取消标志
                    switch (action) {
                        case "ok":
                        case "cancel":
                        case "close":
                            if ($("#" + ProductSpec.SpecContainerID + " table.tblist tr td[select='1']").length > 0) {
                                $("#" + ProductSpec.SpecContainerID + " table.tblist tr td[select='1']").removeAttr("select");
                            }
                            break;
                        default: break;
                    }
                }
            });
        }
    },
    //添加货号
    AddRow: function () {
        if ($("#" + ProductSpec.SpecContainerID + " table.tblist tr").length > 0) {
            var specTR = "<tr tag=\"data\">";
            $("#" + ProductSpec.SpecContainerID + " table.tblist tr:first").find("th").each(function (i, n) {
                var $this = $(n);
                switch ($this.attr("tag")) {
                    case "sno":
                        specTR += "<td><input type=\"text\" class=\"txt100\" value=\"" + $.trim($("#txtgoodNO").val()) + "\" name=\"sno\" /></td>";
                        break;
                    case "spec": //规格
                        specTR += "<td tag=\"spec\" specid=\"" + $this.attr("specid") + "\"><a href=\"javascript:void(0);\" onclick=\"ProductSpec.SelectSpecValue(this);\">请选择</a></td>";
                        break;
                    case "sku":
                        specTR += "<td><input type=\"text\" class=\"txt50\" value=\"\" name=\"sku\" onbeforepaste=\"clipboardData.setData('text',clipboardData.getData('text').replace(/[^(\\d)]/g,''))\" onkeyup=\"value=value.replace(/[^(\\d)]/g,'')\" /></td>";
                        break;
                    case "saleprice":
                        specTR += "<td><input type=\"text\" class=\"txt50\" value=\"" + $("#txtShopPrice").val() + "\" name=\"saleprice\" onbeforepaste=\"clipboardData.setData('text',clipboardData.getData('text').replace(/[^(\\d\\.)]/g,''))\" onkeyup=\"value=value.replace(/[^(\\d\\.)]/g,'')\" /></td>";
                        break;
                    case "costprice":
                        specTR += "<td><input type=\"text\" class=\"txt50\" value=\"" + $("#txtCostPrice").val() + "\" name=\"costprice\" onbeforepaste=\"clipboardData.setData('text',clipboardData.getData('text').replace(/[^(\\d\\.)]/g,''))\" onkeyup=\"value=value.replace(/[^(\\d\\.)]/g,'')\" /></td>";
                        break;
                    case "weight":
                        specTR += "<td><input type=\"text\" class=\"txt50\" value=\"" + $("#txtWeight").val() + "\" name=\"weight\" onbeforepaste=\"clipboardData.setData('text',clipboardData.getData('text').replace(/[^(\\d\\.)]/g,''))\" onkeyup=\"value=value.replace(/[^(\\d\\.)]/g,'')\" /></td>";
                        break;
                    case "onsale":
                        specTR += "<td><input type=\"checkbox\" checked=\"checked\" name=\"onsale\" /></td>";
                        break;
                    case "opt":
                        specTR += "<td><a href=\"javascript:void(0);\" onclick=\"ProductSpec.DeleteRow(this);\">删除</a></td>";
                        break;
                    default: break;
                }
            });
            specTR += "</tr>";
            $("#" + ProductSpec.SpecContainerID + " table.tblist tbody").append(specTR);
        }
    },
    //关闭规格
    Close: function () {
        asyncbox.confirm("关闭后现有货品数据将全部丢失,确定吗 ?", "温馨提示", function (action) {
            if (action == "ok") {
                ProductSpec.SpecSelItemJson = [];
                $("#" + ProductSpec.TempContainerID).val("");
                $("#SpecSelItemRuleTxt").val("");

                //处理删除的库存ID
                var DelIdList = $("#SpecProductDelIDs").val();
                $("#" + ProductSpec.SpecContainerID + " table.tblist tr[tag='data']").each(function (i, n) {
                    var $TR = $(n);
                    //有库存ID的将其添加到删除集合
                    if ($TR.attr("skuid") != null && $TR.attr("skuid").length > 0) {
                        if (DelIdList.length > 0) {
                            DelIdList += "," + "'" + $TR.attr("skuid") + "'";
                        } else {
                            DelIdList += "'" + $TR.attr("skuid") + "'";
                        }
                    }
                });
                $("#SpecProductDelIDs").val(DelIdList);

                $("#" + ProductSpec.SpecContainerID + " table.tblist tr").remove();
            }
        });
    },
    //保存
    Save: function () {
        var flag = true;
        var errorSign = 0;
        //验证是否全部选择规格值
        if ($("#" + ProductSpec.SpecContainerID + " table.tblist tr td[tag='spec']").length != $("#" + ProductSpec.SpecContainerID + " table.tblist tr td[tag='spec']:has('span.hand')").length) {
            errorSign = 1;
        }
        //是否有库存不填
        $("#" + ProductSpec.SpecContainerID + " table.tblist tr td input[name='sku']").each(function (i, n) {
            if ($.trim($(n).val()).length == 0) {
                errorSign = 2;
                return false; //表示退出循环break, return true则表示continue
            }
        });
        //是否有销售价不填
        $("#" + ProductSpec.SpecContainerID + " table.tblist tr td input[name='saleprice']").each(function (i, n) {
            if ($.trim($(n).val()).length == 0) {
                errorSign = 3;
                return false;
            }
        });
        if (errorSign > 0) {
            flag = false;
            switch (errorSign) {
                case 1:
                    asyncbox.error('请为所有货品选择规格值', '温馨提示');
                    break;
                case 2:
                    asyncbox.error('请为所有货品填写库存', '温馨提示');
                    break;
                case 3:
                    asyncbox.error('请为所有货品填写售价', '温馨提示');
                    break;
                default: break;
            }
        } else {//保存数据            
            if ($("#" + ProductSpec.SpecContainerID + " table.tblist tr[tag='data']").length > 0) {
                //规格商品
                var specproducts = "";
                $("#" + ProductSpec.SpecContainerID + " table.tblist tr[tag='data']").each(function (i, n) {
                    var $TR = $(n);
                    var re = /[;<>\[]]/g; //正则表达式,替换字符
                    var TrRecord = "[";
                    TrRecord += "<skuid:" + ($TR.attr("skuid") != null && $TR.attr("skuid").length > 0 ? $TR.attr("skuid") : "") + ">";
                    TrRecord += "<skuno:" + $TR.find("input[name='sno']").val().replace(re, '') + ">";
                    TrRecord += "<stocks:" + $TR.find("input[name='sku']").val().replace(re, '') + ">";
                    TrRecord += "<saleprice:" + $TR.find("input[name='saleprice']").val().replace(re, '') + ">";
                    TrRecord += "<costprice:" + $TR.find("input[name='costprice']").val().replace(re, '') + ">";
                    TrRecord += "<weight:" + $TR.find("input[name='weight']").val().replace(re, '') + ">";
                    TrRecord += "<onsale:" + ($TR.find("input[name='onsale']")[0].checked ? 1 : 0) + ">";

                    //循环获取选择值ID与文本集合
                    var valIDs = "";
                    var specTxt = "";
                    $TR.find("td[tag='spec']").each(function (j, o) {
                        var $o = $(o);
                        if (j > 0) {
                            valIDs += ",";
                            specTxt += "、";
                        }
                        valIDs += $o.attr("valueid");
                        specTxt += $("#" + ProductSpec.SpecContainerID + " table.tblist th[specid=" + $o.attr("specid") + "]").html() + "：" + $o.attr("valtext");
                    });

                    TrRecord += "<valueids:" + valIDs.replace(re, '') + ">";
                    TrRecord += "<spectxt:" + specTxt.replace(re, '') + ">";
                    TrRecord += "]";
                    specproducts += TrRecord;
                });
                $("#SpecProductItems").val(specproducts); //保存规格商品,C#解析操作
                //选择规格值(C#解析操作)
                var RuleTxt = ""; //C#处理的规格文本(<specid:***><selvalues:[{***}{***}]>)(<specid:***><selvalues:[{***}{***}]>)
                for (var i = 0; i < ProductSpec.SpecSelItemJson.length; i++) {
                    RuleTxt += "(<specid:" + ProductSpec.SpecSelItemJson[i].specid + "><selvalues:[";
                    var selVals = ProductSpec.SpecSelItemJson[i].selvalues;
                    if (selVals != null && selVals.length > 0) {
                        for (var j = 0; j < selVals.length; j++) {
                            var valArrayItem = "";
                            if (j > 0)
                                valArrayItem += ",";
                            valArrayItem += "{";
                            valArrayItem += "\"valueid\":\"" + selVals[j].valueid + "\",\"valtext\":\"" + selVals[j].valtext + "\",\"specimg\":\"" + selVals[j].specimg + "\",";
                            valArrayItem += "\"ctmtext\":\"" + selVals[j].ctmtext + "\",\"ctmimg\":\"" + selVals[j].ctmimg + "\",";
                            valArrayItem += "\"usecount\":" + $("#" + ProductSpec.SpecContainerID + " table.tblist tr[tag='data'] td[valueid=" + selVals[j].valueid + "]").length + ",";
                            valArrayItem += "\"productpics\":[";
                            //商品关联图片
                            var pics = selVals[j].productpics;
                            if (pics != null && pics.length > 0) {
                                for (var k = 0; k < pics.length; k++) {
                                    if (k > 0)
                                        valArrayItem += ",";
                                    valArrayItem += "{\"picid\":\"" + pics[k].picid + "\",\"picurl\":\"" + pics[k].picurl + "\"}";
                                }
                            }
                            valArrayItem += "],";
                            //获取关联的规格值(在规格商品列表中存在与该值组合)
                            valArrayItem += "\"rltids\":[";
                            var vids = "";
                            $("#" + ProductSpec.SpecContainerID + " table.tblist tr[tag='data']").has("td[valueid=" + selVals[j].valueid + "]").each(function (k, n) {
                                var $Tr = $(n);
                                $Tr.find("td[tag='spec']").not("[valueid=" + selVals[j].valueid + "]").each(function (l, m) {//循环其他规格值
                                    if (vids.indexOf("\"" + $(m).attr("valueid") + "\"") < 0) {//不存在
                                        if (vids.length > 0)
                                            vids += ",";

                                        vids += "\"" + $(m).attr("valueid") + "\"";
                                    }
                                });
                            });
                            valArrayItem += vids;
                            valArrayItem += "]";

                            valArrayItem += "}";

                            var re = /\)/g; //正则表达式,替换字符
                            var re1 = /\(/g;
                            RuleTxt += valArrayItem.replace(re, '）').replace(re1, '（');
                        }
                    }
                    RuleTxt += "]>)";
                }
                $("#SpecSelItemRuleTxt").val(RuleTxt); //保存选择项,C#解析操作
            } else {
                $("#SpecProductItems").val('');
                $("#SpecSelItemRuleTxt").val('');
            }
        }
        return flag;
    }
}