//获取光标位置添加  相关内容
(function($) {
    $.fn.extend({
        "insert": function(value) {
            value = $.extend({
                "text": "123"
            },
            value);
            var dthis = $(this)[0];
            if (document.selection) {
                $(dthis).focus();
                var fus = document.selection.createRange();
                fus.text = value.text;
                $(dthis).focus();
            } else if (dthis.selectionStart || dthis.selectionStart == '0') {
                var start = dthis.selectionStart;
                var end = dthis.selectionEnd;
                var top = dthis.scrollTop;
                dthis.value = dthis.value.substring(0, start) + value.text + dthis.value.substring(end, dthis.value.length);
            } else {
                this.value += value.text;
                this.focus();
            };
            return $(this);
        }
    })
})(jQuery)