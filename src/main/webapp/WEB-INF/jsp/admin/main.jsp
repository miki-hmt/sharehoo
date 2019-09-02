<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>IT帮-资讯传播社区--后台管理</title>
<link rel="stylesheet" href="css/bootstrap.min.css" />
<link rel="stylesheet" href="css/bootstrap-responsive.min.css" />
<link rel="stylesheet" href="css/uniform.css" />
<link rel="stylesheet" href="css/unicorn.main.css" />
<link rel="stylesheet" href="css/unicorn.grey.css" class="skin-color" />
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.11.1.js"></script>
<script src="${pageContext.request.contextPath}/js/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript">

function logout() {
	if (confirm("您确定要退出系统吗？")) {
		window.location.href="User_logout.action";
	}
}
        //用户密码修改 
function checkUserLogin(){
	
		window.location.href="${host}/user/center?page=1";
}

$(function(){
	var sectionPage="section.jsp";var topicPage="topic.jsp";var userPage="user.jsp";var zonePage="zone.jsp";
	var upLoadPage="addSoft.jsp";var softPage="soft.jsp";var softSectionPage="softSection.jsp";var noticePage="notice.jsp";
	var articlePage="article.jsp";
	var albumPage="album.jsp";
	var photoPage="photo.jsp";
	var critiquePage="critique.jsp";
	var shopPage="shoplist.jsp";
	var sourcePage="shop_source.jsp";
	var commentPage="shop_comments.jsp";
	var bannerPage="shop_banner.jsp";
	var operatePage="shop_cdk.jsp";
	var categoryPage="shop_category.jsp";
	var sonCategoryPage="shop_menu.jsp";
	var menuPage="shop_sourceMenu.jsp";
	var logPage="shop_log.jsp";
	var typePage="shop_sourceType.jsp";
	var levelPage="shop_level.jsp";
	var messagePage="shop_message.jsp";

	var solrPage="solr_analysis.jsp";
	var curPage='${mainPage}';
	if(sectionPage.indexOf(curPage)>=0&&curPage!=""){
		$("#sectionLi").addClass("active");
	} else if(topicPage.indexOf(curPage)>=0&&curPage!=""){
		$("#topicLi").addClass("active");
	} else if(userPage.indexOf(curPage)>=0&&curPage!=""){
		$("#userLi").addClass("active");
	} else if(zonePage.indexOf(curPage)>=0&&curPage!=""){
		$("#zoneLi").addClass("active");
	}
	else if(softSectionPage.indexOf(curPage)>=0&&curPage!=""){
		$("#softSectionLi").addClass("active");
	}
	 else if(upLoadPage.indexOf(curPage)>=0&&curPage!=""){
			$("#addSoftLi").addClass("active");
		}
	 else if(softPage.indexOf(curPage)>=0&&curPage!=""){
			$("#softLi").addClass("active");
		}
	 else if(noticePage.indexOf(curPage)>=0&&curPage!=""){
			$("#noticeLi").addClass("active");
		}
	 else if(articlePage.indexOf(curPage)>=0&&curPage!=""){
			$("#articleLi").addClass("active");
		}
	 else if(albumPage.indexOf(curPage)>=0&&curPage!=""){
			$("#albumLi").addClass("active");
		}
	 else if(photoPage.indexOf(curPage)>=0&&curPage!=""){
			$("#photoLi").addClass("active");
		}
	 else if(critiquePage.indexOf(curPage)>=0&&curPage!=""){
			$("#critiqueLi").addClass("active");
		}
	 else if(shopPage.indexOf(curPage)>=0&&curPage!=""){
			$("#shopLi").addClass("active");
		}
	 else if(sourcePage.indexOf(curPage)>=0&&curPage!=""){
			$("#sourceLi").addClass("active");
		}
	 else if(commentPage.indexOf(curPage)>=0&&curPage!=""){
			$("#commentLi").addClass("active");
		}
	 else if(bannerPage.indexOf(curPage)>=0&&curPage!=""){
			$("#bannerLiLi").addClass("active");
		}
	 else if(operatePage.indexOf(curPage)>=0&&curPage!=""){
			$("#operateLi").addClass("active");
		}
	 else if(logPage.indexOf(curPage)>=0&&curPage!=""){
			$("#logLi").addClass("active");
		}
	 else if(categoryPage.indexOf(curPage)>=0&&curPage!=""){
			$("#categoryLi").addClass("active");
		}
	 else if(menuPage.indexOf(curPage)>=0&&curPage!=""){
			$("#menuLi").addClass("active");
		}
	 else if(typePage.indexOf(curPage)>=0&&curPage!=""){
			$("#typeLi").addClass("active");
		}
	 else if(levelPage.indexOf(curPage)>=0&&curPage!=""){
			$("#levelLi").addClass("active");
		}
	 else if(messagePage.indexOf(curPage)>=0&&curPage!=""){
			$("#messageLi").addClass("active");
		}
	 else if(messagePage.indexOf(curPage)>=0&&curPage!=""){
			$("#sonCategoryLi").addClass("active");
		}
	else if(solrPage.indexOf(curPage)>=0&&curPage!=""){
			$("#solrLi").addClass("active");
		}
})
</script>
</head>
<%
if(session.getAttribute("currentUser")==null){
	response.sendRedirect("admin/login");
	return;
}
%>
<body>
	<div id="header">
		<h1 style="margin-left: 0px;padding-left: 0px;"><a href="#">河南城建java软件工程</a></h1>	
	</div>

	<div id="sidebar">
		<ul>	
			<li id="noticeLi"><a href="Notice_list.action"><i class="icon icon-home"></i> <span>公告管理</span></a></li>	
			<li id="noticeLi"><a href="Notice_list.action"><i class="icon icon-home"></i> <span>站内私信</span></a></li>	
			<li id="userLi"><a href="User_list.action"><i class="icon icon-home"></i> <span>用户管理</span></a></li>			
			<li id="upLoadLi"><a href="SoftSection_list.action"><i class="icon icon-home"></i> <span>软件版块列表</span></a></li>
			<li id="softLi"><a href="Soft_list.action"><i class="icon icon-home"></i> <span>软件列表</span></a></li>
			<li id="upLoadLi"><a href="Soft_upload.action"><i class="icon icon-home"></i> <span>上传软件</span></a></li>			
			<!-- <li><a href="#"><i class="icon icon-home"></i> <span>回复管理</span></a></li> -->
			<li class="submenu"><a href="#"><i class="icon icon-th-list"></i>
				<span>下载社区管理</span> <span class="label">11</span></a>
				<ul>
					<li id="shopLi"><a href="ShopManage_list.action"><i class="icon icon-home"></i> <span>店铺列表</span></a></li>
					<li id="sourceLi"><a href="SourceManage_list.action"><i class="icon icon-home"></i> <span>资源管理</span></a></li>			
					<li id="commentLi"><a href="Section_list.action"><i class="icon icon-home"></i> <span>评论列表</span></a></li>
					<li id="bannerLi"><a href="NewsBanner_listAdmin.action"><i class="icon icon-home"></i> <span>banner列表</span></a></li>
					<li id="logLi"><a href="Log_list.action"><i class="icon icon-home"></i> <span>网站日志</span></a></li>
					<li id="messageLi"><a href="MesManage_msList.action"><i class="icon icon-home"></i> <span>举报日志</span></a></li>
					<li id="operateLi"><a href="Cdk_list.action"><i class="icon icon-home"></i> <span>cdk管理</span></a></li>
					<li id="categoryLi"><a href="Category_list.action"><i class="icon icon-home"></i> <span>大目录管理</span></a></li>
					<li id="sonCategoryLi"><a href="Menu_list.action"><i class="icon icon-home"></i> <span>二级菜单管理</span></a></li>
					<li id="typeLi"><a href="Type_list.action"><i class="icon icon-home"></i> <span>资源类型管理</span></a></li>
					<li id="levelLi"><a href="Level_list.action"><i class="icon icon-home"></i> <span>等级列表</span></a></li>						
				</ul>
			</li>
	
			<li class="submenu"><a href="#"><i class="icon icon-th-list"></i>
				<span>solr索引管理</span> <span class="label">3</span></a>
				<ul>
					<li id="solrLi"><a href="SolrJ_show.action"><i class="icon icon-home"></i> <span>添加索引</span></a></li>
					<li id="solrLi"><a href="SolrJ_show.action"><i class="icon icon-home"></i> <span>索引删除</span></a></li>			
					<li id="solrLi"><a href="SolrJ_show.action"><i class="icon icon-home"></i> <span>索引统计</span></a></li>
											
				</ul>
			</li>
			<li class="submenu"><a href="#"><i class="icon icon-th-list"></i>
					<span>博客管理</span> <span class="label">5</span></a>
				<ul>		
					<li id="userLi"><a href="User_list.action"><i class="icon icon-home"></i> <span>用户管理</span></a></li>
					<li id="articleLi"><a href="article.jsp"><i class="icon icon-home"></i> <span>文章管理</span></a></li>
					<li id="albumLi"><a href="album.jsp"><i class="icon icon-home"></i> <span>相册管理</span></a></li>
					<li id="photoLi"><a href="photo.jsp"><i class="icon icon-home"></i> <span>用户文件管理</span></a></li>
					<li id="critiqueLi"><a href="critique.jsp"><i class="icon icon-home"></i> <span>留言管理</span></a></li>	
				</ul>
			</li>
			<li class="submenu"><a href="#"><i class="icon icon-th-list"></i>
				<span>论坛管理</span> <span class="label">5</span></a>
				<ul>
					<li id="userLi"><a href="User_list.action"><i class="icon icon-home"></i> <span>用户管理</span></a></li>
					<li id="zoneLi"><a href="Zone_list.action"><i class="icon icon-home"></i> <span>空间列表</span></a></li>
					<li id="noticeLi"><a href="Notice_list.action"><i class="icon icon-home"></i> <span>公告管理</span></a></li>			
					<li id="sectionLi"><a href="Section_list.action"><i class="icon icon-home"></i> <span>板块列表</span></a></li>
					<li id="topicLi"><a href="Topic_listAdmin.action"><i class="icon icon-home"></i> <span>帖子列表</span></a></li>
			
				</ul>
			</li>				
			<li class="submenu"><a href="#"><i class="icon icon-th-list"></i>
				<span>系统管理</span> <span class="label">3</span></a>
				<ul>
					<li><a href="javascript:checkUserLogin()">修改密码</a></li>
					<li><a href="javascript:logout()">安全退出</a></li>
					<li><a href="#">刷新系统缓存</a></li>
				</ul>
			</li>
		</ul>

	</div>

	<div id="style-switcher">
		<i class="icon-arrow-left icon-white"></i> <span>颜色:</span> 
		<a href="#grey" style="background-color: #555555; border-color: #aaaaaa;"></a> 
		<a href="#blue" style="background-color: #2D2F57;"></a> 
		<a href="#red" style="background-color: #673232;"></a>
	</div>

	<div id="content">
		<div id="content-header">
			<h1>后台管理</h1>
			<!-- <div class="btn-group">
				<a class="btn btn-large tip-bottom" title="Manage Files"><i
					class="icon-file"></i></a> <a class="btn btn-large tip-bottom"
					title="Manage Users"><i class="icon-user"></i></a> <a
					class="btn btn-large tip-bottom" title="Manage Comments"><i
					class="icon-comment"></i><span class="label label-important">5</span></a>
				<a class="btn btn-large tip-bottom" title="Manage Orders"><i
					class="icon-shopping-cart"></i></a>
			</div> -->
		</div>
		<div id="breadcrumb">
			<a href="main.jsp" title="首页" class="tip-bottom">
			<i class="icon-home"></i> 首页</a> <a href="#" class="current">${crumb1 }</a>
		</div>
		<jsp:include page="${mainPage }"></jsp:include>
		<div class="row-fluid">
			<div id="footer" class="span12">
				2016.08.22 &copy; 河南城建Java软件工程班. 作者：miki&nbsp;&nbsp;&nbsp;&nbsp; <a href="https://www.limi.store"></a>
			</div>
		</div>
	</div>

<script src="js/jquery.min.js"></script>
<script src="js/jquery.ui.custom.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/jquery.uniform.js"></script>
<!-- <script src="js/select2.min.js"></script> -->
<script src="js/jquery.dataTables.min.js"></script>
<script src="js/unicorn.js"></script>
<script src="js/unicorn.tables.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/uploadPreview.min.js"></script>
</body>
</html>