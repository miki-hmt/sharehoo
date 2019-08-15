//document.domain = "www.demo.xiazaiba.com";
var _siteRoot = 'http://www.xiazaiba.com';
var _new_siteRoot = 'http://do.xiazaiba.com';

/**
* [isNeeded 判断页面是否有这个元素 ]
* @param  {String}  selectors [JQ选择符]
* @return {Boolean}           [返回true/false]
*/

function isNeeded(selectors){
    var selectors = (typeof selectors == 'string') ? [selectors] : selectors,
        isNeeded;
    for(var i=0;i<selectors.length;i++){
        var selector = selectors[i];
        if( $(selector).length > 0 ) { 
            isNeeded = true; 
            break; 
        }
    };
    return isNeeded ;
};

var tools = {
    cookie: {
        set:function(name,value,expires,path,domain){
            if(typeof expires=="undefined"){
                expires = 365;
            }
            expires=new Date(new Date().getTime()+1000*3600*24*expires);
            document.cookie=name+"="+escape(value)+((expires)?"; expires="+expires.toGMTString():"")+((path)?"; path="+path:"; path=/")+((domain)?";domain="+domain:"");
        },
        get:function(name){
            var arr=document.cookie.match(new RegExp("(^| )"+name+"=([^;]*)(;|$)"));
            if(arr!=null){
                return unescape(arr[2]);
            }
            return null;
        },
        clear:function(name,path,domain){
            if(this.get(name)){
            document.cookie=name+"="+((path)?"; path="+path:"; path=/")+((domain)?"; domain="+domain:"")+";expires=Fri, 02-Jan-1970 00:00:00 GMT";
            }
        }
    }
};
/**
 * [ xTaber 切换 ]
 * @param  {[type]} $ [description]
 * @return {[type]}   [description]
 */
(function($){
    $.fn.extend({
        xTaber: function(opt){
            var def = $.extend({
                /* @tab 触发事件标签 [true|false|obj]
                 * true 自动生成带数字的标签
                 * false 不显示tab
                 * obj 自定义tab
                 */
                tab: true, //默认为自动生成
                content:$('#xtaberWrap'),
                prev: null, //上一个按钮
                next: null, //下一个按钮
                /* @style 滚动的样式 [opacity|left|top|none]
                 * opacity 淡出淡入
                 * left 向左
                 * top 向上
                 * none 无效果
                 */
                style: 'opacity', //默认为opacity
                activeClass: 'current', //当前样式
                delay: 100, //操作延时
                speed: 300, //移动速度
                timeout: 3000, //间歇时间
                auto: false, //是否自动滚动
                setup: 1,//每次滚动多少个
                defaultShow: 1, //默认显示第n个
                mouseEvent: 'mouseover', //鼠标事件
                tabedCallback: null //切换后的回调函数
            }, opt);

            if(typeof def.setup != Number && def.setup < 1) def.setup = 1;
            // 内部通用变量
            var self = def.content,
                content = self.find('[rel="xtaberItems"]'),
                subItem = content.find('.xtaber-item'),
                itemLength = subItem.length,
                subItemHeight = 
                    parseInt(subItem.height())+
                    parseInt(subItem.css('marginTop'))+
                    parseInt(subItem.css('marginBottom'))+
                    parseInt(subItem.css('paddingTop'))+
                    parseInt(subItem.css('paddingBottom')),
                subItemWidth = 
                    parseInt(subItem.width())+
                    parseInt(subItem.css('marginLeft'))+
                    parseInt(subItem.css('marginRight'))+
                    parseInt(subItem.css('paddingLeft'))+
                    parseInt(subItem.css('paddingRight')),
                scrollHeight = subItemHeight * def.setup,
                scrollWidth = subItemWidth * def.setup,
                screenNum,
                current = 0,
                autoTimer,
                itemTimer,
                tabItem = null;

            //滚动屏数                
            if(def.setup == 1){
                screenNum = itemLength;
            }
            else{
                var inAll = (itemLength % def.setup),
                    num = parseInt(itemLength / def.setup);
                screenNum = (inAll > 0) ? (num+1) : num;
            }                

            var init = function(){
                // 自动生成tab
                if(def.tab && typeof def.tab != 'object'){
                    var tabHTML = '<ol rel="xtaberTabs" class="xtaber-tabs">';
                    for(var i=1; i<=screenNum; i++){
                        tabHTML += '<li rel="xtaberTabItem">'+i+'</li>';
                    }
                    tabHTML += '</ol>';
                    self.append(tabHTML);
                    def.tab = self.find('[rel="xtaberTabs"]');
                }
                else if(typeof def.tab == 'object'){
                    def.tab = self.find('[rel="xtaberTabs"]');
                }
                else{
                    def.tab = null;
                }

                if(def.tab != null){
                    tabItem = def.tab.find('[rel="xtaberTabItem"]');
                }

                if(typeof def.next == 'boolean' && def.next){
                    def.next = $('<span rel="xtaberNext">next</span>');
                    def.next.appendTo(self);
                }
                if(typeof def.prev == 'boolean' && def.prev){
                    def.prev = $('<span rel="xtaberPrev">prev</span>');
                    def.prev.appendTo(self);
                }

                switch(def.style){
                    case 'left':
                        setParent('left');
                        break;
                    case 'top':
                        setParent('top');
                        break;
                }

                goTo(def.defaultShow - 1);
                
                bindEvent();
                if(def.auto){
                    auto();
                }

            }
            //设置父级的样式
            var setParent = function(type){
                var wrapHeight,wrapWidht,contentWidth,contentHeight;
                if(type == 'top'){
                    contentHeight = subItemHeight * itemLength;
                    contentWidth = subItemWidth;
                }
                else if(type == 'left'){
                    contentHeight = subItemHeight;
                    contentWidth = subItemWidth * itemLength;
                }
                //alert(typeof(subItemWidth));
                content.css({
                    left: 0,
                    top: 0,
                    position: 'absolute',
                    width: contentWidth,
                    height: contentHeight
                });
            }

            var goTo = function(index){
                clearInterval(autoTimer);
                clearTimeout(itemTimer);
                current = index;
                switch(def.style){
                    case 'top':
                        content.stop().animate({'top': -(index * scrollHeight)}, def.speed);
                        break;
                    case 'left':
                        content.stop().animate({'left': -(index * scrollWidth)}, def.speed);
                        break;
                    case 'opacity':
                        subItem.eq(index).fadeIn().siblings().fadeOut(100);
                        break;
                    default:
                        subItem.eq(index).show().siblings().hide();
                        break;
                }
                if(def.tab != null){
                   tabItem.eq(index).addClass(def.activeClass).siblings().removeClass(def.activeClass);
                }
                if(def.auto){
                    auto()
                };
                if(def.tabedCallback){
                    def.tabedCallback();
                }
                if($('img[data-original]').length){
                    //if($('#drop_histroy').css('display') == 'none'){
                        $(window).trigger('scroll');
                    //}
                }
            }

            var auto = function(){
                if(def.auto){
                    clearInterval(autoTimer);
                    autoTimer = setInterval(function(){
                        if(current + 1 >= screenNum){
                                goTo(0);
                        }else{
                            goTo(current + 1);
                        }
                    }, def.timeout);
                }
            }
            //绑定事件
            var bindEvent = function(){
                if(def.tab != null){
                    tabItem.each(function(){
                        var el = $(this);
                        el.bind(def.mouseEvent, function(){
                            clearInterval(autoTimer);
                            clearTimeout(itemTimer);
                            itemTimer = setTimeout(function(){
                                goTo(el.index());
                            }, def.delay);
                        });
                        
                        el.bind('mouseleave', function(){
                            clearTimeout(itemTimer);
                            auto();
                        });
                    });
                }

                if(def.next){
                    def.next.click(function(e){
                        e.preventDefault();
                        var currentNum = (current + 1 >= screenNum) ? 0 : current + 1;
                        goTo(currentNum);  
                    });
                }
                
                if(def.prev){
                    def.prev.click(function(e){
                        e.preventDefault();
                        var currentNum = (current - 1 < 0) ? screenNum - 1 : current - 1;
                        goTo(currentNum);
                    });
                }
                
            }
            init();           
        }
    });
})(jQuery);

