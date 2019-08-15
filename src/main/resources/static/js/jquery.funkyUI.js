/*
 * jQuery funkyUI plugin
 * Version 1.1 beta (2009-6-10)
 * @requires jQuery v1.2.6 or later
 *
 * Email: willin2004@sohu.com
 * Copyright (c) 2009-2010 周晖
 * 
 * 浏览器兼容性
 * Internet Explorer 6 (已测试)
 * Internet Explorer 7 (已测试)
 * Internet Explorer 8 (已测试)
 * FireFox 2.0.0.18 (已测试)
 *
 * 待解决问题
 *
 *
 *
 * Thanks to jQuery blockUI 泽元软件
 *
 * 软件功能：
 * 无限级弹出窗口
 * Esc退出block弹出窗口
 * 可拖动窗口
 * 模态窗口
 * 模态alert警告对话框 
 * 模态confirm对话框
 * 页面局部模态
 * 绑定按钮响应函数
 * 弹出窗口加载iframe
 * 自定义背景样式
 *  
 */

;(function($) {

//用正则表达式判断jQuery的版本
if (/1\.(0|1|2)\.(0|1|2|3|4|5)/.test($.fn.jquery) || /^1.1/.test($.fn.jquery)) {
    alert('funkyUI 需要 jQuery v1.2.6 以后版本支持!  你正使用的是 v' + $.fn.jquery);
    return;
}

// 全局函数，用来block和unbluck整个页面，弹出窗口加载一段信息或者一个层或者iframe 
$.funkyUI   = function(opts) { install(window.top, opts); };
$.unfunkyUI = function(opts) { remove(window.top, opts); };

$.alert = function(msg,w,h,func) { Alert(msg,w,h,func); };
$.confirm = function(msg,func1,func2,w,h) { Confirm(msg,func1,func2,w,h); };

$._Array = [];

// 插件，用来block一个元素内容
$.fn.block = function(opts) {
    return this.each(function() {
        if ($.css(this,'position') == 'static')
            this.style.position = 'relative';
        if ($.browser.msie) 
            this.style.zoom = 1; // force 'hasLayout'
        install(this, opts);
    });
};

// 插件，用来unblock一个元素内容
$.fn.unblock = function(opts) {
    return this.each(function() {
        remove(this, opts);
    });
};

//版本信息
$.funkyUI.version = "1.1 beta"; 

// 默认参数，可以在程序中根据需要设定
$.funkyUI.defaults = {
		
		id:            'id',//弹出窗口的id
		title:         '提示窗口：',//弹出窗口的标题
		showButtonRow: true,//是否显示按钮   
		showDialog:    true,//是否显示框体   
    message:       '请稍后...', // 进行区域block时显示的信息。
		url :          'javascript:void(0);',
//		OKEvent://弹出窗口“确定”按钮响应函数，这里没设默认值，如果需要响应可直接在参数中指定
//		CancelEvent://弹出窗口“取消”按钮响应函数，这里没设默认值，如果需要响应可直接在参数中指定
    
    // 弹出窗口的样式，
    css: { 
        padding:        0,
        margin:         0,
        width:          200, 
        height:         60,
        top:            0, 
        left:           0, 
        textAlign:      'center', 
        color:          '#000', 
        border:         '3px solid #aaa',
        backgroundColor:'#fff',
        cursor:         'wait'
    },
    
    // block时的背景样式，颜色及透明度
    overlayCSS:  { 
        backgroundColor:'#000', 
        opacity:        '0.6' 
    },
    
    // block层的z-index
    baseZ: 1000,
    
    // set these to true to have the message automatically centered
    centerX: true, // <-- only effects element blocking (page block controlled via css above)
    centerY: true,
    
    // be default funkyUI will supress tab navigation from leaving blocking content;
    constrainTabKey: true,
    
    // unblock时背景渐变消失的时间，毫秒
    fadeOut:  400,
    
    // blocking时设定焦点
    focusInput: true,
        
    // unblock的回调函数
    //     onUnblock(element, options)
    onUnblock: null
    
   
};

// 命名空间内的私有函数及变量

var ie6 = $.browser.msie && /MSIE 6.0/.test(navigator.userAgent);
var pageBlock = null;
var pageBlockEls = [];

//得到主窗口，即最顶端的窗口
var topWin = window.top;

		
    //保存弹出窗口的当前信息
$.DialogData={}

function install(el, opts) {
		//full是代表全屏的Boolean变量
    var full = (el == window.top);
    var url = opts && opts.url !== undefined ? opts.url : undefined;
    opts = $.extend({}, $.funkyUI.defaults, opts || {});
    opts.overlayCSS = $.extend({}, $.funkyUI.defaults.overlayCSS, opts.overlayCSS || {});
    var css = $.extend({}, $.funkyUI.defaults.css, opts.css || {});
    url = url === undefined ? opts.url : url;
    
		//z-index
    var z = opts.baseZ;
    
		if(opts.id=='id'){//这里加个判断，可以接受用户传递的id参数，这样同一个弹出窗口只需要创建一次就ok了
			opts.id = Math.round(Math.random()*10000);
		}
		//计算窗口的高宽和滚动条的位置,确保显示在屏幕正中间
	  topWin.$.DialogData.cw = window.top.document.compatMode == "BackCompat" ?window.top.document.body.clientWidth:window.top.document.documentElement.clientWidth;//窗体高度
		topWin.$.DialogData.ch = window.top.document.compatMode == "BackCompat" ?window.top.document.body.clientHeight:window.top.document.documentElement.clientHeight;//窗体宽度//必须考虑文本框处于页面边缘处，控件显示不全的问题
		topWin.$.DialogData.sw = Math.max(window.top.document.documentElement.scrollLeft, window.top.document.body.scrollLeft);//横向滚动条位置
		topWin.$.DialogData.sh = Math.max(window.top.document.documentElement.scrollTop, window.top.document.body.scrollTop);//纵向滚动条位置//考虑滚动的情况
		
    if(!css.height){
			css.height = css.width/2;
		}
	
		if(css.top==0){
			css.top = (topWin.$.DialogData.ch - css.height - 30) / 2 + topWin.$.DialogData.sh - 8;//有8像素的透明背景
			css.top = css.top > 0?css.top:0;
		}
		if(css.left==0){
			css.left = (topWin.$.DialogData.cw - css.width - 12) / 2 + topWin.$.DialogData.sw;
			css.left = css.left > 0?css.left:0;
		}
		if(opts.showButtonRow){//按钮行高36
			css.top -= 18;
		}
		if(!opts.showDialog){//标题栏行高33
			css.top -= 16;
		}
				
    // 用2个层来block
    // block后的背景用来block页面
    // 弹出框，提示信息layer3 is the message content that is displayed while blocking    
                 
    var arr = [];
    
		if(opts.showDialog){
			arr.push("<table style='-moz-user-select:none;' border='0' cellpadding='0' cellspacing='0' width='"+(css.width)+"'>");
			arr.push("  <tr style='cursor:move;'>");
			arr.push("    <td width='13' height='33' style=\"background-image:url(shop/alert/images/dialog_lt.png) !important;background-image: none;filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(src='shop/alert/images/dialog_lt.png', sizingMethod='crop');\"><div style='width:13px;'></div></td>");
			arr.push("    <td height='33' style=\"background-image:url(shop/alert/images/dialog_ct.png) !important;background-image: none;filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(src='shop/alert/images/dialog_ct.png', sizingMethod='crop');\"><div style=\"float:left;font-weight:bold; color:#FFFFFF; padding:9px 0 0 4px;\"><img src=\"shop/alert/images/icon_dialog.gif\" align=\"absmiddle\">&nbsp;"+opts.title+"</div>");
			arr.push("      <div style=\"position: relative;cursor:pointer; float:right; margin:5px 0 0; _margin:4px 0 0;height:17px; width:28px; background-image:url(shop/alert/images/dialog_closebtn.gif)\" onMouseOver=\"this.style.backgroundImage='url(shop/alert/images/dialog_closebtn_over.gif)'\" onMouseOut=\"this.style.backgroundImage='url(shop/alert/images/dialog_closebtn.gif)'\" drag='false' onClick=\"$('#_ButtonCancel_"+opts.id+"').click();\"></div></td>");
			arr.push("    <td width='13' height='33' style=\"background-image:url(shop/alert/images/dialog_rt.png) !important;background-image: none;filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(src='shop/alert/images/dialog_rt.png', sizingMethod='crop');\"><div style=\"width:13px;\"></div></td>");
			arr.push("  </tr>");
			arr.push("  <tr drag='false'><td width='13' style=\"background-image:url(shop/alert/images/dialog_mlm.png) !important;background-image: none;filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(src='shop/alert/images/dialog_mlm.png', sizingMethod='crop');\"></td>");
			arr.push("    <td align='center' valign='top'>");
			arr.push("    <table width='100%' height='100%' border='0' cellpadding='0' cellspacing='0' bgcolor='#FFFFFF'>");
			arr.push("        <tr id='_MessageRow_"+opts.id+"' style='display:none'>");
			arr.push("          <td height='50' valign='top'><table id='_MessageTable_"+opts.id+"' width='100%' border='0' cellspacing='0' cellpadding='8' style=\" background:#EAECE9 url(shop/alert/images/dialog_bg.jpg) no-repeat right top;\">");
			arr.push("              <tr><td width='25' height='50' align='right'><img id='_MessageIcon_"+opts.id+"' src='shop/alert/images/window.gif' width='32' height='32'></td>");
			arr.push("                <td align='left' style='line-height:16px;'>");
			arr.push("                <h5 class='fb' id='_MessageTitle_"+opts.id+"'>&nbsp;</h5>");
			arr.push("                <div id='_Message_"+opts.id+"'>&nbsp;</div></td>");
			arr.push("              </tr></table></td></tr>");
			arr.push("        <tr><td align='center' valign='top'>");
			arr.push("          <iframe src='");	
			arr.push(url);
			arr.push("' id='_DialogFrame_"+opts.id+"' allowTransparency='true'  width='"+css.width+"' height='"+css.height+"' frameborder='0' style=\"background-color: #transparent; border:none;\"></iframe></td></tr>");
			arr.push("        <tr drag='false' id='_ButtonRow_"+opts.id+"'><td height='36'>");
			arr.push("            <div id='_DialogButtons_"+opts.id+"' style='text-align:right; border-top:#dadee5 1px solid; padding:8px 20px; background-color:#f6f6f6;'>");
			arr.push("           	<input id='_ButtonOK_"+opts.id+"'  type='button' value='确 定'>");
			arr.push("           	<input id='_ButtonCancel_"+opts.id+"'  type='button' onclick=\"$.unfunkyUI('"+opts+"');\" value='取 消'>");
			arr.push("            </div></td></tr>");
			arr.push("      </table></td>");
			arr.push("    <td width='13' style=\"background-image:url(shop/alert/images/dialog_mrm.png) !important;background-image: none;filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(src='shop/alert/images/dialog_mrm.png', sizingMethod='crop');\"></td></tr>");
			arr.push("  <tr><td width='13' height='13' style=\"background-image:url(shop/alert/images/dialog_lb.png) !important;background-image: none;filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(src='shop/alert/images/dialog_lb.png', sizingMethod='crop');\"></td>");
			arr.push("    <td style=\"background-image:url(shop/alert/images/dialog_cb.png) !important;background-image: none;filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(src='shop/alert/images/dialog_cb.png', sizingMethod='crop');\"></td>");
			arr.push("    <td width='13' height='13' style=\"background-image:url(shop/alert/images/dialog_rb.png) !important;background-image: none;filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(src='shop/alert/images/dialog_rb.png', sizingMethod='crop');\"></td>");
			arr.push("  </tr></table>");
		}else{
			arr.push("<table width=\"200\" height=\"59\" style=\"border:solid #5e97cc 1px; background-color:#FFFFFF \">");
			arr.push("  <tr>");
			arr.push("    <td width=\"74\" height=\"53\" align=\"center\" valign=\"middle\"><img src=\"shop/alert/images/loading1.gif\" width=\"32\" height=\"32\" /></td>");
			arr.push("  	<td width=\"114\" align=\"left\" valign=\"middle\">正在加载</br>initializing</td>");
			arr.push("  </tr>");
			arr.push("</table>");
		}
			
		var lyr2 = full ? $("#_DialogBGDiv",topWin.document.body):$("#_DialogBGDiv_"+opts.id);
		if(!lyr2.length>0){
			lyr2 = full ? $('<div class="funkyUI blockOverlay" style="z-index:'+ z++ +';cursor:wait;border:none;margin:0;padding:0;width:100%;height:100%;top:0;left:0"></div>', topWin.document.body):$('<div class="funkyUI blockOverlay" style="z-index:'+ z++ +';cursor:wait;border:none;margin:0;padding:0;width:100%;height:100%;top:0;left:0"></div>');
			lyr2.attr("id",full ? "_DialogBGDiv":"#_DialogBGDiv_"+opts.id);
			$(lyr2[0]).appendTo(full ? $(topWin.document.body) : $(el));
			full ? (topWin.$.DialogData.backgroundDiv = lyr2):null;
		}else{
			topWin.$.DialogData.backgroundDiv.css('z-index',parseInt(topWin.$._Array[topWin.$._Array.length-1].$.DialogData.dialogDiv.css('z-index'))+1);	
			z = parseInt(topWin.$.DialogData.backgroundDiv.css('z-index'))+1;	
		}
		var lyr3 =  full ? $("#_DialogDiv_"+opts.id,topWin.document.body):$("#_DialogDiv_"+opts.id);
		if(!lyr3.length>0){
			lyr3 = full ? $('<div class="funkyUI blockMsg blockPage" style="z-index:'+ z +';position:fixed"></div>',topWin.document.body)
	                    : $('<div class="funkyUI blockMsg blockElement" style="z-index:'+ z +';display:none;position:absolute">'+opts.message+'</div>');
			lyr3.hide();
			lyr3.attr("id","_DialogDiv_"+opts.id);
			lyr3.css("class","dialogdiv");	
			lyr3.appendTo(full ? $(topWin.document.body) : $(el));
		}
    
    // 设置背景样式
    lyr2.css(opts.overlayCSS);
    lyr2.css('position', full ? 'fixed' : 'absolute');
    
    //当前window对象压入栈
		full ?topWin.$._Array.push(window):null;
		
		$.DialogData.dialogDiv = lyr3;

		//修正在ie6下的显示问题
		var expr = $.browser.msie && (!$.boxModel || $('object,embed', full ? null : el).length > 0);
    if (ie6 || expr) {
        // give body 100% height
        if (full && $.boxModel)
            $('html,body').css('height','100%');

        // fix ie6 issue when blocked element has a border width
        if ((ie6 || !$.boxModel) && !full) {
            var t = sz(el,'borderTopWidth'), l = sz(el,'borderLeftWidth');
            var fixT = t ? '(0 - '+t+')' : 0;
            var fixL = l ? '(0 - '+l+')' : 0;
        }

        $.each([lyr2,lyr3], function(i,o) {
            var s = o[0].style;
            s.position = 'absolute';
            if (i < 2) {
                full ? s.setExpression('height','Math.max(document.body.scrollHeight, document.body.offsetHeight) - (jQuery.boxModel?0:'+opts.quirksmodeOffsetHack+') + "px"')
                     : s.setExpression('height','this.parentNode.offsetHeight + "px"');
                full ? s.setExpression('width','jQuery.boxModel && document.documentElement.clientWidth || document.body.clientWidth + "px"')
                     : s.setExpression('width','this.parentNode.offsetWidth + "px"');
                if (fixL) s.setExpression('left', fixL);
                if (fixT) s.setExpression('top', fixT);
            }
            else if (opts.centerY) {
                if (full) s.setExpression('top','(document.documentElement.clientHeight || document.body.clientHeight) / 2 - (this.offsetHeight / 2) + (blah = document.documentElement.scrollTop ? document.documentElement.scrollTop : document.body.scrollTop) + "px"');
                s.marginTop = 0;
            }
        });
    }
    
    // 绑定鼠标或者键盘事件bind key and mouse events
    bind(1, el, opts);
    
    
    
  	// 显示弹出窗口
    if(full){
			lyr3.html(arr.join('\n'));
	    lyr3.css({left:css.left+"px",top:css.top+"px",width:css.width+"px",height:css.height+"px"});
	    
			if(opts.showDialog){
				//记录当前弹出窗口的iframe对象
				topWin.$.DialogData.iframeObj = $("#_DialogFrame_"+opts.id,topWin.document.body);
		    lyr3.bind("mousedown", function(event){
					topWin.$.funkyUI.dragEle = lyr3;
					topWin.$.funkyUI.pointer = getPointer(event);//当前鼠标位置
					topWin.$.funkyUI.dialogPointer = {x:lyr3.css('left').substring(0,lyr3.css('left').length-2),y:lyr3.css('top').substring(0,lyr3.css('top').length-2)};//记录窗体当前位置
		    	lyr3.bind("mousemove", dragMove);
		    	lyr3.bind("mouseup", dragUp);
		    	//在背景层上绑定，修正拖动不平滑的bug
		    	$(topWin.document).bind("mousemove", dragMove);
		    	$(topWin.document).bind("mouseup",dragUp);
		    	//鼠标滑动可能在iframe中发生,将弹出窗口的坐标作为入参，作为判断鼠标进入iframe的依据
		    	$(topWin.$.DialogData.iframeObj.attr('contentWindow').document).bind("mousemove",{x:"topWin.$.funkyUI.dragEle.css('left')",y:"topWin.$.funkyUI.dragEle.css('top')"}, dragMove);
		    	$(topWin.$.DialogData.iframeObj.attr('contentWindow').document).bind("mouseup", dragUp);
		    	if(opts.OKEvent){
		    		lyr3.find("input[id^='_ButtonOK_']").bind("click", opts.OKEvent);
		    	}
		    	if(opts.CancelEvent){
		    		lyr3.find("input[id^='_ButtonCancel_']").bind("click", opts.CancelEvent);
		    	}
		    }); 
			}
			
  	}
    lyr3.show();
    
    if (full) {
        pageBlock = lyr3[0];
        pageBlockEls = $(':input:enabled:visible',pageBlock);
        if (opts.focusInput)
            setTimeout(focus, 20);
    }
    else
        center(lyr3[0], opts.centerX, opts.centerY);
};

function dragMove(event){
	event = event ? event : ((window.event) ? window.event : "")
  if (topWin.$.funkyUI.dragEle == null ) {
		return;
	}
	
	var dx = event.data?(parseInt(eval(event.data.x).substring(0,eval(event.data.x).length-2)))+13:0;
	var dy = event.data?(parseInt(eval(event.data.y).substring(0,eval(event.data.y).length-2)))+33:0;

	//鼠标的现在位置
	var x = dx  + getPointer(event).x - parseInt(topWin.$.funkyUI.pointer.x);//还需要加上iframe与div之间的表格宽度13
	var y = dy  + getPointer(event).y - parseInt(topWin.$.funkyUI.pointer.y);//还需要加上iframe与div之间的表格宽度33

	topWin.$.funkyUI.dragEle.css('left',parseInt(topWin.$.funkyUI.dialogPointer.x) + x);
	topWin.$.funkyUI.dragEle.css('top',parseInt(topWin.$.funkyUI.dialogPointer.y) + y);
}

function dragUp(){
	topWin.$.funkyUI.dragEle.unbind("mousemove", dragMove).unbind("mouseup", dragUp);
  $(topWin.document).unbind("mousemove", dragMove).unbind("mouseup", dragUp);
  $(topWin.$.DialogData.iframeObj.attr('contentWindow').document).unbind("mousemove", dragMove);
  $(topWin.$.DialogData.iframeObj.attr('contentWindow').document).unbind("mouseup", dragUp);
}
//获得当前鼠标的坐标
function getPointer(event){
		var x = event.pageX || (event.clientX + (document.documentElement.scrollLeft || document.body.scrollLeft)) || 0;
		var y = event.pageY || (event.clientY + (document.documentElement.scrollTop || document.body.scrollTop)) || 0;
		return {x:x, y:y};
	}

// remove the block
function remove(el, opts) {
    var full = el == window.top;
    opts = $.extend({}, $.funkyUI.defaults, opts || {});
    if (full) {
    	if(topWin.$._Array.length>1){
    		var win = topWin.$._Array.pop();
    		topWin.$.DialogData.backgroundDiv.css('z-index',parseInt(topWin.$._Array[topWin.$._Array.length-1].$.DialogData.dialogDiv.css('z-index'))-1);	
//    		topWin.$._Array[topWin.$._Array.length-1].$.DialogData.dialogDiv.hide(); 
//    		topWin.$._Array[topWin.$._Array.length-1].$.DialogData.dialogDiv.fadeIn("fast"); 
//    		win.$.DialogData.dialogDiv.fadeOut("normal"); 
				$('#_DialogDiv_'+opts.id).fadeOut("normal");
    		bind(0, el, opts); // unbind events
    	}else{
    		var win = topWin.$._Array.pop();
//    		win.$.DialogData.dialogDiv.hide();
//    		win.$.DialogData.dialogDiv.html();
				$('#_DialogDiv_'+opts.id).fadeOut("normal");
    		bind(0, el, opts); // unbind events
    		var els = $(topWin.document.body).children().filter('.funkyUI') ;
    		if (opts.fadeOut) {
		        els.fadeOut(opts.fadeOut);
		        setTimeout(function() { 
		        	reset(els,  opts, el);
		        	}, opts.fadeOut);
		    }
		    else{
		        reset(els,  opts, el);
		    }
    	}
    	//这里要进行初始化，即消灭所有创建的，并把命名空间置零
    }else{
    		bind(0, el, opts); // unbind events
    		var els = $('.funkyUI', el) ;
    		if (opts.fadeOut) {
		        els.fadeOut(opts.fadeOut);
		        setTimeout(function() { 
		        	reset(els,opts,el); 
		        	}, opts.fadeOut);
		    }
		    else{
		        reset(els,  opts, el);
				}
    }

};

// move blocking element back into the DOM where it started
function reset(els,opts,el) {
    els.each(function(i,o) {
    		$(this).remove();
    });
    
   //如果onUnblock初始化了函数则执行
    if (typeof opts.onUnblock == 'function')
        opts.onUnblock(el,opts);
};

// bind/unbind the handler
function bind(b, el, opts) {
    var full = el == window.top, $el = $(el);
    // don't bother unbinding if there is nothing to unbind
    if (!b && (full && !pageBlock || !full && !$el.data('funkyUI.isBlocked'))) 
        return;
    if (!full) 
        $el.data('funkyUI.isBlocked', b);
        
    // bind anchors and inputs for mouse and key events
    var events = 'mousedown mouseup keypress keydown click';
    var doc = full ? $(el.document):$(document);
    b ? doc.bind(events, {opts:opts,el:el}, handler) : doc.unbind(events, handler);
    		
};

// 当block了以后禁止键盘和鼠标动作
function handler(e) {
    // allow tab navigation (conditionally)
    if (e.keyCode && e.keyCode == 9) {
        if (pageBlock && e.data.constrainTabKey) {
            var els = pageBlockEls;
            var fwd = !e.shiftKey && e.target == els[els.length-1];
            var back = e.shiftKey && e.target == els[0];
            if (fwd || back) {
                setTimeout(function(){focus(back)},10);
                return false;
            }
        }
    }
    //当按下esc键的时候unblock
    if (e.keyCode && e.keyCode == 27) {
		    	remove(e.data.el,e.data.opts);		
		}
    // 发生在弹出窗口中的事件是允许的 
    if ($(e.target).parents('div.blockMsg').length > 0)
        return true;
        
    // 发生在未被block的事件是允许的
    return $(e.target).parents().children().filter('div.funkyUI').length == 0;
};

function focus(back) {
    if (!pageBlockEls) 
        return;
    var e = pageBlockEls[back===true ? pageBlockEls.length-1 : 0];
    if (e) 
        e.focus();
};

//计算被block的元素或者页面的中心，确保弹出框在中心
function center(el, x, y) {
    var p = el.parentNode, s = el.style;
    var l = ((p.offsetWidth - el.offsetWidth)/2) - sz(p,'borderLeftWidth');
    var t = ((p.offsetHeight - el.offsetHeight)/2) - sz(p,'borderTopWidth');
    if (x) s.left = l > 0 ? (l+'px') : '0';
    if (y) s.top  = t > 0 ? (t+'px') : '0';
};

function sz(el, p) { 
    return parseInt($.css(el,p))||0; 
};


function Alert(msg,w,h,func){
	var opts = {css:{width:w?w:300,height:h?h:120}};
	//这里还可以判断msg的长度进行排版，并调整弹出框的大小加
	install(window.top, opts);
//	$.DialogData.dialogDiv.find("input[id^='_ButtonCancel_']")[0].focus();
	$.DialogData.dialogDiv.find("input[id^='_ButtonCancel_']").hide();
//	$.DialogData.dialogDiv.find("input[id^='_ButtonCancel_']").attr('value','确 定');
	$.DialogData.dialogDiv.find("div[id^='_DialogButtons_']").css('text-align','center');
	var win = topWin.$.DialogData.iframeObj.attr('contentWindow');
	var doc = win.document;
	doc.open();
	doc.write("<body></body>") ;
	var arr = [];
	arr.push("<div><table height='100%' border='0' align='center' cellpadding='10' cellspacing='0'>");
	arr.push("<tr><td align='center'><img id='Icon' src='shop/alert/images/icon_alert.gif' width='34' height='34' align='absmiddle'></td>");
	arr.push("<td align='left' id='Message' style='font-size:9pt'>"+msg+"</td></tr></table></div>");
	var div = $(arr.join(''),doc.body);
	$(doc.body).append(div);
	doc.close()
	
	//设置响应函数;
	//如果传递响应函数则执行，否则仅关闭窗口
	$.DialogData.dialogDiv.find("input[id^='_ButtonOK_']").bind("click", function() {
			$.unfunkyUI();
			if(func){
				func();
			}
			}) 

}

function Confirm(msg,func1,func2,w,h){
	var opts = {css:{width:w?w:300,height:h?h:120}};
	//这里还可以判断msg的长度进行排版，并调整弹出框的大小
	install(window.top, opts);
	$.DialogData.dialogDiv.find("div[id^='_DialogButtons_']").css('text-align','center')
	
	var win = topWin.$.DialogData.iframeObj.attr('contentWindow');
	var doc = win.document;
	doc.open();
	doc.write("<body></body>") ;
	var arr = [];
	arr.push("<div><table height='100%' border='0' align='center' cellpadding='10' cellspacing='0'>");
	arr.push("<tr><td align='center'><img id='Icon' src='shop/alert/images/icon_query.gif' width='34' height='34' align='absmiddle'></td>");
	arr.push("<td align='left' id='Message' style='font-size:9pt'>"+msg+"</td></tr></table></div>");
	var div = $(arr.join(''),doc.body);
	$(doc.body).append(div);
	doc.close();
	
	//设置响应函数
	//如果传递响应函数则执行，否则仅关闭窗口
	$.DialogData.dialogDiv.find("input[id^='_ButtonOK_']").bind("click", function() { 
			$.unfunkyUI();
			if(func1){
				func1();
			}
			window.location.href="User_logout.action";
		})
	$.DialogData.dialogDiv.find("input[id^='_ButtonCancel_']").bind("click", function() { 
			if(func2){
				func2();
			}
		}) ;
}

})(jQuery);
