var x=0;
var y=0;
function zan(order,rid,num){
	var goodx="gd" + order;
	var goody="good" + order;
	var n=$("#"+goodx).text();
	n++;
	x=x+1;
	 if(x>10){
		alert("点赞过于频繁，歇一歇吧！");
		x=x-1;
	 }else{
		$("#"+goodx).text(n);
		$.post("${pageContext.request.contextPath}/Reply_zan.action",{rid:rid,num:n},
		function(result){
			if(!result.success){
				alert("点赞失败，请重试");
			}
		},"json");
	
	 }
	
}

function zan1(order,rid,num){

	var n=$("#gd1").text();
	n++;
	x=x+1;
	if(x>10){
		alert("点赞过于频繁，歇一歇吧！");
		x=x-1;
	 }else{
		$("#gd1").text(n);
		$.post("${pageContext.request.contextPath}/Reply_zan.action",{rid:rid,num:n},
		function(result){
			if(!result.success){
				alert("点赞失败，请重试");
			}
		},"json");
	
	 }
	
	
}

function bad1(order,rid,num){
	
	var n=$("#bd1").text();
	n++;
	$("#bd1").text(n);
	$.post("${pageContext.request.contextPath}/Reply_bad.action",{rid:rid,num:n},
			function(result){
				if(!result.success){
					alert("出错咯，请重试");
				}
			},"json");
}


function bad(order,rid,num){
	var goodx="bd" + order;
	var goody="bad" + order;
	var n=$("#"+goodx).text();
	n++;
	y=y+1;
	if(y>10){
		alert("点赞过于频繁，歇一歇吧！");
		y=y-1;
	 }else{
		$("#"+goodx).text(n);
		$.post("${pageContext.request.contextPath}/Reply_bad.action",{rid:rid,num:n},
			function(result){
				if(!result.success){
					alert("出错咯，请重试");
				}
			},"json");
	
	 }
	
}

$(function () {        
	   $("#good1").click(function(){
	   	 	var x = 100;       
	 		var y = 900;  
	   		var nb = Math.floor(Math.random() * 7 + 1);
	   		var index=$('.demo1').children('img').length;
	   		var rand = parseInt(Math.random() * (x - y + 1) + y); 
	   		
	   		$(".demo1").append("<img src=''>");
	   		$('.demo1 img:eq(' + index + ')').attr('src','topic/zan/'+nb+'.gif')
	   		$(".demo1 img").animate({
	   			bottom:"800px",
	   			opacity:"0",
	   			left: rand,
	   		},3000)
	   		
	   })
	});

$(function () {        
	   $("#good2").click(function(){
	   	 	var x = 100;       
	 		var y = 900;  
	   		var nb = Math.floor(Math.random() * 7 + 1);
	   		var index=$('.demo2').children('img').length;
	   		var rand = parseInt(Math.random() * (x - y + 1) + y); 
	   		
	   		$(".demo2").append("<img src=''>");
	   		$('.demo2 img:eq(' + index + ')').attr('src','topic/zan/'+nb+'.gif')
	   		$(".demo2 img").animate({
	   			bottom:"800px",
	   			opacity:"0",
	   			left: rand,
	   		},3000)
	   		
	   })
	});

$(function () {        
	   $("#good3").click(function(){
	   	 	var x = 100;       
	 		var y = 900;  
	   		var nb = Math.floor(Math.random() * 7 + 1);
	   		var index=$('.demo3').children('img').length;
	   		var rand = parseInt(Math.random() * (x - y + 1) + y); 
	   		
	   		$(".demo3").append("<img src=''>");
	   		$('.demo3 img:eq(' + index + ')').attr('src','topic/zan/'+nb+'.gif')
	   		$(".demo3 img").animate({
	   			bottom:"800px",
	   			opacity:"0",
	   			left: rand,
	   		},3000)
	   		
	   })
	});

$(function () {        
	   $("#good4").click(function(){
	   	 	var x = 100;       
	 		var y = 900;  
	   		var nb = Math.floor(Math.random() * 7 + 1);
	   		var index=$('.demo4').children('img').length;
	   		var rand = parseInt(Math.random() * (x - y + 1) + y); 
	   		//var offset=-$(document).scrollTop()+200;
	   		//alert(offset);
	   		//$(".demo img").css("bottom",offset);
	   		$(".demo4").append("<img src=''>");
	   		$('.demo4 img:eq(' + index + ')').attr('src','topic/zan/'+nb+'.gif')
	   		$(".demo4 img").animate({
	   			bottom:"800px",
	   			opacity:"0",
	   			left: rand,
	   		},3000)
	   		
	   })
	});