/**
 * [ xHover 鼠标事件 ]
 * @param  {[type]} $ [description]
 * @return {[type]}   [description]
 */
(function($){
    $.fn.extend({
        xHover: function(opt){
            var def = $.extend({
                node: $('[d-hover="hover"]'), 
                type: 1,
                delay: 100,
                activeClass: 'hover'
            }, opt);

            var timer = null,
                clearTimer = function(){
                    if(timer) clearTimeout(timer);
                };

            def.node.each(function(){
                var self = $(this),
                    cls = def.activeClass,
                    type = def.type,
                    activeObj = (type == 1 || type == 3) ? self : self.parent();

                activeObj.bind('mouseover',function(){
                    clearTimer();
                    timer = setTimeout(function(){
                        activeObj.addClass(cls);
                        if(type == 3){
                            activeObj.siblings().removeClass(cls)
                        }
                    }, def.delay);
                }).bind('mouseleave',function(){
                    clearTimer();
                    if(type != 3){
                        activeObj.removeClass(cls);
                    }
                });
            });         
        }
    });
})(jQuery);
/* gotop */
(function($) {
    $.extend($.fn, {
        xGotop: function(opts){
            opts = $.extend({}, 
                {  
                    node: $('#gotop'), // 滚动的按钮
                    speed: 600, //滚动的速度
                    show: true
                }, opts);

            var init = function(){
                opts.node.bind('click', function(e){
                    var doc = $(document).find("html,body");
                    if (doc.filter(":animated").size()) {
                        doc.stop()
                    }
                    doc.animate({
                        scrollTop: 0
                    },
                    opts.speed);
                    return false;
                });
                if(opts.show){
                    showState();
                }
            }

            var showState = function(){
                var state = $(document).scrollTop() > 0 ? 'show' : 'hide';
                opts.node[state]();
            }
            if(opts.show){
                $(window).bind('scroll', function(){
                    showState();
                });
            }
            init();
        }
    });
})(jQuery);
/* 星星评级 */
(function ($) {
    $.extend($.fn, {
        xRater: function(opts){
            opts = $.extend({}, 
                {  
                    node: $('.star-bar'), //?úμ?
                    callback: function(result){} //??μ÷oˉêy
                }, opts);

            var inner = opts.node.find('i'),
                old = '0%',
                isPost = false,
                result,
                oldScore = 0;
            var methods = {
                init: function(){
                    var innerWidth = inner.css('width');
                    if((innerWidth != '' || innerWidth != undefined ) && innerWidth != '0px'){
                        old = innerWidth;
                    }
                    inner.css('width',old+'%');
                    oldScore = $('#j_star_score').html();
                    //ê??t°ó?¨
                    opts.node.bind('mousemove', function(e){
                        if(!isPost){
                            result = methods.setWidth(e.pageX, e.pageX);
                        }
                    }).bind('mouseleave', function(){
                        if(!isPost){
                            inner.css('width',old);
                            $('#j_star_score').html(oldScore);
                        }
                    }).bind('click', function(){
                        if(!isPost){
                            opts.callback(result);
                            isPost = true;
                        }
                    });
                },
                setWidth: function(px, py){
                    var info = methods.getPosition(),
                        leftIn = px - info.left;
                    if(leftIn <= info.width && leftIn > 0){
                        var parcent = leftIn/info.width*100;
                        inner.css('width', parcent+'%');
                        parcent = parseInt(parcent);
                        var parcentNum = 0;
                        if(parcent < 10){
                            parcentNum = 1;
                        }
                        else if(parcent < 20 && parcent >= 10){
                            parcentNum = 2;
                        }
                        else if(parcent < 30 && parcent >= 20){
                            parcentNum = 3;
                        }
                        else if(parcent < 40 && parcent >= 30){
                            parcentNum = 4;
                        }
                        else if(parcent < 50 && parcent >= 40){
                            parcentNum = 5;
                        }
                        else if(parcent < 60 && parcent >= 50){
                            parcentNum = 6;
                        }
                        else if(parcent < 70 && parcent >= 60){
                            parcentNum = 7;
                        }
                        else if(parcent < 80 && parcent >= 70){
                            parcentNum = 8;
                        }
                        else if(parcent < 90 && parcent >= 80){
                            parcentNum = 9;
                        }
                        else if(parcent >= 90){
                            parcentNum = 10;
                        }
                        $('#j_star_score').html(parcentNum);
                        return parcent;
                    }
                },
                getPosition: function(){
                    var os = opts.node.offset(),
                        ol = os.left,
                        ot = os.top,
                        width = opts.node.outerWidth();
                    return {
                        left: ol,
                        top: ot,
                        width: width
                    }
                }
            }
            methods.init();
        }
    });
})(jQuery);
/* ajaxaTab */
(function($){
    $.fn.extend({
        xAjaxTab: function(opt){
            var def = $.extend({
                ajaxBox: $('.ajax-box'),
                tab: null,
                con: null,
                active: 'current'
            }, opt);
            
            var box = def.ajaxBox,
                tab = def.tab,
                con = def.con;
            if(!tab) tab = box.find('[rel="ajax-tab"] li');
            if(!con) con = box.find('[rel="ajax-con"]');

            var showItem = function(elem){
                var _self = $(elem),
                    targetStr = _self.attr('box'),
                    target = $(targetStr),
                    loaded = _self.attr('loaded'),
                    iframe = _self.attr('frame'),
                    url = _self.attr('url'),
                    callback = _self.attr('cb');
                    
                if(targetStr == undefined) return;
                
                if(!target.get(0)){
                    var newDiv = $('<div />');
                    newDiv.attr('id', targetStr.replace('#', '')).hide();
                    newDiv.appendTo(con);
                    target = newDiv;
                }
                
                var showTabCon = function(elem){
                    target.show().siblings().hide();
                    //elem.attr('loaded', 1);
                    tab.removeClass(def.active);
                    elem.addClass(def.active);
                }
                if(loaded == undefined || loaded != 1){
                    if(iframe != undefined && iframe == 1){
                        var f = $('<iframe />');
                        f.attr({
                            'src': url,
                            'class': 'auto-iframe',
                            'frameborder': 0,
                            'scrolling': 'no'
                        });
                        f.bind('load', function(){
                            $(this).height($(this).contents().height()); 
                        });
                        f.appendTo(target);
                        _self.attr('loaded', 1);
                        showTabCon(_self);
                        return;
                    }
                    $.ajax({
                        url: url,
                        beforeSend: function(){
                            target.html('<div class="loading"></div>');
                            showTabCon(_self);
                        },
                        dataType: 'html',
                        success: function(data){
                            target.html(data);
                            _self.attr('loaded', 1);
                            if(callback != undefined){
                                eval(callback)();
                            }
                        }
                    });
                }
                else{
                    showTabCon(_self);
                }
            }
            
            tab.each(function(){
                $(this).bind('click', function(e){
                    showItem($(this));
                    e.preventDefault();
                });
            });

            showItem(box.find('[rel="ajax-tab"] .current'));
        }
    });
})(jQuery);

