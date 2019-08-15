<%@page pageEncoding="UTF-8"%>
<nav id="topnav">
	<a href="${pageContext.request.contextPath }/blog/Blog_show.action?userId=${user.id}">首页</a><a
		href="${pageContext.request.contextPath }/blog/Blog_article.action?userId=${user.id}">漫生活</a><a href="${pageContext.request.contextPath }/blog/AlbumShow_list.action?userId=${user.id}">我的相册</a><a
		href="${pageContext.request.contextPath }/blog/Critique_list.action?userId=${user.id}">留言板</a>
		<a href="${pageContext.request.contextPath }/blog/AlbumShow_file.action?userId=${user.id}">我的收藏</a>
		<a href="${pageContext.request.contextPath }/blog/Blog_about.action?userId=${user.id}">关于我</a>
</nav>