$(function () {        
	   $("#good5").click(function(){
	   	 	var x = 100;       
	 		var y = 900;  
	   		var nb = Math.floor(Math.random() * 7 + 1);
	   		var index=$('.demo5').children('img').length;
	   		var rand = parseInt(Math.random() * (x - y + 1) + y); 
	   		//var offset=$("#good5").position().top-$(document).scrollTop();
	   		//alert(offset);
	   		//var offset=$("#good5").position().top;
	   		//alert(offset);
	   		$(".demo5").append("<img src=''>");
	   		$('.demo5 img:eq(' + index + ')').attr('src','topic/zan/'+nb+'.gif')
	   		$(".demo5 img").animate({
	   			bottom:"800px",
	   			opacity:"0",
	   			left: rand,
	   		},3000)
	   		
	   })
	});

$(function () {        
	   $("#good6").click(function(){
	   	 	var x = 100;       
	 		var y = 900;  
	   		var nb = Math.floor(Math.random() * 7 + 1);
	   		var index=$('.demo6').children('img').length;
	   		var rand = parseInt(Math.random() * (x - y + 1) + y); 
	   		
	   		$(".demo6").append("<img src=''>");
	   		$('.demo6 img:eq(' + index + ')').attr('src','topic/zan/'+nb+'.gif')
	   		$(".demo6 img").animate({
	   			bottom:"800px",
	   			opacity:"0",
	   			left: rand,
	   		},3000)
	   		
	   })
	});

$(function () {        
	   $("#good7").click(function(){
	   	 	var x = 100;       
	 		var y = 900;  
	   		var nb = Math.floor(Math.random() * 7 + 1);
	   		var index=$('.demo7').children('img').length;
	   		var rand = parseInt(Math.random() * (x - y + 1) + y); 
	   		
	   		$(".demo7").append("<img src=''>");
	   		$('.demo7 img:eq(' + index + ')').attr('src','topic/zan/'+nb+'.gif')
	   		$(".demo7 img").animate({
	   			bottom:"800px",
	   			opacity:"0",
	   			left: rand,
	   		},3000)
	   		
	   })
	});

$(function () {        
	   $("#good8").click(function(){
	   	 	var x = 100;       
	 		var y = 900;  
	   		var nb = Math.floor(Math.random() * 7 + 1);
	   		var index=$('.demo8').children('img').length;
	   		var rand = parseInt(Math.random() * (x - y + 1) + y); 
	   		
	   		$(".demo8").append("<img src=''>");
	   		$('.demo8 img:eq(' + index + ')').attr('src','topic/zan/'+nb+'.gif')
	   		$(".demo8 img").animate({
	   			bottom:"800px",
	   			opacity:"0",
	   			left: rand,
	   		},3000)
	   		
	   })
	});

$(function () {        
	   $("#good9").click(function(){
	   	 	var x = 100;       
	 		var y = 900;  
	   		var nb = Math.floor(Math.random() * 7 + 1);
	   		var index=$('.demo9').children('img').length;
	   		var rand = parseInt(Math.random() * (x - y + 1) + y); 
	   		
	   		$(".demo9").append("<img src=''>");
	   		$('.demo9 img:eq(' + index + ')').attr('src','topic/zan/'+nb+'.gif')
	   		$(".demo9 img").animate({
	   			bottom:"800px",
	   			opacity:"0",
	   			left: rand,
	   		},3000)
	   		
	   })
	});

$(function () {        
	   $("#good10").click(function(){
	   	 	var x = 100;       
	 		var y = 900;  
	   		var nb = Math.floor(Math.random() * 7 + 1);
	   		var index=$('.demo10').children('img').length;
	   		var rand = parseInt(Math.random() * (x - y + 1) + y); 
	   		
	   		$(".demo10").append("<img src=''>");
	   		$('.demo10 img:eq(' + index + ')').attr('src','topic/zan/'+nb+'.gif')
	   		$(".demo10 img").animate({
	   			bottom:"800px",
	   			opacity:"0",
	   			left: rand,
	   		},3000)
	   		
	   })
	});