(function ($) {
    $.extend($.fn, {
        xDrop: function(opts){
            opts = $.extend({}, 
                {  
                    node: $('[drop="#drop-wrap"]'), //下拉菜单节点
                    activeClass: 'active', //下拉菜单当前状态class
                    fix: { // 下拉内容位置修正
                        x: 0, // x轴
                        y: 0  // y轴
                    },
                    callback: null //回调函数
                }, opts);

            //var tmpArr = [];

            var node = opts.node,
                dropContent = $(node.attr('drop')),
                setPosition = function(){
                    var top = node.offset().top + node.outerHeight() + opts.fix.y,
                        left = node.offset().left + opts.fix.x,
                        css = {
                            top: top,
                            left: left,
                            position: 'absolute',
                            zIndex: 9999
                        };
                    dropContent.css(css);
                },
                dShow = function(){
                    for(var i in $.fn.xDropTmp){
                        $.fn.xDropTmp[i].til.removeClass(opts.activeClass);
                        $.fn.xDropTmp[i].con.hide();
                    }
                    node.addClass(opts.activeClass);
                    dropContent.show();
                },
                dHide = function(){
                    node.removeClass(opts.activeClass);
                    dropContent.hide();
                };

            node.bind('click',function(e){
                $.fn.xDropTmp[node.attr('drop')] = {};
                $.fn.xDropTmp[node.attr('drop')].til = node;
                $.fn.xDropTmp[node.attr('drop')].con = $(node.attr('drop'));
                e.stopPropagation();
                e.preventDefault();
                (!node.hasClass(opts.activeClass)) ? dShow() : dHide();
                setPosition();
                if(opts.callback){
                    opts.callback();
                }
            });
            dropContent.find('a').click(function(e){
                e.stopPropagation();
            });
            dropContent.find('input').bind('click',function(){
                return false;
            });
            
            $(document).bind('click',function(e){
                dHide();
            });
        },
        xDropTmp: {}
    });
})(jQuery);

