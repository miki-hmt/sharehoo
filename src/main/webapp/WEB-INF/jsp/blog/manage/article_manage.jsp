<%@page pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!--修改日期格式只显示年月日  -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>  
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>个人博客——博客管理</title>
		<meta name="keywords" content="个人博客" />
		<meta name="description" content="炮总的个人博客。" />
		<link href="${host}/blog/include/css/base.css" rel="stylesheet"/>
		<link href="${host}/blog/include/css/style.css" rel="stylesheet"/>
		<link href="${host}/blog/include/css/media.css" rel="stylesheet"/>
		<link href="${host}/shop/images/logo/favicon.ico" rel="SHORTCUT ICON" />
		<!-- 尾部分页 css页码 	2017.05.24 -->
		<link href="${host}/blog/include/css/page.css" rel="stylesheet"/>
		<style type="text/css">
		
		</style>
		<meta name="viewport" content="width=device-width, minimum-scale=1.0, maximum-scale=1.0"/>
		<!--[if lt IE 9]>
		<script src="../include/js/modernizr.js"></script>
		<![endif]-->

		<!-- 2019.09.03 自定义弹窗所需插件 -->
		<link rel="stylesheet" type="text/css" href="${host}/sweetalert/sweetalert.css"/>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.11.1.js"></script>
		<script src="${host}/sweetalert/sweetalert.min.js"></script>
		
	 	 <script type="text/javascript">
			function deleteArticle(articleId){
				if (confirm("您确定要删除这篇文章吗？")) {
					$.post("${host}/blog/manage/article/delete",{articleId:articleId},function(result){
						if(result.status==200){
							tipOk("文章已成功删除！");
							location.reload(true);
						}else{
							tipError("删除失败！！");
						}
					},"json");
				}else{
					return;
				}
			}
			
			function operate(type,articleId){
				switch(type){
					case "recommend" :
						recommendArticle(articleId);
					break;
					case "unrecommend" :
						unrecommendArticle(articleId);
					break;
					case "publish" :
						window.open("${host}/blog/manage/article/go?articleId="+articleId);
					break;
					case "update" :
						window.open("${host}/blog/manage/article/preview?articleId="+articleId);
					break;
				}
			}
			
			function recommendArticle(articleId){
				if (confirm("您确定要将这篇文章设为推荐吗？")) {
					$.post("${host}/blog/manage/article/recommend",{articleId:articleId},function(result){
						if(result.status==200){
							tipOk("设置成功！");
							location.reload(true);
						}else{
							tipError("设置失败！！");
						}
					},"json");
				}else{
					return;
				}
			}
			function unrecommendArticle(articleId){
				if (confirm("您确定要删除这篇文章吗？")) {
					$.post("${host}/blog/manage/article/unRecommend",{articleId:articleId},function(result){
						if(result.status==200){
							tipOk("设置成功！");
							location.reload(true);
						}else{
							tipError("设置失败！！");
						}
					},"json");
				}else{
					return;
				}
			}
			
			function tipOk(content){
				swal({   
					title: content,   
					text: '来自<span style="color:red">sharehoo社区</span>、<a href="#">温馨提示</a>。<br/>2秒后自动关闭..',   
					imageUrl: "${host}/sweetalert/images/thumbs-up.jpg",
					html: true,
					timer: 2000,   
					showConfirmButton: false
				});
			};
			function tipError(content){
				swal("操作失败", content, "error");
			};
			function openWin(url,name,iWidth,iHeight) { 
            //获得窗口的垂直位置 
            var iTop = (window.screen.availHeight - 30 - iHeight) / 2; 
            //获得窗口的水平位置 
            var iLeft = (window.screen.availWidth - 10 - iWidth) / 2; 
            window.open(url, name, 'height=' + iHeight + ',innerHeight=' + iHeight + ',width=' + iWidth + ',innerWidth=' + iWidth + ',top=' + iTop + ',left=' + iLeft + ',status=no,toolbar=no,menubar=no,location=no,resizable=no,scrollbars=0,titlebar=no'); 
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
    <h2 class="about_h">您现在的位置是：<a href="${host}/blog/manage/article/list">首页</a>><a href="#">博客管理</a></h2>
    <div class="bloglist">
    <c:forEach items="${articleList }" var="article">
      <div class="newblog">
        <ul>
          <h3><a href="${host}/blog/manage/article/details?id=${article.id }">${article.title }</a></h3>
          <div class="autor"><span>作者：${article.editer }</span><span>分类：[<a href="#">${article.type }</a>]</span><span>浏览（<a href="#">${article.count }</a>）</span><span>评论（<a href="#">${article.count1 }</a>）</span>
          	<span>
		      <select style="border:solid 1px green;" onchange='operate(this.options[this.selectedIndex].value,${article.id })'>
				 <option>编辑文章</option>
				 <option value='publish'>发表文章</option>
				 <option value='update'>修改文章</option>		
				 <option value='recommend'>设为推荐</option>
				 <option value='unrecommend'>取消推荐</option>
			</select>
		<button style="background:#0F9C7C;color:white;" onclick="javascript:deleteArticle(${article.id })">删除</button>
          </span>
          </div>
          <div class="content" >${article.content }</div>
          	<a href="${host}/blog/manage/article/details?id=${article.id }"  class="readmore" style="display:inline-block;" target="_blank">全文</a>
        </ul>
        <figure><img src="${host}/${article.image }"  /></figure>
        <div class="dateview">${article.time }</div>
      </div>
     </c:forEach>
	<div class="newblog">
        <ul>
          <h3><a href="${host}/blog/manage/article/details?id=${article.id }">${article.title }</a></h3>
          <div class="autor"><span>作者：${article.editer }</span><span>分类：[<a href="#">${article.type }</a>]</span><span>浏览（<a href="#">${article.count }</a>）</span><span>评论（<a href="#">${article.count1 }</a>）</span>
          	<span>
		      <select style="border:0;" onchange='operate(this.options[this.selectedIndex].value,${article.id })'>
				 <option>编辑文章</option>
				 <option value='publish'>发表文章</option>
				 <option value='update'>修改文章</option>
				 <option value='recommend'>设为推荐</option>
				 <option value='unrecommend'>取消推荐</option>
			</select>
          </span>
          </div>
          <div class="content" >${article.content }</div><a href="${host}/blog/manage/article/details?id=${article.id }"  class="readmore" style="display:inline-block;" target="_blank">全文</a>
        </ul>
        <figure><img src="${host}/${article.image }"  /></figure>
        <div class="dateview">${article.time }</div>
      </div>
    </div>
    
      
     <div class="pagination alternate">
		<ul class="clearfix">
		${pageCode }
		</ul>
	</div>           
  </article>
  <aside>
    <%@ include file="../rnav.jsp" %> 
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
      		<li><span>${ state.index+1 }</span><a href="${host}/blog/manage/article/details?id=${article.id }">${article.title }</a></li>
      	</c:otherwise>
      </c:choose>
      </c:forEach>
     </ul>

      <h2>
        <p class="tj_t1">博友互动</p>
      </h2>
      <ul class="pl_n">
        <c:forEach items="${ critiques}" var="critiques">
        <dl>
          <dt><img src="${host}/blog/include/images/s8.jpg" style="width:47px;height:47px;"> </dt>
          <dt> </dt>
          <dd>${critiques.name }
            <fmt:formatDate value="${critiques.time }" pattern="yyyy-MM-dd HH:mm:ss "/>
          </dd>
          <a href="#"><font style="color:gray;">${critiques.content }</font></a>
        </dl>
        </c:forEach>
      </ul>
    </div>
   <%@ include file="../copyright.jsp" %> 
  </aside>
  <script src="${host}/blog/include/js/silder.js"></script>
  <div class="clear"></div>
  <!-- 清除浮动 --> 
</div>
</body>
</html>
