<%@page pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!--修改日期格式只显示年月日  -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>  

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>个人博客——博客</title>
		<meta name="keywords" content="个人博客" />
		<meta name="description" content="炮总的个人博客。" />
		<link href="${host}/blog/include/css/base.css" rel="stylesheet"/>
		<link href="${host}/blog/include/css/style.css" rel="stylesheet"/>
		<link href="${host}/blog/include/css/media.css" rel="stylesheet"/>

		<link href="${host}/shop/images/logo/favicon.ico" rel="SHORTCUT ICON" />		
		
		<!-- 2019.09.03 自定义弹窗所需插件 -->
		<link rel="stylesheet" type="text/css" href="${host}/sweetalert/sweetalert.css"/>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.11.1.js"></script>
		<script src="${host}/sweetalert/sweetalert.min.js"></script>
		
		<!--2018.07.18  miki  ckeditor代码高亮	开头这里的样式为默认的风格，可以根据自己的喜好更换风格-->
		<!--我的高亮效果是zenburn-->
		<link rel="stylesheet" href="${host}/highlight/styles/gruvbox-dark.css"/>
		<script src="${host}/highlight/highlight.pack.js"></script>
		<script>hljs.initHighlightingOnLoad();</script>
		<meta name="viewport" content="width=device-width, minimum-scale=1.0, maximum-scale=1.0"/>
		<!--[if lt IE 9]>
		<script src="../include/js/modernizr.js"></script>
		<![endif]-->
		<script type="text/javascript">
		  // 楼层回复传参功能实现      2017.02.28     
		function reply(b){
			 document.getElementById("Content").value = b;
			 $("#content").focus();
			 //CKEDITOR.instances.Content.setData(text+a+text2+b+text3);
			   
		}
		  </script>
	</head>
<body>
<div class="ibody">
  <header>
    <h1>${user.nickName }的博客</h1>
    <h2>愿居于一城，与卿所见美好......</h2>
    <div class="logo"><a href="${host}/blog/manage/article/list"></a></div>
	  <%@ include file="../manage_nav.jsp" %>
   </header>
  <article>
    <h2 class="about_h">您现在的位置是：<a href="${host}/blog/${user.nickNameId}">首页</a>><a href="${host}/blog/${user.nickNameId}/article">漫生活</a>><a href="#">详细内容</a></h2>
    <div class="index_about">
      <h2 class="c_titile">${article.title }</h2>
      <p class="box_c"><span class="d_time">发布时间：<fmt:formatDate value="${article.time }" pattern="yyyy-MM-dd HH:mm:ss "/></span><span>编辑：${article.editer }</span><span>浏览（${article.count }）</span><span>评论（${article.count1 }）</span></p>
      <ul class="infos">
        ${article.content }
      </ul>
      <div class="keybq">
        <p><span>关键字词</span>：${article.keywords }</p>
      </div>
      <div class="nextinfo">
      <s:if test="before!=null">
        <p>上一篇：<a href="${host}/blog/${user.nickNameId}/article/${before.id }">${before.title }</a></p>
      </s:if>
      <s:if test="next!=null">
        <p>下一篇：<a href="${host}/blog/${user.nickNameId}/article/${next.id }">${next.title }</a></p>
      </s:if>
      </div>
    </div>
  </article>
  <aside>
    <div class="rnav">
      <li class="rnav1 "><a href="#">日记</a></li>
      <li class="rnav2 "><a href="#">欣赏</a></li>
      <li class="rnav3 "><a href="#">编程</a></li>
      <li class="rnav4 "><a href="#">经典语录</a></li>
    </div>
    <div class="ph_news">
      <h2>
        <p>点击排行</p>
      </h2>
		     <ul class="ph_n">
		      <c:forEach items="${countList }" var="article" varStatus="state">
		      <c:choose>
		      	<c:when test="${ state.index<3}">
		      		<li><span class="num1">${ state.index+1 }</span><a href="${host}/blog/manage/article/details?id=${article.id }">${article.title }</a></li>       	
		      	</c:when>
		      	<c:otherwise>
		      		<li><span>${state.index+1 }</span><a href="${host}/blog/manage/article/details?id=${article.id }">${article.title }</a></li>
		      	</c:otherwise>
		      	</c:choose>
		      </c:forEach>
     		</ul>
      <h2>
        <p>栏目推荐</p>
      </h2>
       <ul class="ph_n">
		      <c:forEach items="${recommendList }" var="article" varStatus="state">
		      <c:choose>
		      	<c:when test="${ state.index<3}">
		      		<li><span class="num1">${ state.index+1 }</span><a href="${host}/blog/manage/article/details?id=${article.id }">${article.title }</a></li>       	
		      	</c:when>
		      	<c:otherwise>
		      		<li><span>${state.index+1 }</span><a href="${host}/blog/manage/article/details?id=${article.id }">${article.title }</a></li>
		      	</c:otherwise>
		      	</c:choose>
		      </c:forEach>
     		</ul>
      <h2>
        <p>文章评论</p>
      </h2>
      <ul class="pl_n">
        <c:forEach items="${ critiques}" var="critiques">
        <dl>
          <dt><img src="${host}/blog/include/images/s8.jpg"> </dt>
          <dt> </dt>
          <dd>${critiques.name }
            <fmt:formatDate value="${critiques.time }" pattern="yyyy-MM-dd HH:mm:ss "/>           
          </dd>
          <a href="#"><font style="color:gray;">${critiques.content }</font></a>
          &nbsp;<a href="javascript:deleteCritique(${critiques.id })" class="dellink"><span style="color:red;">删除</span></a>
          &nbsp;<a href="#1" style="font-size: 9pt;text-align:right;" onclick='reply("${critiques.name }")'><span style="color:red;">回复</span></a>
        </dl>
        </c:forEach>
      </ul>
       <h2>
        <p>作者回复</p>
      </h2>
      <ul class="pl_n">
        <c:forEach items="${ replyList}" var="reply">
        <dl>
          <dt><img src="${host}/blog/include/images/s8.jpg"> </dt>
          <dt> </dt>
          <dd>我&nbsp;回复：${reply.type }
            <fmt:formatDate value="${reply.time }" pattern="yyyy-MM-dd HH:mm:ss "/>           
          </dd>
          <a href="#"><font style="color:gray;">${reply.content }</font></a>
          &nbsp;<a href="javascript:deleteCritique(${reply.id })" class="dellink"><span style="color:red;">删除</span></a>
        </dl>
        </c:forEach>
      </ul>
      
      <h2>
        <p><span style="color:white;"><a name="1">回复留言</a></span></p>
      </h2>
      <br></br>
       <form action="" method="post" id="reply_form">
      		<table>
      			<tr>
      				<td><input type="text" name="type" id="Content" placeholder="回复留言者"/></td>
      			</tr>
      			<tr>
	    			<td><textarea id ="reply" name="content" style ="height:200px; width:268px;bg-color:gray;" placeholder="回复内容"></textarea></td>
    			</tr>
    			<tr>
	    			<td><button id="submitAdd" style="width: 60px;height: 30px;font-size: larger;">提交</button></td>
    			</tr>
    			
    			<input type="hidden" name="user.id" value="${user.id }"/>
    			<input type="hidden" name="article.id" value="${article.id }"/>
      		</table>
      </form>
      
      
    </div>
   <%@ include file="../copyright.jsp" %> 
  </aside>
  <script src="${host}/blog/include/js/silder.js"></script>
  <div class="clear"></div>
  <!-- 清除浮动 --> 
