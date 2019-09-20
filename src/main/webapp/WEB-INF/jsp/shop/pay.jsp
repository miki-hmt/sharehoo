<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
   <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>充值中心--下载社区--IT帮-资讯传播社区</title>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="description" content="上传资源-我的资源-下载频道-sharehoo.cn" />
<meta name="keywords" content="" />
<meta name="author" content="miki" />
<meta name="Copyright" content="miki" />
<meta name="baidu-site-verification" content="5qKL5WPafahaSFtZ" />
<meta http-equiv="X-UA-Compatible" content="IE=8,9" />
<meta name="renderer" content="webkit|ie-stand" />
<link href="${pageContext.request.contextPath}/shop/images/logo/favicon.ico" rel="SHORTCUT ICON" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/shop/css/index.css">
<link href="${pageContext.request.contextPath}/she_files/style2016.css" rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/shop/css/common.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/shop/css/download_new.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/shop/css/footer.css">
	<!--2017.10.15 miki body样式css文件 -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/shop/css/pay-css/style.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/shop/css/pay-css/common.css?{min}">
<link rel="stylesheet" href="${pageContext.request.contextPath}/shop/css/pay-css/c_buy.min.css?{min}">
<link href="${pageContext.request.contextPath }/shop/css/ask_float_block.css" rel="stylesheet" type="text/css" />

<!-- 尾部分页 css页码 	2017.08.03 miki-->
<link href="${pageContext.request.contextPath }/blog/include/css/page.css" rel="stylesheet"/>

<!-- 页面使用font-awesome矢量字体图标方法引入	2017.08.04	miki -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/font-awesome-4.4.0/css/font-awesome.min.css">

<script src="${pageContext.request.contextPath}/js/jquery-1.11.1.js" type="text/javascript"></script>
<script type="text/javascript"  src="${host}/shop/js/libs/jquery-version.js" type="text/javascript"></script>
<script type='text/javascript' src='${pageContext.request.contextPath}/shop/js/jquery.form.js'></script>
<script src="${pageContext.request.contextPath}/shop/js/html5shiv.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/shop/js/sharehoo_download_comment.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/shop/js/placeholder.js"></script>

<script type="text/javascript" src="${pageContext.request.contextPath}/shop/js/pay-js/jquery.select.js"></script>

<script type="text/javascript">
	function validateLogin(){
		if ('${currentUser.nickName}'==null||'${currentUser.nickName}'=="") {
			alert("您还未登陆！");
		} else {
			window.location.href="${host}/shop/center";
		}	
}
</script>

<script type="text/javascript">
	function upload(){
		if ('${currentUser.nickName}'==null||'${currentUser.nickName}'=="") {
			alert("您还未登陆！");
		} 
		else{
			window.location.href="${host}/shop/upload.htm";
		}
}
	
		
	//2017.08.16 miki 顶部搜索框搜索功能实现
	
	  function htmlencode(s){  
		    var div = document.createElement('div');  
		    div.appendChild(document.createTextNode(s));  
		    return div.innerHTML;  
		}  
		function htmldecode(s){  
		    var div = document.createElement('div');  
		    div.innerHTML = s;  
		    return div.innerText || div.textContent;  
		}  
		
		function setTab(m,n){
			var tli=document.getElementById("menu"+m).getElementsByTagName("a");
			var mli=document.getElementById("main"+m).getElementsByTagName("ul");
			for(i=0;i<tli.length;i++){
				tli[i].className=i==n?"current1 current2":"";
				mli[i].style.display=i==n?"block":"none";
			}
		}
	
		function check_up(thisform){
			//var key=$.trim(htmlencode(thisform.keywords.value));
			var key=document.getElementById("tagff").value;
			if(key=="" || key==null){
				alert("关键字不能为空！");
			}
			else{
				//key=key.replace(/\+/g,"%2B").replace(/\//g,"%2F");
				key =  encodeURIComponent(key)
				var url="${host}/shop/source/search?keyword="+encodeURIComponent(key);
				window.location.href=url;
			}
			return false;
		}
				
	//底部热门标签关键字搜索  2017.08.26 miki
	
		function find(keyword){			
			if(keyword==""){
				alert("关键字不能为空！");
			}
			else{
				//key=key.replace(/\+/g,"%2B").replace(/\//g,"%2F");
				key =  encodeURIComponent(keyword)
				var url="${host}/shop/source/search?keyword="+encodeURIComponent(key);
				window.location.href=url;
			}
			return false;
		}
    
</script>

