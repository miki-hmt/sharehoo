<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="${pageContext.request.contextPath}/shop/images/logo/favicon.ico" rel="SHORTCUT ICON" />
<title>h5小游戏体验</title>




              <!--2017.02.02首页右下角弹幕  ***********top********** -->
<script src="js/jquery.min.js"></script>
<link href="css/swiper.min.css" rel="stylesheet" type="text/css"/>
<script src="js/swiper.min.js" type="text/javascript"></script>
<style>
	#audio_btn{
		position:absolute;
		top:0px;
		left:0px;
		z-index:999999;
	}
	#reply-write{          /**发表框    **/
		display: block;
		width: 100%;
		border: none;
		font-size: 1em;
		line-height: 20px;
		margin: 0;
		padding: 0.3em;
		resize: none;
		font-family: inherit;
		color: inherit;
		box-sizing: border-box;
		border:1px solid #FE0002;
		border-radius:4px 0 0 4px;
	}
	.send-btn {       
		float: left;
	}
	#conts p{
		display:inline-block;
		padding:3px 0px 3px 0px;
		margin:0px;
	}

	.dm .d_screen 
	.d_del{width:38px;height:38px;background:#600;display:block;text-align:center;line-height:38px;
		   text-decoration:none;font-size:20px;color:#fff;border-radius:19px;border:1px solid #fff;position:absolute;top:10px;right:20px;z-index:3;display:none;}
	.dm .d_screen .d_del:hover{background:#f00;}
	.dm .d_screen .d_mask{width:255px;height:200px;position:absolute;top:0;left:0;opacity:0.5;
						  filter:alpha(opacity=50) ;z-index:1;}
	.dm .d_screen .d_show{position: relative;z-index:2;}
	.dm .d_screen .d_show div{color:#fff; background:rgba(1,1,1,.4);border-radius:5px; margin:5px; }
	#showmeg p{
		font-weight:bold;
		text-align:center; /*center*/
		
	}
	.d_show div{         /* 文字显示框设置    2017.02.26    */
		width:220px;font-size:12px;color:#fff; line-height:20px;
	}
	
						/*  头像位置调整    2017.02.26        */
	.d_show img{width:20px; height:20px;border-radius:50%; padding:2px;margin-right:10px;} 
	.d_show p{
		text-overflow:ellipsis	;
	}
#audio_btn{
		position:absolute;
		top:0px;
		left:0px;
		z-index:999999;
	}
.NYwishes{width:255px; height:300px; position:fixed; bottom:0; right:0; background:rgba(0,0,0,.6);}
.NYwishes h2{ margin:5px 0; font-family:"微软雅黑"; font-size:18px; text-align:center; color:#fff;}
.NYwishes .swiper-container{ height:250px;}

 /*包含 页面显示六条信息的边框    2017.02.26       */
#conts{margin:0 auto ;padding-left:2%;padding-right:2%;height:280px; border-top:1px solid red;} 

.NYwishes .send{position: absolute;left:0%;bottom:0px;height:40px;width:100%;z-index:99999;}
.NYwishes .send .input{width:155px;float:left;margin-left:5%;}
.NYwishes .send-btn a{background-color:#FE0000;color:#fff;width:80px;height:30px;display: inline-block;text-align: center;line-height:30px;cursor:pointer; border-radius:0 4px 4px 0;}
</style>

                              <!-- 弹幕   *********尾********   -->










<style type="text/css">

body{
	background-color:#E9E9E9;
	margin:0 auto;
	width:1000px;
	height:1000px;
	border:0px solid blue;
}

.div1{
	background-color:#FFFFFF;
	width:1000px;    /*350px*/
	height:600px;
	border:1px solid gray;
	margin-left:0px;  /*650px*/
}

/*定义几个常用的字体*/
.font1{
margin-left:500px;
font-weight:bold;
font-size: 15px;
color:white;
margin-top:20px;
}

/*定义几个超链接*/
a:link{
	text-decoration:none;
}

.span1{
	height:40px;
	background-color: #B6241F;
	display: block;
	box-shadow:2px 5px 5px rgba(0,0,0,0.8); 
}

/*背景色调宽度调节*/
.span1 a{
	margin-left: 320px;  /*更改“更多小游戏” 字体的位置 */
}

.faceul{
	border:0px solid green;
	width:1000px;  /*350px   定义左浮动宽度，仅在定义宽度内进行 浮动   2016.10.28*/
	height:140px; 
	/*background-color:green;*/
	     /*去除<li>列表前的点*/
	list-style-type: none;
	padding:0;   /*图片左边紧挨边框*/
	
}



/*控制图片里文字的大小*/
.faceul a{
	font-size: 12px;
	margin-left:14px; /*字体居中*/
	margin-top:1px;
}


    /*faceul li用于控制单个图片区域的大小*/
.faceul li{
	border:1px solid silver;
	float:left;
	width:160px;
	height:130px;
	/*background-color:pink;*/
	margin-left:2px;
	text-align:center;/*表示其它元素将居中*/
	padding:0px;
	box-shadow:2px 5px 5px rgba(0,0,0,0.8); 
}


   /*控制图片大小*/
.faceul img{
	width:150px;
	margin-left: 5px;  /*控制图片之间的间距*/
	margin-top:3px;
	margin-bottom:3px;
	
}

</style>
</head>
<body>

<div class="div1">
    	<div>		
           <span class="span1"><div style="position:absolute;margin-left:21px;color: #fff;text-align: left;font: bold 16px/36px simsun;">H5小游戏</div>
		</span>
            <ul class="faceul">
	    <li><img src="images/mogu.jpg"/><br/><a href="games/weChatGame/index.html"  target="blank">去玩40款微信小游戏</a></li>
            <li><img src="images/bird.jpg"/><br/><a href="games/HappyBird/bird.html" target="blank">愤怒的小鸟</a></li>
            <li><img src="images/shi.jpg"/><br/><a href="games/zhiwu/shi.htm" target="blank">植物大战僵尸</a></li>
            <li><img src="images/132.jpg"/><br/><a href="games/fruit/fruit.html"  target="blank">水果忍者</a></li>
            <li><img src="images/tank.jpg"/><br/><a href="games/zy_tank/zy_tank_frameVersion.html"  target="blank">坦克大战</a></li>
            <li><img src="images/mogu.jpg"/><br/><a href="games/mogubeer/index7.html"  target="blank">让蘑菇动起来</a></li>
            <li><img src="images/1.jpg"/><br/><a href="home">社区首页</a></li>
            </ul>
    	</div>
    	
    	
    	
  	
    	
    </div>




 <!-- 右下角弹幕框         2017.02.02 --> 
		 
		 
		 <div style="padding:0px;margin:0px;" > 
<div class="NYwishes">
<h2>愿望墙</h2>
<div class="swiper-container">
	<div  id="conts"> 
		<div class="dm">
			<!--d_screen start-->
			<div class="d_screen">
				<div class="d_mask"></div>
				<div class="d_show">  
					<div></div>    <!-- 占空间，三个空的div能允许一次显示六条信息    2017.02.26         -->
					<div></div>
                    <div></div>
				</div>
			</div>
		</div>
	</div> 
</div> 
<div class="send">
			<div class="input">
				<input id="reply-write" name="content" type="text" value="" placeholder="说出你的愿望" style="height:30px">
			</div>
			<div class="send-btn" >
				<a onClick="send_reply2()">发送</a>
			</div>
	</div>
</div>		
<script>

function send_reply2() {
var content = $("#reply-write").val();
if ($.trim(content) == "") {
	alert("亲，请说出你的愿望！");
	return false;
}
	var text=$("#reply-write").val();
	input(text)
	$("#reply-write").val("");
   	init_screen();  
   	if($(".d_show").height()>180){
		$($(".d_show").children("div").get(0)).toggle(1000);
		$($(".d_show").children("div").get(0)).remove();
	}
}
$(function(){
	var date=[{'id':1,'val':'新年新气象&nbsp;&nbsp;&nbsp;'},{'id':2,'val':'出门捡钱包&nbsp;&nbsp;&nbsp;'},{'id':3,'val':'活捉一枚妹子&nbsp;&nbsp;&nbsp;'},{'id':4,'val':'祝自己早日脱单&nbsp;&nbsp;&nbsp;'},{'id':4,'val':'miki你要好好的&nbsp;&nbsp;&nbsp;'},{'id':4,'val':'幸福来得太突然&nbsp;&nbsp;&nbsp;'},{'id':4,'val':'快乐在你身边绕&nbsp;&nbsp;&nbsp;'},{'id':4,'val':'二狗又浪去了&nbsp;&nbsp;&nbsp;'},{'id':4,'val':'幸福吉祥把你抱&nbsp;&nbsp;&nbsp;'}];
	var i=0;
	setInterval(function(){
		if($(".d_show").height()<100){
			if(i<date.length){
				input(date[i].val)
				i++;
			}else{
				i=0	
				input(date[i].val)
				i++;
			}
		}else{
			init_screen();
			$($(".d_show").children("div").get(0)).remove();
			if(i<date.length){
				input(date[i].val)
				i++;
			}else{
				i=0	
				input(date[i].val)
				i++;
			}
		}
	},1000);
	
	$("#reply-write").keyup(function(ev){
		var ev=ev||event;
		if(ev.keyCode==13){
			send_reply2();
		}
	});
})
function init_screen(){
	$(".d_show").find("div").show().each(function () {
		setInterval(function(){
		 $($(".d_show").children("div").get(0)).toggle(1000);
		},1000);
	});
}	
function input(val){
	var div=$("<div><img src='images/bg.png'/>"+val+"</div>");
	$(".d_show").append(div.fadeIn(1000));
}
</script>

</div>
		 







</body>
</html>