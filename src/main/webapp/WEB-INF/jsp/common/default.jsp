
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!--修改日期格式只显示年月日  -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>  
    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

	<!--2017.03.26 调用浏览器的极速内核模式  可以显示出标准样式 -->
<meta name="renderer" content="webkit"> 
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">

<!-- #2017.05.03   网站上半部分引入    文件              头 -->

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath}/she_files/style.css">

<meta http-equiv="Cache-Control" content="no-siteapp">
<link href="${pageContext.request.contextPath}/she_files/style2016.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/she_files/channelheader1000.css" rel="stylesheet">
<meta name="author" content="chn 17869">

<!-- #2017.05.03   网站上半部分引入    文件              尾 -->

<title>首页</title>

<style type="text/css" id="98512502000"></style>

<script type="text/javascript">

function checkForm(){
	 var page=$("#s_topic.title").val();
	 if(page==""){
		 $("#error").html("搜索内容不能为空！");
		 return false;
	 }	 
	 return true;
}

	//引用评论
function copy(c){		
		document.getElementById("content").value = c ;
	}

function findKey(){
		var key=$("#keyword").val();
		if(key==""){
			alert("关键字不能为空");
		}else{
			if(key.length>6){
				alert("关键字长度不能大于5");
			}else{
				$("#searchForm").submit();
			}
		}
		return false;
	}
</script>

<link href="css/csshake.min.css" rel="stylesheet" type="text/css" />
<style type="text/css">
a:hover{
  	text-decoration:none;
}
</style>
</head>
<body>

		<!-- 2017.05.04  网站上半部分  头    -->

<div style="border:0px solid red;background:#FFFFFF;">
<style>

	/*隐藏二级菜单列表      2016.10.08               */
.mainnav li ul li{
	height:12px;
}	
.mainnav li ul{
	display:none;
	padding:0px;
	width:80px;
}		
/*当鼠标移动到一级菜单时，显示二级菜单 2017.03.23 晚上  */
			
.mainnav li:hover ul{
	text-align:center;
	display:block;
	margin:0px auto;  /*   2017.05.08       防止偏出，与一级菜单不对照          */
	width:80px;  /*定义宽度，让二级菜单呈现瀑布式排列，而非横向  6  */
	padding:0px;
}		
</style>

<script type="text/javascript" src="${pageContext.request.contextPath}/she_files/function.js"></script>
<div class="club-nav">
<div class="logo"><a href="http://sharehoo.cn/" title="IT帮-资讯传播社区" target="_blank"><img src="./images/banner/ti.jpg" style=" width:180px;height:62px;border-left: 0px solid #B6241F;"></a></div>
<ul id="navMain" class="mainnav">
    <li><a target="_blank" title="" href="topic/section/7">IT面试艺术</a></li>
    <li><a target="_blank" title="javaWeb-api" href="topic/section/21">原创文章</a></li>
    <li><a target="_blank" title="" href="">javaWeb-api</a>
    	
		 <ul>
		      <li><a href="./source/jquery3.0/jQuery3.1.html" target="_blank" title="jquery3.0">前端样式
		          </a>
		      </li> 
		      <li><a href="./source/hibernate/Hibernate.html" target="_blank" title="java，php，c#">后端语言
		         </a>
		     </li>
		    <li><a href="./source/zhengze/zzbd.html" target="_blank" title="正则表达式">正则表达
		        </a>
		    </li>
		     <li><a href="./source/txt.jsp" target="_blank" title="更多资源">更多文档
		        </a>
		    </li>                 
       </ul>
								
        
    </li>
	<li><a target="_blank" title="" href="#">IT编程/语言</a>

		<ul>	  
		      <li><a href="topic/section/1" target="_blank" title="日有一计，必有所获">后端语言
		         </a>
		     </li>
		    <li><a href="topic/section/8"  target="_blank" title="CSS">前端样式
		        </a>
		    </li>
		     <li><a href="topic/section/7"  target="_blank" title="HTML">网页制作
		        </a>
		      </li>
		     <li><a href="topic/section/11"  target="_blank" title="HTML">技术求助
		        </a>
		      </li>         
       		</ul>
		
	</li>
	<li><a target="_blank" title="" href="topic/section/16">大数据</a></li>
    <li><a target="_blank" title="" href="topic/section/13">服务运维</a></li>
    <li><a target="_blank" title="" href="topic/section/2">二手市场</a></li>
    <li><a target="_blank" title="" href="topic/section/19">艺术/生活/美</a>

		<ul>	  
		      <li><a href="topic/section/19" target="_blank" title="日有一计，必有所获">美食美客
		         </a>
		     </li>
		    <li><a href="topic/section/14" target="_blank" title="宁可食无肉，不可居无乐">音乐心灵
		        </a>
		    </li>
		     <li><a href="topic/section/15" target="_blank" title="不吐不快">约伴出游
		        </a>
		    </li>  
			<li><a href="topic/section/4" target="_blank" title="生活那些事">吐吐吐嘈
		        </a>
		    </li>

			<li><a href="topic/section/13" target="_blank" title="前端样式">精致物品
		        </a>
		    </li>                 
       		</ul>