<script type="text/javascript">
	function Login(){	
		 if ('${currentUser.nickName}'==null||'${currentUser.nickName}'=="") {
		var curPage=window.location.href;
		window.location.href="${pageContext.request.contextPath}/login?prePage="+curPage;
		 }else{
			  alert("上了还想上嘛？");
		  }
}
	
	function exchange(){
		if ('${currentUser.nickName}'==null||'${currentUser.nickName}'=="") {
			alert("您还未登陆！");
		} else {
		 var code= $("#content").val();
		 
		 if(code==""){
			 $("#error2").html("*兑换码不能为空！");
			 $("#content").focus();
		 }else{
			 $("#error2").html("");
		 }
			 $.post("${pageContext.request.contextPath}/shop/cdk/exchange?code="+code,
				 function(result){
				if(result.status==200){
					alert("兑换成功！");
					//location.reload(true);
				}else{
					alert(result.msg);
				}
			},"json");
	}
}
	
</script>

</head>
<body>
	<c:choose>
		 <c:when test="${currentUser==null }">
		 	<script id="toolbar-tpl-scriptId" prod="download" skin="black" src="${pageContext.request.contextPath}/shop/js/html.js" type="text/javascript" domain="http://sharehoo.cn"></script>	
		 </c:when>
		 <c:otherwise>
		 	 <%@ include file="./common/login1.jsp" %> 
		 </c:otherwise>
	</c:choose>    <script type="text/javascript">
 		 //var protocol = window.location.protocol;
		 // document.write('<script type="text/javascript" src="' +protocol+ '//c.csdnimg.cn/pubfooter/js/repoAddr2.js?v=' + Math.random() + '"></'+'script>');
	</script>
<div class="news-nav">
	<div class="container clearfix">
		<div class="nav-bar">
			<a href="${host}/shop/index.htm">首页</a>
			<a href="${pageContext.request.contextPath}/shop/source/categories" target="_blank">资源分类</a>
			<a class=" " href="${host}/shop/rank" target="_blank">精品铺子</a>
			<a class=" " href="http://sharehoo.cn/topic/section/4" target="_blank">赏金平台</a>
			<a href="${host}/shop/download/rank" target="_blank">下载排行</a>			
			<a class=" " href="${pageContext.request.contextPath}/" target="_blank">论坛</a>			
			<a href="${pageContext.request.contextPath}/shop/cdk/buy" target="_blank" class="current">虎豆充值</a>
			<a href="javascript:void(0)" onclick="javascript:validateLogin()" target="_blank">我的店铺</a>
		</div>
		<div class="search-download">
			<form action="http://sharehoo.cn" method="post" onsubmit="return check_up(this);" name="download_search" style="height:26px;;">
				<input type="text" placeholder="搜索资源" value="" id="tagff" name="keywords"/>
				<a href="javascript:check_up(download_search);void(0);" class="download-search-bth"></a>
			</form>
			<a href="/help" class="help"><i class="fa fa-question-circle"></i>帮助</a>
		</div>
	</div>
</div>
<!-- //toolbar nav -->


	
<link rel="stylesheet" href="${pageContext.request.contextPath}/shop/css/download_profile.css"/>


 
 <div class="software_intro">
      <div class="bor_bac">
        <div class="c_buy">
          <header class="cb_tit">
            <h4>虎豆充值<span>剩余虎豆数：<em>${shop1.douNum }</em></span></h4>
          </header>
          <div class="cb_buy_con"><span class="c_buy_choose">请选择充值虎豆数量</span>
            <ul class="cbuy_list clearfix">
	               
	               <li class="cbuy_item  fl" data-val="38.00" data-id="514">
	                	<div class="cbuy_sel"><span class="c_num_sel">虎豆10枚</span></div>
	                	<span class="c_much">￥10.00 </span><span class="c_tips">可沿社区浪一圈</span>
	              </li>
	              
	              <li class="cbuy_item cbuy_cur fl" data-val="98.00" data-id="516">
	                <div class="cbuy_sel"><span class="c_num_sel">虎豆 50枚</span></div><span class="c_much">￥48.00 </span><span class="c_tips">土豪请留名</span>
	              </li>
	              
	               <li class="cbuy_item  fl" data-val="998.00" data-id="520">
	                <div class="cbuy_sel"><span class="c_num_sel">虎豆 100枚</span></div><span class="c_much">￥95.00 </span><span class="c_tips">下次充值80折</span>
	              </li>             
           </ul>
           
           <span class="c_buy_choose">支付金额 <em> ￥48.00 </em>请扫码支付</span>
                            
            <div class="payment clearfix">
              <div class="wechat_payment"><div id="wechat_payment"><img src="${pageContext.request.contextPath}/shop/images/pay-icon/wei.png" width=117 height=117/></div></div>
              <div class="zhifubao_payment"><div id="zhifubao_payment"><img src="${pageContext.request.contextPath}/shop/images/pay-icon/zhi.jpg" width="117" height="117"></div></div>         
             
            </div>
                            
             <div style="margin:0 auto;align:center;margin-top:19px;margin-left:36%;">
				<form action="" method="post" class="form-search" style="border:0px;">
					<input id="content" name="cdk.code"  type="text" class="input-medium search-query" placeholder="输入兑换码..." style="width: 230px;margin:0px auto;background:#C8DAEE;"/>
					<a type="submit" class="btn btn-primary" title="Search" onclick="javascript:exchange()">兑换&nbsp;<i class="icon  icon-search"></i></a><font id="error2" color="red"></font>			
				</form>	
			</div>
         
          </div>
          
          
          <div class="intro_contact">      
	          <span class="tips_tit">虎豆兑换说明：         		
	          </span>
	          	<p class="tips">充值过后，会得到一个CDK兑换码，将其输入到上面的输入框中即可兑换虎豆。</p>	            
	            <p class="tips">虎豆是sharehoo社区下载及购买获得的虚拟积分，可兑换<a href="#" class="mark_link" target="_blank">下载社区资源</a>、<a href="#" class="mark_link">虎豆平台礼品</a>、<a href="#" class="mark_link">论坛可用分</a>。</p>
	            <p class="tips">虎豆可用来直接下载全站资源。</p>
	            <p class="tips">充值前请仔细核对充值CDK和充值金额，一旦充值成功则无法退款</p>
          </div>
        </div>
      </div>
    </div>
 
    <%@ include file="./common/footer.jsp" %> 
    

    
