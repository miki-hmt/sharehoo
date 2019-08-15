//
function initTab() {
    if ( !document.getElementById("spotlight") ) { return false };
	var slide_spot = new Tab();
	slide_spot.init({
	  handle:document.getElementById("spotlight").getElementsByTagName("h3")[0].getElementsByTagName("span"),
	  content:$("#spotlight .newslist"),
	  current:"active",
	  delay:300,
	  mode:"mouseover"
	});
};
initTab();
//initFocuseTab
var _focseitem=document.getElementById('focuscon').getElementsByTagName('dl');
function changeFocuse(obj){
	for(var i=0;i<_focseitem.length;i++){
		if(i>0){
			_focseitem[i].style.display = "none";
			}
		}
}
changeFocuse();

function initFocuseTab() {
   if ( !document.getElementById("focuscon") ) { return false };
	slide_focus = new Tab();
	slide_focus.init({
	  handle:document.getElementById("focuscon").getElementsByTagName("h2")[0].getElementsByTagName("span"),
	  content:document.getElementById("focuscon").getElementsByTagName("dl"),
	  current:"active",
	  mode:"mouseover",
	  delay:300,
	  speed:6000
	});
};
initFocuseTab();
/*news bigtxt*/
function lineBig(o,liYc){
	for(var i=0;i<liYc.length;i++){
		if(i==0||i==5){
			liYc[i].className="boldTxt";
			}
		}
}
function li_nub(o,liYc){
	for(var i=0;i<liYc.length;i++){
		if(i<=2){
			liYc[i].className="red";
			}
		}
}
_liNews1=document.getElementById('sh').getElementsByTagName('li');
_liNews2=document.getElementById('js').getElementsByTagName('li');
_liNews3=document.getElementById('yl').getElementsByTagName('li');
_liNews4=document.getElementById('gj').getElementsByTagName('li');
_liNews5=document.getElementById('rank').getElementsByTagName('li');
lineBig('sh',_liNews1);
lineBig('js',_liNews2);
lineBig('yl',_liNews3);
lineBig('gj',_liNews4);
li_nub('rank',_liNews5);







//togSideNav
function togSideNav() {
    $("#sideNavTop").on("click",function() {
    $("#sideNavCon").animate({height:'toggle'}, 200);
    });
};
togSideNav();
// 在初始化侧栏导航Fixed之前先设置节点参数
$("#sideNav").attr({"fixed-top-hide":$(".siteNav").offset().top + 580});
$("#sideNav").attr({"fixed-bottom-stop":$(".botCon").height() + 23});
if ( $(window).width() >= 1146 ) {// 屏幕过窄时不显示侧栏
	new FixedModule("sideNav", {
	    showCallback:function(that) {
	      sideShowFlag = false;
	      $(that.elem).hide();
	      $(that.elem).animate({opacity:'show'}, "slow", function() {
	      	$("#sideNavCon").animate({height:'show'}, 300);
	      });
	      // console.log("show");
	    },hideCallback:function(that) {
	      $(that.elem).hide();
	      $(that.elem).animate({opacity:'hide'}, "slow");
	      // console.log("hide");
	    }
	  });
};
//newslist id hlList


//
//chinaLogin
china_api_login({
 userNameInitValue:"",
  id:"login",
  initHTML:'{F7:form}<ul class="login-b"><li class="c-l-text"><em>用户名：</em>{F7:username /}</li><li class="c-l-text"><em>密&nbsp;&nbsp;&nbsp;码：</em>{F7:password /}</li><li class="c-l-check">记住登录状态：{F7:checkbox_cookietime /}</li><li class="c-l-btn"><input type="submit" value="登录" name="" /> <input type="button" value="注册" name="" class="mgl7r3"  onclick="register();" /> <a href="http://passport.china.com/jsp/user/findpassword.jsp" title="" target="_blank">忘记密码</a></li></ul><span id="clBot" class="clother"><a href="http://passport.china.com/user/the3ConnectAction.do?processID=qq&refurl=http://club.china.com/data/threads/1011/index.html"><img src="/index_2012/images/dlway01.png" alt="" /></a><a href="http://passport.china.com/user/the3ConnectAction.do?processID=sina&refurl=http://club.china.com/data/threads/1011/index.html"><img src="/index_2012/images/dlway02.png" alt="" /></a><a href="http://passport.china.com/user/the3ConnectAction.do?processID=kaixin&refurl=http://club.china.com/data/threads/1011/index.html"><img src="/index_2012/images/dlway03.png" alt="" /></a></span>{/F7:form}',
  logonHTML:'<ul><li class="c-l-dlh">[F7:nickname /]，您好！</li>'+
			'<li class="c-l-dlh"><span class="clsl">积分：<em id="scoresID">0</em></span><span class="clsl"><a target="_blank" href="http://wenda.china.com/myzhidao_q.jsp">我的问答</a></span></li>'
			+'<li class="c-l-dlh"><span>短信息：<a target="_blank" href="http://u.china.com/message/box_passport.php"><em id="newmessagenumID">0</em>封</a></span><span><a href="javascript:propscenter();">我的道具</a></span></li>'
			+'<li class="c-l-dlh"><span class="clsl"><a href="javascript:personalInfo();">个人中心</a></span><span>[F7:out /]</span></li></ul>',
  succeed:{loginOk: function(){ messageNum() }}
});

function messageNum(){
	if (china_api_login_nickname()!=false) {
		var url = "http://r.club.china.com/jsp/pub/controler.do?event=MESSAGEFRIENDSTOSNS&action=newMessage";
		var script_el = document.createElement("script");
		script_el.type='text/javascript';
		script_el.id='dscript';
		var h=document.getElementsByTagName("head")[0];
		h.appendChild(script_el);
		script_el.src=url;
	}
    onlineuserObject.refresh();
}