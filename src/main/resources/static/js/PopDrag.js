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
        getViewPort:function(w) {//��ȡ�Ӵ���Ⱥ͸߶�  
            //ʹ��ָ���Ĵ��ڣ����ȱʡ��Ϊ��ǰ����  
            w = w || window;  
            /* 
             *��û�й�����ʱ��document.documentElement.clientWidth��window.innerWidth��ֵ��һ���� 
             *���ֹ�����ʱ��ǰ�ߵ�ֵ�Ⱥ��ߵ�С���Ϊ��������ռ�Ŀ�ȣ������ֲ�򵯳���ʱ��ǰ�߸�Ϊ��ȷ 
             */  
            //IE8�����°汾��IEϵ��δʵ�ָ÷���  
//            if(w.innerWidth != null) {  
//                return {  
//                    w:w.innerWidth,  
//                    h:w.innerHeight  
//                };  
//            }  
            var d = w.document;  
            //IE��׼ģʽ����������xhtml1.0ͷ  
            if(document.compatMode == 'CSS1Compat') {  
                return {  
                    w:d.documentElement.clientWidth,  
                    h:d.documentElement.clientHeight,  
                    sw:d.documentElement.scrollWidth,  
                    sh:d.documentElement.scrollHeight  
                };  
            }  
            //����ģʽ(Quirks)��δ����DOCTYPE  
            return {  
                w:d.body.clientWidth,  
                h:d.body.clientHeight,  
                sw:d.body.scrollWidth,  
                sh:d.body.scrollHeight  
            };  
        },  
        getScrollOffset:function(w) {//��ȡ����λ��  
            //ʹ��ָ���Ĵ��ڣ����ȱʡ��Ϊ��ǰ����  
            w = w || window;  
            //IE8�����°汾��IEϵ��δʵ�ָ÷���  
            if(w.pageXOffset != null) {  
                return {  
                    x:w.pageXOffset,  
                    y:w.pageYOffset  
                };  
            }  
            var d = w.document;  
            //IE��׼ģʽ����������xhtml1.0ͷ  
            if(document.compatMode == 'CSS1Compat') {  
                return {  
                    x:d.documentElement.scrollLeft,  
                    y:d.documentElement.scrollTop  
                };  
            }  
            //����ģʽ(Quirks)��δ����DOCTYPE  
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
                speed = params.speed || 20,     //���붯�����е��ٶ�  
                level = params.level || 100,    //���û��ָ��������͸������100  
                initOpacity = params.initOpacity || 0,  //��ʼ����ʱԪ�ص�͸���ȣ����û������Ϊ0  
                elStyle = el.style,  
                step = initOpacity;           //͸����ÿ�θı������  
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
                speed = params.speed || 20,       //�����������е��ٶ�  
                level = params.level || 0,        //���û��ָ�����򵭳�͸������0��Ȼ�����ظ�Ԫ��  
                initOpacity = params.initOpacity || 100,  //��ʼ����ʱԪ�ص�͸���ȣ����û������Ϊ100  
                elStyle = el.style,  
                step = initOpacity;  
            (function() {  
                EventUtil.setOpacity(el,step);  
                step -= 5;  
                ((step >= level) && setTimeout(arguments.callee,speed)) || (elStyle.display = 'none');  
            })();  
        }  
    };  
  
    //Ϊ��ȡ����ID�ķ��������ݷ�ʽ  
    //var $ = EventUtil._$;  
    var isIE6 = EventUtil.getBroswersVer.isIE6,  
        isIE = EventUtil.getBroswersVer.isIE,  
        isOpera = EventUtil.getBroswersVer.isOpera;  
  
    /* 
     * �������캯�� 
     */  
    function PopUp() {  
        return this.init.apply(this,arguments);  
    }  
    PopUp.prototype = {  
        init:function(params) {  
            params = params || {};  
            //��ȡ������������û��ָ����ʹ��Ĭ��  
            this.pop = EventUtil._$(params.id) || EventUtil._$('popBox');  
            //��ȡ�϶��ֱ�����δָ����������Ϊ����������  
            this.handle = this.pop.getElementsByClassName('popBoxHandle')[0] || this.pop;  
            var pStyle = this.pop.style;  
            //�������Ƿ���������������Ĭ��Ϊ����  
            this.isScroll = params.isScroll || 'enabled';  
            //���洰�ڹ���ʱ��IE6�����������fixed������������Ҫ��Ϊabsolute  
            //Opera��һ�������������������Ϊfixedʱ��Firefox��Chrome���������Ϊ��һ��  
            //����Ϊff��chrome��fixed�������궼����Դ��ڵģ���Opera��Ҫ���ǹ�����  
            //Ϊ�˷���ͨ�ã��ʽ�Opera��IE6��Ϊһ��  
            this.isScroll == 'enabled' ?  
                    ((isIE6 || isOpera) ? pStyle.position = 'absolute' : pStyle.position = 'fixed') :  
                    pStyle.position ='absolute';  
  
            //�Ƿ���Ҫ�������ֲ㣬Ĭ��Ϊ����  
            this.enableShadow = params.enableShadow == 'disabled' ? false : new Shadow();  
            //�Ƿ������Ϸţ�Ĭ��Ϊ����  
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
            //��������Ϸ���Ҫ���϶��ֱ��������ʽ��ΪĬ��  
            if(this.enableDrag == false) this.handle.style.cursor = 'default';  
              
            //��ȡ������Ŀ�Ⱥ͸߶�  
            var s = this.pop.getBoundingClientRect();  
            //����IE��getBoundingClientRect()����û��width��height���ԣ���ȡ�ұ߾����߾�֮��������width���߶�Ҳһ��  
            this.w = s.width || s.right - s.left;  
            this.h = s.height || s.bottom - s.top;  
            pStyle.display = 'none';  
        },  
        setPosition:function(params) {  
            params = params || {};  
            var pStyle = this.pop.style;  
  
            //�������Ĳ�����ָ��������λ�ã���ֵ����������  
            if(params.x != undefined && params.y != undefined) {  
                pStyle.left = params.x + 'px';  
                pStyle.top = params.y + 'px';  
                return;  //����  
            }  
            //���δָ�����꣬�򵯳�����Ļ������ʾ  
            //IE6��Opera�Լ��������ֹ���������ʱʹ�õĶ�λ��ʽ��absolute����Ҫ���Ϲ�������  
            var x = (EventUtil.getViewPort().w - this.w) / 2 + (isIE6 || isOpera || this.isScroll == 'disabled' ?  
                    EventUtil.getScrollOffset().x : 0);  
                y = (EventUtil.getViewPort().h - this.h) / 2 + (isIE6 || isOpera || this.isScroll == 'disabled' ?  
                        EventUtil.getScrollOffset().y : 0);  
            pStyle.left = x + 'px';  
            pStyle.top = y + 'px';  
        },  
        show:function(params) {  
            params = params || {};  
            //���뵯����  
            EventUtil.fadeIn({el:this.pop});  
            //��ʾ���ֲ�  
            this.enableShadow && this.enableShadow.show();  
            //������λ  
            this.setPosition(params);  
        },  
        hide:function() {  
            EventUtil.fadeOut({el:this.pop});  
            this.enableShadow && this.enableShadow.hide();  
        }  
    };  
  
    /* 
     * �ϷŹ��캯�� 
     */  
    function Drag() {  
        return this.init.apply(this,arguments);  
    }  
    Drag.prototype = {  
        init:function(params) {  
            params = params || {};  
            var _self = this;  
            //��ȡ�Ϸ�Ԫ��  
            this.dragTarget = params.target || EventUtil._$('popBox');  
            //�϶��ֱ�  
            this.handle = this.dragTarget.getElementsByClassName('popBoxHandle')[0];  
            //��Χ�޶����������ò����򵯳�����ָ����Χ�ڿ��϶�  
            this.range = params.range || {};  
            //�Ƿ�������������  
            this.isScroll = params.isScroll || 'enabled';  
            var s = this.dragTarget.getBoundingClientRect();  
            this.w = s.width || s.right - s.left;  
            this.h = s.height || s.bottom - s.top;  
            //ˮƽ������ֱ����  
            this.sMode = params.sMode || null;  
            //Ԫ�����ƶ�ʱ�������¼�  
            this.moveHandler = function(e) {  
                _self.move(e);  
            };  
            //���ͷ����ʱ�������¼�  
            this.upHandler = function() {  
                _self.dragStop();  
            };  
            //�������ʱ�Ϸſ�ʼ  
            EventUtil.addEvent(this.handle,'mousedown',function(e) {  
                _self.dragStart(e);  
            });  
        },  
        dragStart:function(e) {//��ʼ�Ϸ�  
            e = e || window.event;  
            var _self = this,  
                target = this.dragTarget,  
                isPosAbs = target.style.position == 'absolute';  
            EventUtil.preventDefault(e);  
            //�Ϸſ�ʼʱ����͸����Ϊ50  
            EventUtil.setOpacity(this.dragTarget,50);  
  
            //������Ƴ����ڻ��л��Ӵ�ʱ���ܲ����¼�  
            (target.setCapture && isIE) && target.setCapture(true);  
  
            //���ѡ���ı���ǰ����IE���еķ���  
            (document.selection && document.selection.empty) ? document.selection.empty() :  
                    window.getSelection().removeAllRanges();  
  
            //�����������Ϸ�Ԫ�ص�����͵�ǰԪ�ؿ��ƶ�������߶�  
            this.offset = {//layerX(Firefox)��offsetX(IE��Opera)  
                x:e.clientX - target.getBoundingClientRect().left,  
                y:e.clientY - target.getBoundingClientRect().top,  
                //fixed��λȡ��������ڵ�ǰ���ڵ�λ�ƣ�����Ҫ���Ϲ���ֵ����absolute��λ��Ҫ���Ϲ�����ֵ  
                maxX:this.range.maxLeft - (isPosAbs ? 0 : EventUtil.getScrollOffset().x) || EventUtil.getViewPort().w -  
                    this.w + (target.style.position == 'absolute' ? EventUtil.getScrollOffset().x : 0),  
                maxY:this.range.maxTop - (isPosAbs ? 0 : EventUtil.getScrollOffset().y) || EventUtil.getViewPort().h -  
                        this.h + ((target.style.position == 'absolute') ? EventUtil.getScrollOffset().y : 0)  
            };  
            //ע������ƶ����ͷ�����¼�  
            EventUtil.addEvent(document,'mousemove',this.moveHandler);  
            EventUtil.addEvent(document,'mouseup',this.upHandler);  
        },  
        move:function(e) {  
            e = e || window.event;  
            //��ֹ�����Ĭ���¼���IE8�й��������ϷŹ�����Ĭ��ѡ�����ֵ�Ĭ����Ϊ  
            EventUtil.preventDefault(e);  
            //ͨ����굱ǰλ�������ȥ���λ��������Ԫ�ص�left��topֵ  
            var sx = EventUtil.getScrollOffset().x,     //���浱ǰ�������  
                sy = EventUtil.getScrollOffset().y,     //���浱ǰ�����߶�  
                //����Ԫ����ҳ���ڵ�����  
                x = e.clientX - this.offset.x + (isIE6 || isOpera || this.isScroll == 'disabled' ? sx : 0),  
                y = e.clientY - this.offset.y + (isIE6 || isOpera || this.isScroll == 'disabled' ? sy : 0),  
                //����Ԫ�ؿ����ƶ������������������  
                maxX = this.offset.maxX,  
                maxY = this.offset.maxY;  
            //����Ԫ�ص����겢��ֹ������λ�ó���ָ����Χ  
            if(isIE6 || isOpera || this.isScroll == 'disabled') {//�����IE6��Opera���������˽�ֹ�������������  
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
        dragStop:function() {//ֹͣ�Ϸ�  
            EventUtil.setOpacity(this.dragTarget,100);  
            //ֹͣ���ڲ���  
            (this.dragTarget.releaseCapture && isIE) && this.dragTarget.releaseCapture();  
            EventUtil.removeEvent(document,'mousemove',this.moveHandler);  
            EventUtil.removeEvent(document,'mouseup',this.upHandler);  
        }  
    };  
  
    /* 
     * ���ֲ㹹�캯�� 
     */  
    function Shadow() {  
        return this.init.apply(this,arguments);  
    }  
    Shadow.prototype = {  
        init:function() {},  
        create:function(params) {//�������ֲ�  
            params = params || {};  
            //������ֲ��Ѵ��ڣ�����  
            if(this.shadow) return;  
            var c = document.createElement('div'),  
                s = c.style;  
            //Ϊ���ֲ㶨����ʽ  
            c.id = 'shadow';  
            s.backgroundColor = params.bgColor || '#000';  
            s.position = isIE6 ? 'absolute' : 'fixed';  
            s.left = s.top = 0;  
            //�������ֲ�Ŀ��  
            this.setProperty(c);  
            s.zIndex = 100;  
            s.display = 'none';  
            //Ϊ��ֹIE6��ֹ���������⣬��insertBefore����appendChild����  
            document.body.insertBefore(c,document.body.childNodes[0]);  
            //�����ֲ㱣�浽this.shadow  
            this.shadow = c;  
            //IE6�������ֲ㲻���ڸ�selectԪ�ص�bug,ͨ������һ��iframe�����  
            if(isIE6 && !this.fixedIframe) {  
                var iframe = document.createElement('iframe'),  
                    iStyle = iframe.style;  
                iStyle.position = 'absolute';  
                iStyle.left = iStyle.top = 0;  
                iStyle.zIndex = 1;  
                iStyle.src = 'about:blank';  
                iStyle.filter = 'alpha(opacity=0)';  
                //����iframe�Ŀ��  
                this.setProperty(iframe);  
                document.body.insertBefore(iframe,document.body.childNodes[0]);  
                this.fixedIframe = iframe;  
            }  
            //���ش��������ֲ�  
            return c;  
        },  
        setProperty:function(el) {  
            var s = el.style;  
            //�Ƚ�clientWidth(clientHeight)��scrollWidth(scrollHeight)�Ĵ�С��ȡ���нϴ��һ����Ϊ��߶�  
            s.width = Math.max(EventUtil.getViewPort().w,EventUtil.getViewPort().sw) + 'px';  
            s.height = Math.max(EventUtil.getViewPort().h,EventUtil.getViewPort().sh) + 'px';  
        },  
        show:function(params) {  
            params = params || {};  
            EventUtil.fadeIn({  
                el:this.shadow || this.create(params), //����������򴴽�  
                level:30    //���뵽30��͸����  
            });  
            //�������iframe�������ֲ�һ����ʾ  
            this.fixedIframe && (this.fixedIframe.style.display = 'block');  
        },  
        hide:function() {  
            EventUtil.fadeOut({  
                el:this.shadow || this.create(),  
                initOpacity:30  
            });  
            //�������iframe�������ֲ�һ������  
            this.fixedIframe && (this.fixedIframe.style.display = 'none');  
        }  
    };  