<script type="text/javascript">



function cancel_fav(sourcename,id)
{
	if(confirm("您确定要取消对"+sourcename+"的收藏吗？"))
	{
		$.get("/index.php/favorite/cancel_fav/" + id,function(data){
			data = eval('('+data+')');
			alert(data.msg);
			window.location.href = '/my/favs';
		}); 
	}
}

function del_my_src(id)
{
	$("#resource_id").val(id);
	$("#delete_reason").css("display","block");
	/*资源删除原因*/
	$("#del_reason_form input").first().attr("checked","checked");
	$("#delreason").attr("value","");

	$("#delreason").focus(function(){
		$(':input:radio:checked').attr("checked",false);					
		})
	$("#delreason").blur(function(){
			if($("#delreason").val() == ''){
				$("#del_reason_form input").first().attr("checked",true);
			}
	})
// 	if(confirm("一旦删除将不可恢复，您确定要删除吗？"))
// 	{
// 		$.get("/index.php/user_console/del_my_source/"+ id ,function(ret){
// 			ret = eval('('+ret+')');
// 			if(ret.succ == 0){
// 				alert(ret.msg);
// 			}else{
// 				alert('删除成功');
// 				window.location.reload();
// 			}
// 		});
// 	}	

}


function edit_my_src(id){
	$.getJSON("/index.php/upload/get_can_update_count?source_id=" + id + "&random="+Math.random(), function(res){
		if (res.status){
			$('#can_upload_count').html(res.count);
			
		}
	});
	//var a = $("#source_id").val(id);
	$('.update_tips_btn .up_ok').attr('data-id', id);
	$("#update_tips").css("display","block");
}

//我知道了
$('.update_tips_btn .up_ok').click(function(){
	var count = $("#can_upload_count").text();
	if(count == 0){
		alert('修改次数超限制！');
		window.location.reload();
	}
	else{
		window.location.href = "/upload/" + $(this).attr('data-id');
	}
	
	
});


//真正点击确认删除
/*删除资源*/
function submit_del_reason(){
	if(confirm("一旦删除将不可恢复，您确定要删除吗？")){
		$('#del_reason_form').ajaxSubmit({
			dataType: 'json',
			success: function(data) {	
				if(data.succ == 0)
					{
					alert(ret.msg);					
					//remove_row(id);
					//window.location.reload();
					}
				else{
					alert('删除成功');
					window.location.reload();
					}
			}
		});
	}
	return false;
}
	

/*删除资源框关闭*/
function close_delete_reason(){
		$("#delete_reason").css("display","none");
	}

//返回框关闭
function close_update(){
	$("#update_tips").css("display","none");
}

</script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/shop/js/toolbar.js"></script>
      <!-- ask 全局悬浮按钮  -->
        <!--script(type="text/javascript" src="static/js/apps/fontSize.js")-->
	<script language="javascript" type="text/javascript" src="${pageContext.request.contextPath }/shop/js/async_new.js"></script>
	<!-- <script data-main="${host}/shop/js/apps/download.config.js" src="${host}/shop/js/libs/require.js"></script> -->
 
  </body>
</html>