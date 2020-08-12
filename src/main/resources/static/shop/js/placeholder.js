/**
 * Created by zhangw on 2017-5-18.
 */

function placeHolder (){
    this.text = '';
    this.init();
};
placeHolder.prototype = {
    init: function(){
        var self = this;
        if(!this.hasPlaceholder()) {
            $('input').each(function(){
                var selfDom = $(this);
                selfDom.attr("type") == "text" && self.addPlaceholder(selfDom);
            });
        }
    },
    hasPlaceholder: function(){
        var input = document.createElement("input");

        return "placeholder" in input;
    },
    addPlaceholder: function(inp){
        var defaultValue = inp.defaultValue,
            self = this;
        self.text = inp.attr('placeholder');

        !defaultValue && inp.val(self.text).css("color","#999");

        self.bindEvent(inp);
    },
    bindEvent: function(inp){
        var self = this;
        inp.focus(function(){
            inp.val() == self.text && $(this).val("");
        }).blur(function(){
            inp.val() == "" && $(this).val(self.text).css("color","#999");
        }).keydown(function(){ //输入的字符不为灰色
            $(this).css("color","#666");
        });
    }
};

$(function(){
    new placeHolder();
})