</li>
    <li><a target="_blank" title="" href="topic/section/3">资源分享</a></li>
    
    <li><a target="_blank" title="" href="topic/section/12">游戏圈</a></li>
    

    <li><a target="_blank" title="" href="#">写帖子/博客</a>

		 <ul>	
			<li><a href="topic/section/11"  target="_blank" title="HTML">发帖求助
		        </a>
		      </li>   
		      <li><a href="javascript:void(0);" onclick="writeBlog()" target="_blank" title="日有一计，必有所获">去写博客
		         </a>
		     </li>
		    <li><a href="javascript:void(0);" onclick="writeTopic()" target="_blank" title="正则表达式">去写帖子
		        </a>
		    </li>
		     <li><a href="javascript:void(0);" onclick="writeAnswer()" target="_blank" title="更多资源">去提问题
		        </a>
		    </li>                 
       		</ul>
	</li>
    <li><a target="_blank" title="" href=""></a></li>	         
</ul>
</div>

<div class="row chaotong_nav"> 
<!-- 66704196：社区首页变幻广告栏      类型：固定 尺寸：1000x90-->

</div>
<div class="row chaotong_nav"> 
<!-- 66704196：社区首页变幻广告栏     类型：固定 尺寸：1000x90-->

</div>

<div class="row r2">
<div class="section_L bbs-picture">
    <h2 class="modTit"> 
    
    <!-- 图文版块   2017.05.04   -->
      <strong>最新</strong>
      <span class="modTit-link"><a href="topic/section/21">更多</a></span></h2>
    <div class="left">
      <ul class="miki">
      <c:forEach items="${countList }" var="article">
        <li class="row-l">
      	  
              <dl>
                <dt><a href="${pageContext.request.contextPath}/blog/${article.user.nickNameId}/article/${article.id}" title="" target="_blank"><img src="${pageContext.request.contextPath}/${article.image}" alt=""></a></dt>
                <dd><a href="${pageContext.request.contextPath}/blog/${article.user.nickNameId}/article/${article.id}" title="${article.title }" target="_blank">${fn:substring(article.title, 0, 14)}</a></dd>
              </dl>
      	  
        </li>
       </c:forEach> 
        
      </ul>
    </div>

    <div class="right">
      <ul id="js" class="newslist">
        <c:forEach items="${lastTopicList }" var="topic" varStatus="status">
             	
          <li>
           <c:choose>
          	<c:when test="${topic.code==null }">
          		<a href="${host}/topic/detail/${topic.id }" title="${topic.title }" target="_blank">${topic.title }</a>
          		<span class="newslistSubTitle">
              		<a href="${host}/topic/detail/${topic.id }" title="香焦叶" target="_blank">
				<span class="time${status.count}" title="2018-10-30 00:02:32"><fmt:formatDate value="${topic.publishTime }" pattern="yy-MM-dd HH:mm:ss"/></span></a>
            	</span>
          	</c:when>
          	<c:otherwise>
          		<a href="http://sharehoo.cn/${topic.code }.html" title="${topic.title }" target="_blank">${topic.title }</a>
          		<span class="newslistSubTitle">
              		<a href="http://sharehoo.cn/${topic.code }.html" title="${topic.title }" target="_blank">
				<span class="time${status.count}" title="2018-10-30 00:02:32"><fmt:formatDate value="${topic.publishTime }" pattern="yyyy-MM-dd HH:mm:ss"/></span></a>
            	</span>
          	</c:otherwise>
          </c:choose>
          </li>
        </c:forEach>
      </ul>
    </div>
  </div>
   
<div class="section_R1" style="margin-top:9px;">
  <h2 class="modTit" style="margin:0px;padding:0px;"> <strong>发帖达人</strong><span class="modTit-link"></span></h2>
  	 <c:forEach items="${userScoreList }" var="user" varStatus="state">
      <div class="card_">
        <a href="${pageContext.request.contextPath }/blog/${user.nickNameId}" target="_blank">
          <img src="${pageContext.request.contextPath}/${user.face}">
        </a>
        <span>
          <strong>
            <a href="${pageContext.request.contextPath }/blog/${user.nickNameId}" target="_blank">${user.nickName }</a>
          </strong> 
          <em>积分：<i>${user.score }</i></em>
        </span>
      </div>
      
  </c:forEach>
</div>

</div>
<div class="row chaotong"></div>
<div class="row r2">
  <div class="col">
    <h2 class="modTit"><strong><a href="#">网友原创</a></strong><span class="modTit-link"><a href="topic/section/21">更多</a></span></h2>
    <div class="r2bor">
      <ul class="newslist" id="dataClubYch">
      <c:forEach items="${ycTopicList }" var="topic">
      <li>
	<c:choose>
          	<c:when test="${topic[3]==null }">
          		<a href="${host}/topic/detail/${topic[0] }" target="_blank">${topic[1] }</a>${topic[2] }
			
          	</c:when>
          	<c:otherwise>
          		<a href="http://sharehoo.cn/${topic[3]}.html" target="_blank">${topic[1] }</a>${topic[2] }
          	</c:otherwise>
          </c:choose>
		  </li>
       </c:forEach>
     </ul>
     </div>
  </div>
  
  
  <div class="coM">
    <div class="spotlight" id="spotlight">
      <h3><span class="active">版主推荐</span><span>出谋划策</span> </h3>
      <ul class="newslist">
      <c:forEach items="${tjTopicList }" var="topic">
		<li>
	<c:choose>
          	<c:when test="${topic.code==null }">
          		<a target="_blank" title="${topic.title }  " href="${host}/topic/detail/${topic.id }">${topic.title }  </a>${topic.user.nickName  }
          	</c:when>
          	<c:otherwise>
          		<a target="_blank" title="${topic.title }  " href="http://sharehoo.cn/${topic.code }.html">${topic.title }  </a>${topic.user.nickName  }
          	</c:otherwise>
          </c:choose>	</li>
	</c:forEach>
