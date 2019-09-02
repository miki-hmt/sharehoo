<%@page pageEncoding="UTF-8"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
    	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1,text/html; charset=utf-8"/> 
        <link rel="shortcut icon" href="../favicon.ico"/> 
		<title>个人博客——添加收藏</title>
		<meta name="keywords" content="社区博客" />
		<meta name="description" content="sharehoo社区博客。" />
		<link href="../include/css/base.css" rel="stylesheet"/>
		<link href="../include/css/style.css" rel="stylesheet"/>
		<link href="../include/css/media.css" rel="stylesheet"/>
		<link href="${host}/shop/images/logo/favicon.ico" rel="SHORTCUT ICON" />
		<script type="text/javascript" src="../include/js/jquery.min.js"></script>
		<script type="text/javascript" src="../include/js/jquery.gallery.js"></script>
		<script type="text/javascript" src="../include/js/modernizr.custom.53451.js"></script>
		<script type="text/javascript" src="${host}/ckeditor/ckeditor.js"></script>
		<meta name="viewport" content="width=device-width, minimum-scale=1.0,initial-scale=1.0,maximum-scale=1.0"/>
		<!--[if lt IE 9]>
		<script src="../include/js/modernizr.js"></script>
		<![endif]-->
	</head>
<body>
<div class="ibody">
  <header>
    <h1>${user.nickName }的博客</h1>
    <h2>愿居于一城，与卿所见美好......</h2>
    <div class="logo"><a href="../manage/article"></a></div>
    <%@ include file="../manage_nav.jsp" %>
    </header>
  <article>
    <h2 class="about_h">您现在的位置是：<a href="../manage/Article_list.action?userId=${user.id }">首页</a>><a href="../manage/PhotoManage_file.action?userId=${user.id }">文件管理管理</a>><a href="#">添加文件</a></h2>
    <div class="template">
      <h3>
        <p><span>个人文件</span></p>
      </h3>
       <form action="../manage/PhotoManage_saveFile.action?userId=${user.id}" method="post" theme="xhtml" enctype="multipart/form-data">
      		<table>
      			<tr>
      				<td><span>添加文件:</span><input type="file" name="upload"/>(16M以内)</td>
      			</tr>
      			<tr>
      				<td><span>文件描述:</span><input type="text" name="name"/>
      					<input type="hidden" name="photo.user.id" value="${user.id }"/>
      				</td>
      			</tr>
      			<tr>
      				<td><input type="submit"  value="上传"/></td>
      			</tr>
      		</table>
      		
      </form>
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
    <%@ include file="../copyright.jsp" %> 
  </aside>
  <script src="../include/js/silder.js"></script>
  <div class="clear"></div>
  <!-- 清除浮动 --> 
</div>
</body>
</html>