(function($){
    $.extend($.fn, {
        xAutocomplete: function(opts){
            opts = $.extend({}, 
                {  
                    node: null,
                    delay: 0,
                    param: null,
                    source: 'su',
                    fix: {
                        x: 0,
                        y: 0
                    },
                    extSource: ["示例"],
                    border: true,
                    onchange: null,
                    onselect: null,
                    extBtn: null
                }, opts);

            var keys = { 
                RETURN: 13, 
                BACKSPACE: 8, 
                SPACE: 32,
                UP: 38,
                DOWN: 40,
                ESC: 27
            };

            var self = this,
                cacheData = {},
                currentData = [],
                lastKeyPress = null,
                lastSelectedValue = null,
                active = false,//当有自动完成的值时
                local = $.isArray(opts.source),
                mouseInSelect = false,
                timeOutActive = null,
                lastProcessValue = null,
                menuContainer = null,
                node = opts.node,
                form = $(node).parents('form'),
                delay = opts.delay,
                extBtn = opts.extBtn,
                extEvent = false;

            var init = function(){
                    //bind event
                    node.bind('keydownEvent', function(e, event){
                        _keydownEvent.apply(self, [event]);
                    }).bind('blurEvent', function(){
                        _blurEvent.apply(self);
                    }).bind('focusEvent',function(){
                        _focusEvent.apply(self);
                    }).attr('autocomplete', 'off');
                    //trigger event
                    node.keyup(function(e){
                        node.trigger('keydownEvent', [e]);
                    }).blur(function(e){
                        node.trigger('blurEvent');
                    }).click(function(e){
                        node.trigger('focusEvent');
                    });
                    if(extBtn != null){
                        extBtn.bind('click', function(e){
                            extBtn.find('.hot-arr').addClass('up');
                            extBtn.find('.hot-num').hide();
                            var hotNewTime = new Date().getTime();
                            tools.cookie.set('__hotNewNum_', hotNewTime);
                            extEvent = true;
                            if(active){
                                _blurEvent();
                            }
                            else{
                                activeAutoComplete();
                            }
                            e.preventDefault();
                            e.stopPropagation();
                        });
                    }
                    $('body').bind('click',_blurEvent); 
                    form.bind('submit', function(){
                        if($.trim(node.val()) == ''){
                            node.focus();
                            return false;
                        }
                    });
                },
                dealData = function(data){
                    return data;
                },
                isResult = function(data){
                    return data.length;
                },
                destroy = function(){
                    node.unbind('keydownEvent').unbind('blurEvent').removeAttr('autocomplete');
                },
                _keydownEvent = function(e){
                    extEvent = false;
                    //var self = this;
                    lastKeyPress = e.keyCode;
                    switch (lastKeyPress) {
                        case keys.UP:
                            e.preventDefault();
                            if (active) {
                                focusPrev();
                            }
                            break;
                        case keys.DOWN:
                            e.preventDefault();
                            if (active) {
                                focusNext();
                            }
                            else {
                                activeAutoComplete();
                            }
                            break;
                        case keys.RETURN:
                            e.preventDefault();
                            if(active) {
                                selectCurrent();
                                return false;
                            }
                            break;
                        case keys.ESC:
                            //esc
                            e.preventDefault();
                            if(active) {
                                finish();
                            }
                            break;
                        default:
                            activeAutoComplete();
                    }
                },
                _blurEvent = function(){
                    if(!mouseInSelect){
                        finish();
                        if(extEvent){
                           extBtn.find('.hot-arr').removeClass('up'); 
                        }
                    }
                },
                _focusEvent = function(){
                    if($.trim(node.val()) != '')
                    activeAutoComplete();
                },
                activeAutoComplete = function(){
                    if(timeOutActive){
                        clearTimeout(timeOutActive);
                    }
                    if(delay && !local){
                        timeOutActive = setTimeout(function(){
                            activeNow();
                        }, delay);
                    }
                    else {
                        activeNow();
                    }
                },
                activeNow = function(){
                    var value = $.trim(node.val());
                    if(value == '' && !extEvent){
                        finish();
                        return;
                    }
                    if (value != lastSelectedValue) {
                        lastProcessValue = value;
                        getData(value);
                    }
                    getData(value);
                },
                finish = function(){
                    active = false;
                    menuContainer && menuContainer.hide();
                },
                getData = function(value){
                    if (typeof opts.source == 'string') {
                        value = encodeURIComponent(value);
                        var url = _autoData.url + value + '&jsonpCallback=?';
                        if(extEvent){
                            if(!_autoData.extData){
                             //   alert('热门推荐数据有误qq！');
                                return;
                            }
                            parseData(_autoData.extData);
                        }
                        else{
                            $.ajax({
                                url: url,
                                dataType: 'json',
                                success: function(r){
                                    currentData = r;
                                    parseData(currentData);
                                }
                            });
                        }
                        
                    }
                },
                parseData = function(data){
                    if(isResult(data)){
                        active = true;
                        createDom();
                        position();
                        var data = dealData(data);
                        renderMenu(data, lastProcessValue);
                    }
                    else{
                        finish();
                    }
                },
                createDom = function(){
                    if (menuContainer) {
                        return;
                    }
                    else {
                        var div = $('<div/>').addClass('autocomplete-container'), 
                            ul = $('<ul/>');
                        menuContainer = div;
                        menuContainer.append(ul);
                        menuContainer.appendTo(document.body);
                        menuContainer.delegate('li', 'mouseover', function(){
                            menuContainer.find('li').removeClass('autocomplete-hover');
                            $(this).addClass('autocomplete-hover');
                            mouseInSelect = true;
                            var val = $('li.autocomplete-hover',menuContainer).data('value');                           
                        }).delegate('li', 'mouseout', function(){
                            mouseInSelect = false;
                        }).delegate('li', 'click', function(){
                            lastSelectValue = $(this).data('value');
                            mouseInSelect = false;
                            finish();
                            goPage($(this).attr('id'), $(this).attr('type'),$(this).attr('isgame'));
                            //node.val(lastSelectValue);
                            //$(node).parents('form').submit();
                        });
                        menuContainer.click(function(){return false;});
                    }
                },
                renderMenu = function(data, value){
                    var ul = menuContainer;
                    ul.empty();
                    if(!extEvent){
                        var softArr = [],
                            appArr = [],
                            articleArr = [],
                            newsArr = [],
                            glArr = [];
                        for(var i=0;i<data.length;i++){
                            if(data[i].type == 1){
                               softArr.push(data[i]); 
                            }
                          /*  if(data[i].type == 2){
                               appArr.push(data[i]); 
                            }*/
                            if(data[i].type == 6){
                                appArr.push(data[i]); 
                             }
                            if(data[i].type == 7){
                                appArr.push(data[i]); 
                             }
                            if(data[i].type == 3){
                               articleArr.push(data[i]); 
                            }
                            if(data[i].type == 4){
                               newsArr.push(data[i]); 
                            }
                            if(data[i].type == 5){
                               glArr.push(data[i]); 
                            }
                        }
                        var liStr = '';
                        var bulidSu = function(d, type){
                            var typeName,
                                dStr = null;
                            if(type == 1) typeName = '软件';
                           // if(type == 2) typeName = '应用';
                            if(type == 6) typeName = '应用';
                            if(type == 7) typeName = '应用';
                            if(type == 3) typeName = '教程';
                            if(type == 4) typeName = '新闻';
                            if(type == 5) typeName = '攻略';
                            if(d.length){
                                var searchItem = $('<div class="search-item"><span class="til">'+typeName+'</span></div>'),
                                    searchUl = $('<ul class="search-li"></ul>');
                                for(var a=0;a<d.length;a++){
                                    var s = d[a],
                                        li = $('<li/>').data('value', s.title).attr({'id': s.softid, 'type': s.type,'isgame': s.isgame}),
                                        sinStr = s.title.replace(value, '<b class="imp">' + value + '</b>');
                                    var tui = (s.tui == '1') ? '<em>热</em>' : '';
                                    li.html('<img class="ico" width="16" src="'+_siteRoot+'/'+s.ico+'" />'+sinStr + tui);
                                    searchUl.append(li);
                                    searchItem.append(searchUl);
                                }
                                dStr = searchItem;
                            }
                            return dStr;
                        }
                        var softHtml = bulidSu(softArr, 1),
                           // appHtml = bulidSu(appArr, 2),
                        appHtml = bulidSu(appArr, 6),
                        appHtml = bulidSu(appArr, 7),
                            artHtml = bulidSu(articleArr, 3),
                            newsHtml = bulidSu(newsArr, 4),
                            glHtml = bulidSu(glArr, 5);
                        menuContainer.append(softHtml).show();
                        menuContainer.append(appHtml).show();
                        menuContainer.append(artHtml).show();
                        menuContainer.append(newsHtml).show();
                        menuContainer.append(glHtml).show();
                    }
                    else{
                        var searchHot = $('<ul class="search-hot"></ul>');
                        $.each(data, function(i, item){
                            var li = $('<li/>').data('value', item.title).attr({'id': item.softid, 'type': item.type,'isgame': item.isgame}),
                                keyStr = item.title,
                                newStr = '';
                            if(item.isnews == 1){
                                newStr = '<i></i>';
                            }
                            li.html('<img class="ico" width="16" src="'+_siteRoot+'/'+item.ico+'" />'+keyStr+newStr);
                            searchHot.append(li);
                        });
                        menuContainer.append(searchHot).show();
                    }
                },
                position = function(){
                    menuContainer.css('position', 'absolute');
                    var offset = node.offset(), 
                        height = node.outerHeight(), 
                        width = node.outerWidth(),
                        border = opts.border ? 2 : 0;
                    menuContainer.css({
                        top: offset.top + height + opts.fix.y,
                        left: offset.left + opts.fix.x,
                        width: width - border
                    });
                },
                //移动选中
                focus = function(index){
                    var items = $('li', menuContainer), hasSelect = false;
                    if (items.length) {
                        for (var i = 0; i < items.length; i++) {
                            if (items.eq(i).hasClass('autocomplete-hover')) {
                                selectItem(i + index);
                                hasSelect = true;
                                return;
                            }
                        }
                        if (!hasSelect) {
                            selectItem(0);
                        }
                    }
                },
                focusNext = function(){
                    focus(1);
                },
                focusPrev = function(){
                    focus(-1);
                },
                selectItem = function(index){
                    var items = $('li', menuContainer);
                        index = index < 0 ? items.length - 1 : index;
                    index = index == items.length ? 0 : index;
                    items.removeClass('autocomplete-hover');
                    items.eq(index).addClass('autocomplete-hover');
                    var val = $('li.autocomplete-hover', menuContainer).data('value');
                    node.val(val);
                    if (lastSelectedValue && !lastSelectedValue != val) {
                        if(opts.onchange)
                            opts.onchange(val);
                    }
                    lastSelectedValue = val;
                },
                selectCurrent = function(){
                    var val = $('li.autocomplete-hover',menuContainer).data('value');
                    if(val != '' && val != undefined){
                        node.val(val);
                        lastSelectValue = val;
                        if(opts.onselect){
                            onselect(val);
                        }
                        var liHover = menuContainer.find('li.autocomplete-hover');
                        goPage(liHover.attr('id'), liHover.attr('type'),liHover.attr('isgame'));
                        finish();
                    }
                },
                goPage = function(id, type,isgame){
                    var curUrl = _siteRoot+'/',
                        curType = 'html/';
                    if(type == 3){
                        curType = 'jiaocheng/';
                    }
                    if(type == 4){
                        curType = 'news/';
                    }
                    if(type == 5){
                        curType = 'gonglue/';
                    }
                    if(type == 6){
                    	curUrl = 'http://a.xiazaiba.com/';
                    	if(isgame==0){
                    		curType = 'app/';
                    	}else{
                    		curType = 'game/';
                    	}
                    }
                    if(type == 7){
                    	curUrl = 'http://i.xiazaiba.com/';
                    	if(isgame==0){
                    		curType = 'app/';
                    	}else{
                    		curType = 'game/';
                    	}
                    }
                    location.href = curUrl+curType+id+'.html';
                };
            init();
        }
    });

})(jQuery);

