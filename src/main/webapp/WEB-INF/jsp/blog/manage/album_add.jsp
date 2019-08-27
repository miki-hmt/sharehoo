<%@page pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
    	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1,text/html; charset=utf-8"/> 
        <link rel="shortcut icon" href="../favicon.ico"/> 
		<title>sharehoo社区博客——新建相册</title>
		<meta name="keywords" content="个人博客" />
		<meta name="description" content="炮总的个人博客。" />
		<link href="../include/css/base.css" rel="stylesheet"/>
		<link href="../include/css/style.css" rel="stylesheet"/>
		<link href="../include/css/media.css" rel="stylesheet"/>
		<script type="text/javascript" src="../include/js/jquery.min.js"></script>
		<script type="text/javascript" src="../include/js/jquery.gallery.js"></script>
		<script type="text/javascript" src="../include/js/modernizr.custom.53451.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/ckeditor/ckeditor.js"></script>
		<link href="${pageContext.request.contextPath}/shop/images/logo/favicon.ico" rel="SHORTCUT ICON" />

		<!-- 2017.06.03 相册封面视图显示 -->
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.11.1.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/uploadPreview.min.js"></script>
		
		
		<meta name="viewport" content="width=device-width, minimum-scale=1.0,initial-scale=1.0,maximum-scale=1.0"/>
		<!--[if lt IE 9]>
		<script src="../include/js/modernizr.js"></script>
		<![endif]-->
		
		<script type="text/javascript">
			$(function () {
				$("#image").uploadPreview({ Img: "ImgPr", Width: 220, Height: 220 });
				
			});
		</script>
	</head>
<body>
<div class="ibody">
  <header>
    <h1>${user.nickName }的社区博客</h1>
    <h2>愿居于一城，与卿所见美好......</h2>
    <div class="logo"><a href="../manage/article"></a></div>
    <%@ include file="../manage_nav.jsp" %>
    </header>
  <article>
    <h2 class="about_h">您现在的位置是：<a href="../manage/Article_list.action?userId=${user.id }">首页</a>><a href="../manage/AlbumManage_list.action?userId=${user.id }">相册管理</a>><a href="#">新建相册</a></h2>
    <div class="template">
      <h3>
        <p><span>个人相册</span></p>
      </h3>
       <form action="../manage/AlbumManage_save.action?userId=${user.id }" method="post" theme="xhtml" enctype="multipart/form-data">
      		<table>
      			<tr>
      				<td>
			      		<div class="control-group" id="preDiv" style="width: 700px; height: 80px;margin-left: 70px;">
							<img id="ImgPr" class="pull-left" style="width: 170px; height: 90px;" src="${pageContext.request.contextPath}/${album.image }" />
						</div>
						<div class="control-group">
							<label class="control-label" for="image">文章配图(*)</label>
							<div class="controls">
								<input type="file" id="image" name="image">
								<input type="hidden" name="album.user.id" value="${user.id }">
							</div>
						</div>
      						
      				</td>
      			</tr>
      			<tr>
      				<td><span>相册描述:</span><input name="album.title"/></td>
      			</tr>
      			<tr>
	    			<td><textarea name="album.content" placeholder="相册内容" style="width:700px;height:200px;"></textarea></td>
	    			</tr>
	    		<tr>
	    			<td><input type="submit" style="width: 60px;height: 30px;font-size: larger;" value="确定"/></td>
    			</tr>
      		</table>
      </form>
      <h3>
        <p><span>最新评论</span></p>
      </h3>
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
      
    <div class="page"></div>
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
        
      </ul>
    <%@ include file="../copyright.jsp" %> 
  </aside>
  <script src="${pageContext.request.contextPath }/blog/include/js/silder.js"></script>
  <div class="clear"></div>
  <!-- 清除浮动 --> 
</div>
</body>
</html>
