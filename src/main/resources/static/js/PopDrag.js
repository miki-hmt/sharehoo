if(!Function.prototype.bind) {  
        Function.prototype.bind = function(o,args) {  
            var _self = this;  
            return function() {  
                return _self.apply(o,[].concat(args));  
            };  
        };  
    }  
var EventUtil = {  
        _$:function(id) {  
            return typeof id === 'string' ? document.getElementById(id) : id;  
        },  
        addEvent:function(el,type,handler) {  
            return el.addEventListener ? el.addEventListener(type,handler,false) : el.attachEvent('on'+type,handler);  
        },  
        removeEvent:function(el,type,handler) {  
            return el.removeEventListener ? el.removeEventListener(type,handler,false) : el.detachEvent('on'+type,handler);  
        },  
        getViewPort:function(w) {//获取视窗宽度和高度  
            //使用指定的窗口，如果缺省则为当前窗口  
            w = w || window;  
            /* 
             *当没有滚动条时，document.documentElement.clientWidth和window.innerWidth的值是一样的 
             *出现滚动条时，前者的值比后者的小，差即为滚动条所占的宽度，做遮罩层或弹出层时，前者更为精确 
             */  
            //IE8及以下版本的IE系列未实现该方法  
//            if(w.innerWidth != null) {  
//                return {  
//                    w:w.innerWidth,  
//                    h:w.innerHeight  
//                };  
//            }  
            var d = w.document;  
            //IE标准模式，即声明了xhtml1.0头  
            if(document.compatMode == 'CSS1Compat') {  
                return {  
                    w:d.documentElement.clientWidth,  
                    h:d.documentElement.clientHeight,  
                    sw:d.documentElement.scrollWidth,  
                    sh:d.documentElement.scrollHeight  
                };  
            }  
            //怪异模式(Quirks)，未声明DOCTYPE  
            return {  
                w:d.body.clientWidth,  
                h:d.body.clientHeight,  
                sw:d.body.scrollWidth,  
                sh:d.body.scrollHeight  
            };  
        },  
        getScrollOffset:function(w) {//获取滚动位置  
            //使用指定的窗口，如果缺省则为当前窗口  
            w = w || window;  
            //IE8及以下版本的IE系列未实现该方法  
            if(w.pageXOffset != null) {  
                return {  
                    x:w.pageXOffset,  
                    y:w.pageYOffset  
                };  
            }  
            var d = w.document;  
            //IE标准模式，即声明了xhtml1.0头  
            if(document.compatMode == 'CSS1Compat') {  
                return {  
                    x:d.documentElement.scrollLeft,  
                    y:d.documentElement.scrollTop  
                };  
            }  
            //怪异模式(Quirks)，未声明DOCTYPE  
            return {  
                x:d.body.scrollLeft,  
                y:d.body.scrollTop  
            }  
        },  
        getStyle:function(el,cName) {  
            return el.currentStyle ? el.currentStyle[cName] : document.defaultView.getComputedStyle(el,null)[cName];  
        },  
        getBroswersVer: {  
            isIE: /msie/i.test(navigator.userAgent) && !window.opera,  
            isIE6: /msie 6/i.test(navigator.userAgent) && !window.opera,  
            isChrome: /chrome/i.test(navigator.userAgent),  
            isOpera:!!window.opera  
        },  
        getEvent:function(e) {  
            return e || window.event;  
        },  
        preventDefault:function(e) {  
            e = e || window.event;  
            return e.preventDefault ? e.preventDefault() : e.returnValue = false;  
        },  
        setOpacity:function(el,level) {  
            return el.filters ? (el.style.filter = 'alpha(opacity ='+level+')') : (el.style.opacity = level/100);  
        },  
        fadeIn:function(params) {  
            params = params || {};  
            var el = params.el || null,  
                speed = params.speed || 20,     //淡入动画进行的速度  
                level = params.level || 100,    //如果没有指定，则淡入透明度至100  
                initOpacity = params.initOpacity || 0,  //开始动画时元素的透明度，如果没有则设为0  
                elStyle = el.style,  
                step = initOpacity;           //透明度每次改变的增量  
            elStyle.display = 'block';  
            (function() {  
                EventUtil.setOpacity(el,step);  
                step += 5;  
                (step <= level) && setTimeout(arguments.callee,speed);  
            })();  
        },  
        fadeOut:function(params) {  
            params = params || {};  
            var el = params.el || null,  
                speed = params.speed || 20,       //淡出动画进行的速度  
                level = params.level || 0,        //如果没有指定，则淡出透明度至0，然后隐藏该元素  
                initOpacity = params.initOpacity || 100,  //开始动画时元素的透明度，如果没有则设为100  
                elStyle = el.style,  
                step = initOpacity;  
            (function() {  
                EventUtil.setOpacity(el,step);  
                step -= 5;  
                ((step >= level) && setTimeout(arguments.callee,speed)) || (elStyle.display = 'none');  
            })();  
        }  
    };  
  
    //为获取对象ID的方法定义快捷方式  
    //var $ = EventUtil._$;  
    var isIE6 = EventUtil.getBroswersVer.isIE6,  
        isIE = EventUtil.getBroswersVer.isIE,  
        isOpera = EventUtil.getBroswersVer.isOpera;  
  
    /* 
     * 弹出框构造函数 
     */  
    function PopUp() {  
        return this.init.apply(this,arguments);  
    }  
    PopUp.prototype = {  
        init:function(params) {  
            params = params || {};  
            //获取弹出框对象，如果没有指定则使用默认  
            this.pop = EventUtil._$(params.id) || EventUtil._$('popBox');  
            //获取拖动手柄，如未指定则将其设置为整个弹出框  
            this.handle = this.pop.getElementsByClassName('popBoxHandle')[0] || this.pop;  
            var pStyle = this.pop.style;  
            //弹出框是否跟随滚动条滚动，默认为允许  
            this.isScroll = params.isScroll || 'enabled';  
            //跟随窗口滚动时非IE6浏览器可以用fixed，不跟随则需要设为absolute  
            //Opera是一个特殊情况，它在设置为fixed时和Firefox、Chrome浏览器的行为不一致  
            //具体为ff、chrome在fixed计算坐标都是相对窗口的，但Opera需要考虑滚动条  
            //为了方法通用，故将Opera与IE6归为一类  
            this.isScroll == 'enabled' ?  
                    ((isIE6 || isOpera) ? pStyle.position = 'absolute' : pStyle.position = 'fixed') :  
                    pStyle.position ='absolute';  
  
            //是否需要创建遮罩层，默认为创建  
            this.enableShadow = params.enableShadow == 'disabled' ? false : new Shadow();  
            //是否启用拖放，默认为启用  
            this.enableDrag = params.enableDrag == 'disabled' ? false : new  
                    Drag({  
                        target:this.pop,  
                        isScroll:params.isScroll || 'enabled'  
                        //sMode:'horizontal'  
//                        range:{  
//                            minLeft:EventUtil._$('range').getBoundingClientRect().left,  
//                            maxLeft:EventUtil._$('range').getBoundingClientRect().right - this.pop.offsetWidth,  
//                            minTop:EventUtil._$('range').getBoundingClientRect().top,  
//                            maxTop:EventUtil._$('range').getBoundingClientRect().bottom - this.pop.offsetHeight  
//                        }  
                    });  
            //如果禁用拖放需要把拖动手柄的鼠标样式设为默认  
            if(this.enableDrag == false) this.handle.style.cursor = 'default';  
              
            //获取弹出框的宽度和高度  
            var s = this.pop.getBoundingClientRect();  
            //由于IE的getBoundingClientRect()方法没有width和height属性，故取右边距和左边距之差来代替width，高度也一样  
            this.w = s.width || s.right - s.left;  
            this.h = s.height || s.bottom - s.top;  
            pStyle.display = 'none';  
        },  
        setPosition:function(params) {  
            params = params || {};  
            var pStyle = this.pop.style;  
  
            //如果传入的参数中指定了坐标位置，则将值赋给弹出框  
            if(params.x != undefined && params.y != undefined) {  
                pStyle.left = params.x + 'px';  
                pStyle.top = params.y + 'px';  
                return;  //返回  
            }  
            //如果未指定坐标，则弹出框屏幕居中显示  
            //IE6、Opera以及弹出框禁止跟随滚动条时使用的定位方式是absolute，需要加上滚动距离  
            var x = (EventUtil.getViewPort().w - this.w) / 2 + (isIE6 || isOpera || this.isScroll == 'disabled' ?  
                    EventUtil.getScrollOffset().x : 0);  
                y = (EventUtil.getViewPort().h - this.h) / 2 + (isIE6 || isOpera || this.isScroll == 'disabled' ?  
                        EventUtil.getScrollOffset().y : 0);  
            pStyle.left = x + 'px';  
            pStyle.top = y + 'px';  
        },  
        show:function(params) {  
            params = params || {};  
            //淡入弹出框  
            EventUtil.fadeIn({el:this.pop});  
            //显示遮罩层  
            this.enableShadow && this.enableShadow.show();  
            //弹出框定位  
            this.setPosition(params);  
        },  
        hide:function() {  
            EventUtil.fadeOut({el:this.pop});  
            this.enableShadow && this.enableShadow.hide();  
        }  
    };  
  
    /* 
     * 拖放构造函数 
     */  
    function Drag() {  
        return this.init.apply(this,arguments);  
    }  
    Drag.prototype = {  
        init:function(params) {  
            params = params || {};  
            var _self = this;  
            //获取拖放元素  
            this.dragTarget = params.target || EventUtil._$('popBox');  
            //拖动手柄  
            this.handle = this.dragTarget.getElementsByClassName('popBoxHandle')[0];  
            //范围限定，如果传入该参数则弹出框将在指定范围内可拖动  
            this.range = params.range || {};  
            //是否跟随滚动条滚动  
            this.isScroll = params.isScroll || 'enabled';  
            var s = this.dragTarget.getBoundingClientRect();  
            this.w = s.width || s.right - s.left;  
            this.h = s.height || s.bottom - s.top;  
            //水平锁定或垂直锁定  
            this.sMode = params.sMode || null;  
            //元素在移动时触发的事件  
            this.moveHandler = function(e) {  
                _self.move(e);  
            };  
            //在释放鼠标时触发的事件  
            this.upHandler = function() {  
                _self.dragStop();  
            };  
            //按下鼠标时拖放开始  
            EventUtil.addEvent(this.handle,'mousedown',function(e) {  
                _self.dragStart(e);  
            });  
        },  
        dragStart:function(e) {//开始拖放  
            e = e || window.event;  
            var _self = this,  
                target = this.dragTarget,  
                isPosAbs = target.style.position == 'absolute';  
            EventUtil.preventDefault(e);  
            //拖放开始时设置透明度为50  
            EventUtil.setOpacity(this.dragTarget,50);  
  
            //当鼠标移出窗口或切换视窗时仍能捕获事件  
            (target.setCapture && isIE) && target.setCapture(true);  
  
            //清除选中文本，前面是IE特有的方法  
            (document.selection && document.selection.empty) ? document.selection.empty() :  
                    window.getSelection().removeAllRanges();  
  
            //保存鼠标相对拖放元素的坐标和当前元素可移动的最大宽高度  
            this.offset = {//layerX(Firefox)、offsetX(IE、Opera)  
                x:e.clientX - target.getBoundingClientRect().left,  
                y:e.clientY - target.getBoundingClientRect().top,  
                //fixed定位取的是相对于当前窗口的位移，不需要加上滚动值，而absolute定位需要加上滚动的值  
                maxX:this.range.maxLeft - (isPosAbs ? 0 : EventUtil.getScrollOffset().x) || EventUtil.getViewPort().w -  
                    this.w + (target.style.position == 'absolute' ? EventUtil.getScrollOffset().x : 0),  
                maxY:this.range.maxTop - (isPosAbs ? 0 : EventUtil.getScrollOffset().y) || EventUtil.getViewPort().h -  
                        this.h + ((target.style.position == 'absolute') ? EventUtil.getScrollOffset().y : 0)  
            };  
            //注册鼠标移动和释放鼠标事件  
            EventUtil.addEvent(document,'mousemove',this.moveHandler);  
            EventUtil.addEvent(document,'mouseup',this.upHandler);  
        },  
        move:function(e) {  
            e = e || window.event;  
            //阻止浏览器默认事件，IE8有滚动条随拖放滚动和默认选中文字的默认行为  
            EventUtil.preventDefault(e);  
            //通过鼠标当前位置坐标减去相对位置坐标获得元素的left和top值  
            var sx = EventUtil.getScrollOffset().x,     //保存当前滚动宽度  
                sy = EventUtil.getScrollOffset().y,     //保存当前滚动高度  
                //保存元素在页面内的坐标  
                x = e.clientX - this.offset.x + (isIE6 || isOpera || this.isScroll == 'disabled' ? sx : 0),  
                y = e.clientY - this.offset.y + (isIE6 || isOpera || this.isScroll == 'disabled' ? sy : 0),  
                //保存元素可以移动的最大横坐标和纵坐标  
                maxX = this.offset.maxX,  
                maxY = this.offset.maxY;  
            //设置元素的坐标并防止弹出框位置超出指定范围  
            if(isIE6 || isOpera || this.isScroll == 'disabled') {//如果是IE6、Opera或者设置了禁止跟随浏览器滚动  
                (this.sMode == 'horizontal' || this.sMode == null) && (this.dragTarget.style.left = Math.min(maxX, x  
                        <= (this.range.minLeft || sx) ? (this.range.minLeft || sx) : x) +'px');  
                (this.sMode == 'vertical' || this.sMode == null) && (this.dragTarget.style.top = Math.min(maxY, y <=  
                        (this.range.minTop || sy) ? (this.range.minTop || sy) : y) + 'px');  
                return;  
            }  
  
            (this.sMode == 'horizontal' || this.sMode == null) && (this.dragTarget.style.left = Math.min(maxX,x <=  
                    (this.range.minLeft-sx || 0) ? (this.range.minLeft-sx || 0) : x) + 'px');  
            (this.sMode == 'vertical' || this.sMode == null) && (this.dragTarget.style.top = Math.min(maxY,y <=  
                    (this.range.minTop-sy || 0) ? (this.range.minTop-sy || 0) : y) + 'px');  
  
        },  
        dragStop:function() {//停止拖放  
            EventUtil.setOpacity(this.dragTarget,100);  
            //停止窗口捕获  
            (this.dragTarget.releaseCapture && isIE) && this.dragTarget.releaseCapture();  
            EventUtil.removeEvent(document,'mousemove',this.moveHandler);  
            EventUtil.removeEvent(document,'mouseup',this.upHandler);  
        }  
    };  
  
    /* 
     * 遮罩层构造函数 
     */  
    function Shadow() {  
        return this.init.apply(this,arguments);  
    }  
    Shadow.prototype = {  
        init:function() {},  
        create:function(params) {//创建遮罩层  
            params = params || {};  
            //如果遮罩层已存在，返回  
            if(this.shadow) return;  
            var c = document.createElement('div'),  
                s = c.style;  
            //为遮罩层定义样式  
            c.id = 'shadow';  
            s.backgroundColor = params.bgColor || '#000';  
            s.position = isIE6 ? 'absolute' : 'fixed';  
            s.left = s.top = 0;  
            //设置遮罩层的宽高  
            this.setProperty(c);  
            s.zIndex = 100;  
            s.display = 'none';  
            //为防止IE6中止操作的问题，用insertBefore代替appendChild方法  
            document.body.insertBefore(c,document.body.childNodes[0]);  
            //将遮罩层保存到this.shadow  
            this.shadow = c;  
            //IE6下有遮罩层不能遮盖select元素的bug,通过创建一个iframe来解决  
            if(isIE6 && !this.fixedIframe) {  
                var iframe = document.createElement('iframe'),  
                    iStyle = iframe.style;  
                iStyle.position = 'absolute';  
                iStyle.left = iStyle.top = 0;  
                iStyle.zIndex = 1;  
                iStyle.src = 'about:blank';  
                iStyle.filter = 'alpha(opacity=0)';  
                //设置iframe的宽高  
                this.setProperty(iframe);  
                document.body.insertBefore(iframe,document.body.childNodes[0]);  
                this.fixedIframe = iframe;  
            }  
            //返回创建的遮罩层  
            return c;  
        },  
        setProperty:function(el) {  
            var s = el.style;  
            //比较clientWidth(clientHeight)与scrollWidth(scrollHeight)的大小，取其中较大的一个作为宽高度  
            s.width = Math.max(EventUtil.getViewPort().w,EventUtil.getViewPort().sw) + 'px';  
            s.height = Math.max(EventUtil.getViewPort().h,EventUtil.getViewPort().sh) + 'px';  
        },  
        show:function(params) {  
            params = params || {};  
            EventUtil.fadeIn({  
                el:this.shadow || this.create(params), //如果不存在则创建  
                level:30    //淡入到30的透明度  
            });  
            //如果存在iframe，与遮罩层一并显示  
            this.fixedIframe && (this.fixedIframe.style.display = 'block');  
        },  
        hide:function() {  
            EventUtil.fadeOut({  
                el:this.shadow || this.create(),  
                initOpacity:30  
            });  
            //如果存在iframe，与遮罩层一并隐藏  
            this.fixedIframe && (this.fixedIframe.style.display = 'none');  
        }  
    };  