</div>
<script type="text/javascript">
	$(document).ready(function() {	
	$("#submitAdd").on("click",function(){
		var content=$("#reply").val();
		var author=$("#Content").val();
		if(content==""){
			tipError("亲亲，昵称不能为空哦");
			return false;
		}
		if(author=""){
			tipError("亲亲，评论内容不能为空哦");
			return false;
		}
		$.ajax({
	       type: "POST",
	       url: "${host}/blog/manage/ar/reply?id=521",
	       data: $("#reply_form").serialize(),
	       success: function (data) {
	       		if(data.status==200){
	       			tipOk("回复成功",function(){
		       			 	window.location.reload();       			
		       			});
	       		}
	       }
		   	});
   		return false;	//!!一定要return false, 否則會自動刷新頁面,導致ajax彈窗提醒失效。防止刷新頁面
})
});

function deleteCritique(id) {
			swal({
				title : "",
				text : "您确定要删除这个评论吗？",
				type : "warning",
				showCancelButton : true,
				closeOnConfirm : false,
				confirmButtonText : "是的，我要删除",
				confirmButtonColor : "#ec6c62"
			}, function() {
				$.post("${host}/blog/manage/critique/delete", {
					id : id
				}, function(result) {
					if (result.status == 200) {
						tipOk("评论已成功删除！", function() {
							console.log(".......");
							location.reload(true);
						});
	
					} else {
						tipError("删除失败！！");
					}
				}, "json");
			});
		}

function tipOk(content,callback){
		swal({   
			title: content,   
			text: '来自<span style="color:red">sharehoo社区</span>、<a href="#">温馨提示</a>。<br/>2秒后自动关闭..',   
			imageUrl: "${host}/sweetalert/images/thumbs-up.jpg",
			html: true,
			timer: 2000,   
			showConfirmButton: false
		},function(){
				if (callback) {
					callback();
				}
			});
	};
	function tipError(content){
		swal("操作失败", content, "error");
	};
</script>


</body>
</html>