</ul>


<ul class="newslist" style="display:none;">

     <c:forEach items="${helpTopicList }" var="topic">
	<li><c:choose>
          	<c:when test="${topic[3]==null }">
          		<a href="${host}/topic/detail/${topic[0] }" target="_blank">${topic[1] }</a>${topic[2] }
          	</c:when>
          	<c:otherwise>
          		<a href="http://sharehoo.cn/${topic[3]}.html" target="_blank">${topic[1] }</a>${topic[2] }
          	</c:otherwise>
          </c:choose></li>
	</c:forEach>

     
</ul>
    </div>
  </div>
  
 <div class="section_R" style="margin-top:9px;">
	 <h2 class="modTit" style="margin:0px;padding:0px;"> <strong><a href="#">版块排行</a></strong><span class="modTit-link"></span></h2>
	  <ul class="paihang" id="rank" style="margin:0; padding:0; border:none; list-style:none;">             
	   <li>
		   <em>01</em><a href="topic/section/1" target="_blank">javaWeb</a>
		   <span><i style="width:52%;"></i></span>        
	   </li>  
	                 
	   <li>          
		   <em>02</em><a href="topic/section/11" target="_blank">出谋划策</a>  
		   <span>            <i style="width:32%;"></i>          </span>       
	   </li>  
	   
	  <li> 
		  <em>03</em> <a href="topic/section/16" target="_blank">大数据</a>          
		  <span>            <i style="width:20%;"></i>          </span>        
	  </li>  
	                
	  <li>
		  <em>04</em><a href="topic/section/20" target="_blank">编程语言</a> 
		   <span>            <i style="width:15%;"></i>          </span>        
	   </li>     
	              
	   <li>         
		    <em>05</em>          <a href="topic/section/12" target="_blank">游戏开发</a>
		   <span>  <i style="width:2%;"></i>  </span>       
	    </li> 
	              
	    <li> 
		     <em>06</em>  <a href="topic/section/15" target="_blank">约伴出游</a> 
		     <span>  <i style="width:10%;"></i></span>        
	     </li>
	                     
	  <li>   
		  <em>07</em> <a href="topic/section/19" target="_blank">美食美客</a> 
		  <span>  <i style="width:8%;"></i> </span>        
	  </li> 
	   <li> 
		   <em>08</em>  <a href="topic/section/2" target="_blank">二手市场</a> 
		       <span> <i style="width:6%;"></i></span>        
	   </li>               
	  <li> 
		  <em>09</em> <a href="topic/section/18" target="_blank">微信开发</a>
		   <span> <i style="width:3%;"></i></span>       
	    </li>                     
	      <li>
		       <em>10</em>  <a href="topic/section/8" target="_blank">HTML5+CSS</a> 
		       <span> <i style="width:2%;"></i></span>        
	      </li>  
	    </ul>
	    
	<!-- 统计访问量    -->
	   
	    <!-- 访问量统计 -->
	 <div style="height:120px;border:1px solid silver;border-left:0px;border-right:0px;">
	  <ul class="paihang" id="rank" style="margin:0; padding:0; border:none; list-style:none;">             
		   <li>
			   <em>在线人数</em><a href="#" id="online"></a>
			   <span><i style="width:22%;"></i></span>        
		   </li>  
		                 
		   <li>          
			   <em>今日访问量</em><a href="#" id="dayonline"></a>  
			   <span>            <i style="width:32%;"></i>          </span>       
		   </li>  
		   
		  <li> 
			  <em>总访问量</em> <a href="#" id="total"></a>          
			  <span>            <i style="width:70%;"></i>          </span>        
		  </li>
	  </ul>
	    </div>
  </div> 
  
</div>
<div class="row chaotong"></div>
<div class="row r2">

</div>

<script src="${pageContext.request.contextPath}/she_files/freescroll.js"></script> 
<script src="${pageContext.request.contextPath}/she_files/tab.min.js"></script> 
<script src="./she_files/fixedLimit.min.js"></script>   
<script src="./she_files/function2016.js"></script> 	 <!--   2017 .05.06  首页实现出谋划策和版主推荐板块两者点击鼠标滑动特效的关键   -->


<!-- #2017.05.01     网站上半部分       End -->

</div>