/*
 * Lazy Load - jQuery plugin for lazy loading images
 * Version:  1.7.2
 */
(function(a,b){$window=a(b),a.fn.lazyload=function(c){function f(){var b=0;d.each(function(){var c=a(this);if(e.skip_invisible&&!c.is(":visible"))return;if(!a.abovethetop(this,e)&&!a.leftofbegin(this,e))if(!a.belowthefold(this,e)&&!a.rightoffold(this,e))c.trigger("appear");else if(++b>e.failure_limit)return!1})}var d=this,e={threshold:0,failure_limit:0,event:"scroll",effect:"show",container:b,data_attribute:"original",skip_invisible:!0,appear:null,load:null};return c&&(undefined!==c.failurelimit&&(c.failure_limit=c.failurelimit,delete c.failurelimit),undefined!==c.effectspeed&&(c.effect_speed=c.effectspeed,delete c.effectspeed),a.extend(e,c)),$container=e.container===undefined||e.container===b?$window:a(e.container),0===e.event.indexOf("scroll")&&$container.bind(e.event,function(a){return f()}),this.each(function(){var b=this,c=a(b);b.loaded=!1,c.one("appear",function(){if(!this.loaded){if(e.appear){var f=d.length;e.appear.call(b,f,e)}a("<img />").bind("load",function(){c.hide().attr("src",c.data(e.data_attribute))[e.effect](e.effect_speed),b.loaded=!0;var f=a.grep(d,function(a){return!a.loaded});d=a(f);if(e.load){var g=d.length;e.load.call(b,g,e)}}).attr("src",c.data(e.data_attribute))}}),0!==e.event.indexOf("scroll")&&c.bind(e.event,function(a){b.loaded||c.trigger("appear")})}),$window.bind("resize",function(a){f()}),f(),this},a.belowthefold=function(c,d){var e;return d.container===undefined||d.container===b?e=$window.height()+$window.scrollTop():e=$container.offset().top+$container.height(),e<=a(c).offset().top-d.threshold},a.rightoffold=function(c,d){var e;return d.container===undefined||d.container===b?e=$window.width()+$window.scrollLeft():e=$container.offset().left+$container.width(),e<=a(c).offset().left-d.threshold},a.abovethetop=function(c,d){var e;return d.container===undefined||d.container===b?e=$window.scrollTop():e=$container.offset().top,e>=a(c).offset().top+d.threshold+a(c).height()},a.leftofbegin=function(c,d){var e;return d.container===undefined||d.container===b?e=$window.scrollLeft():e=$container.offset().left,e>=a(c).offset().left+d.threshold+a(c).width()},a.inviewport=function(b,c){return!a.rightofscreen(b,c)&&!a.leftofscreen(b,c)&&!a.belowthefold(b,c)&&!a.abovethetop(b,c)},a.extend(a.expr[":"],{"below-the-fold":function(c){return a.belowthefold(c,{threshold:0,container:b})},"above-the-top":function(c){return!a.belowthefold(c,{threshold:0,container:b})},"right-of-screen":function(c){return a.rightoffold(c,{threshold:0,container:b})},"left-of-screen":function(c){return!a.rightoffold(c,{threshold:0,container:b})},"in-viewport":function(c){return!a.inviewport(c,{threshold:0,container:b})},"above-the-fold":function(c){return!a.belowthefold(c,{threshold:0,container:b})},"right-of-fold":function(c){return a.rightoffold(c,{threshold:0,container:b})},"left-of-fold":function(c){return!a.rightoffold(c,{threshold:0,container:b})}})})(jQuery,window);

//点击软件缩略图放大效果
var showBigPic = function(picUrl){
    var e = $('<div/>');
    e.attr('id', 'mask').css({
        width: document.documentElement.clientWidth+"px",
        height: $(document).height()+"px",
        backgroundColor: "black",
        position: "absolute",
        zIndex: 99990,
        top: 0,
        left: 0,
        opacity: "0.5"
    });
    
    var p = $("<div/>");
    p.attr('id','bigPicBo').html('图片加载中，请稍等...').css({
        position: "absolute",
        top: document.documentElement.clientHeight/2+document.documentElement.scrollTop+document.body.scrollTop+"px",
        left: "50%",
        padding: "3px",
        border: "1px solid #D8D8D8",
        background: "#FFF",
        zIndex: 99999
    });
    

    var closeBtn = $("<div/>");
    closeBtn.css({
        width: "20px",
        height: "20px",
        background: "url(http://www.xiazaiba.com/static/images/closePic.gif) no-repeat",
        position: "absolute",
        right: 0,
        top: 0,
        cursor: "pointer"
    });
    closeBtn.bind('click',hideBigPic);
    
    e.appendTo('body');
    p.appendTo('body');
    
    var imageLoader = new Image();
    imageLoader.onload = function(){
        var clientW = document.documentElement.clientWidth,
            clientH = document.documentElement.clientHeight,
            w = imageLoader.width,
            h = imageLoader.height,
            a ='';
        /*if(w >= 800){
            h = h/w*800;
            w = 800;
        }*/
        if(w > clientW){
            h = h/w*(clientW-100);
            w = clientW-100;
            a = "width='"+w+"'";
        }
        else if(h > clientH){
            w = w/h*(clientH-100);
            h = clientH-100;
            a = "height='"+h+"'";
        }
        
        p.css({
            width: w+"px",
            height: h+"px",
            marginLeft: -w/2+"px",
            marginTop: -h/2+"px"
        });
        p.html("<img "+a+" src='"+picUrl+"'>");
        closeBtn.appendTo(p);
    }
    imageLoader.src = picUrl;

    window.onscroll = function(){
        p.css({
            top: document.documentElement.clientHeight/2 + document.documentElement.scrollTop + document.body.scrollTop + "px"
        });
    }
    
    function hideBigPic(){
        e.remove();
        p.remove();
        imageLoader = null;
    }
    e.bind('click', hideBigPic);
}

