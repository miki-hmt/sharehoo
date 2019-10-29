/**
 * Created by zhangw on 2015-10-20.
 */

/* tab 页切换 */
;(function ($) {
    var TabSwitch = function (tabNav) {
        var self = this;
        // 保存单个tabbox对象
        this.tabNav = tabNav;
        this.tabItem = tabNav.find(".tab_item");
        this.tabLayer = tabNav.find(".tab_page");
        this.curTab = null;
        this.curLayer = null;
        this.initTab();
        this.tabItem.each(function (i) {
            $(this).click(function () {
                self.switchTab(this, i);
                if (self.tabNav.attr("data-trigger") && self.tabNav.attr("data-trigger") == "true") {
                    if (self.tabNav.attr("data-call") && self.tabNav.attr("data-call") != "") {
                        eval(self.tabNav.attr("data-call"));
                    }
                } else {
                    self.tabNav.attr("data-trigger", "true");
                }
                return false;
            });
        });
    };
    TabSwitch.prototype = {
        // 设置当前默认显示的tab页
        initTab: function (){
            var self = this;
            this.tabItem.each(function (i) {
                if ($(this).hasClass('cur')) {
                    self.curTab = $(this);
                    self.curLayer = $(self.tabLayer.get(i));
                } else {
                    $(self.tabLayer.get(i)).hide();
                }
            });
        },
        switchTab: function (_this, index) {
            var _this_ = this;
            var $item = $(_this);
            var $layerItem = $(_this_.tabLayer.get(index));
            //_this_.curTab.removeClass('cur');
            //_this_.curLayer.hide();
            if (_this_.curTab) {
                _this_.curTab.removeClass('cur');
                _this_.curLayer.hide();
            }
            $item.addClass('cur');
            $layerItem.show();
            _this_.curTab = $item;
            _this_.curLayer = $layerItem;
        }
    };
    TabSwitch.init = function (tabNavs) {
        var _this_ = this;
        tabNavs.each(function () {
            new _this_($(this));
        });
    };
    window["TabSwitch"] = TabSwitch;
})(jQuery);