<div style="width:1200px;margin:0 auto;height:35px;background:#FFFFFF;">
		<div style="width:1000px;margin:0 auto;height:40px;border:1px solid silver;background:#B6241F;">
			<div style="position:absolute;margin-left:21px;color: #fff;text-align: left;font: bold 16px/36px simsun;">>>热门板块</div>
				<div style="border:0px solid white;width:40%;height:35px;float:right;">
				
				</div>
		</div>
	</div>


	
<div style="width: 1200px; margin: 0 auto;background:#FFFFFF">
<div id="layout_m_1371438904297" class="layout_m clearfix" style="">

	<!-- 左三个版块内容 -->
<!-- 头层容器 -->	
<div id="layout_t_1371438904297_1" class="layout_sub layout_in ui-droppable ui-sortable" style="width:500px;">

<!-- 三个小容器 -->
<c:forEach items="${sectionList }" var="section"  begin="0" end="7" step="1">
<div id="table_m_1371438909822" class="table_m clearfix ih-60 ui-droppable ui-droppable, ui-sortable" style="border: 0px; margin: 0px 10px 10px 0px; padding: 0px; position: relative;">
	<div class="table_head" style="height: 25px; line-height: 25px; margin-bottom: 5px; background-image: url(topic/images/daily_tit_bg_10.jpg); background-color: rgb(255, 255, 255); background-position: 100% 50%; background-repeat: no-repeat no-repeat;">
		<a href="topic/section/${section.id }" target="_blank">
			<div class="Tc-18-4">${fn:substring(section.name, 0, 2)}</div>
			<div class="Tc-18-1">${fn:substring(section.name, 2, 10)}</div>
			<div class="love-more">更多</div>
		</a>
	</div>
	<div id="content_m_1383014408261" class="content_m" style="width: 150px; margin: 0px 0px 10px; padding: 0px; border: 0px;">
		<a href="#">
			<img src="${pageContext.request.contextPath}/${section.logo}" style="height:260px;">
		</a>
	</div>
	
	<!-- 版块介绍 -->
	<div id="content_m_1383015574507" class="content_m" style="width: 330px; margin: 0px 0px 0px 10px; padding: 0px; border: 0px;">
		<div class="content_list" style="width:330px" data="4.html">
			<div class="list_s_love ti_1" data="504670793.html">
				<div class="title_s love-height a_color_1" >
					<font style="color:#B31515;">最近新帖:</font>${sectionNoReplyTopicCount.get(section)}&nbsp;<font style="color:#B31515;">精华帖:</font>${sectionGoodTopicCount.get(section) }
					&nbsp;<font style="color:#B31515;">帖子总数:</font>${sectionTopicCount.get(section) }&nbsp;<font style="color:#B31515;">版主：</font><a href="blog/${section.master.nickNameId }" target="_blamk" style="color:#088B23">${section.master.nickName }</a>
				</div>
				
		  </div>		
	</div>
</div>
		
	<div id="content_m_1383015574507" class="content_m" style="width: 330px; margin: 0px 0px 0px 10px; padding: 0px; border: 0px;">
		<div class="content_list" style="width:330px" data="4.html">
		
			<c:forEach items="${good.get(section) }" var="topic">
				<div class="list_s_love ti_1" data="504670793.html">
					<div class="title_s love-height a_color_1">

						<c:choose>
				          	<c:when test="${topic[3]==null }">
				          		<a href="${host}/topic/detail/${topic[0] }" target="_blank">${fn:substring(topic[1], 0, 24)}</a>
				          	</c:when>
				          	<c:otherwise>
				          		<a href="http://sharehoo.cn/${topic[3]}.html" target="_blank">${fn:substring(topic[1], 0, 24)}</a>
				          	</c:otherwise>
				          </c:choose>
					</div>
					<div class="nick_s a_color_2" ><a href="blog/Blog_show.action?userId=${topic[4]}">${topic[2] }</a>
					</div>
			  </div>
			 </c:forEach>			
		</div>
	</div>	
	<!-- 图片文字 -->
	<div id="content_m_1383030174361" class="content_m" style="width: 150px; margin: 0px 0px 10px; padding: 0px; border: 0px;">
		<p class="ima_mention"><a href="http://xiangxuanqingya504637218.html
	" style="color:#ffffff;font-size:9pt;">社区新功能陆续上线当中</a></p>
	</div>
	
</div>

</c:forEach>
	