/* 文章投票 */
var artDigger = function(artId, commType, dType, elem){
    if(artId == undefined) return;
    var url = _new_siteRoot +'/route.php?ac=dox';
    $.post(url,'softid='+artId+'&subject='+commType+'&forx='+dType,function(data){
        if(data == 1){
            var numObj = $(elem).find('.num'),
                num = parseInt(numObj.text());
            numObj.text(num+1);
        }
        else if(data == -1){
            alert('您已经表态过了！')
        }
        else{
            alert('网络出错了，请重试！')
        }
    });
}
/* 统计一下 */
var artTongJi = function(softid,commType){
	
    if(softid == undefined) return;
    var url = _new_siteRoot + '/route.php?ac=stathits'+'&softid='+softid+'&subject='+commType;
    $.getScript(url);
	//window['stathits'] = function(data){}
	/*  $.post(url,'softid='+softid+'&subject='+commType);*/
    
}
/* 获取相关字段 */
var getArtDuan = function(softid,commType,dType,elem){
	if(softid == undefined || commType ==undefined) return;
    var url = _new_siteRoot +'/route.php?ac=getstat'+'&softid='+softid+'&subject='+commType+'&forx='+dType;
    $.getScript(url);
	window['getstat'] = function(data){
		$(elem).find('.num').html(data);
	}
   /* $.post(url,'softid='+softid+'&subject='+commType+'&forx='+dType,function(data){
    	alert(data);
        $(elem).find('.num').html(data);
    })*/
  
}

/* 美女图片滚动 */
var mmScrollShow = function(o){
    var box = $(o.elem),
        item = box.find('li'),
        len = item.length,
        num = len/o.setup,
        curNum = 1,
        prev = box.find(o.prev),
        next = box.find(o.next),
        autoTimer = null,
        autoPlay = function(){
            if(curNum + 1 > num){
                go(1);
            }
            else{
                go(curNum + 1);
            }
        };
    
    if(num > 1){
        num = Math.ceil(num);
        var go = function(idx){
            if(autoTimer)clearInterval(autoTimer);
            item.hide();
            item.slice((idx-1)*o.setup,o.setup*idx).show();
            curNum = idx;
            if(o.auto)autoTimer = setInterval(autoPlay, o.timeout);
        }
        go(curNum);
        prev.click(function(e){
            e.preventDefault();
            --curNum;
            if(curNum == 0){
                curNum = num;
            }
            go(curNum);
        });
        next.click(function(e){
            e.preventDefault();
            ++curNum;
            if(curNum > num){
                curNum = 1;
            }
            go(curNum);
        });

        if(autoTimer)clearInterval(autoTimer);
        if(o.auto)autoTimer = setInterval(autoPlay, o.timeout);
    }
}

// 83133
var mmPic = function(data){
    if(!data.length)return;
    var len = data.length,
        str = '';
    if(len >= 20) len = 20;
    for(var i=0; i<len; i++){
        str+='<li><a href="'+data[i].url+'" target="_blank"><img height="90" src="'+data[i].thumb+'" alt="'+data[i].title+'"><span class="til">'+data[i].title+'</span></a></li>';
    }
    $('#cmt_mm_box').find('ul').html(str);

    mmScrollShow({
        elem: '#cmt_mm_box',
        setup: 5,
        prev: '.btn-prev', 
        next: '.btn-next',
        timeout: 3500,
        auto: true
    });
}

var extQiqu = function(data, elem){
    if(!data.length)return;
        var len = data.length,
        str = '<div class="sider-title"><span class="mark">奇闻趣事</span><a href="http://www.83133.com/" target="_blank" class="more">更多&raquo;</a></div><ul class="qiqu-list clearfix">';
    if(len > 10) len = 10;
    for(var i=0; i<len; i++){
        if(i<2){
            str+='<li class="img-item"><a href="'+data[i].url+'" target="_blank"><img height="90" src="'+data[i].thumb+'" alt="'+data[i].title+'"><span class="til">'+data[i].title+'</span></a></li>';
        }
        else{
            str+='<li class="txt-item"><a href="'+data[i].url+'" target="_blank"><span class="til">'+data[i].title+'</span></a></li>';
        }
    }
    str+='</ul>';
    $('#ext_content_1').html(str);
}

/* u77u */
var u77ugame = function(data){
    if(!data.length) return;
    var len = data.length
    if(len > 12) len = 12;
    var u77uStr = '<div class="sider-title"><span class="mark">好玩的游戏</span><a href="http://www.u77u.com/" target="_blank" class="more">更多&raquo;</a></div><div class="side-ext-box"><ul class="app-list clearfix">';
    for(var i=0;i<len;i++){
        u77uStr += '<li><a href="'+data[i].url+'" target="_blank" title="'+data[i].title+'"><img alt="'+data[i].title+'" src="'+data[i].pic+'"><span>'+data[i].title+'</span></a></li>';
    }
    u77uStr+='</ul></div>';
    $('#ext_content_2').html(u77uStr);
}

function SetCwinHeight(){
    var iframeid=document.getElementById('com_iframe'); //iframe id
    if (document.getElementById){
        if (iframeid && !window.opera){
            if (iframeid.contentDocument && iframeid.contentDocument.body.offsetHeight){
                iframeid.style.height = iframeid.contentDocument.body.offsetHeight+ 10 + 'px';
            }else if(iframeid.Document && iframeid.Document.body.scrollHeight){
                iframeid.style.height = iframeid.Document.body.scrollHeight+10+'px';
            }
        }
    }
}

/* 专题内容 */
/*if(isNeeded('#zt_show_con')){
    var ztCon = $('#zt_show_con'),
        ztBtn = $('#zt_show_btn'),
        ztHeight = ztCon.outerHeight();
    if(ztHeight >= 48){
        ztBtn.parent().show();
        ztCon.css('height', 48);
    }
    ztBtn.click(function(e){
        e.preventDefault();
        var rel = $(this).attr('rel');
        if(rel == 0){
            ztCon.stop().animate({height: ztHeight});
            $(this).attr('rel', 1).html('收起详情&uarr;')
        }
        else{
            ztCon.stop().animate({height: 48});
            $(this).attr('rel', 0).html('全部详情&darr;') 
        }
    })
}*/

