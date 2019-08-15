<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>IT帮-资讯传播社区--激活页面</title>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <style type="text/css">
        @font-face {
            font-family: digit;
            src: url('digital-7_mono.ttf') format("truetype");
        }
    </style>
    <link href="register_result/default.css" type="text/css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/shop/images/logo/favicon.ico" rel="SHORTCUT ICON" />
    <script type="text/javascript" src="register_result/jquery.js"></script>
    <script type="text/javascript" src="register_result/garden.js"></script>
    <script type="text/javascript" src="register_result/functions.js"></script>
</head>

<body>
    <div id="mainDiv">
        <div id="content">
            <div id="code">
                <span class="comments">/**注册成功！</span><br />
                <span class="space"/><span class="comments">* haha恭喜你,亲爱的陌生人，注册成为本站又又又一位重要的成员.</span><br />
                <span class="space"/><span class="comments">* so 本站从2016.10.8号上线至今，多靠各位的举手之劳，一步步走到今天这样的地步.</span><br />
                <span class="space"/><span class="comments">*/</span><br />
                Sharehoo = <span class="keyword">share</span> Who(<span class="string">"we"</span>);<br />
                We u = <span class="keyword">new</span> We(<span class="string">"you++"</span>);<br />
                <span class="comments">// October 8, 2016, we had told you we need you. </span><br />
                we.want(u);<br />
                <span class="comments">// by the way..., 顺便介绍一下本站的特色.</span><br />
                em...();<br />
                <span class="comments">// OK, 本站是集交流论坛，下载店铺，个人博客等于一身的社区系统，致力于打造中国最大的学生智力资源集中处理的集中营.</span><br />
                <span class="keyword">var</span> reason=u.ask("who 给我的勇气?");<br />
                <span class="comments">// em，当然不是梁静茹，梦想还是要有的，万一实现了呢(笑哭)。如果没了梦想，那和咸鱼有什么两样 .</span><br />
                $("body").append(reason);<br />
                <span class="comments">// So 加入我们吧，释放你的想象力，做自己想做的事情.</span><br />
                <span class="comments">// And 在这里，你可以将你的智慧和结晶呈献给大家，同时可以换取一部分金钱价值.</span><br />
                who.don‘t love(money)?;<br />
                <span class="comments">// So 我们在这里等着你回来，等着你归来把那菊花摘.</span><br />
                <span class="keyword">boolean</span> isAccept = <span class="keyword">false</span>;<br />
                <span class="keyword">while</span> (isAccept) {<br />
                <span class="placeholder"/>we.waitFor(u);<br />
                <span class="placeholder"/><span class="comments">// I think 这是一个非常不明智的决定</span><br />
                <span class="placeholder"/><span class="comments">// and 事情不应该是这样的.</span><br />
                <span class="placeholder"/>isAccept = u.thinkOver(请再好好想想);<br />
                }<br />
                <span class="comments">// After 你成为本站成员，我们会变得日益强大.</span><br />
                u.accept(we);<br />
                i.liveStrongerWith(we);<br />
				thanks for watching!;<br />
            </div>
            <div id="loveHeart">
                <canvas id="garden"></canvas>
                <div id="words">
                    <div id="messages">
<center>
<script type="text/javascript"><!--
google_ad_client = "ca-pub-3712320065678109";
/* lovead */
google_ad_slot = "0650322805";
google_ad_width = 320;
google_ad_height = 50;
//-->
</script>

</center>	<br>
			<br>
			<br>
                        请去邮箱收件箱或垃圾箱查收一下激活邮件<br>
						&nbsp;点击激活之后<br>
                        <div id="elapseClock" style="display:none"></div>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href='http://sharehoo.cn/login.jsp' target="_blank">去登录</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href='#' id="accept">再想想</a>
                    </div>
                    <div id="loveu">
                        IT帮-资讯传播，下载社区永远服务于你.<br/>
                        <div class="signature">- sharehoo</div>
                    </div>
                </div>
            </div>
        </div>
        <div id="copyright">
            程序改编: <a href="http://sharehoo.cn/">miki</a><br />
        </div>
    </div>
    <script type="text/javascript">
        var offsetX = $("#loveHeart").width() / 2;
        var offsetY = $("#loveHeart").height() / 2 - 55;
        
        if (!document.createElement('canvas').getContext) {
            var msg = document.createElement("div");
            msg.id = "errorMsg";
            msg.innerHTML = "Your browser doesn't support HTML5!<br/>Recommend use Chrome 14+/IE 9+/Firefox 7+/Safari 4+"; 
            document.body.appendChild(msg);
            $("#code").css("display", "none")
            $("#copyright").css("position", "absolute");
            $("#copyright").css("bottom", "10px");
            document.execCommand("stop");
        } else {
            setTimeout(function () {
                adjustWordsPosition();
                startHeartAnimation();
            }, 10000);
            
            $("#accept").click(function(){
                $(this).hide();
                $("#elapseClock").show();
                var together = new Date();
                timeElapse(together);
                setInterval(function () {
                    timeElapse(together);
                }, 500);
            })
            adjustCodePosition();
            $("#code").typewriter();
        }
    </script>
</body>
</html>