</div>
	
		
	<!-- 右三个版块内容 -->
	
	<div id="layout_t_1371438904297_2" class="layout_sub layout_in ui-droppable ui-sortable" style="margin-left:10px; width:490px;">
		
		
		<!-- 社区公告 -->
		
		<div id="table_m_1371438954447" class="table_m clearfix ih-60 ui-droppable ui-droppable, ui-sortable" style="border: 0px; margin: 0px 0px 10px; padding: 0px; position: relative;">
			<div class="table_head" style="height: 26px; line-height: 26px; margin-bottom: 5px; background-image: url(topic/images/daily_tit_bg_10.jpg); background-color: rgb(255, 255, 255); background-position: 100% 50%; background-repeat: no-repeat;">
				<a href="#">
					<div class="Tc-18-4">社区</div>
					<div class="Tc-18-1">公告</div>
					<div class="love-more">更多</div>
				</a>
			</div>
		<div id="content_m_1383017391897" class="content_m" style="width: 150px; margin: 0px 0px 10px; padding: 0px; border: 0px;"><a href="#">
			<img src="topic/images/141.jpg"  style="height:260px;"></a>
		</div>
			<div id="content_m_1383017483899" class="content_m" style="width: 330px; margin: 0px 0px 0px 10px; padding: 0px; border: 0px;">
				<div class="content_list" style="width:330px" data="4.html">
				
				<c:forEach items="${noticeList }" var="notice">
					<div class="list_s_love ti_1" data="504835932.html">
						<div class="title_s love-height a_color_1">
							<a href="#" onClick="window.open('${host}/notice/detail/${notice.id }','','width=500,height=400');" style="color:black;font-size:9pt;">${notice.name }</a>
						</div>
						<div class="nick_s a_color_2">
							<fmt:formatDate value="${notice.pubDate }" pattern="MM-dd "/>
						</div>
					</div>
				</c:forEach>	
				
				</div>
			</div>
			<div id="content_m_1383030378198" class="content_m" style="width: 150px; margin: 0px 0px 10px; padding: 0px; border: 0px;">
				<p class="ima_mention">
					<a href="#" style="color:#ffffff;font-size:9pt;">载人飞船发射成功！  </a></p>
			</div>
		</div>
		
		
		
		<!-- 右边版块遍历 -->
							
		<c:forEach items="${sectionList }" var="section"  begin="8" end="11" step="1">
			<div id="table_m_1371438913403" class="table_m clearfix ih-60 ui-droppable ui-droppable, ui-sortable" style="border: 0px; margin: 0px 0px 10px; padding: 0px; position: relative;">
				<div class="table_head" style="margin-top:-5px;height: 25px; line-height: 25px; margin-bottom: 5px; background-image: url(./topic/images/daily_tit_bg_10.jpg); background-color: rgb(255, 255, 255); background-position: 100% 50%; background-repeat: no-repeat no-repeat;">
					<a href="topic/section/${section.id }" target="_blank">
						<div class="Tc-18-4">${fn:substring(section.name, 0, 2)}</div>
						<div class="Tc-18-1">${fn:substring(section.name, 2, 10)}</div>
						<div class="love-more">更多</div>
					</a>
				</div>
				
				<!-- 素材图片 -->
				<div id="content_m_1383016487803" class="content_m" style="width: 150px; margin: 0px 0px 10px; padding: 0px; border: 0px;">
					<a href="#">
						<img src="${pageContext.request.contextPath}/${section.logo}" style="height:260px;"></a>
				</div>
				
			
			<div id="content_m_1383016689855" class="content_m" style="width: 330px; margin: 0px 0px 10px 10px; padding: 0px; border: 0px;">
			
				<!-- 版块介绍 -->
					<div class="content_list" style="width:330px" data="4.html">
						<div class="list_s_love ti_1" data="504670793.html">
							<div class="title_s love-height a_color_1" >
							<font style="color:#B31515;">最近新帖:</font>${sectionNoReplyTopicCount.get(section)}&nbsp;<font style="color:#B31515;">精华帖:</font>${sectionGoodTopicCount.get(section) }
							&nbsp;<font style="color:#B31515;">帖子总数:</font>${sectionTopicCount.get(section) }&nbsp;<font style="color:#B31515;">版主：</font><a href="blog/${section.master.nickNameId }" target="_blamk" style="color:#088B23">${section.master.nickName }</a>
							</div>
					
			  			</div>		
		 			 </div>
				<div class="content_list" style="width:330px" data="4.html">
				
				 	<c:forEach items="${good.get(section) }" var="topic">
						<div class="list_s_love ti_1" data="504670793.html">
							<div class="title_s love-height a_color_1" >
								<c:choose>
								<c:when test="${topic[3]==null }">
									<a href="${host}/topic/detail/${topic[0] }" target="_blank">${fn:substring(topic[1], 0, 24)}</a>
								</c:when>
								<c:otherwise>
									<a href="http://sharehoo.cn/${topic[3]}.html" target="_blank">${fn:substring(topic[1], 0, 24)}</a>
								</c:otherwise>
							  </c:choose>	
							</div>
							<div class="nick_s a_color_2" ><a href="blog/Blog_show.action?userId=${topic[4]}">${topic[2] }</a>
							</div>
					  	</div>
					 </c:forEach>	
				
				</div>
			</div>
			
			<div id="content_m_1383030238548" class="content_m" style="width: 150px; margin: 0px 0px 10px; padding: 0px; border: 0px;">
				<p class="ima_mention">
					<a href="#" style="color:#ffffff;font-size:9pt;">版块升级，更贴近于生活</a></p>
			</div>
			
		</div>
		</c:forEach>
		
		<c:forEach items="${sectionList }" var="section"  begin="13" end="15" step="1">
			<div id="table_m_1371438913403" class="table_m clearfix ih-60 ui-droppable ui-droppable, ui-sortable" style="border: 0px; margin: 0px 0px 10px; padding: 0px; position: relative;">
				<div class="table_head" style="height: 25px; line-height: 25px; margin-bottom: 5px; background-image: url(./topic/images/daily_tit_bg_10.jpg); background-color: rgb(255, 255, 255); background-position: 100% 50%; background-repeat: no-repeat no-repeat;">
					<a href="topic/section/${section.id }" target="_blank">
					<div class="Tc-18-4">${fn:substring(section.name, 0, 2)}</div>
					<div class="Tc-18-1">${fn:substring(section.name, 2, 10)}</div>
					<div class="love-more">更多</div>
					</a>
				</div>
				
				<div id="content_m_1383016487803" class="content_m" style="width: 150px; margin: 0px 0px 10px; padding: 0px; border: 0px;">
					<a href="http://djw25553504660895.html">
						<img src="${pageContext.request.contextPath}/${section.logo}" style="height:260px;"></a>
				</div>
			
			<div id="content_m_1383016689855" class="content_m" style="width: 330px; margin: 0px 0px 10px 10px; padding: 0px; border: 0px;">
			<div class="content_list" style="width:330px" data="4.html">			
				<!-- 版块介绍 -->
					<div class="content_list" style="width:330px" data="4.html">
						<div class="list_s_love ti_1" data="504670793.html">
							<div class="title_s love-height a_color_1" >
							<font style="color:#B31515;">最近新帖:</font>${sectionNoReplyTopicCount.get(section)}&nbsp;<font style="color:#B31515;">精华帖:</font>${sectionGoodTopicCount.get(section) }
							&nbsp;<font style="color:#B31515;">帖子总数:</font>${sectionTopicCount.get(section) }&nbsp;<font style="color:#B31515;">版主：</font><a href="blog/${section.master.nickNameId }" target="_blamk" style="color:#088B23">${section.master.nickName }</a>
							</div>
					
			  			</div>		
		 			 </div>
		 			 
					<div class="content_list" style="width:330px" data="4.html">
				
					 	<c:forEach items="${good.get(section) }" var="topic">
							<div class="list_s_love ti_1" data="504670793.html">
								<div class="title_s love-height a_color_1" >
									<c:choose>
										<c:when test="${topic[3]==null }">
											<a href="${host}/topic/detail/${topic[0] }" target="_blank">${fn:substring(topic[1], 0, 24)}</a>
										</c:when>
										<c:otherwise>
											<a href="http://sharehoo.cn/${topic[3]}.html" target="_blank">${fn:substring(topic[1], 0, 24)}</a>
										</c:otherwise>
									  </c:choose>
								</div>
								<div class="nick_s a_color_2" ><a href="blog/Blog_show.action?userId=${topic[4]}">${topic[2] }</a>
								</div>
						  	</div>
						 </c:forEach>	
				
					</div>
				</div>
			</div>
			
			<div id="content_m_1383030238548" class="content_m" style="width: 150px; margin: 0px 0px 10px; padding: 0px; border: 0px;">
				<p class="ima_mention">
					<a href="http:#" style="color:#ffffff;font-size:9pt;">入驻社区商城，立享豪华大礼</a></p>
			</div>
			
		</div>
		</c:forEach>
		<!-- 无味生活 -->
				
		<!-- 博客乱炖 -->	
	</div>
	
	
