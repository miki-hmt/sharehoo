// Traffic Stats of the entire Web site By baidu
var _hmt = _hmt || [];
(function() {
  var hm = document.createElement("script");
  hm.src = "https://hm.baidu.com/hm.js?a17e70ae662c5f982f285d3f3d93f0ca";
  var s = document.getElementsByTagName("script")[0]; 
  s.parentNode.insertBefore(hm, s);
})();
// Traffic Stats of the entire Web site By baidu end
var _gaq = [];
var userAgent = navigator.userAgent.toLowerCase();
// if(userAgent == null || userAgent == ''){
// //
// }else{
//     if(userAgent.indexOf("android") != -1 || userAgent.indexOf("ios") != -1 || userAgent.indexOf("iphone") != -1 || userAgent.indexOf("ipad") != -1 || userAgent.indexOf("windows phone") != -1 ){

//   	}else{
//   	  //google 统计start
//   	  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
//   		  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
//   		  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
//   		  })(window,document,'script','//www.google-analytics.com/analytics.js','ga');

//   		  ga('create', 'UA-64962204-1', 'auto');
//   		  ga('send', 'pageview');
//         //google 统计end
//    }
// }


!(function(){
  var currUser={
      userName:"",
      userNick:'<a class="set-nick" href="#">设置昵称<span class="write-icon"></span></a>',
      userInfo:"",
      desc : '<a class="fill-dec" href="//my.csdn.net" target="_blank">编辑自我介绍，让更多人了解你<span class="write-icon"></span></a>',
      avatar:""
    };
  var prodLogo = "none";
  var $oScriptTag =$("#toolbar-tpl-scriptId");
  var skin =$oScriptTag.attr("skin")=="black"?" csdn-toolbar-skin-black ":"";
  var fixed = $oScriptTag.attr("fixed")=="top"?" navbar-fixed-top ":"";
  var prodIndex= $oScriptTag.attr("domain")?$oScriptTag.attr("domain"):window.location.protocol+"//"+window.location.host;
      prodIndex+='?ref=toolbar_logo';
  var getCookie =function (objName){//获取指定名称的cookie的值
      var arrStr = document.cookie.split("; ");
      for(var i = 0;i < arrStr.length;i ++){
      var temp = arrStr[i].split("=");
      if(temp[0] == objName && objName=="UD") return decodeURIComponent(temp[1]);
      if(temp[0] == objName) return decodeURI(temp[1]);
      }
  }
  var setCookie = function (name,value) {
    var Days = 30;
    var exp = new Date();
    exp.setTime(exp.getTime() + Days*24*60*60*1000);
    document.cookie = name + "="+ escape (value) + ";expires=" + exp.toGMTString();// + ";domain=.csdn.net;path=/";
  }
  var HTMLEncode =function(str) {
      var s = "";
      if(str.length == 0) return "";
      s = str.replace(/&/g, "&amp;").replace(/</g, "&lt;").replace(/>/g, "&gt;").replace(/\'/g, "&#39;").replace(/\"/g, "&quot;");
      return s;
    }
  var AUtoAvatar = function(AU){
    if(!AU||!currUser.userName){
      return false;
    }
    var _AUPath = AU.split("").join("index.html");
    var userName = currUser.userName&&currUser.userName.toLowerCase();
    return "http://sharehoo.cn/"+_AUPath+"/2_"+userName+".jpg";
  }
  var hasLogin = false;
  var loginMark ="unlogin";
  function checkLogin(callback) {
          currUser.userNick = getCookie("UserNick") ||currUser.userNick;
          currUser.userName = getCookie("UserName") || currUser.userName;
          currUser.userInfo = getCookie("UserInfo") || currUser.userInfo;
          currUser.avatar = AUtoAvatar(getCookie("AU")) || currUser.avatar;
          currUser.desc = getCookie("UD") || currUser.desc;
          if(getCookie("UD")){
            currUser.desc = HTMLEncode(currUser.desc.replace(/\+/g," "));
          }
          callback(currUser);
    }
  
  checkLogin(function(currUser){
    if(currUser.userName&&currUser.userInfo){
        hasLogin = true;
    }
    loginMark = hasLogin?"":"unlogin";
  })


	function upload(){
		if ('${currentUser.nickName}'==null||'${currentUser.nickName}'=="") {
			swal("您还未登陆！");
		} else {
			window.location.href="shop/center";
		}	
    }

	
  function Login(){	
	  if ('${currentUser.nickName}'==null||'${currentUser.nickName}'=="") {
		var curPage=window.location.href;
		window.location.href="${pageContext.request.contextPath}/login.jsp?prePage="+curPage;
	  }else{
		  swal("您已经登录！");
	  }
    }
  /*
  * init pord logo
  */
  var prodJSON = {
      "blog" : "blog-icon",
      "download" : "down-icon",
      "bbs" : "bbs-icon",
      "my" :"space-icon",
      "code" : "code-icon",
      "share" : "share-icon",
      "tag" : "tag-icon",
      "dashboard":"dashboard-icon",
      "news" : "news-icon",
      "tag" : "tag-icon",
      "ask" : "ask-icon",
      "notify" : "notify-icon"
  }
  if(prodJSON[$oScriptTag.attr("prod")]){
    prodLogo=prodJSON[$oScriptTag.attr("prod")]||$oScriptTag.attr("prod");
  }

  var tpl ='\<div class="csdn-toolbar'+skin+fixed+'">\
  <div class="container row center-block ">\
  <div class="col-md-3 pull-left logo clearfix"><a href="http://sharehoo.cn/shop/Shop_home.action" title="下载首页" target="_blank" class="icon"></a><a title="频道首页" href="http://sharehoo.cn/shop/Shop_home.action" class="img '+prodLogo+'"></a></div>\
  <div class="pull-right login-wrap '+loginMark+'">\
    <ul class="btns">\
  <li class="loginlink"><a href="javascript:void(0)" onclick="javascript:Login()" target="_top">登录&nbsp;</a>|<a  target="_top" href="../register">&nbsp;注册</a></li>\
      <li class="search">\
        <div class="icon on-search-icon">\
          <div class="wrap">\
            <div class="curr-icon-wrap">\
              <div class="curr-icon"></div>\
            </div>\
            <form action="http://so.csdn.net/search" id="toolbar_search" method="get" target="_blank">\
              <input type="hidden" value="toolbar" name="ref" accesskey="2">\
              <div class="border">\
                <input placeholder="搜索" type="text" value="" name="q" accesskey="2"><span class="icon-enter-sm"></span>\
              </div>\
            </form>\
          </div>\
        </div>\
      </li>\
      <li class="favor">\
        <div class="icon on-favor-icon">\
          <div class="wrap">\
            <div class="curr-icon-wrap">\
              <div class="curr-icon"></div>\
            </div>\
            <div style="display:none;" class="favor-success"><span class="msg">收藏成功</span>\
              <div class="btns"><span class="btn btn-primary ok">确定</span></div>\
            </div>\
            <div style="display:none;" class="favor-failed"><span class="icon-danger-lg"></span><span class="msg">收藏失败，请重新收藏</span>\
              <div class="btns"><span class="btn btn-primary ok">确定</span></div>\
            </div>\
            <form role="form" class="form-horizontal favor-form">\
              <div class="form-group">\
                <div class="clearfix">\
                  <label for="input-title" class="col-sm-2 control-label"><span class="red_txt">*</span>标题</label>\
                  <div class="col-sm-10">\
                    <input id="inputTitle" type="text" placeholder="" class="title form-control">\
                  </div>\
                </div>\
                <div class="alert alert-danger"><strong></strong>标题不能为空</div>\
              </div>\
              <div class="form-group" style="display:none;">\
                <label for="input-url" class="col-sm-2 control-label">网址</label>\
                <div class="col-sm-10">\
                  <input id="input-url" type="text" placeholder="" class="url form-control">\
                </div>\
              </div>\
              <div class="form-group">\
                <label for="input-tag" class="col-sm-2 tag control-label">标签</label>\
                <div class="col-sm-10">\
                  <input id="input-tag" type="text" class="form-control tag">\
                </div>\
              </div>\
              <div class="form-group">\
                <label for="input-description" class="description col-sm-2 control-label">位置</label>\
                <div class="col-sm-10">\
                  <div class="my_lib_box">\
                    个人主页&nbsp;-&nbsp;<a href="http://my.csdn.net/" target="_blank">我的知识</a>\
                  </div>\
                  <div class="checkbox">\
                    <div class="pull-left">\
                      <label>\
                        <input type="checkbox" name="share" class="save_lib_map">同时保存至：\
                      </label>\
                    </div>\
                    <div class="pull-left">\
                      <div class="dropdown">\
                        <button id="toolbar_sele_map" type="button">\
                          选择知识图谱\
                          <i class="fa fa-chevron-down"></i>\
                        </button>\
                        <div class="top_arr"></div>\
                        <div class="outside">\
                          <ul class="dropdown-menu" id="toolbar_Design_knowledge"></ul>\
                        </div>\
                      </div>\
                    </div>\
                    <div class="pull-left new_txt">\
                      <a href="http://lib.csdn.net/my/create/structure" target="_blank">新建？</a>\
                    </div>\
                  </div>\
                </div>\
              </div>\
              <div class="form-group">\
                <div class="col-sm-offset-2 col-sm-10 ft">\
                  <div class="col-sm-4 pull-left" style="display:none">\
                    <div class="checkbox">\
                      <label>\
                        <input type="checkbox" name="share" checked="checked" class="share">公开\
                      </label>\
                    </div>\
                  </div>\
                  <div class="col-sm-8 pull-right favor-btns">\
                    <button type="button" class="cancel btn btn-default">取消</button>\
                    <button type="submit" class="submit btn btn-primary">收藏</button>\
                  </div>\
                </div>\
              </div>\
            </form>\
          </div>\
        </div>\
      </li>\
      <li class="notify">\
        <div style="display:none" class="number"></div>\
        <div style="display:none" class="icon-hasnotes-sm"></div>\
        <div id="header_notice_num"></div>\
        <div class="icon on-notify-icon">\
          <div class="wrap">\
            <div class="curr-icon-wrap">\
              <div class="curr-icon"></div>\
            </div>\
            <div id="note1" class="csdn_note">\
              <div class="box"></div>\
            </div>\
          </div>\
        </div>\
      </li>\
      <li class="ugc">\
        <div class="icon on-ugc-icon">\
          <div class="wrap clearfix">\
            <div class="curr-icon-wrap">\
              <div class="curr-icon"></div>\
            </div>\
            <dl>\
              <dt><a href="http://sharehoo.cn/topic/section/1" target="_blank" class="p-news clearfix" style="display:none;"><em class="icon"></em><span>分享资讯</span></a></dt>\
              <dt style="border: none;"><a href="javascript:void(0)"  onclick="javascript:upload()" target="_blank" class="p-doc clearfix"><em class="icon"></em><span>传文件</span></a></dt>\
              <dt><a href="http://sharehoo.cn/topic/section/11" target="_blank" class="p-ask clearfix"><em class="icon"></em><span>提问题</span></a></dt>\
              <dt><a href="#" target="_blank" class="p-blog clearfix"><em class="icon"></em><span>写博客</span></a></dt>\
              <dt><a href="javascript:void(0)"  onclick="javascript:upload()" target="_blank" class="p-src clearfix"><em class="icon"></em><span>传资源</span></a></dt>\
              </dl>\
          </div>\
        </div>\
      </li>\
      <li class="profile">\
        <div class="icon on-profile-icon"><img src="'+currUser.avatar+'" class="curr-icon-img">\
          <div class="wrap clearfix">\
            <div class="curr-icon-wrap">\
              <div class="curr-icon"></div>\
            </div>\
            <div class="bd">\
              <dl class="clearfix">\
                <dt class="pull-left img"><a target="_blank" href="http://my.csdn.net?ref=toolbar" class="avatar"><img src="'+currUser.avatar+'"></a></dt>\
                <dd class="info" style="border: none;"><a target="_blank" href="http://my.csdn.net?ref=toolbar" class="nickname">'+currUser.userNick+'</a><span class="dec">'+currUser.desc+'</span></dd>\
              </dl>\
            </div>\
            <div class="ft clearfix"><a target="_blank" href="http://my.csdn.net/my/account/changepwd?ref=toolbar" class="pull-left"><span class="icon-cog"></span>帐号设置</a><a href="https://passport.csdn.net/account/logout?ref=toolbar"  target="_top" class="pull-left" style="margin-left:132px; width:18px; height:27px; white-space:nowrap; overflow:hidden;"><span class="icon-signout"></span><span class="out">退出</span></a></div>\
          </div>\
        </div>\
      </li>\
      <li class="apps">\
        <div id="chasnew123" class="hasnew"></div>\
        <div id="cappsarea123" class="icon on-apps-icon">\
          <div class="wrap clearfix">\
            <div class="curr-icon-wrap">\
              <div class="curr-icon"></div>\
            </div>\
          <div class="detail">\
            <dl>\
              <dt>\
                <h5>社区</h5>\
              </dt>\
              <dd> <a href="http://sharehoo.cn/blog/Blog_show.action?userId=21" target="_blank">博客</a></dd>\
              <dd> <a href="http://sharehoo.cn" target="_blank">论坛</a></dd>\
              <dd> <a href="http://sharehoo.cn/shop/Shop_home.action" target="_blank">下载</a></dd>\
              <dd> <a href="http://sharehoo.cn/topic/section/1" target="_blank">知识库</a></dd>\
              <dd><a href="http://sharehoo.cn/topic/section/11" target="_blank">技术问答</a></dd>\
              <dd><a href="http://sharehoo.cn/topic/section/21" target="_blank">原创社区</a></dd>\
              <dd style="display:none;"> <a href="javascript:void(0)"  onclick="javascript:upload()" target="_blank">传文件</a></dd>\
            </dl>\
          </div>\
          <div class="detail">\
            <dl>\
              <dt>\
                <h5>服务</h5>\
              </dt>\
              <dd style="display:none"> <a href="#" target="_blank">店铺入驻<img src="#" style="display: none; margin-top: -26px; width: 23px;"></a></dd>\
              <dd> <a href="http://sharehoo.cn/game2.jsp" target="_blank">H5小游戏<img src="http://sharehoo.cn/shop/images/logo/new.gif" style=" margin-top: -26px; width: 23px;"></a></dd>\
              <dd> <a href="#" target="_blank">威客平台</a></dd>\
              <dd> <a href="#" target="_blank">店铺活动</a></dd>\
              <dd> <a href="http://sharehoo.cn/Topic_leaveList.action" target="_blank">秘密墙</a></dd>\
              <dd> <a href="#" target="_blank">虎豆兑换<img src="#" style="display: none; margin-top: -26px; width: 23px;"></a></dd>\
            </dl>\
          </div>\
          <div class="detail last">\
            <dl>\
              <dt>\
                <h5>社友俱乐部</h5>\
              </dt>\
              <dd> <a href="#" target="_blank">灌水区</a></dd>\
              <dd> <a href="#" target="_blank">高校俱乐部</a></dd>\
            </dl>\
          </div>\
        </div>\
      </div>\
    </li>\
    </ul>\
  </div>\
</div>\ </div>';
  $(document.body).prepend($(tpl));
  $("#chasnew123").hide();
  //var newTag = true;
  //if (newTag) {
  //  var hasNew = getCookie("csdn_has_new_product");
  //  if (hasNew == "2")
  //    $("#chasnew123").hide();
  //  else {
  //    $("#cappsarea123").one("mouseover", function () {
  //      setCookie("csdn_has_new_product", "2");
  //      $("#chasnew123").hide();
  //    });
  //  }
  //}
  $("#toolbar_sele_map").bind('click',function(){
    if(!$(this).parents(".dropdown").hasClass("open")){
      $(this).parents(".dropdown").addClass('open');
    }else{
      $(this).parents(".dropdown").removeClass('open');
    }
  });
})();
