// JavaScript Document
var t = n = 0, count; 
function inimarquee(id){
  $("#"+id+"_list div").removeAttr('style');
	count=$("#"+id+"_list div").length; 
	$("#"+id+"_list div:not(:first-child)").hide(); 
	$("#"+id+"_info").html($("#"+id+"_list div:first-child").find("img").attr('alt')); 
	$("#"+id+"_info").click(function(){window.open($("#"+id+"_list div:first-child").attr('href'), "_blank")}); 
	$("#"+id+" li").click(function() { 
		var i = $(this).text() - 1;//获取Li元素内的值，即1，2，3，4 
		n = i; 
		if (i >= count) return; 
      	
		$("#"+id+"_info").html($("#"+id+"_list div").eq(i).find("img").attr('alt')); 
		$("#"+id+"_info").unbind().click(function(){window.open($("#"+id+"_list div").eq(i).attr('href'), "_blank")}) 
		$("#"+id+"_list div").filter(":visible").fadeOut(500).parent().children().eq(i).fadeIn(1000); 
		$(this).css({"background":"#be2424",'color':'#000'}).siblings().css({"background":"#6f4f67",'color':'#fff'}); 
	}); 
	t = setInterval("showAuto('"+id+"')", 4000); 
	$("#"+id).hover(function(){clearInterval(t)}, function(){t = setInterval("showAuto('"+id+"')", 4000);}); 
}
//$("#content_m_1371440288299 div:eq(2)").css("width","340px")
function showAuto(id) 
{ 
	n = n >=(count - 1) ? 0 : ++n; 
	$("#"+id+" li").eq(n).trigger('click');
}


function move_photo(id)
{
	var oMain=$('#'+id);
	$(function(){ 
	$(".p_1 p").hide();
	$(".p_1").hover(function(){
		$(".p_1 p").stop().slideToggle();	
	})
})
	$(function(){ 
	$(".p_2 p").hide();
	$(".p_2").hover(function(){
		$(".p_2 p").stop().slideToggle();	
	})
})
	
	$(function(){ 
	$(".p_3 p").hide();
	$(".p_3").hover(function(){
		$(".p_3 p").stop().slideToggle();	
	})
})
	
	$(function(){ 
	$(".p_4 p").hide();
	$(".p_4").hover(function(){
		$(".p_4 p").stop().slideToggle();	
	})
})
	
	$(function(){ 
	$(".p_5 p").hide();
	$(".p_5").hover(function(){
		$(".p_5 p").stop().slideToggle();	
	})
})
	$(function(){ 
	$(".p_6 p").hide();
	$(".p_6").hover(function(){
		$(".p_6 p").stop().slideToggle();	
	})
})
	}
	
	

function user_scroll(id)
{
		var oMain=document.getElementById(id);
		var oDiv=document.getElementById('user_scroll_list');
		var oLi=oDiv.getElementsByTagName('div');
  		oDiv.innerHTML+=oDiv.innerHTML;
  		oDiv.style.width=(oLi[0].offsetWidth+10)*oLi.length+'px';
		
		setInterval(function(){
				oMain.scrollLeft++;
				if(oMain.scrollLeft>1600)
				{
					oMain.scrollLeft=0;
					}
			},30)
	}