</div>
	
	<!-- 六个版块内容结束 -->		
<script src="js/jquery.min.js"></script>	
<div id="layout_m_1431933408203" class="layout_m clearfix" style="">
	<div id="layout_t_1431933408203_1" class="layout_sub layout_in ui-droppable ui-sortable" style="width:1000px;">
	<div id="table_m_1431933427046" class="table_m clearfix ui-droppable ui-sortable" style="">
	<div id="content_m_1431933442198" class="content_m" style="">
		<script>
			(function() {
			    var s = "_" + Math.random().toString(36).slice(2);
			    document.write('<div id="' + s + '"></div>');
			    (window.slotbydup=window.slotbydup || []).push({
			        id: '3153098',
			        container: s,
			        size: '1000,100',
			        display: 'inlay-fix'
			    });
			})();
		</script>
		</div>
	</div>
</div>
</div>


<!-- 图库开始 -->

<div id="layout_m_1371535606530" class="layout_m clearfix" style="">
	<div id="layout_t_1371535606530_1" class="layout_sub layout_in ui-droppable ui-sortable" style="width:1000px;">
		<div id="table_m_1371535648179" class="table_m clearfix ui-droppable ui-sortable ih-0" style="border: 0px none; margin: 0px; padding: 0px;">
			<div class="table_head" style="height: 25px; line-height: 25px; margin-bottom: 5px;">
				<div class="Tc-18-1">博客</div>
				<div class="Tc-18-5">读图</div>
			</div>
			
			<div id="content_m_1371697272290" class="content_m" style="width: 1000px; margin: 0px; padding: 0px; border: 0px none;">
			</div>
			<div id="content_m_1406604451373" class="content_m" style="">
				<div id="readimg">
					<ul id="readimg_ul"><li>1</li><li>2</li><li>3</li><li>4</li><li>5</li><li>6</li><li>7</li><li>8</li><li>9</li>
					</ul>
				<div id="readimg_list">
					<div class="readimg-t-1">
						<a href="#" target="_blank">
							<img src="topic/images/557.jpg" title="冬日九寨沟，美哭了的童话" alt="冬日九寨沟，美哭了的童话">
								<p><span class="title">冬日九寨沟，美哭了的童话</span></p>
						</a>
					</div>
					<div class="readimg-t-2">
						<a href="#" target="_blank">
							<img src="./topic/images/218.jpg" title="云端的美味" alt="云端的美味">
							<p><span class="title">云端的美味</span></p>
						</a>
					</div>
					
					<div class="readimg-t-2">
						<a href="#" target="_blank">
							<img src="topic/images/139.jpg" title="斑斓之秋" alt="斑斓之秋">
							<p><span class="title">斑斓之秋</span></p>
						</a>
					</div>
					
						<div class="readimg-t-2"><a href="#" target="_blank"><img src="topic/images/219.jpg" title="图瓦人的美丽家园" alt="图瓦人的美丽家园"><p><span class="title">图瓦人的美丽家园</span></p></a>
						</div>
					
						<div class="readimg-t-2"><a href="#" target="_blank"><img src="topic/images/551.jpg" title="超级树" alt="超级树"><p><span class="title">超级树</span></p></a>
						</div>
						
						<div class="readimg-t-2"><a href="#" target="_blank"><img src="topic/images/1314/2016.5.10/2.jpg" title="这些建筑是来搞笑的吗" alt="这些建筑是来搞笑的吗"><p><span class="title">这些建筑是来搞笑的吗</span></p></a>
						</div>
						
						<div class="readimg-t-2"><a href="#" target="_blank"><img src="topic/images/546.jpg" title="零添加的山楂糕" alt="零添加的山楂糕"><p><span class="title">零添加的山楂糕</span></p></a>
						</div>
						
						<div class="readimg-t-2"><a href="#" target="_blank"><img src="topic/images/556.jpg" title="双色双味汤圆" alt="双色双味汤圆"><p><span class="title">双色双味汤圆</span></p></a>
						</div>
						
						<div class="readimg-t-2"><a href="#" target="_blank"><img src="topic/images/1314/2016.5.10/23.jpg" title="再喜欢也不要旧情复燃" alt="再喜欢也不要旧情复燃"><p><span class="title">再喜欢也不要旧情复燃</span></p></a>
						</div>
						
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<!-- 图库结尾 -->
	
	
	<!-- 用户轮播图开始 -->
	<div id="layout_m_1371698456355" class="layout_m clearfix" style="">
		<div id="layout_t_1371698456355_1" class="layout_sub layout_in ui-droppable ui-sortable" style="width:1000px;">
			<div id="table_m_1371698460868" class="table_m clearfix ih-60 ui-droppable ui-sortable" style="border: 0px; margin: 0px; padding: 0px;">
				<div class="table_head" style="height: 25px; line-height: 25px; margin-bottom: 5px;">
					<div class="Tc-18-1">活跃</div>
					<div class="Tc-18-5">博客</div>
				</div>
				<div id="content_m_1371698529386" class="content_m" style="width: 960px; margin: 0px; padding: 0px; border: 0px;">
				</div>
				<div id="content_m_1395371859736" class="content_m" style=""></div>
				<div id="content_m_1405405238839" class="content_m" style=""></div>
			</div>
			
			<div id="table_m_1371794406459" class="table_m clearfix ui-droppable ui-sortable ih-0" style="border: 0px; margin: 0px; padding: 0px;">
				<div id="content_m_1406525883528" class="content_m" style="">
					<div id="user_scroll">
						<ul id="user_scroll_ul">					
						<li>1</li>
						<li>2</li>
						<li>3</li>
						<li>4</li>
						<li>5</li>
						<li>6</li>
						<li>7</li>
						<li>8</li>
						<li>9</li>
						<li>10</li>
						<li>11</li>
						<li>12</li>
						<li>13</li>
						<li>14</li>
						<li>15</li>
						<li>16</li>
						<li>17</li>
						<li>18</li>
						<li>19</li>
						<li>20</li>
						
						</ul>
						<div id="user_scroll_list" style="width: 3312px;">
						<c:forEach items="${userScoreList }" var="user" varStatus="state">
							<div class="scroll-t-1">
								<a href="blog/${user.nickNameId }" target="_blank">
										<img src="${pageContext.request.contextPath}/${user.face}" title="${user.nickName }" alt="${user.nickName }" style="width:71px; height:71px;border:1px solid #85735F;">
										<p>
											<span class="title">${user.nickName }</span>
										</p>
								</a>
							</div>
						</c:forEach>	
							<div class="scroll-t-1">
								<a href="http://liushouri521" target="_blank">
									<img src="topic/images/index/7001(2).jpg" title="心灵创可贴" alt="心灵创可贴">
										<p>
											<span class="title">心灵创可贴</span>
										</p>
								</a>
							</div>
							
							<div class="scroll-t-1"><a href="http://qizicool" target="_blank"><img src="topic/images/index/7002.jpg" title="羽子偕老" alt="羽子偕老"><p><span class="title">羽子偕老</span></p></a></div>
							<div class="scroll-t-1"><a href="http://piaoyutong" target="_blank"><img src="topic/images/index/71.jpg" title="飘雨桐" alt="飘雨桐"><p><span class="title">飘雨桐</span></p></a></div>
							<div class="scroll-t-1"><a href="http://youyou825" target="_blank"><img src="topic/images/index/you.jpg" title="幽忧" alt="幽忧"><p><span class="title">幽忧</span></p></a></div>
							<div class="scroll-t-1"><a href="http://amitou" target="_blank"><img src="topic/images/index/370.jpg" title="阿眯头" alt="阿眯头"><p><span class="title">阿眯头</span></p></a></div>
							<div class="scroll-t-1"><a href="http://hxls2011" target="_blank"><img src="topic/images/index/470.jpg" title="美宝" alt="美宝"><p><span class="title">美宝</span></p></a></div>
							<div class="scroll-t-1"><a href="http://15848668028" target="_blank"><img src="topic/images/index/570.jpg" title="幸运儿朵儿" alt="幸运儿朵儿"><p><span class="title">幸运儿朵儿</span></p></a></div>
							<div class="scroll-t-1"><a href="http://xiaomafaguang520" target="_blank"><img src="topic/images/index/647.jpg" title="小马发光" alt="小马发光"><p><span class="title">小马发光</span></p></a></div>
							<div class="scroll-t-1"><a href="http://timshengmingguoke" target="_blank"><img src="topic/images/index/970.jpg" title="TIM生命過客" alt="TIM生命過客"><p><span class="title">TIM生命過客</span></p></a></div>
							<div class="scroll-t-1"><a href="http://wujinguang114" target="_blank"><img src="topic/images/index/1270(2).jpg" title="湖光秋水" alt="湖光秋水"><p><span class="title">湖光秋水</span></p></a></div>
							<div class="scroll-t-1"><a href="http://622002794" target="_blank"><img src="topic/images/index/70(3).jpg" title="电影娱乐人" alt="电影娱乐人"><p><span class="title">电影娱乐人</span></p></a></div>
							<div class="scroll-t-1"><a href="http://tusijikayi" target="_blank"><img src="topic/images/index/1(42).jpg" title="兔斯基Kayi" alt="兔斯基Kayi"><p><span class="title">兔斯基Kayi</span></p></a></div>
							<div class="scroll-t-1"><a href="http://tangyibin885" target="_blank"><img src="topic/images/index/6322ffedd5007470348cc9d3d6641877%21big.jpg" title="群狼合作" alt="群狼合作"><p><span class="title">群狼合作</span></p></a></div>
						</div>
					</div>
				</div>
			</div>
		<div id="table_m_1421223694111" class="table_m clearfix ui-droppable ui-sortable ih-0" style="border: 0px; margin: 0px; padding: 0px;">
		
    	   
    	</div>
    </div>
    </div>
    <div id="layout_m_1489390164607" class="layout_m clearfix" style=""><div id="layout_t_1489390164607_1" class="layout_sub ui-droppable ui-sortable" style="width:500px;"></div><div id="layout_t_1489390164607_2" class="layout_sub ui-droppable ui-sortable" style="margin-left:10px; width:490px;"></div></div><script src="topic/files/bootstrap-tab.js"></script>
