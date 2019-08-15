<?php
$y = empty($_GET['name'])?'':$_GET['name'];
$sex = empty($_GET['address'])?'':$_GET['address'];
$x = empty($_GET['num'])?'':$_GET['num'];
?>
<!DOCTYPE HTML>
<html>
<head>
	<meta charset="UTF-8">
	<meta content="yes" name="apple-mobile-web-app-capable"/>
	<meta content="black" name="apple-mobile-web-app-status-bar-style"/>
	<meta name="format-detection" content="telephone=no"/>
	<meta content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no" name="viewport"/>
	<title>祈福</title>
	<style type="text/css">		
		body{color:#505050;font-size:30px; font-family:"Microsoft YaHei"; line-height:1.5; background:url(img/bg02.jpg) no-repeat; background-size:100% auto;}		
		html,body,h1,h2,h3,p,div,ul,li{margin:0;padding:0;}
		ul,li{list-style:none;}
		html,body,img{border:0;}
		em{font-style:normal;}			
		h1,h2,h3,strong,em{ font-style:normal; font-weight:normal;}
		a,a:hover{text-decoration:none; display:inline-block; outline:none;blr:expression(this.onFocus=this.blur());}
		.clearfix:after{clear:both; content:'.'; display:block; visibility:hidden; height:0}		
		.container{width:100%;}		
		
		.msg{ margin:0 10px 0 20px; padding-top:40%;}		
	    .msginfo{ width:100%; line-height:1.5; font-size:1.1rem; color:#FFF;}
		.info{ width:100%; padding-top:20px; text-indent:32px; line-height:1.5; font-size:1.1rem; color:#FFF;}
		.infonum{ width:90%; position:absolute; bottom:26%; left:5%; text-align:center; line-height:1.5; font-size:1.1rem; color:#f6e90e;}		
		.btn{ width:60%; position:absolute; bottom:10%; left:20%;}	
		.btn a{ width:100%; display:block; height:40px; line-height:40px; text-align:center; color:#873600; font-size:1.1rem; background:#FFF; border-radius:3px;}	
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
<!--编辑区域 start-->

<div class="msg" id="stepOne">
	<div class="msginfo"><?=$y?>来自<?=$sex?>的送出了他的祈福</div>
	
    <div class="info margintop2">为云南鲁甸县祈福，为灾区的所有同胞祈福！</div>        
</div>
<div class="infonum margintop2">第<?=$x?>位微信用户为灾区祈福<br>已2201600十微信用户为灾区祈福</div> </div> 
<DIV class="txt"><span class="bigfont">
  
</span></DIV>
</DIV>
<div class="btn">
    <a href="http://game.id87.com/game/qifu/qifu/">我也要祈福</a><!--http://192.168.1.188/2 替换为你的域名例如http://game.id87.com/zhufu/index.htm-->
</div>
<!--编辑区域 end-->
<div class="aa">
    <div class="bb">
        <div class="lt">        
        <table width="100%" height="100%" border="0">
          <tr>
            <td align="center" valign="middle"><a href="game.id87.com"><img src="http://app100620636.qzone.qzoneapp.com/wap_hly/public/resource/assets/h_logo.png" /></a></td>
          </tr>
        </table>
      </div>
        <div class="rt">
            <table width="100%" height="100%" border="0">
              <tr>
                <td align="center" valign="middle"><a href="http://game.id87.com/" class="btn">自定义按钮</a></td>
              </tr>
            </table>
        </div>
         <div class="ct">
        <table width="100%" height="100%" border="0">
          <tr>
            <td align="center" valign="middle"><a href="http://game.id87.com/" style="color:#fff;">自定义内容自定义内容<Br />自定义内容自定义内容！</a></td>
          </tr>
        </table>
        </div>
    </div>
</div>
</body>
</html>