$(function () {        
	   $("#bad1").click(function(){
	   	 	var x = 100;       
	 		var y = 900;  
	   		var nb = Math.floor(Math.random() * 7 + 1);
	   		var index=$('.demo11').children('img').length;
	   		var rand = parseInt(Math.random() * (x - y + 1) + y); 
	   		
	   		$(".demo11").append("<img src=''>");
	   		$('.demo11 img:eq(' + index + ')').attr('src','topic/bad/'+nb+'.gif')
	   		$(".demo11 img").animate({
	   			bottom:"800px",
	   			opacity:"0",
	   			left: rand,
	   		},3000)
	   		
	   })
	});

$(function () {        
	   $("#bad2").click(function(){
	   	 	var x = 100;       
	 		var y = 900;  
	   		var nb = Math.floor(Math.random() * 7 + 1);
	   		var index=$('.demo12').children('img').length;
	   		var rand = parseInt(Math.random() * (x - y + 1) + y); 
	   		
	   		$(".demo12").append("<img src=''>");
	   		$('.demo12 img:eq(' + index + ')').attr('src','topic/bad/'+nb+'.gif')
	   		$(".demo12 img").animate({
	   			bottom:"800px",
	   			opacity:"0",
	   			left: rand,
	   		},3000)
	   		
	   })
	});

$(function () {        
	   $("#bad3").click(function(){
	   	 	var x = 100;       
	 		var y = 900;  
	   		var nb = Math.floor(Math.random() * 7 + 1);
	   		var index=$('.demo13').children('img').length;
	   		var rand = parseInt(Math.random() * (x - y + 1) + y); 
	   		
	   		$(".demo13").append("<img src=''>");
	   		$('.demo13 img:eq(' + index + ')').attr('src','topic/bad/'+nb+'.gif')
	   		$(".demo13 img").animate({
	   			bottom:"800px",
	   			opacity:"0",
	   			left: rand,
	   		},3000)
	   		
	   })
	});

$(function () {        
	   $("#bad4").click(function(){
	   	 	var x = 100;       
	 		var y = 900;  
	   		var nb = Math.floor(Math.random() * 7 + 1);
	   		var index=$('.demo14').children('img').length;
	   		var rand = parseInt(Math.random() * (x - y + 1) + y); 
	   		
	   		$(".demo14").append("<img src=''>");
	   		$('.demo14 img:eq(' + index + ')').attr('src','topic/bad/'+nb+'.gif')
	   		$(".demo14 img").animate({
	   			bottom:"800px",
	   			opacity:"0",
	   			left: rand,
	   		},3000)
	   		
	   })
	});

$(function () {        
	   $("#bad5").click(function(){
	   	 	var x = 100;       
	 		var y = 900;  
	   		var nb = Math.floor(Math.random() * 7 + 1);
	   		var index=$('.demo15').children('img').length;
	   		var rand = parseInt(Math.random() * (x - y + 1) + y); 
	   		
	   		$(".demo15").append("<img src=''>");
	   		$('.demo15 img:eq(' + index + ')').attr('src','topic/bad/'+nb+'.gif')
	   		$(".demo15 img").animate({
	   			bottom:"800px",
	   			opacity:"0",
	   			left: rand,
	   		},3000)
	   		
	   })
	});


$(function () {        
	   $("#bad6").click(function(){
	   	 	var x = 100;       
	 		var y = 900;  
	   		var nb = Math.floor(Math.random() * 7 + 1);
	   		var index=$('.demo16').children('img').length;
	   		var rand = parseInt(Math.random() * (x - y + 1) + y); 
	   		
	   		$(".demo16").append("<img src=''>");
	   		$('.demo16 img:eq(' + index + ')').attr('src','topic/bad/'+nb+'.gif')
	   		$(".demo16 img").animate({
	   			bottom:"800px",
	   			opacity:"0",
	   			left: rand,
	   		},3000)
	   		
	   })
	});

$(function () {        
	   $("#bad7").click(function(){
	   	 	var x = 100;       
	 		var y = 900;  
	   		var nb = Math.floor(Math.random() * 7 + 1);
	   		var index=$('.demo17').children('img').length;
	   		var rand = parseInt(Math.random() * (x - y + 1) + y); 
	   		
	   		$(".demo17").append("<img src=''>");
	   		$('.demo17 img:eq(' + index + ')').attr('src','topic/bad/'+nb+'.gif')
	   		$(".demo17 img").animate({
	   			bottom:"800px",
	   			opacity:"0",
	   			left: rand,
	   		},3000)
	   		
	   })
	});