function do_login(gurl){
    gurl = gurl + encodeURIComponent(location.href);
    location.href = gurl;
}
function do_logout(gurl){
    gurl = gurl + encodeURIComponent(location.href);
    location.href = gurl;
}

var _autoData = {};
var rd = new Date().getTime();
_autoData.url = 'http://so.xiazaiba.com/route.php?ct=search_new&ac=auto&is_ajax=1&q=';
_autoData.hotUrl = 'http://so.xiazaiba.com/route.php?ct=search_new&ac=tui_soft&is_ajax=1&jsonpCallback=?';
_autoData.extData = null;

/* 站群接口 */
/* PC下载页评论下方 */
var cb83133 =  function(data){

    if(isNeeded('#cmt_mm_box')){
        mmPic(data);
    }
    /* 列表，文章右侧下方 */
    if(isNeeded('#ext_content_1')){
        extQiqu(data);
    }
}

$.getScript('http://www.83133.com/api/999datacb83133.js');

if(isNeeded('#ext_content_2')){
    $.getScript('http://www.u77u.com/e/api/game.js');
}

$('.art-content').find('img').each(function(){
    var _img_w = $(this).width();
    if(_img_w > 660){$(this).width(660);}
});

/* 畅言评论要用的参数 */
var hasCMT = false, cmtNum = 0, cmtTimer = null;