<script src="topic/files/base.js"></script>

<script type="text/javascript" src="js/timer.js"></script>
  <script type="text/javascript">
  $(document).ready(function(){
  	
  	$.ajax({
		cache: false,
		type: "POST",
		dataType: "json",
		data: {},
		url: "${host}/online",
		success: function(result) {
			if(result.status==200){
				$("#total").text('：'+result.data.total);
				$("#dayonline").text('：'+result.data.daytotal);
				$("#online").text('：'+result.data.online);
			}else{
				$("#total").text('：521');
				$("#dayonline").text('：1314');
				$("#online").text('：99999');
			}
		}
	});
	
	for(var i=0;i<13;i++){
		var date=$(".time"+i).text();
		$(".time"+i).text(diaplayTime(date));
	}
	});
  </script>

<script src="topic/files/new_contral.js"></script>
<script>
	inimarquee('banner');
	move_photo('girl_photo');
	move_photo('girl_photo');
	user_scroll('user_scroll');
	user_scroll('user_scroll');
	user_scroll('user_scroll');
	user_scroll('user_scroll');
</script>
<script>
	function writeTopic(){
		if ('${currentUser.nickName}'==null||'${currentUser.nickName}'=="") {
			$.alert("您还未登陆！");
		} else {
			window.location.href="topic/write?sectionId=11";
		}	
}
</script>

<script>
	function writeBlog(){
		if ('${currentUser.nickName}'==null||'${currentUser.nickName}'=="") {
			$.alert("您还未登陆！");
		} else {
			window.location.href="${host}/blog/manage/article/go";
		}	
}
</script>

<script>
	function writeAnswer(){
		if ('${currentUser.nickName}'==null||'${currentUser.nickName}'=="") {
			$.alert("您还未登陆！");
		} else {
			window.location.href="topic/section/11";
		}	
}
</script>
<script type="text/javascript">//<![CDATA[
ac_as_id = 73838;
ac_click_track_url = "";ac_format = 0;ac_mode = 1;
ac_width = 280;ac_height = 210;
//]]></script>


</div>

</body>
</html>