$(function () {        
	   $("#bad8").click(function(){
	   	 	var x = 100;       
	 		var y = 900;  
	   		var nb = Math.floor(Math.random() * 7 + 1);
	   		var index=$('.demo18').children('img').length;
	   		var rand = parseInt(Math.random() * (x - y + 1) + y); 
	   		
	   		$(".demo18").append("<img src=''>");
	   		$('.demo18 img:eq(' + index + ')').attr('src','topic/bad/'+nb+'.gif')
	   		$(".demo18 img").animate({
	   			bottom:"800px",
	   			opacity:"0",
	   			left: rand,
	   		},3000)
	   		
	   })
	});

$(function () {        
	   $("#bad9").click(function(){
	   	 	var x = 100;       
	 		var y = 900;  
	   		var nb = Math.floor(Math.random() * 7 + 1);
	   		var index=$('.demo19').children('img').length;
	   		var rand = parseInt(Math.random() * (x - y + 1) + y); 
	   		
	   		$(".demo19").append("<img src=''>");
	   		$('.demo19 img:eq(' + index + ')').attr('src','topic/bad/'+nb+'.gif')
	   		$(".demo19 img").animate({
	   			bottom:"800px",
	   			opacity:"0",
	   			left: rand,
	   		},3000)
	   		
	   })
	});

$(function () {        
	   $("#bad10").click(function(){
	   	 	var x = 100;       
	 		var y = 900;  
	   		var nb = Math.floor(Math.random() * 7 + 1);
	   		var index=$('.demo20').children('img').length;
	   		var rand = parseInt(Math.random() * (x - y + 1) + y); 
	   		
	   		$(".demo20").append("<img src=''>");
	   		$('.demo20 img:eq(' + index + ')').attr('src','topic/bad/'+nb+'.gif')
	   		$(".demo20 img").animate({
	   			bottom:"800px",
	   			opacity:"0",
	   			left: rand,
	   		},3000)
	   		
	   })
	});

  // 楼层回复传参功能实现      2017.02.28     
function reply(b,a,c){
	 document.getElementById("title").value = c;
}

//楼层回复传参功能实现      2017.02.28     
function replySon(b,a,c){
	 document.getElementById("title").value = c;
	 document.getElementById("replySonId").value = a;
	   
}


	//引用评论
function copy(c,d){
		var text4 ="引用【 ";
		var text5="】楼：";
		var text6="：";
		document.getElementById("Content").value = text4+d+text5+c+text6;
		CKEDITOR.instances.Content.setData(text4+d+text5+c+text6);

	}

  
  
  



  //简单的 敏感词汇验证  2016.12.13 ....时间允许，可以建一个数据库表，存储相关词汇 
//定义敏感字符     
var forbiddenArray =['傻逼','滚','黄色','畜生','sb','尼玛','妈的','反共','草泥马'];
//定义函数
function forbiddenStr(str){
//    var destString = trim(str);
    var re = '';
    
    for(var i=0;i<forbiddenArray.length;i++){
        if(i==forbiddenArray.length-1)
            re+=forbiddenArray[i];
        else
            re+=forbiddenArray[i]+"|";
    }
    //定义正则表示式对象
    //利用RegExp可以动态生成正则表示式
    var pattern = new RegExp(re,"g");
    if(pattern.test(str)){
        return false;
    }else{
        return true;
    }
}

$(function(){
    $("#message_face").jqfaceedit({txtAreaObj:$("#Content"),containerObj:$('#container'),top:25,left:-27});
	 //显示表情
	$(".show_e").emotionsToHtml();
});
function saveReply(){
	if('${currentUser.nickName}'==null){
		alert("请先登陆，再回帖！");
		return false;
	}
	if ($("#Content").val().length<10) {
		alert("最少输入10个字符！");
		return false;
	}
	if ($("#Content").val().length>1000) {
		alert("最多输入1000个字符！");
		return false;	
	}
	
	//敏感词汇判断   2016.12.13@miki 
	
	if(forbiddenStr($("#Content").val())==true){
		var sonId=$("#replySonId").val();
		$.post("Reply_save.action",$("#replyForm").serialize(),function(result){
			if(result.success){
				alert("回复成功！");
				location.reload(true);
			}else{
				alert("回复失败！");
			}
		},"json");
		
	}else{
        alert("内容含敏感词汇！请修改后发表 ");
        return false;
	}
	
}
function deleteReply(replyId){
	if (confirm("您确定要删除这条回复吗？")) {
		$.post("Reply_delete.action",{replyId:replyId},function(result){
			if(result.success){
				alert("数据已成功删除！");
				location.reload(true);
			}else{
				alert("数据删除失败！");
			}
		},"json");
	}else{
		return;
	}
}