$(function(){
    $('img[data-original]').lazyload({
        effect:'fadeIn'
    });
    if(isNeeded('#search_key')){
        var hotBtn = $('#hot_auto_btn');
            hotNum = hotBtn.find('.hot-num'),
            num = 0;
        /* 新闻更新数量 */
        $.getJSON(_autoData.hotUrl, function(data){
            for(var i=0;i<data.length;i++){
                if(data[i].isnews == 1){
                    num++;
                }
            }
            _autoData.extData = data;
            hotNum.text(num);

            var _hotNew = tools.cookie.get('__hotNewNum_'),
                _hotCookie = _hotNew,
                nowTime = new Date().getTime(),
                lastTime = _hotNew == undefined ? nowTime - 3600000 : _hotNew;
            if((nowTime - lastTime >= 3600000 || _hotCookie == undefined) && num != 0){
                hotNum.show();
            }
        });
        
        $.fn.xAutocomplete({
            node: $('#search_key'),
            extBtn: hotBtn
        });
        
        $("#search_key").bind('focus', function(){
            $(this).addClass('search-wrod-focus');
        }).bind('blur', function(){
            $(this).removeClass('search-wrod-focus');
        });
    }

    

    if(isNeeded('#drop_login_box')){
        var loginStr = '<div class="til">StartOS论坛用户可直接登录</div><form action="http://sso.999.com/?ac=login" method="post" rel="nofollow"> <input name="login[gotourl]" id="gotourl" type="hidden" value="/" /> <div class="login-item"><input type="text" name="login[username]" id="username" /></div> <div class="login-item"><input type="password" name="login[password]" id="password" /></div> <div class="clearfix"> <a href="http://bbs.startos.com/register.php" class="fl" rel="nofollow">新注册用户</a> <a href="http://bbs.startos.com/sendpwd.php" class="fr" rel="nofollow">忘记密码？</a> </div> <div class="login-item"><button type="submit">登 录</button></div> </form>';
       
        $('#drop_login_box').html(loginStr);
        
        $("#gotourl").val(location.href);
        /*$.get("/route.php?ac=ajaxstate", function(data){
            $('#user_info_area').html( data );
        });*/
        $.getScript(_new_siteRoot+"/route.php?ac=ajaxstate");
    	window['route'] = function(data){
    		
    		$('#user_info_area').html( data );
    		$(function(){
    		    if(isNeeded('#drop_login_box')){
    		        $.fn.xDrop({
    		            node: $('[drop=\"#drop_login_box\"]'),
    		            fix: {
    		                x: -20,
    		                y: 15
    		            }
    		        })
    		    }

    		});
    		
    	}
    	

     /*   $.ajax({  
            type : "get",  
            url : _new_siteRoot +"/route.php?ac=ajaxstate",
            dataType: 'JSONP',
            success : function(res){
               alert(1);
            }  
        });*/
        
    }
    // 二级菜单
    if(isNeeded('#j_main_nav')){
        var navTimer;
        var hideNav = function(){
            if(navTimer) clearTimeout(navTimer);
            navTimer = setTimeout(function(){
                $('.sub-menu').hide();
            }, 200);
        }
        $('#j_main_nav').find('li').each(function(){
            $(this).bind('mouseover',function(){
                if(navTimer) clearTimeout(navTimer);
                var rel = $(this).attr('rel');
                $('.sub-menu').hide();
                $('.j-sub-menu-'+rel).show();
            });
            $(this).bind('mouseleave', hideNav);

            $('.sub-menu').bind('mouseover',function(){
                if(navTimer) clearTimeout(navTimer);
            });
            $('.sub-menu').bind('mouseleave', hideNav);
        });
        
        $('.nav-more-box').hover(
            function(){$(this).addClass('nav-more-hover')},
            function(){$(this).removeClass('nav-more-hover')}
        );

        var snavTimer;
        var hideSnav = function(){
            if(snavTimer) clearTimeout(snavTimer);
            snavTimer = setTimeout(function(){
                $('.s-nav-mark').hide();
                $('.s-nav-mark p').hide();
            }, 200);
        }
        $('.s-nav-187').find('a').each(function(i){
            $(this).bind('mouseover',function(){
                if(snavTimer) clearTimeout(snavTimer);
                $('.s-nav-mark').show();
                $('.s-nav-mark p').eq(i).show().siblings().hide();
            });
            $(this).bind('mouseleave', hideSnav);

            $('.s-nav-mark').bind('mouseover',function(){
                if(snavTimer) clearTimeout(snavTimer);
            });
            $('.s-nav-mark').bind('mouseleave', hideSnav);
        });
    }
    if(isNeeded('#j_gotop')){
        $.fn.xGotop({
            node: $('#j_gotop')
        })
    }
    if(isNeeded('#j_index_focus_img')){
        var idxFoc = $('#j_index_focus_img');
        $.fn.xTaber({
            content: idxFoc,
            tab: idxFoc,
            auto: true,
            style: 'left',
            timeout: 5000,
            prev: idxFoc.find('.prev'),
            next: idxFoc.find('.next')
        });
    }

    if(isNeeded('.onlytab')){
        $('.onlytab').each(function(){
            $.fn.xTaber({
                content: $(this),
                tab: $(this),
                style: 'none'
            });
        });
    }

    if(isNeeded('.onlyhover')){
        $('.onlyhover').each(function(){
            $.fn.xHover({
                node: $(this).find('li'),
                type: 3,
                delay: 50
            });
        });
    }
    
    if(isNeeded('#j_star_bar')){
        var old;
        var innerWidth = $('#j_star_bar').find('i').css('width');
        if((innerWidth != '' || innerWidth != undefined ) && innerWidth != '0px'){
            old = innerWidth;
        }
        var oldScore = $('#j_star_score').html();
        var resetScore = function(){
            $('#j_star_bar').find('i').css('width', old);
            $('#j_star_score').html(oldScore);
        }
        var _softid = $('#j_star_bar').attr('rel');
        if(_softid == undefined) _softid = 1;
        $.fn.xRater({  
            node: $('#j_star_bar'), //节点
            callback: function(result){
                $.get('/route.php?ac=vote&type=rank&softid='+_softid+'&rank='+result,function(data){
                    if(data == 1){
                        alert('成功');
                        return;
                    }
                    else if(data == -2){
                        alert('已评分');
                    }
                    else if(data == -1){
                        alert('错误');
                    }
                    else if(data == 0){
                        alert('网络繁忙');
                    }
                    resetScore();
                });

            } // result 为返回的结果            
        });
    }

    $('.rela-item').each(function(){
        if(!$(this).find('.rela-sub-list a').length){
            $(this).removeClass('has-list');
        }
    });

    $('.has-list').hover(
        function(){
            $(this).addClass('rela-hover');
        },
        function(){
            $(this).removeClass('rela-hover');
        }
    );

    $('.art-other').hover(
        function(){$(this).addClass('art-other-hover')},
        function(){$(this).removeClass('art-other-hover')}
    );
    
    // 软件介绍 
    if(isNeeded('#soft-intro-wrap')){
        var intrWrap = $('#soft-intro-wrap'),
            intrHeight = intrWrap.find('table').height(),
            intrMore = $('#show-more-end'),
            intrBtn = $('#more-intro-btn');
        if(intrHeight > 230){
        	intrMore.show();
            $("#more-intro").show();
            intrWrap.height(230);
        }
        //软件简介收展
        intrBtn.toggle(
            function(){
            	intrWrap.css({'max-height':'none'});
                $(this).html('收起简介');
                intrWrap.stop().animate({height: intrHeight});
                intrMore.hide();
            },
            function(){
                $(this).html('更多简介');
                intrMore.show();
                intrWrap.stop().animate({height: 230});
            }
        );
    }

		$('.more-his').on('click', function(){
			var staElm = $(this),
				state = staElm.attr('rel'),
				histBd = $('#hist_wrap');
			staElm.toggleClass('more-his-open');
			if(state == 0){
				histBd.css({'height':'auto'});
				staElm.attr('rel',1);
			}
			else{
				histBd.css({'height':'36px'});
				staElm.attr('rel',0);
			}
		});

    //查看大图
    $('.previewimg').click(function(){
        var bigPicUrl = $(this).attr('rel');
        if(!bigPicUrl) return;
        showBigPic(bigPicUrl);
    });

	//评论
    $('#j_cmt_tab').find('li').bind('click', function(){
        var id = $(this).attr('rel');
        $('#j_cmt_hot, #j_cmt_post').hide();
        $(this).addClass('current').siblings().removeClass('current');
        $('#'+id).show();
        if(id == 'j_cmt_post'){
            var iframe = $('#com_iframe');
            var url = iframe.attr('data');
            if (url == undefined)return;
            var src = iframe.attr('src');
            if(src == '' || src == undefined){
                iframe.attr('src', url);
                iframe.load(SetCwinHeight);
            }
        }
    });

    if(isNeeded('#com_iframe')){
        var iframe = $('#com_iframe'),
            src = iframe.attr('src');
        //if(iframe.parent().attr('id') == 'j_cmt_post')return;
        if(src == undefined){
            src = iframe.attr('data');
        }
        setTimeout(function(){
            iframe.attr('src', src+'&t');
            iframe.load(SetCwinHeight);
        }, 1000);
    }

    /* 畅言评论的相关功能 */
    if($('#SOHUCS').get(0)){
        var chkCMT = function(){
            hasCMT = $('#list_sohu').get(0);
            if(cmtNum <= 10){
                if(!hasCMT){cmtNum ++;}
                else{
                    clearTimeout(cmtTimer);
                    var tabli = '<li class="new-tab"><strong class="title-name-gw title-name-bg">最新评论</strong></li><li class="hot-tab"><strong class="title-name-gw title-name-bg">热门评论</strong></li>';
                    $('#list_sohu').find('.block-title-gw>ul').html(tabli);
                    var newTab = $('#list_sohu').find('.list-newest-w'),
                        hotTab = $('#list_sohu').find('.list-hot-w'),
                        liTab = $('#list_sohu').find('.block-title-gw>ul>li'),
                        cmtPage = $('#page_sohu');
                    if(hotTab.get(0)){
                        hotTab.hide();
                        liTab.on('click',function(){
                            if($(this).hasClass('new-tab')){
                                newTab.show();
                                hotTab.hide();
                                cmtPage.show();
                            }
                            else{
                                newTab.hide();
                                hotTab.show();
                                cmtPage.hide();
                            }
                        });
                    }
                    else{
                        $('#list_sohu').find('.block-title-gw>ul>.hot-tab').hide();
                    }
                    
                    /* 去掉底下评论框 */
                    $(window).bind('scroll', function(){
                        if(isNeeded('#changyan_floatbar_wrapper'))
                        $('#changyan_floatbar_wrapper').hide().remove();
                    })
                    $('#changyan_floatbar_wrapper').hide().remove();
                }
            }
            else{
                clearTimeout(cmtTimer);
                return false;
            }
        }
        cmtTimer = setTimeout(chkCMT,500);
    }

    /* 教程列表 */
    if(isNeeded('#jc_guide_box')){
        var box = $('#jc_guide_box');
        box.find('.first').click(function(){
            var p = $(this).parent();
            if(p.hasClass('guide-current')){
                p.removeClass('guide-current');
            }
            else{
                p.addClass('guide-current');
            }
        });

        box.find('.cur').parents('.guide-item').addClass('guide-current');

        $('#jc_more').click(function(e){
            e.preventDefault();
            if(!$(this).hasClass('jc-oo')){
                box.find('.guide-item').addClass('guide-current');
                $(this).text('全部收起').addClass('jc-oo');
            }
            else{
                box.find('.guide-item').removeClass('guide-current');
                $(this).text('全部展开').removeClass('jc-oo');
            }
        });
    }
});


//区域广告 (目前针对右侧二维码广告)
var fckNum = null,
goAds = function(data){
	  if(data) {$("#float_qr").show();}


}
$.getScript(_new_siteRoot +"/route.php?ct=stat&ac=show_ads_test&id=111");
$.getScript(_new_siteRoot+"/route.php?ct=stat&ac=show_detail_ads&id=65");
/*$.ajax({  
    type : "get",  
    url : "http://www.xiazaiba.com/route.php?ct=stat&ac=show_ads&id=111",  
    data : "",  
    async : false,  
    success : function(res){
        fckNum = res;     
        document.write(goAds(fckNum));
    }  
});*/
