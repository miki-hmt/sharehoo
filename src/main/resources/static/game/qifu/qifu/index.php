﻿<!DOCTYPE HTML>
<html>
<head>
	<meta charset=utf-8"UTF-8">
	<meta content="yes" name="apple-mobile-web-app-capable"/>
	<meta content="black" name="apple-mobile-web-app-status-bar-style"/>
	<meta name="format-detection" content="telephone=no"/>
	<meta content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no" name="viewport"/>
	<title>祈福</title>
	<style type="text/css">		
		body{color:#505050;font-size:30px; font-family:"Microsoft YaHei"; line-height:1.5; background:url("bg01.jpg") no-repeat; background-size:100% auto;}		
		html,body,h1,h2,h3,p,div,ul,li{margin:0;padding:0;}
		ul,li{list-style:none;}
		html,body,img{border:0;}
		em{font-style:normal;}			
		h1,h2,h3,strong,em{ font-style:normal; font-weight:normal;}
		a,a:hover{text-decoration:none; display:inline-block; outline:none;blr:expression(this.onFocus=this.blur());}
		.clearfix:after{clear:both; content:'.'; display:block; visibility:hidden; height:0}		
		.container{width:100%;}		
		
		.msg{ margin:0 10px 0 20px; padding-top:40%;}		
		.p-put{ width:50%; height:25px; display:inline-block; float:left;}
		.p-put label{ color:#FFF; font-size:1.1rem; float:left;}
		.p-put span{ width:60%; height:23px; font-size:1.1rem; border-bottom:solid 2px #FFF; float:left;}
		.p-put span input{ width:100%; height:23px; line-height:23px; font-size:1.1rem; border:none; color:#FFF; background:none; outline:none; float:left;}		
		.info{ width:100%; padding-top:30px; text-indent:32px; line-height:1.5; font-size:1.1rem; color:#FFF;}
		.margin_big{ margin-top:60%;}
		.margin_small{ margin-top:30%;}		
		.btn{ margin-left:20%; margin-right:20%;}	
		.btn a{ width:100%; display:block; height:40px; line-height:40px; text-align:center; color:#873600; font-size:1.1rem; background:#FFF; border-radius:3px;}	
		.sharemcover {
			position: fixed;
			top: 0;
			left: 0;
			width: 100%;
			height: 100%;
			background: rgba(0, 0, 0, 0.7);
			display: none;
			z-index: 20000;
		}
		.sharemcover img {
			position: fixed;
			right: 18px;
			top: 5px;
			width: 260px;
			height: 180px;
			z-index: 20001;
			border:0;
		}
		.sharemcover p {
			color:#fff;
			left:0px;
			top:50%;
			font-size: 15px;
			position: fixed;
			text-align: center;
			z-index: 20002;
			border:0;
		}
    .aa{ width:100%; position:fixed; top:0; left:0; height:72px; z-index:2;}
    .aa .bb{ width:100%; max-width:640px; margin:0 auto; height:100%; font-size:50%; position:relative;}
    .aa .bb .lt{ width:20%; max-width:72px; height:100%; position:absolute; top:0; left:2%; text-align:left;}
    .aa .bb .lt img{ width:100%; max-width:72px; vertical-align:middle;}
    .aa .bb .ct{ padding:0 32% 0 22%; height:100%; color:#FFF; text-align:center;font-size: 10px;}
    .aa .bb .rt{ width:30%; height:100%; max-width:160px; position:absolute; top:0; right:2%; text-align:right;}
    .aa .bb .rt .btn{ width:100%; display:inline-block; padding:6% 0; color:#FFF; text-decoration:none; text-align:center; border-radius:5px; background:#399B39; font-size:15px;}
    </style>
</head>
<body>
<div id="sharemcover0" class="sharemcover" onClick="document.getElementById('sharemcover0').style.display = '';">
    <img src="guidetofollow.png" tppabs="http://app100620636.qzone.qzoneapp.com/wap_hly/youxi/img/guidetofollow.png"  style="width:70px;heigth:50px;">
    <p>您是第<span id="123" style="color:#fff"></span>位，为灾区同胞祈福的人。点击分享，发出祈福。</p>
</div>
<!--编辑区域 start-->
<div class="msg" id="stepOne">
	<div class="container clearfix">
        <div class="p-put">
            <label>我是</label>
            <span><input type="text" id="my_name"/></span>
        </div>
        <div class="p-put">
            <label>我来自</label>
            <span><input type="text" id="my_address"/></span>
        </div>
    </div>
    <div class="info" id="infoID">为云南鲁甸县祈福，为灾区的所有同胞祈福！</div>    
</div>
<div class="btn margintop-big" id="btnID">
    <a href="javascript:;">为灾区祈福</a>
</div>
<!--编辑区域 end-->

<script type="text/javascript" src="jquery.js" tppabs="http://app100620636.qzone.qzoneapp.com/wap_hly/qifu/js/jquery.js"></script>
<script type="text/javascript">
 
function GetRandomNum(Min,Max)
{   
var Range = Max - Min;   
var Rand = Math.random();   
return(Min + Math.round(Rand * Range));   
}   
var num = GetRandomNum(739165,833999);   
  
var name='';
var address='';
$(window).ready(function() {
	if($(window).height()>=420)
	{		
		$("#btnID").addClass("margin_big").removeClass("margin_small");		
	}	
	else
	{
		$("#btnID").addClass("margin_small").removeClass("margin_big");		
	}

	// $('.p-put input').blur(function(){

	// })


	$('#btnID a').click(function(){
		name=$('#my_name').val();
		address=$('#my_address').val();	
		$('#sharemcover0').show();
	})
});


HOME_PATH="http://game.id87.com";
mebtnopenurl=HOME_PATH;
window.shareData = {
		"imgUrl": "http://app100620636.qzone.qzoneapp.com/wap_hly/qifu/img/share.jpg"/*game.id87.com*/,
		"timeLineLink": "http://game.id87.com/game/qifu/msg.php?name="+name+'&address='+address+'&num='+num,
		"tTitle":"" ,
		"tContent": "为云南鲁甸县祈福，为灾区的所有同胞祈福！"
};

document.addEventListener('WeixinJSBridgeReady', function onBridgeReady() {
    
    WeixinJSBridge.on('menu:share:appmessage', function(argv) {
        WeixinJSBridge.invoke('sendAppMessage', {
            "img_url": window.shareData.imgUrl,
            "link": 'http://game.id87.com/game/qifu/msg.php?name='+name+'&address='+address+'&num='+num,
            "desc": window.shareData.tContent,
            "title": window.shareData.tTitle
        }, function(res) {
        	document.location.href = mebtnopenurl;
        })
    });

    WeixinJSBridge.on('menu:share:timeline', function(argv) {
        WeixinJSBridge.invoke('shareTimeline', {
            "img_url": window.shareData.imgUrl,
            "img_width": "640",
            "img_height": "640",
            "link": 'http://game.id87.com/game/qifu/msg.php?name='+name+'&address='+address+'&num='+num,
            "desc": window.shareData.tContent,
            "title": "我叫"+name+"，我来自"+address+'，我是第'+num+'位为灾区祈福的人'
        }, function(res) {
        	document.location.href = mebtnopenurl;
        });
    });
}, false);
</script>
<script>
    var timestamp = (Date.parse(new Date())/1000) + (3600*8);
    document.getElementById("123").innerHTML = timestamp%864000;
</script>


</body>
</html>