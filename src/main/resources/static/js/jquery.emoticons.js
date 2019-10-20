/**
 * jQuery's jqfaceedit Plugin
 *
 * @author cdm
 * @version 0.2
 * @copyright Copyright(c) 2012.
 * @date 2012-08-09
 */
(function($) {
    var em = [
                {'id':1,'phrase':'[呵呵]','url':'1.gif'},{'id':2,'phrase':'[颤栗]','url':'2.gif'},
                {'id':3,'phrase':'[色]','url':'3.gif'},{'id':4,'phrase':'[发呆]','url':'4.gif'},
                {'id':5,'phrase':'[流泪]','url':'5.gif'},{'id':6,'phrase':'[长睫毛]','url':'6.gif'},
                {'id':7,'phrase':'[封口]','url':'7.gif'},{'id':8,'phrase':'[睡眠]','url':'8.gif'},
                {'id':9,'phrase':'[可怜]','url':'9.gif'},{'id':10,'phrase':'[紧张]','url':'10.gif'},
                {'id':11,'phrase':'[怒]','url':'11.gif'},{'id':12,'phrase':'[调皮]','url':'12.gif'},
                {'id':13,'phrase':'[龇牙]','url':'13.gif'},{'id':14,'phrase':'[惊讶]','url':'14.gif'},
                {'id':15,'phrase':'[不开心]','url':'15.gif'},{'id':16,'phrase':'[抱歉的流汗]','url':'16.gif'},
                {'id':17,'phrase':'[作]','url':'17.gif'},{'id':18,'phrase':'[呕吐]','url':'18.gif'},
                {'id':19,'phrase':'[笑不露齿]','url':'19.gif'},{'id':20,'phrase':'[可爱]','url':'20.gif'},
                {'id':21,'phrase':'[吹口哨]','url':'21.gif'},{'id':22,'phrase':'[撇嘴]','url':'22.gif'},
                {'id':23,'phrase':'[饥饿]','url':'23.gif'},{'id':24,'phrase':'[困倦]','url':'24.gif'},
                {'id':25,'phrase':'[吓尿了]','url':'25.gif'},{'id':26,'phrase':'[无奈的流汗]','url':'26.gif'},
                {'id':27,'phrase':'[哈哈]','url':'27.gif'},{'id':28,'phrase':'[酷]','url':'28.gif'},
                {'id':29,'phrase':'[奋斗]','url':'29.gif'},{'id':30,'phrase':'[训斥]','url':'30.gif'},
                {'id':31,'phrase':'[疑问]','url':'31.gif'},{'id':32,'phrase':'[嘘]','url':'32.gif'},
                {'id':33,'phrase':'[懵圈]','url':'33.gif'},{'id':34,'phrase':'[发神经]','url':'34.gif'},
                {'id':35,'phrase':'[衰]','url':'35.gif'},{'id':36,'phrase':'[敲死你]','url':'36.gif'},
                {'id':37,'phrase':'[拜拜]','url':'37.gif'},{'id':38,'phrase':'[鄙视的流汗]','url':'38.gif'},
                {'id':39,'phrase':'[挖鼻]','url':'39.gif'},{'id':40,'phrase':'[撅嘴流汗]','url':'40.gif'},
                {'id':41,'phrase':'[挑逗]','url':'41.gif'},{'id':42,'phrase':'[左哼哼]','url':'42.gif'},
                {'id':43,'phrase':'[右哼哼]','url':'43.gif'},{'id':44,'phrase':'[打哈欠]','url':'44.gif'},
                {'id':45,'phrase':'[鄙视]','url':'45.gif'},{'id':46,'phrase':'[委屈]','url':'46.gif'},
                {'id':47,'phrase':'[要哭了]','url':'47.gif'},{'id':48,'phrase':'[阴笑]','url':'48.gif'},
                {'id':49,'phrase':'[亲亲]','url':'49.gif'},{'id':50,'phrase':'[黑线]','url':'50.gif'},
                {'id':51,'phrase':'[期盼]','url':'51.gif'},{'id':52,'phrase':'[抱抱]','url':'52.gif'},
                {'id':53,'phrase':'[夜晚]','url':'53.gif'},{'id':54,'phrase':'[白天]','url':'54.gif'},
                {'id':55,'phrase':'[地雷]','url':'55.gif'},{'id':56,'phrase':'[骷髅头]','url':'56.gif'},
                {'id':57,'phrase':'[菜刀]','url':'57.gif'},{'id':58,'phrase':'[猪头]','url':'58.gif'},
                {'id':59,'phrase':'[西瓜]','url':'59.gif'},{'id':60,'phrase':'[咖啡]','url':'60.gif'},
                {'id':61,'phrase':'[米饭]','url':'61.gif'},{'id':62,'phrase':'[一颗红心献给你]','url':'62.gif'},
                {'id':63,'phrase':'[牛逼]','url':'63.gif'},{'id':64,'phrase':'[烂透了]','url':'64.gif'},
                {'id':65,'phrase':'[合作愉快]','url':'65.gif'},{'id':66,'phrase':'[耶]','url':'66.gif'},
                {'id':67,'phrase':'[抱拳]','url':'67.gif'},{'id':68,'phrase':'[来]','url':'68.gif'},
                {'id':69,'phrase':'[OK]','url':'69.gif'},{'id':70,'phrase':'[NO]','url':'70.gif'},
                {'id':71,'phrase':'[玫瑰]','url':'71.gif'},{'id':72,'phrase':'[玫瑰蔫了]','url':'72.gif'},
                {'id':73,'phrase':'[唇]','url':'73.gif'},{'id':74,'phrase':'[一对小企鹅]','url':'74.gif'},
                {'id':75,'phrase':'[一只求爱的小企鹅]','url':'75.gif'},{'id':76,'phrase':'[笑的捶地]','url':'76.gif'},
		{'id':77,'phrase':'[害羞]','url':'Onion--7.gif'},{'id':78,'phrase':'[呕吐]','url':'Onion--10.gif'},
		{'id':79,'phrase':'[心情好]','url':'Onion--11.gif'},{'id':80,'phrase':'[鄙视]','url':'Onion--12.gif'},
		{'id':81,'phrase':'[吓尿]','url':'Onion--14.gif'},{'id':82,'phrase':'[催眠]','url':'Onion--15.gif'},
		{'id':83,'phrase':'[得瑟]','url':'Onion--42.gif'},{'id':84,'phrase':'[大吵]','url':'Onion--48.gif'},
		{'id':85,'phrase':'[飞起]','url':'Onion--77.gif'},{'id':86,'phrase':'[发烧]','url':'Onion--61.gif'},
		{'id':87,'phrase':'[可怜]','url':'Onion--100.gif'},{'id':88,'phrase':'[写代码]','url':'Onion--81.gif'},
		{'id':89,'phrase':'[必杀]','url':'Onion--90.gif'},{'id':90,'phrase':'[爽]','url':'Onion--16.gif'},
		{'id':91,'phrase':'[擦汗]','url':'Onion--20.gif'},{'id':92,'phrase':'[跳舞]','url':'Onion--49.gif'},
		{'id':93,'phrase':'[踢飞]','url':'Onion--44.gif'},{'id':94,'phrase':'[念经]','url':'Onion--106.gif'},
		{'id':95,'phrase':'[踢球]','url':'Onion--76.gif'},{'id':96,'phrase':'[再见]','url':'Onion--84.gif'},
		{'id':97,'phrase':'[瞌睡]','url':'Onion--85.gif'},{'id':98,'phrase':'[无语]','url':'Onion--74.gif'},
		{'id':99,'phrase':'[死翘翘]','url':'Onion--33.gif'},{'id':100,'phrase':'[英雄]','url':'Onion--26.gif'},
		{'id':101,'phrase':'[鼻血]','url':'Onion--1.gif'},{'id':102,'phrase':'[ok]','url':'Onion--2.gif'},
		{'id':103,'phrase':'[恼怒]','url':'Onion--3.gif'},{'id':104,'phrase':'[坏笑]','url':'Onion--4.gif'},
		{'id':105,'phrase':'[冷落]','url':'Onion--5.gif'},{'id':106,'phrase':'[抛弃]','url':'Onion--6.gif'}
            ];
    //textarea设置光标位置
    function setCursorPosition(ctrl, pos) {
        if(ctrl.setSelectionRange) {
            ctrl.focus();
            ctrl.setSelectionRange(pos, pos);
        } else if(ctrl.createTextRange) {// IE Support
            var range = ctrl.createTextRange();
            range.collapse(true);
            range.moveEnd('character', pos);
            range.moveStart('character', pos);
            range.select();
        }
    }

    //获取多行文本框光标位置
    function getPositionForTextArea(obj)
    {
        var Sel = document.selection.createRange();
        var Sel2 = Sel.duplicate();
        Sel2.moveToElementText(obj);
        var CaretPos = -1;
        while(Sel2.inRange(Sel)) {
            Sel2.moveStart('character');
            CaretPos++;
        }
       return CaretPos ;

    }

    $.fn.extend({
        jqfaceedit : function(options) {
            var defaults = {
                txtAreaObj : '', //TextArea对象
                containerObj : '', //表情框父对象
                textareaid: 'Content',//textarea元素的id
                popName : '', //iframe弹出框名称,containerObj为父窗体时使用
                emotions : em, //表情信息json格式，id表情排序号 phrase表情使用的替代短语url表情文件名
                top : 0, //相对偏移
                left : 0 //相对偏移
            };
            
            var options = $.extend(defaults, options);
            var cpos=0;//光标位置，支持从光标处插入数据
            var textareaid = options.textareaid;
            
            return this.each(function() {
                var Obj = $(this);
                var container = options.containerObj;
                if ( document.selection ) {//ie
                    options.txtAreaObj.bind("click keyup",function(e){//点击或键盘动作时设置光标值
                        e.stopPropagation();
                        cpos = getPositionForTextArea(document.getElementById(textareaid)?document.getElementById(textareaid):window.frames[options.popName].document.getElementById(textareaid));
                    });
                }
                $(Obj).bind("click", function(e) {
                    e.stopPropagation();
                    var faceHtml = '<div id="face">';
                    faceHtml += '<div id="texttb"><a class="f_close" title="关闭" href="javascript:void(0);"></a></div>';
                    faceHtml += '<div id="facebox">';
                    faceHtml += '<div id="face_detail" class="facebox clearfix"><ul>';

                    for( i = 0; i < options.emotions.length; i++) {
                        faceHtml += '<li text=' + options.emotions[i].phrase + ' type=' + i + '><img title=' + options.emotions[i].phrase + ' src="../../images/emotions/'+ options.emotions[i].url + '"  style="cursor:pointer; position:relative;"   /></li>';
                    }
                    faceHtml += '</ul></div>';
                    faceHtml += '</div><div class="arrow arrow_t"></div></div>';

                    container.find('#face').remove();
                    container.append(faceHtml);
                    
                    container.find("#face_detail ul >li").bind("click", function(e) {
                        var txt = $(this).attr("text");
                        var faceText = txt;

                        //options.txtAreaObj.val(options.txtAreaObj.val() + faceText);
                        var tclen = options.txtAreaObj.val().length;
                        
                        var tc = document.getElementById(textareaid);
                        if ( options.popName ) {
                            tc = window.frames[options.popName].document.getElementById(textareaid);
                        }
                        var pos = 0;
                        if( typeof document.selection != "undefined") {//IE
                            options.txtAreaObj.focus();
                            setCursorPosition(tc, cpos);//设置焦点
                            document.selection.createRange().text = faceText;
                            //计算光标位置
                            pos = getPositionForTextArea(tc); 
                        } else {//火狐
                            //计算光标位置
                            pos = tc.selectionStart + faceText.length;
                            options.txtAreaObj.val(options.txtAreaObj.val().substr(0, tc.selectionStart) + faceText + options.txtAreaObj.val().substring(tc.selectionStart, tclen));
                        }
                        cpos = pos;
                        setCursorPosition(tc, pos);//设置焦点
                        container.find("#face").remove();

                    });
                    //关闭表情框
                    container.find(".f_close").bind("click", function() {
                        container.find("#face").remove();
                    });
                    //处理js事件冒泡问题
                    $('body').bind("click", function(e) {
                        e.stopPropagation();
                        container.find('#face').remove();
                        $(this).unbind('click');
                    });
                    if(options.popName != '') {
                        $(window.frames[options.popName].document).find('body').bind("click", function(e) {
                            e.stopPropagation();
                            container.find('#face').remove();
                        });
                    }
                    container.find('#face').bind("click", function(e) {
                        e.stopPropagation();
                    });
                    var offset = $(e.target).offset();
                    offset.top += options.top;
                    offset.left += options.left;
                    container.find("#face").css(offset).show();
                });
            });
        },
        //表情文字符号转换为html格式
        emotionsToHtml : function(options) {
            return this.each(function() {
                var msgObj = $(this);
                var rContent = msgObj.html();

                var regx = /(\[[\u4e00-\u9fa5]*\w*\]){1}/g;
                //正则查找“[]”格式
                var rs = rContent.match(regx);
                if(rs) {
                    for( i = 0; i < rs.length; i++) {
                        for( n = 0; n < em.length; n++) {
                            if(em[n].phrase == rs[i]) {
                                var t = "<img src='../../images/emotions/"  + em[n].url + "' />";
                                rContent = rContent.replace(rs[i], t);
                                break;
                            }
                        }
                    }
                }
                msgObj.html(rContent);
            });
        }
    })
})(jQuery);
