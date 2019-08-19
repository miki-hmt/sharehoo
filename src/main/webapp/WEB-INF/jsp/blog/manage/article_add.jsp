<%@page pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>个人博客——写博客</title>
		<meta name="keywords" content="个人博客" />
		<meta name="description" content="个人博客。" />
		<link href="../include/css/base.css" rel="stylesheet"/>
		<link href="../include/css/style.css" rel="stylesheet"/>
		<link href="../include/css/media.css" rel="stylesheet"/>
		<link href="bootstrap/css/bootstrap.css" rel="stylesheet" />
		<link href="${pageContext.request.contextPath}/shop/images/logo/favicon.ico" rel="SHORTCUT ICON" />
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.11.1.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/ckeditor410/ckeditor.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/uploadPreview.min.js"></script>
		<meta name="viewport" content="width=device-width, minimum-scale=1.0, maximum-scale=1.0"/>
		<style type="text/css">
			/*为段落定义样式*/
			input {border:1px solid;border-color:green;}
			span {color:#099;}
		</style>
		
<script type="text/javascript">
$(function () {
	$("#image").uploadPreview({ Img: "ImgPr", Width: 220, Height: 220 });
	
});
</script>		
		
		
		<!--[if lt IE 9]>
		<script src="../include/js/modernizr.js"></script>
		<![endif]-->
	</head>
<body>
<div class="ibody">
  <header>
    <h1>${user.nickName }的博客</h1>
    <h2>愿居于一城，与卿所见美好......</h2>
    <div class="logo"><a href="${pageContext.request.contextPath }/blog/manage/Article_list.action"></a></div>
    <%@ include file="../manage_nav.jsp" %>
    </header>
  <article>
    <h2 class="about_h">您现在的位置是：<a href="../manage/Article_list.action">首页</a>><a href="1/">写博客</a></h2>
    <div class="index_about">
    <form  method="post" theme="xhtml" enctype="multipart/form-data" action="../manage/Article_save.action">
    	<table>
    		<tr>
	    		<td><input name="article.title" value="${article.title }" style="width:90%;font-size:12pt;text-align:center;" placeholder="请在这里输入标题"/></td>
    		</tr>
    		<tr>
	    		<td>
	    	<div class="control-group" id="preDiv" style="width: 700px; height: 80px;margin-left: 70px;">
				<img id="ImgPr" class="pull-left" style="width: 170px; height: 90px;" src="${pageContext.request.contextPath}/${article.image }" />
			</div>
			<div class="control-group">
				<label class="control-label" for="image">文章配图(*)</label>
				<div class="controls">
					<input type="file" id="image" name="image">
				</div>
			</div>
			</td>
    		</tr>
    		<tr>
    			<table>
      			<tr>
	    			<td><textarea name="article.content" class="ckeditor" style ="height:150px; width:700px;bg-color:gray;" placeholder="您的内容"></textarea>
	    				
	    			</td>
    			</tr>   			
    			</table>
    		</tr>
    		<tr>
	    		<td>
    				<span>作者:</span><input name="article.editer" value="${article.editer }" style="width:90px"/>
	    			<span>关键词:</span><input name="article.keywords" value="${article.keywords }" style="width:90px"/>
	    			<span>分类:</span><input name="article.type" value="${article.type }"  style="width:90px"/>
	    			<span>设为推荐:</span>
	    				<input name="article.notice" type="radio" value="1" />是
		 				<input name="article.notice" type="radio" value="2" checked/>否
		 				<input id="user" name="article.user.id" value="${user.id }" type="hidden"/>
	    		</td>
    		</tr>
    		<tr>
	    			<td><input type="submit" style="width: 60px;height: 30px;font-size: larger;" value="确定"/></td>
    			</tr>
    	</table>
    </form>
    </div>
  </article>
  <aside>
  <%@ include file="../rnav.jsp" %> 
    <div class="ph_news">
      <h2>
        <p>点击排行</p>
      </h2>
      <ul class="ph_n">
       
      </ul>
      <h2>
        <p>栏目推荐</p>
      </h2>
      <ul>
       <s:iterator value="recommendArticles" >
        <li><a href="../article/article_detail?id=<s:property value="id"/>"><s:property value="title"/></a></li>
      </s:iterator>
      </ul>
      <h2>
        <p>最新评论</p>
      </h2>
      <ul class="pl_n">
        <s:iterator value="critiques" >
        <dl>
          <dt><img src="../include/images/s8.jpg"> </dt>
          <dt> </dt>
          <dd><s:property value="name"/>
            <time><s:property value="time"/></time>
          </dd>
          <dd><a href="#"><s:property value="content" escape="false"/></a></dd>
        </dl>
        </s:iterator>
      </ul>
      
    </div>
   <%@ include file="../copyright.jsp" %> 
  </aside>
  <script src="../include/js/silder.js"></script>
  <div class="clear"></div>
  <!-- 清除浮动 --> 
</div>
</body>
</html>
