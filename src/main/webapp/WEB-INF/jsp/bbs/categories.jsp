<%--
  Created by IntelliJ IDEA.
  User: miki
  Date: 2020/9/6
  Time: 15:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>IT帮-资讯传播社区--精选板块</title>
    <meta name="keywords" content="HTML5 Template">
    <meta name="description" content="Forum - Responsive HTML5 Template">
    <meta name="author" content="Forum">
    <link href="${host}/shop/images/logo/favicon.ico" rel="SHORTCUT ICON" />
    <meta name="format-detection" content="telephone=no">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="${host}/bbs/css/style.css">

    <script src="${host}/js/jquery-1.11.1.js" type="text/javascript"></script>
    <style type="text/css">
        /**2020.09.06 控制头文件样式问题**/
        .header{
            height: 40px;
            line-height: 40px;
            background: #48525e;
        }
    </style>
</head>
<body>

<jsp:include page="./common/header.jsp"></jsp:include>

<main id="tt-pageContent">
    <div class="tt-custom-mobile-indent container">
        <div class="tt-categories-title">
            <div class="tt-title">板块列表</div>
            <div class="tt-search">
                <form class="search-wrapper">
                    <div class="search-form">
                        <input type="text" class="tt-search__input" placeholder="Search Categories">
                        <button class="tt-search__btn" type="submit">
                            <svg class="tt-icon">
                                <use xlink:href="#icon-search"></use>
                            </svg>
                        </button>
                        <button class="tt-search__close">
                            <svg class="tt-icon">
                                <use xlink:href="#icon-cancel"></use>
                            </svg>
                        </button>
                    </div>
                </form>
            </div>
        </div>
        <div class="tt-categories-list">
            <div class="row">

                <c:forEach var="section" items="${sectionList }" varStatus = "status">
                    <div class="col-md-6 col-lg-4">
                        <div class="tt-item">
                            <div class="tt-item-header">
                                <ul class="tt-list-badge">
                                	<!-- 2020.10.27 miki 设置板块主题颜色 -->
                                	<c:if test="${status.count >= 10 }">
                                		<li><a href="${host}/topic/section/${section.id}"><span class="tt-color${status.count} tt-badge">${section.name}</span></a></li>
					                </c:if>
					                <c:if test="${status.count < 10 }">
					                	<li><a href="${host}/topic/section/${section.id}"><span class="tt-color0${status.count} tt-badge">${section.name}</span></a></li>
					                </c:if>                                    
                                </ul>
                                <h6 class="tt-title"><a href="${host}/topic/section/${section.id}">帖子数 - ${fn:length(section.topicList)}</a></h6>
                            </div>
                            <div class="tt-item-layout">
                                <div class="innerwrapper">
                                        ${section.zone.description }
                                </div>
                                <div class="innerwrapper">
                                        <h6 class="tt-title">标签集</h6>
                                    <ul class="tt-list-badge">
                                        <li><a href="#"><span class="tt-badge">世界政治</span></a></li>
                                    <li><a href="#"><span class="tt-badge">人类主权</span></a></li>
                                    <li><a href="#"><span class="tt-badge">trump</span></a></li>
                                    <li><a href="#"><span class="tt-badge">climate change</span></a></li>
                                    <li><a href="#"><span class="tt-badge">国外政策</span></a></li>
                                    </ul>
                                </div>
                                <a href="#" class="tt-btn-icon">
                                    <i class="tt-icon"><svg><use xlink:href="#icon-favorite"></use></svg></i>
                                </a>
                            </div>
                        </div>
                    </div>
                </c:forEach>

                <div class="col-md-6 col-lg-4">
                    <div class="tt-item">
                        <div class="tt-item-header">
                            <ul class="tt-list-badge">
                                <li><a href="#"><span class="tt-color01 tt-badge">politics</span></a></li>
                            </ul>
                            <h6 class="tt-title"><a href="page-categories-single.html">Threads - 1,245</a></h6>
                        </div>
                        <div class="tt-item-layout">
                            <div class="innerwrapper">
                                Lets discuss about whats happening around the world politics.
                            </div>
                            <div class="innerwrapper">
                                <h6 class="tt-title">Similar TAGS</h6>
                                <ul class="tt-list-badge">
                                    <li><a href="#"><span class="tt-badge">世界政治</span></a></li>
                                    <li><a href="#"><span class="tt-badge">人类主权</span></a></li>
                                    <li><a href="#"><span class="tt-badge">trump</span></a></li>
                                    <li><a href="#"><span class="tt-badge">climate change</span></a></li>
                                    <li><a href="#"><span class="tt-badge">国外政策</span></a></li>
                                </ul>
                            </div>
                            <a href="#" class="tt-btn-icon">
                                <i class="tt-icon"><svg><use xlink:href="#icon-favorite"></use></svg></i>
                            </a>
                        </div>
                    </div>
                </div>
                <div class="col-md-6 col-lg-4">
                    <div class="tt-item">
                        <div class="tt-item-header">
                            <ul class="tt-list-badge">
                                <li><a href="#"><span class="tt-color02 tt-badge">video</span></a></li>
                            </ul>
                            <h6 class="tt-title"><a href="page-categories-single.html">Threads - 368</a></h6>
                        </div>
                        <div class="tt-item-layout">
                            <div class="tt-innerwrapper">
                                Lets discuss about whats happening around the world politics.
                            </div>
                            <div class="tt-innerwrapper">
                                <h6 class="tt-title">Similar TAGS</h6>
                                <ul class="tt-list-badge">
                                    <li><a href="#"><span class="tt-badge">movies</span></a></li>
                                    <li><a href="#"><span class="tt-badge">new movies</span></a></li>
                                    <li><a href="#"><span class="tt-badge">marvel movies</span></a></li>
                                    <li><a href="#"><span class="tt-badge">climate change</span></a></li>
                                    <li><a href="#"><span class="tt-badge">netflix</span></a></li>
                                    <li><a href="#"><span class="tt-badge">prime</span></a></li>
                                </ul>
                            </div>
                            <div class="tt-innerwrapper">
                                <a href="#" class="tt-btn-icon">
                                    <i class="tt-icon"><svg><use xlink:href="#icon-favorite"></use></svg></i>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-6 col-lg-4">
                    <div class="tt-item">
                        <div class="tt-item-header">
                            <ul class="tt-list-badge">
                                <li><a href="#"><span class="tt-color03 tt-badge">exchange</span></a></li>
                            </ul>
                            <h6 class="tt-title"><a href="page-categories-single.html">Threads - 381</a></h6>
                        </div>
                        <div class="tt-item-layout">
                            <div class="tt-innerwrapper">
                                Lets discuss about whats happening around the world politics.
                            </div>
                            <div class="tt-innerwrapper">
                                <h6 class="tt-title">Similar TAGS</h6>
                                <ul class="tt-list-badge">
                                    <li><a href="#"><span class="tt-badge">world politics</span></a></li>
                                    <li><a href="#"><span class="tt-badge">human rights</span></a></li>
                                    <li><a href="#"><span class="tt-badge">trump</span></a></li>
                                    <li><a href="#"><span class="tt-badge">climate change</span></a></li>
                                    <li><a href="#"><span class="tt-badge">foreign policy</span></a></li>
                                </ul>
                            </div>
                            <div class="tt-innerwrapper">
                                <a href="#" class="tt-btn-icon">
                                    <i class="tt-icon"><svg><use xlink:href="#icon-favorite"></use></svg></i>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-6 col-lg-4">
                    <div class="tt-item">
                        <div class="tt-item-header">
                            <ul class="tt-list-badge">
                                <li><a href="#"><span class="tt-color04 tt-badge">pets</span></a></li>
                            </ul>
                            <h6 class="tt-title"><a href="page-categories-single.html">Threads - 98</a></h6>
                        </div>
                        <div class="tt-item-layout">
                            <div class="tt-innerwrapper">
                                Lets discuss about whats happening around the world politics.
                            </div>
                            <div class="tt-innerwrapper">
                                <h6 class="tt-title">Similar TAGS</h6>
                                <ul class="tt-list-badge">
                                    <li><a href="#"><span class="tt-badge">world politics</span></a></li>
                                    <li><a href="#"><span class="tt-badge">human rights</span></a></li>
                                    <li><a href="#"><span class="tt-badge">trump</span></a></li>
                                    <li><a href="#"><span class="tt-badge">climate change</span></a></li>
                                    <li><a href="#"><span class="tt-badge">foreign policy</span></a></li>
                                </ul>
                            </div>
                            <div class="tt-innerwrapper">
                                <a href="#" class="tt-btn-icon">
                                    <i class="tt-icon"><svg><use xlink:href="#icon-favorite"></use></svg></i>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-6 col-lg-4">
                    <div class="tt-item">
                        <div class="tt-item-header">
                            <ul class="tt-list-badge">
                                <li><a href="#"><span class="tt-color05 tt-badge">music</span></a></li>
                            </ul>
                            <h6 class="tt-title"><a href="page-categories-single.html">Threads - 28</a></h6>
                        </div>
                        <div class="tt-item-layout">
                            <div class="tt-innerwrapper">
                                Lets discuss about whats happening around the world politics.
                            </div>
                            <div class="tt-innerwrapper">
                                <h6 class="tt-title">Similar TAGS</h6>
                                <ul class="tt-list-badge">
                                    <li><a href="#"><span class="tt-badge">world politics</span></a></li>
                                    <li><a href="#"><span class="tt-badge">human rights</span></a></li>
                                    <li><a href="#"><span class="tt-badge">trump</span></a></li>
                                    <li><a href="#"><span class="tt-badge">climate change</span></a></li>
                                    <li><a href="#"><span class="tt-badge">foreign policy</span></a></li>
                                </ul>
                            </div>
                            <div class="tt-innerwrapper">
                                <a href="#" class="tt-btn-icon">
                                    <i class="tt-icon"><svg><use xlink:href="#icon-favorite"></use></svg></i>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-6 col-lg-4">
                    <div class="tt-item">
                        <div class="tt-item-header">
                            <ul class="tt-list-badge">
                                <li><a href="#"><span class="tt-color06 tt-badge">movies</span></a></li>
                            </ul>
                            <h6 class="tt-title"><a href="page-categories-single.html">Threads - 74</a></h6>
                        </div>
                        <div class="tt-item-layout">
                            <div class="tt-innerwrapper">
                                Lets discuss about whats happening around the world politics.
                            </div>
                            <div class="tt-innerwrapper">
                                <h6 class="tt-title">Similar TAGS</h6>
                                <ul class="tt-list-badge">
                                    <li><a href="#"><span class="tt-badge">world politics</span></a></li>
                                    <li><a href="#"><span class="tt-badge">human rights</span></a></li>
                                    <li><a href="#"><span class="tt-badge">trump</span></a></li>
                                    <li><a href="#"><span class="tt-badge">climate change</span></a></li>
                                    <li><a href="#"><span class="tt-badge">foreign policy</span></a></li>
                                </ul>
                            </div>
                            <div class="tt-innerwrapper">
                                <a href="#" class="tt-btn-icon">
                                    <i class="tt-icon"><svg><use xlink:href="#icon-favorite"></use></svg></i>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-6 col-lg-4">
                    <div class="tt-item">
                        <div class="tt-item-header">
                            <ul class="tt-list-badge">
                                <li><a href="#"><span class="tt-color15 tt-badge">nature</span></a></li>
                            </ul>
                            <h6 class="tt-title"><a href="page-categories-single.html">Threads - 1,245</a></h6>
                        </div>
                        <div class="tt-item-layout">
                            <div class="tt-innerwrapper">
                                Lets discuss about whats happening around the world politics.
                            </div>
                            <div class="tt-innerwrapper">
                                <h6 class="tt-title">Similar TAGS</h6>
                                <ul class="tt-list-badge">
                                    <li><a href="#"><span class="tt-badge">world politics</span></a></li>
                                    <li><a href="#"><span class="tt-badge">human rights</span></a></li>
                                    <li><a href="#"><span class="tt-badge">trump</span></a></li>
                                    <li><a href="#"><span class="tt-badge">climate change</span></a></li>
                                    <li><a href="#"><span class="tt-badge">foreign policy</span></a></li>
                                </ul>
                            </div>
                            <div class="tt-innerwrapper">
                                <a href="#" class="tt-btn-icon">
                                    <i class="tt-icon"><svg><use xlink:href="#icon-favorite"></use></svg></i>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-6 col-lg-4">
                    <div class="tt-item">
                        <div class="tt-item-header">
                            <ul class="tt-list-badge">
                                <li><a href="#"><span class="tt-color07 tt-badge">video games</span></a></li>
                            </ul>
                            <h6 class="tt-title"><a href="page-categories-single.html">Threads - 1,245</a></h6>
                        </div>
                        <div class="tt-item-layout">
                            <div class="tt-innerwrapper">
                                Lets discuss about whats happening around the world politics.
                            </div>
                            <div class="tt-innerwrapper">
                                <h6 class="tt-title">Similar TAGS</h6>
                                <ul class="tt-list-badge">
                                    <li><a href="#"><span class="tt-badge">world politics</span></a></li>
                                    <li><a href="#"><span class="tt-badge">human rights</span></a></li>
                                    <li><a href="#"><span class="tt-badge">trump</span></a></li>
                                    <li><a href="#"><span class="tt-badge">climate change</span></a></li>
                                    <li><a href="#"><span class="tt-badge">foreign policy</span></a></li>
                                </ul>
                            </div>
                            <div class="tt-innerwrapper">
                                <a href="#" class="tt-btn-icon">
                                    <i class="tt-icon"><svg><use xlink:href="#icon-favorite"></use></svg></i>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-6 col-lg-4">
                    <div class="tt-item">
                        <div class="tt-item-header">
                            <ul class="tt-list-badge">
                                <li><a href="#"><span class="tt-color08 tt-badge">youtube</span></a></li>
                            </ul>
                            <h6 class="tt-title"><a href="page-categories-single.html">Threads - 1,245</a></h6>
                        </div>
                        <div class="tt-item-layout">
                            <div class="tt-innerwrapper">
                                Lets discuss about whats happening around the world politics.
                            </div>
                            <div class="tt-innerwrapper">
                                <h6 class="tt-title">Similar TAGS</h6>
                                <ul class="tt-list-badge">
                                    <li><a href="#"><span class="tt-badge">world politics</span></a></li>
                                    <li><a href="#"><span class="tt-badge">human rights</span></a></li>
                                    <li><a href="#"><span class="tt-badge">trump</span></a></li>
                                    <li><a href="#"><span class="tt-badge">climate change</span></a></li>
                                    <li><a href="#"><span class="tt-badge">foreign policy</span></a></li>
                                </ul>
                            </div>
                            <div class="tt-innerwrapper">
                                <a href="#" class="tt-btn-icon">
                                    <i class="tt-icon"><svg><use xlink:href="#icon-favorite"></use></svg></i>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-6 col-lg-4">
                    <div class="tt-item">
                        <div class="tt-item-header">
                            <ul class="tt-list-badge">
                                <li><a href="#"><span class="tt-color09 tt-badge">social</span></a></li>
                            </ul>
                            <h6 class="tt-title"><a href="page-categories-single.html">Threads - 1,245</a></h6>
                        </div>
                        <div class="tt-item-layout">
                            <div class="tt-innerwrapper">
                                Lets discuss about whats happening around the world politics.
                            </div>
                            <div class="tt-innerwrapper">
                                <h6 class="tt-title">Similar TAGS</h6>
                                <ul class="tt-list-badge">
                                    <li><a href="#"><span class="tt-badge">world politics</span></a></li>
                                    <li><a href="#"><span class="tt-badge">human rights</span></a></li>
                                    <li><a href="#"><span class="tt-badge">trump</span></a></li>
                                    <li><a href="#"><span class="tt-badge">climate change</span></a></li>
                                    <li><a href="#"><span class="tt-badge">foreign policy</span></a></li>
                                </ul>
                            </div>
                            <div class="tt-innerwrapper">
                                <a href="#" class="tt-btn-icon">
                                    <i class="tt-icon"><svg><use xlink:href="#icon-favorite"></use></svg></i>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-6 col-lg-4">
                    <div class="tt-item">
                        <div class="tt-item-header">
                            <ul class="tt-list-badge">
                                <li><a href="#"><span class="tt-color10 tt-badge">science</span></a></li>
                            </ul>
                            <h6 class="tt-title"><a href="page-categories-single.html">Threads - 1,245</a></h6>
                        </div>
                        <div class="tt-item-layout">
                            <div class="tt-innerwrapper">
                                Lets discuss about whats happening around the world politics.
                            </div>
                            <div class="tt-innerwrapper">
                                <h6 class="tt-title">Similar TAGS</h6>
                                <ul class="tt-list-badge">
                                    <li><a href="#"><span class="tt-badge">world politics</span></a></li>
                                    <li><a href="#"><span class="tt-badge">human rights</span></a></li>
                                    <li><a href="#"><span class="tt-badge">trump</span></a></li>
                                    <li><a href="#"><span class="tt-badge">climate change</span></a></li>
                                    <li><a href="#"><span class="tt-badge">foreign policy</span></a></li>
                                </ul>
                            </div>
                            <div class="tt-innerwrapper">
                                <a href="#" class="tt-btn-icon">
                                    <i class="tt-icon"><svg><use xlink:href="#icon-favorite"></use></svg></i>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-6 col-lg-4">
                    <div class="tt-item">
                        <div class="tt-item-header">
                            <ul class="tt-list-badge">
                                <li><a href="#"><span class="tt-color11 tt-badge">entertainment</span></a></li>
                            </ul>
                            <h6 class="tt-title"><a href="page-categories-single.html">Threads - 1,245</a></h6>
                        </div>
                        <div class="tt-item-layout">
                            <div class="tt-innerwrapper">
                                Lets discuss about whats happening around the world politics.
                            </div>
                            <div class="tt-innerwrapper">
                                <h6 class="tt-title">Similar TAGS</h6>
                                <ul class="tt-list-badge">
                                    <li><a href="#"><span class="tt-badge">world politics</span></a></li>
                                    <li><a href="#"><span class="tt-badge">human rights</span></a></li>
                                    <li><a href="#"><span class="tt-badge">trump</span></a></li>
                                    <li><a href="#"><span class="tt-badge">climate change</span></a></li>
                                    <li><a href="#"><span class="tt-badge">foreign policy</span></a></li>
                                </ul>
                            </div>
                            <div class="tt-innerwrapper">
                                <a href="#" class="tt-btn-icon">
                                    <i class="tt-icon"><svg><use xlink:href="#icon-favorite"></use></svg></i>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-6 col-lg-4">
                    <div class="tt-item">
                        <div class="tt-item-header">
                            <ul class="tt-list-badge">
                                <li><a href="#"><span class="tt-color04 tt-badge">pets</span></a></li>
                            </ul>
                            <h6 class="tt-title"><a href="page-categories-single.html">Threads - 1,245</a></h6>
                        </div>
                        <div class="tt-item-layout">
                            <div class="tt-innerwrapper">
                                Lets discuss about whats happening around the world politics.
                            </div>
                            <div class="tt-innerwrapper">
                                <h6 class="tt-title">Similar TAGS</h6>
                                <ul class="tt-list-badge">
                                    <li><a href="#"><span class="tt-badge">world politics</span></a></li>
                                    <li><a href="#"><span class="tt-badge">human rights</span></a></li>
                                    <li><a href="#"><span class="tt-badge">trump</span></a></li>
                                    <li><a href="#"><span class="tt-badge">climate change</span></a></li>
                                    <li><a href="#"><span class="tt-badge">foreign policy</span></a></li>
                                </ul>
                            </div>
                            <div class="tt-innerwrapper">
                                <a href="#" class="tt-btn-icon">
                                    <i class="tt-icon"><svg><use xlink:href="#icon-favorite"></use></svg></i>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-6 col-lg-4">
                    <div class="tt-item">
                        <div class="tt-item-header">
                            <ul class="tt-list-badge">
                                <li><a href="#"><span class="tt-color05 tt-badge">music</span></a></li>
                            </ul>
                            <h6 class="tt-title"><a href="page-categories-single.html">Threads - 1,245</a></h6>
                        </div>
                        <div class="tt-item-layout">
                            <div class="tt-innerwrapper">
                                Lets discuss about whats happening around the world politics.
                            </div>
                            <div class="tt-innerwrapper">
                                <h6 class="tt-title">Similar TAGS</h6>
                                <ul class="tt-list-badge">
                                    <li><a href="#"><span class="tt-badge">world politics</span></a></li>
                                    <li><a href="#"><span class="tt-badge">human rights</span></a></li>
                                    <li><a href="#"><span class="tt-badge">trump</span></a></li>
                                    <li><a href="#"><span class="tt-badge">climate change</span></a></li>
                                    <li><a href="#"><span class="tt-badge">foreign policy</span></a></li>
                                </ul>
                            </div>
                            <div class="tt-innerwrapper">
                                <a href="#" class="tt-btn-icon">
                                    <i class="tt-icon"><svg><use xlink:href="#icon-favorite"></use></svg></i>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-6 col-lg-4">
                    <div class="tt-item">
                        <div class="tt-item-header">
                            <ul class="tt-list-badge">
                                <li><a href="#"><span class="tt-color06 tt-badge">movies</span></a></li>
                            </ul>
                            <h6 class="tt-title"><a href="page-categories-single.html">Threads - 1,245</a></h6>
                        </div>
                        <div class="tt-item-layout">
                            <div class="tt-innerwrapper">
                                Lets discuss about whats happening around the world politics.
                            </div>
                            <div class="tt-innerwrapper">
                                <h6 class="tt-title">Similar TAGS</h6>
                                <ul class="tt-list-badge">
                                    <li><a href="#"><span class="tt-badge">world politics</span></a></li>
                                    <li><a href="#"><span class="tt-badge">human rights</span></a></li>
                                    <li><a href="#"><span class="tt-badge">trump</span></a></li>
                                    <li><a href="#"><span class="tt-badge">climate change</span></a></li>
                                    <li><a href="#"><span class="tt-badge">foreign policy</span></a></li>
                                </ul>
                            </div>
                            <div class="tt-innerwrapper">
                                <a href="#" class="tt-btn-icon">
                                    <i class="tt-icon"><svg><use xlink:href="#icon-favorite"></use></svg></i>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-12">
                    <div class="tt-row-btn">
                        <button type="button" class="btn-icon js-topiclist-showmore">
                            <svg class="tt-icon">
                                <use xlink:href="#icon-load_lore_icon"></use>
                            </svg>
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</main>
<div id="js-popup-settings" class="tt-popup-settings">
    <div class="tt-btn-col-close">
        <a href="#">
			<span class="tt-icon-title">
				<svg>
					<use xlink:href="#icon-settings_fill"></use>
				</svg>
			</span>
            <span class="tt-icon-text">
				Settings
			</span>
            <span class="tt-icon-close">
				<svg>
					<use xlink:href="#icon-cancel"></use>
				</svg>
			</span>
        </a>
    </div>
    <form class="form-default">
        <div class="tt-form-upload">
            <div class="row no-gutter">
                <div class="col-auto">
                    <div class="tt-avatar">
                        <svg>
                            <use xlink:href="#icon-ava-d"></use>
                        </svg>
                    </div>
                </div>
                <div class="col-auto ml-auto">
                    <a href="#" class="btn btn-primary">Upload Picture</a>
                </div>
            </div>
        </div>
        <div class="form-group">
            <label for="settingsUserName">Username</label>
            <input type="text" name="name" class="form-control" id="settingsUserName" placeholder="azyrusmax">
        </div>
        <div class="form-group">
            <label for="settingsUserEmail">Email</label>
            <input type="text" name="name" class="form-control" id="settingsUserEmail" placeholder="Sample@sample.com">
        </div>
        <div class="form-group">
            <label for="settingsUserPassword">Password</label>
            <input type="password" name="name" class="form-control" id="settingsUserPassword" placeholder="************">
        </div>
        <div class="form-group">
            <label for="settingsUserLocation">Location</label>
            <input type="text" name="name" class="form-control" id="settingsUserLocation" placeholder="Slovakia">
        </div>
        <div class="form-group">
            <label for="settingsUserWebsite">Website</label>
            <input type="text" name="name" class="form-control" id="settingsUserWebsite" placeholder="Sample.com">
        </div>
        <div class="form-group">
            <label for="settingsUserAbout">About</label>
            <textarea name="" placeholder="Few words about you" class="form-control" id="settingsUserAbout"></textarea>
        </div>
        <div class="form-group">
            <label for="settingsUserAbout">Notify me via Email</label>
            <div class="checkbox-group">
                <input type="checkbox" id="settingsCheckBox01" name="checkbox">
                <label for="settingsCheckBox01">
                    <span class="check"></span>
                    <span class="box"></span>
                    <span class="tt-text">When someone replies to my thread</span>
                </label>
            </div>
            <div class="checkbox-group">
                <input type="checkbox" id="settingsCheckBox02" name="checkbox">
                <label for="settingsCheckBox02">
                    <span class="check"></span>
                    <span class="box"></span>
                    <span class="tt-text">When someone likes my thread or reply</span>
                </label>
            </div>
            <div class="checkbox-group">
                <input type="checkbox" id="settingsCheckBox03" name="checkbox">
                <label for="settingsCheckBox03">
                    <span class="check"></span>
                    <span class="box"></span>
                    <span class="tt-text">When someone mentions me</span>
                </label>
            </div>
        </div>
        <div class="form-group">
            <a href="#" class="btn btn-secondary">Save</a>
        </div>
    </form>
</div>
<a href="${host}/topic/write?sectionId=${empty section.id ? 21 : section.id }" class="tt-btn-create-topic">
    <span class="tt-icon">
        <svg>
          <use xlink:href="#icon-create_new"></use>
        </svg>
    </span>
</a>

<div class="modal fade" id="modalAdvancedSearch" tabindex="-1" role="dialog" aria-label="myModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-sm">
        <div class="modal-content">
            <div class="tt-modal-advancedSearch">
                <div class="tt-modal-title">
                    <i class="pt-icon">
                        <svg>
                            <use xlink:href="#icon-advanced_search"></use>
                        </svg>
                    </i>
                    Advanced Search
                    <a class="pt-close-modal" href="#" data-dismiss="modal">
                        <svg class="icon">
                            <use xlink:href="#icon-cancel"></use>
                        </svg>
                    </a>
                </div>
                <form class="form-default">
                    <div class="form-group">
                        <i class="pt-customInputIcon">
                            <svg class="tt-icon">
                                <use xlink:href="#icon-search"></use>
                            </svg>
                        </i>
                        <input type="text" name="name" class="form-control pt-customInputSearch" id="searchForum" placeholder="Search all forums">
                    </div>
                    <div class="form-group">
                        <label for="searchName">Posted by</label>
                        <input type="text" name="name" class="form-control" id="searchName" placeholder="Username">
                    </div>
                    <div class="form-group">
                        <label for="searchCategory">In Category</label>
                        <input type="text" name="name" class="form-control" id="searchCategory" placeholder="Add Category">
                    </div>
                    <div class="checkbox-group">
                        <input type="checkbox" id="searcCheckBox01" name="checkbox">
                        <label for="searcCheckBox01">
                            <span class="check"></span>
                            <span class="box"></span>
                            <span class="tt-text">Include all tags</span>
                        </label>
                    </div>
                    <div class="form-group">
                        <label>Only return topics/posts that...</label>
                        <div class="checkbox-group">
                            <input type="checkbox" id="searcCheckBox02" name="checkbox">
                            <label for="searcCheckBox02">
                                <span class="check"></span>
                                <span class="box"></span>
                                <span class="tt-text">I liked</span>
                            </label>
                        </div>
                        <div class="checkbox-group">
                            <input type="checkbox" id="searcCheckBox03" name="checkbox">
                            <label for="searcCheckBox03">
                                <span class="check"></span>
                                <span class="box"></span>
                                <span class="tt-text">are in my messages</span>
                            </label>
                        </div>
                        <div class="checkbox-group">
                            <input type="checkbox" id="searcCheckBox04" name="checkbox">
                            <label for="searcCheckBox04">
                                <span class="check"></span>
                                <span class="box"></span>
                                <span class="tt-text">I’ve read</span>
                            </label>
                        </div>
                    </div>
                    <div class="form-group">
                        <select class="form-control" id="searchTop">
                            <option>any</option>
                            <option>value 01</option>
                            <option>value 02</option>
                            <option>value 03</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="searchaTopics">Where topics</label>
                        <select class="form-control" id="searchaTopics">
                            <option>any</option>
                            <option>value 01</option>
                            <option>value 02</option>
                            <option>value 03</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="searchAdvTime">Posted</label>
                        <div class="row">
                            <div class="col-6">
                                <select class="form-control">
                                    <option>any</option>
                                    <option>value 01</option>
                                    <option>value 02</option>
                                    <option>value 03</option>
                                </select>
                            </div>
                            <div class="col-6">
                                <input type="text" name="name" class="form-control" id="searchAdvTime" placeholder="dd-mm-yyyy">
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="minPostCount">Minimum Post Count</label>
                        <select class="form-control" id="minPostCount">
                            <option>1</option>
                            <option>2</option>
                            <option>3</option>
                            <option>4</option>
                            <option>5</option>
                            <option>6</option>
                            <option>7</option>
                            <option>8</option>
                            <option>9</option>
                            <option selected>10</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <a href="#" class="btn btn-secondary btn-block">Search</a>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<script src="${host}/bbs/js/bundle.js"></script>
<svg width="0" height="0" class="hidden">
    <symbol aria-hidden="true" data-prefix="fab" data-icon="facebook-f" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 264 512" id="facebook-f-brands">
        <path fill="currentColor" d="M215.8 85H264V3.6C255.7 2.5 227.1 0 193.8 0 124.3 0 76.7 42.4 76.7 120.3V192H0v91h76.7v229h94V283h73.6l11.7-91h-85.3v-62.7c0-26.3 7.3-44.3 45.1-44.3z"></path>
    </symbol>
    <symbol aria-hidden="true" data-prefix="fab" data-icon="twitter" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" id="twitter-brands">
        <path fill="currentColor" d="M459.37 151.716c.325 4.548.325 9.097.325 13.645 0 138.72-105.583 298.558-298.558 298.558-59.452 0-114.68-17.219-161.137-47.106 8.447.974 16.568 1.299 25.34 1.299 49.055 0 94.213-16.568 130.274-44.832-46.132-.975-84.792-31.188-98.112-72.772 6.498.974 12.995 1.624 19.818 1.624 9.421 0 18.843-1.3 27.614-3.573-48.081-9.747-84.143-51.98-84.143-102.985v-1.299c13.969 7.797 30.214 12.67 47.431 13.319-28.264-18.843-46.781-51.005-46.781-87.391 0-19.492 5.197-37.36 14.294-52.954 51.655 63.675 129.3 105.258 216.365 109.807-1.624-7.797-2.599-15.918-2.599-24.04 0-57.828 46.782-104.934 104.934-104.934 30.213 0 57.502 12.67 76.67 33.137 23.715-4.548 46.456-13.32 66.599-25.34-7.798 24.366-24.366 44.833-46.132 57.827 21.117-2.273 41.584-8.122 60.426-16.243-14.292 20.791-32.161 39.308-52.628 54.253z"></path>
    </symbol>
    <symbol xmlns="http://www.w3.org/2000/svg" viewBox="0 0 117 117" id="icon-advanced_search"><path d="M54 108C24.22 108 0 83.78 0 54S24.22 0 54 0s54 24.22 54 54-24.22 54-54 54zm0-99C29.19 9 9 29.19 9 54s20.19 45 45 45 45-20.19 45-45S78.81 9 54 9z"></path><path d="M112.5 117c-1.15 0-2.3-.44-3.18-1.32l-23.5-23.5a4.49 4.49 0 0 1 0-6.36 4.49 4.49 0 0 1 6.36 0l23.5 23.5a4.49 4.49 0 0 1 0 6.36c-.88.88-2.03 1.32-3.18 1.32zm-40-72h-37c-2.49 0-4.5-2.01-4.5-4.5s2.01-4.5 4.5-4.5h37c2.49 0 4.5 2.01 4.5 4.5S74.99 45 72.5 45zm-14 27h-23c-2.49 0-4.5-2.01-4.5-4.5s2.01-4.5 4.5-4.5h23c2.49 0 4.5 2.01 4.5 4.5S60.99 72 58.5 72z"></path></symbol><symbol xmlns="http://www.w3.org/2000/svg" viewBox="0 0 81 45" id="icon-arrow_below"><path d="M40.5 45c-1.15 0-2.3-.44-3.18-1.32l-36-36a4.49 4.49 0 0 1 0-6.36 4.49 4.49 0 0 1 6.36 0L40.5 34.13 73.32 1.32a4.49 4.49 0 0 1 6.36 0 4.49 4.49 0 0 1 0 6.36l-36 36c-.88.88-2.03 1.32-3.18 1.32z" fill="#666f74"></path></symbol><symbol xmlns="http://www.w3.org/2000/svg" viewBox="0 0 45 81" id="icon-arrow_left"><path d="M40.5 81c-1.15 0-2.3-.44-3.18-1.32l-36-36a4.49 4.49 0 0 1 0-6.36l36-36a4.49 4.49 0 0 1 6.36 0 4.49 4.49 0 0 1 0 6.36L10.86 40.5l32.82 32.82a4.49 4.49 0 0 1 0 6.36c-.88.88-2.03 1.32-3.18 1.32z" fill="#666f74"></path></symbol><symbol xmlns="http://www.w3.org/2000/svg" viewBox="0 0 144 144" id="icon-ava-a"><circle fill="#D81159" cx="72" cy="72" r="72"></circle><path fill="#FFF" d="M90.854 98.959l-5.68-13.199h-27.44l-5.68 13.199h-10.4l25.52-56.399h8.4l25.521 56.399H90.854zM61.094 77.76h20.64l-10.32-24-10.32 24z"></path></symbol><symbol xmlns="http://www.w3.org/2000/svg" viewBox="0 0 144 144" id="icon-ava-b"><circle fill="#218380" cx="72" cy="72" r="72"></circle><path fill="#FFF" d="M92.375 74.799c1.785 2.4 2.68 5.334 2.68 8.801 0 4.8-1.721 8.561-5.16 11.279-3.439 2.721-8.174 4.08-14.2 4.08h-25.6V42.56h24.8c5.865 0 10.467 1.293 13.799 3.88 3.334 2.587 5 6.2 5 10.84 0 2.988-.787 5.574-2.359 7.76-1.574 2.188-3.748 3.788-6.52 4.8 3.251.907 5.771 2.559 7.56 4.959zm-32.201-8.48h13.041c7.092 0 10.639-2.64 10.639-7.92 0-2.666-.879-4.64-2.639-5.92s-4.428-1.92-8-1.92H60.174v15.76zm22.56 22.64c1.705-1.332 2.561-3.412 2.561-6.24 0-2.826-.869-4.932-2.602-6.319-1.732-1.386-4.439-2.08-8.119-2.08h-14.4v16.64h14.4c3.733-.001 6.453-.667 8.16-2.001z"></path></symbol><symbol xmlns="http://www.w3.org/2000/svg" viewBox="0 0 144 144" id="icon-ava-c"><circle fill="#679436" cx="72" cy="72" r="72"></circle><path fill="#FFF" d="M61.375 96.119c-4.134-2.372-7.308-5.746-9.52-10.119-2.214-4.373-3.32-9.467-3.32-15.281 0-5.812 1.106-10.892 3.32-15.239 2.212-4.346 5.386-7.706 9.52-10.08 4.132-2.373 8.972-3.56 14.52-3.56 3.785 0 7.359.587 10.721 1.76 3.359 1.174 6.186 2.827 8.479 4.96l-3.439 7.52c-2.561-2.026-5.094-3.506-7.6-4.44-2.508-.933-5.174-1.4-8-1.4-5.44 0-9.64 1.76-12.6 5.28-2.96 3.52-4.44 8.587-4.44 15.199 0 6.668 1.48 11.761 4.44 15.281 2.96 3.52 7.16 5.279 12.6 5.279 2.826 0 5.492-.467 8-1.4 2.506-.932 5.039-2.412 7.6-4.439l3.439 7.52c-2.293 2.135-5.119 3.788-8.479 4.961-3.361 1.172-6.936 1.76-10.721 1.76-5.548-.001-10.388-1.188-14.52-3.562z"></path></symbol><symbol xmlns="http://www.w3.org/2000/svg" viewBox="0 0 144 144" id="icon-ava-d"><circle fill="#73D2DE" cx="72" cy="72" r="72"></circle><path fill="#FFF" d="M49.254 42.56h20.8c9.227 0 16.387 2.467 21.48 7.4 5.092 4.934 7.64 11.854 7.64 20.759 0 8.908-2.548 15.841-7.64 20.801-5.094 4.96-12.254 7.439-21.48 7.439h-20.8V42.56zm20.16 48c12.96 0 19.439-6.612 19.439-19.841 0-13.172-6.479-19.759-19.439-19.759h-9.84v39.6h9.84z"></path></symbol><symbol xmlns="http://www.w3.org/2000/svg" viewBox="0 0 144 144" id="icon-ava-e"><circle fill="#ABD1B5" cx="72" cy="72" r="72"></circle><path fill="#FFF" d="M53.854 98.959V42.56h37.76v8.16h-27.68v15.52h26.08v8.08h-26.08v16.479h27.68v8.16h-37.76z"></path></symbol><symbol xmlns="http://www.w3.org/2000/svg" viewBox="0 0 144 144" id="icon-ava-f"><circle fill="#9067C6" cx="72" cy="72" r="72"></circle><path fill="#FFF" d="M54.774 98.959V42.56h36.96v8.24h-26.8v15.36h25.2v8.24h-25.2v24.56h-10.16z"></path></symbol><symbol xmlns="http://www.w3.org/2000/svg" viewBox="0 0 144 144" id="icon-ava-g"><circle fill="#CAC4CE" cx="72" cy="72" r="72"></circle><path fill="#FFF" d="M95.135 68.479v27.04c-2.561 1.279-5.668 2.293-9.32 3.04a55.641 55.641 0 0 1-11.16 1.12c-5.813 0-10.854-1.16-15.12-3.48-4.268-2.32-7.534-5.652-9.8-10-2.268-4.346-3.4-9.506-3.4-15.48 0-5.919 1.133-11.052 3.4-15.399 2.266-4.346 5.492-7.68 9.68-10 4.187-2.32 9.106-3.48 14.76-3.48 3.946 0 7.652.574 11.12 1.72 3.466 1.147 6.346 2.788 8.64 4.92l-3.439 7.44c-2.614-2.026-5.188-3.48-7.721-4.36s-5.319-1.32-8.36-1.32c-5.813 0-10.199 1.72-13.159 5.16-2.96 3.44-4.44 8.547-4.44 15.319 0 13.868 6.08 20.801 18.24 20.801 3.626 0 7.253-.506 10.88-1.52V75.84h-12.16v-7.36h21.359z"></path></symbol><symbol xmlns="http://www.w3.org/2000/svg" viewBox="0 0 144 144" id="icon-ava-h"><circle fill="#86BA90" cx="72" cy="72" r="72"></circle><path fill="#FFF" d="M85.814 42.56h10.08v56.399h-10.08v-24.48h-28.88v24.479h-10.16V42.56h10.16v23.6h28.88v-23.6z"></path></symbol><symbol xmlns="http://www.w3.org/2000/svg" viewBox="0 0 144 144" id="icon-ava-i"><circle fill="#DFA06E" cx="72" cy="72" r="72"></circle><path fill="#FFF" d="M66.174 98.959V42.56h10.32v56.399h-10.32z"></path></symbol><symbol xmlns="http://www.w3.org/2000/svg" viewBox="0 0 144 144" id="icon-ava-j"><circle fill="#FC814A" cx="72" cy="72" r="72"></circle><path fill="#FFF" d="M56.535 91.359l5.6-.4c4.746-.319 7.12-2.932 7.12-7.84V42.56h10.319v40.479c0 5.014-1.319 8.895-3.959 11.641-2.641 2.747-6.574 4.279-11.801 4.6l-6.56.4-.719-8.321z"></path></symbol><symbol xmlns="http://www.w3.org/2000/svg" viewBox="0 0 144 144" id="icon-ava-k"><circle fill="#564256" cx="72" cy="72" r="72"></circle><path fill="#FFF" d="M100.055 98.959H87.494l-26.16-26.24v26.24h-10.32V42.56h10.32v25.2l25.12-25.2h12.32l-27.28 27.12 28.561 29.279z"></path></symbol><symbol xmlns="http://www.w3.org/2000/svg" viewBox="0 0 144 144" id="icon-ava-l"><circle fill="#2E6171" cx="72" cy="72" r="72"></circle><path fill="#FFF" d="M55.214 98.959V42.56h10.32v47.92h26.319v8.479H55.214z"></path></symbol><symbol xmlns="http://www.w3.org/2000/svg" viewBox="0 0 144 144" id="icon-ava-m"><circle fill="#D4AFCD" cx="72" cy="72" r="72"></circle><path fill="#FFF" d="M90.734 42.56h8.08v56.399h-9.12V61.68l-14.88 28.16h-6.88l-14.96-27.76.08 36.879h-9.12V42.56h8.16l19.36 36.88 19.28-36.88z"></path></symbol><symbol xmlns="http://www.w3.org/2000/svg" viewBox="0 0 144 144" id="icon-ava-n"><circle fill="#7F7EFF" cx="72" cy="72" r="72"></circle><path fill="#FFF" d="M85.454 42.56h9.68v56.399h-7.76L57.134 59.6v39.359h-9.6V42.56h7.68l30.24 39.28V42.56z"></path></symbol><symbol xmlns="http://www.w3.org/2000/svg" viewBox="0 0 144 144" id="icon-ava-o"><circle fill="#CC8B8C" cx="72" cy="72" r="72"></circle><path fill="#FFF" d="M57.094 96.16c-4.027-2.348-7.134-5.707-9.32-10.08-2.188-4.373-3.28-9.493-3.28-15.361 0-5.866 1.08-10.972 3.24-15.319 2.16-4.346 5.266-7.692 9.32-10.04 4.053-2.346 8.826-3.52 14.321-3.52 5.492 0 10.252 1.174 14.279 3.52 4.025 2.348 7.119 5.694 9.279 10.04 2.16 4.348 3.24 9.454 3.24 15.319 0 5.868-1.094 10.988-3.279 15.361-2.188 4.373-5.295 7.732-9.32 10.08-4.027 2.347-8.76 3.52-14.199 3.52-5.495 0-10.254-1.173-14.281-3.52zm26.4-10.08c2.906-3.573 4.359-8.693 4.359-15.361 0-6.666-1.453-11.772-4.359-15.319-2.908-3.546-6.947-5.32-12.119-5.32-5.228 0-9.294 1.773-12.201 5.32-2.908 3.547-4.36 8.654-4.36 15.319 0 6.668 1.452 11.788 4.36 15.361 2.906 3.573 6.973 5.359 12.201 5.359 5.172 0 9.211-1.786 12.119-5.359z"></path></symbol><symbol xmlns="http://www.w3.org/2000/svg" viewBox="0 0 144 144" id="icon-ava-p"><circle fill="#598181" cx="72" cy="72" r="72"></circle><path fill="#FFF" d="M51.015 42.56h24.64c6.026 0 10.721 1.507 14.08 4.52 3.36 3.014 5.04 7.24 5.04 12.68 0 5.44-1.68 9.68-5.04 12.72-3.359 3.04-8.054 4.56-14.08 4.56h-14.32v21.92h-10.32v-56.4zm23.36 26.559c7.092 0 10.64-3.092 10.64-9.28 0-3.146-.88-5.48-2.64-7-1.761-1.52-4.428-2.28-8-2.28H61.334v18.56h13.041z"></path></symbol><symbol xmlns="http://www.w3.org/2000/svg" viewBox="0 0 144 144" id="icon-ava-q"><circle fill="#4B244A" cx="72" cy="72" r="72"></circle><path fill="#FFF" d="M86.814 98.92c.959.826 1.893 1.986 2.801 3.479l5.76 9.36-8.641 4.16-7.76-12.561c-1.494-2.453-4.027-3.68-7.6-3.68-5.495 0-10.254-1.173-14.281-3.52-4.027-2.348-7.134-5.707-9.32-10.08-2.188-4.373-3.28-9.493-3.28-15.361 0-5.866 1.093-10.972 3.28-15.319 2.186-4.346 5.292-7.692 9.32-10.04 4.026-2.346 8.786-3.52 14.281-3.52 5.439 0 10.172 1.174 14.199 3.52 4.025 2.348 7.133 5.694 9.32 10.04 2.186 4.348 3.279 9.454 3.279 15.319 0 6.4-1.268 11.881-3.799 16.441-2.535 4.559-6.174 7.879-10.92 9.959 1.281.376 2.401.977 3.361 1.803zm-3.32-12.84c2.906-3.573 4.359-8.693 4.359-15.361 0-6.666-1.453-11.772-4.359-15.319-2.908-3.546-6.947-5.32-12.119-5.32-5.228 0-9.294 1.773-12.201 5.32-2.908 3.547-4.36 8.654-4.36 15.319 0 6.668 1.452 11.788 4.36 15.361 2.906 3.573 6.973 5.359 12.201 5.359 5.172 0 9.211-1.786 12.119-5.359z"></path></symbol><symbol xmlns="http://www.w3.org/2000/svg" viewBox="0 0 144 144" id="icon-ava-r"><circle fill="#7180B9" cx="72" cy="72" r="72"></circle><path fill="#FFF" d="M96.895 98.959h-11.2l-9.681-18c-.907-1.705-2.027-2.906-3.359-3.6-1.334-.692-3.014-1.04-5.04-1.04h-7.84v22.64h-10.16V42.56h24.96c6.4 0 11.267 1.427 14.6 4.28 3.333 2.854 5 6.974 5 12.36 0 4.32-1.214 7.88-3.64 10.679-2.428 2.801-5.854 4.628-10.28 5.48 2.986.801 5.387 2.908 7.2 6.32l9.44 17.28zM81.694 66.2c1.813-1.466 2.72-3.72 2.72-6.76 0-3.092-.907-5.346-2.72-6.76-1.813-1.413-4.667-2.12-8.56-2.12h-13.44V68.4h13.44c3.893-.001 6.747-.733 8.56-2.2z"></path></symbol><symbol xmlns="http://www.w3.org/2000/svg" viewBox="0 0 144 144" id="icon-ava-s"><circle fill="#69747C" cx="72" cy="72" r="72"></circle><path fill="#FFF" d="M58.854 97.92c-3.788-1.173-6.987-2.826-9.6-4.961l3.44-7.52c2.72 2.08 5.586 3.6 8.6 4.561 3.013.959 6.28 1.439 9.799 1.439 3.893 0 6.894-.68 9.001-2.04 2.106-1.36 3.16-3.267 3.16-5.72 0-2.133-.975-3.76-2.921-4.881-1.947-1.119-5.188-2.186-9.72-3.199-4.693-1.013-8.507-2.187-11.44-3.52-2.934-1.333-5.147-3.041-6.64-5.121-1.494-2.08-2.24-4.72-2.24-7.92 0-3.306.906-6.266 2.72-8.88 1.813-2.613 4.372-4.653 7.68-6.12 3.306-1.466 7.12-2.2 11.44-2.2 3.945 0 7.706.6 11.279 1.8 3.573 1.2 6.507 2.84 8.801 4.92l-3.44 7.52c-5.014-4-10.56-6-16.64-6-3.628 0-6.494.733-8.6 2.2-2.108 1.468-3.16 3.508-3.16 6.12 0 2.188.933 3.868 2.8 5.04 1.866 1.174 5.04 2.268 9.52 3.28 4.747 1.068 8.601 2.254 11.561 3.56 2.96 1.308 5.226 2.975 6.8 5 1.572 2.027 2.359 4.588 2.359 7.68 0 3.36-.894 6.309-2.68 8.84-1.787 2.534-4.374 4.48-7.76 5.841-3.388 1.36-7.374 2.04-11.96 2.04-4.319.001-8.372-.587-12.159-1.759z"></path></symbol><symbol xmlns="http://www.w3.org/2000/svg" viewBox="0 0 144 144" id="icon-ava-t"><circle fill="#00BD9D" cx="72" cy="72" r="72"></circle><path fill="#FFF" d="M66.174 98.959V51.04h-18.4v-8.48h47.12v8.48h-18.4v47.919h-10.32z"></path></symbol><symbol xmlns="http://www.w3.org/2000/svg" viewBox="0 0 144 144" id="icon-ava-u"><circle fill="#F9BC64" cx="72" cy="72" r="72"></circle><path fill="#FFF" d="M53.774 93.68c-4-4-6-9.84-6-17.52v-33.6h10.08v34.159c0 4.854 1.146 8.521 3.44 11 2.292 2.48 5.653 3.721 10.081 3.721 4.372 0 7.706-1.252 10-3.76 2.292-2.506 3.439-6.16 3.439-10.961V42.56h10.08v33.6c0 7.627-2 13.453-6 17.479-4 4.027-9.84 6.04-17.52 6.04-7.733.001-13.6-1.999-17.6-5.999z"></path></symbol><symbol xmlns="http://www.w3.org/2000/svg" viewBox="0 0 144 144" id="icon-ava-v"><circle fill="#4A6FA5" cx="72" cy="72" r="72"></circle><path fill="#FFF" d="M90.215 42.56h10.479l-25.12 56.399h-8.4L42.054 42.56h10.64l18.72 43.601L90.215 42.56z"></path></symbol><symbol xmlns="http://www.w3.org/2000/svg" viewBox="0 0 144 144" id="icon-ava-w"><circle fill="#D9B26F" cx="72" cy="72" r="72"></circle><path fill="#FFF" d="M103.975 42.56h9.84l-19.92 56.399h-8.4l-14.16-40.56-14.239 40.56h-8.4L28.854 42.56h10.4l14 42 14.72-42h7.279l14.32 42.239 14.402-42.239z"></path></symbol><symbol xmlns="http://www.w3.org/2000/svg" viewBox="0 0 144 144" id="icon-ava-x"><circle fill="#9B6A6C" cx="72" cy="72" r="72"></circle><path fill="#FFF" d="M77.174 70.319l21.44 28.64h-12L71.334 77.84 55.975 98.959h-12l21.52-28.72-20.72-27.68h12l14.56 20.24 14.641-20.24h12l-20.802 27.76z"></path></symbol><symbol xmlns="http://www.w3.org/2000/svg" viewBox="0 0 144 144" id="icon-ava-y"><circle fill="#A15E49" cx="72" cy="72" r="72"></circle><path fill="#FFF" d="M99.375 42.56L76.494 72.959v26h-10.32v-26l-22.8-30.399h11.6l16.32 22.16 16.4-22.16h11.681z"></path></symbol><symbol xmlns="http://www.w3.org/2000/svg" viewBox="0 0 144 144" id="icon-ava-z"><circle fill="#84A2A3" cx="72" cy="72" r="72"></circle><path fill="#FFF" d="M62.614 90.719h30.001v8.24H51.094v-7.52l28.96-40.64h-28.96v-8.24h40.64V50l-29.12 40.719z"></path></symbol><symbol xmlns="http://www.w3.org/2000/svg" viewBox="0 0 126 108" id="icon-blockquote"><path d="M112.5 54h-27C75.6 54 72 45.93 72 40.5v-27C72 3.6 80.07 0 85.5 0h27c9.9 0 13.5 8.07 13.5 13.5v27c0 9.9-8.07 13.5-13.5 13.5z"></path><path d="M85.5 108c-2.48 0-4.5-2.02-4.5-4.5s2.02-4.5 4.5-4.5c31.14 0 31.5-30.21 31.5-31.5v-27a4.5 4.5 0 0 1 9 0v27c0 .41-.06 10.18-4.97 20.01C116.35 96.86 106.4 108 85.5 108zm-45-54h-27C3.6 54 0 45.93 0 40.5v-27C0 3.6 8.07 0 13.5 0h27C50.4 0 54 8.07 54 13.5v27C54 50.4 45.93 54 40.5 54z"></path><path d="M13.5 108c-2.48 0-4.5-2.02-4.5-4.5s2.02-4.5 4.5-4.5C44.64 99 45 68.79 45 67.5v-27c0-2.49 2.01-4.5 4.5-4.5s4.5 2.01 4.5 4.5v27c0 .41-.06 10.18-4.97 20.01C44.35 96.86 34.4 108 13.5 108z"></path></symbol><symbol xmlns="http://www.w3.org/2000/svg" viewBox="0 0 90 117" id="icon-bold"><path d="M58.5 117h-45a4.5 4.5 0 0 1-4.5-4.5V4.5C9 2.02 11.02 0 13.5 0h45C75.87 0 90 14.13 90 31.5c0 11.44-6.14 21.48-15.29 27C83.86 64.02 90 74.06 90 85.5c0 17.37-14.13 31.5-31.5 31.5zM18 108h40.5C70.91 108 81 97.91 81 85.5S70.91 63 58.5 63h-18c-2.49 0-4.5-2.01-4.5-4.5s2.01-4.5 4.5-4.5h18C70.91 54 81 43.91 81 31.5S70.91 9 58.5 9H18v99z"></path><path d="M13.5 9h-9a4.5 4.5 0 0 1 0-9h9C15.98 0 18 2.02 18 4.5S15.98 9 13.5 9zm0 108h-9a4.5 4.5 0 0 1 0-9h9a4.5 4.5 0 0 1 0 9z"></path></symbol><symbol xmlns="http://www.w3.org/2000/svg" viewBox="0 0 112.5 108" id="icon-bullet_list"><circle cx="9" cy="9" r="9"></circle><path d="M108 13.5H36a4.5 4.5 0 0 1 0-9h72a4.5 4.5 0 0 1 0 9z"></path><circle cx="9" cy="54" r="9"></circle><path d="M90 58.5H36c-2.49 0-4.5-2.01-4.5-4.5s2.01-4.5 4.5-4.5h54c2.49 0 4.5 2.01 4.5 4.5s-2.01 4.5-4.5 4.5z"></path><circle cx="9" cy="99" r="9"></circle><path d="M108 103.5H36c-2.49 0-4.5-2.01-4.5-4.5s2.01-4.5 4.5-4.5h72c2.49 0 4.5 2.01 4.5 4.5s-2.01 4.5-4.5 4.5z"></path></symbol><symbol xmlns="http://www.w3.org/2000/svg" viewBox="0 0 81 81" id="icon-cancel"><path d="M76.5 81c-1.15 0-2.3-.44-3.18-1.32l-72-72a4.49 4.49 0 0 1 0-6.36 4.49 4.49 0 0 1 6.36 0l72 72a4.49 4.49 0 0 1 0 6.36c-.88.88-2.03 1.32-3.18 1.32z"></path><path d="M4.5 81c-1.15 0-2.3-.44-3.18-1.32a4.49 4.49 0 0 1 0-6.36l72-72a4.49 4.49 0 0 1 6.36 0 4.49 4.49 0 0 1 0 6.36l-72 72C6.8 80.56 5.65 81 4.5 81z"></path></symbol><symbol xmlns="http://www.w3.org/2000/svg" viewBox="0 0 122.9 122.79" id="icon-color_picker"><path d="M67.61 36.38a5.003 5.003 0 0 1 0-7.07l25.1-25.1c5.75-5.75 14.91-5.59 20.86.35l4.95 4.95c5.85 5.85 5.85 15.36 0 21.21L93.77 55.48c-.98.98-2.26 1.46-3.54 1.46s-2.56-.49-3.54-1.46"></path><path d="M96.6 62.81c-1.15 0-2.31-.44-3.18-1.32L61.59 29.67a4.49 4.49 0 0 1 0-6.36 4.49 4.49 0 0 1 6.36 0l31.82 31.82a4.49 4.49 0 0 1 0 6.36c-.87.88-2.02 1.32-3.17 1.32z"></path><path d="M34.82 113.72H18.36l-9-9V88.26l58.59-58.59a4.49 4.49 0 0 1 6.36 0 4.49 4.49 0 0 1 0 6.36L18.36 91.99v9l3.73 3.73h9l55.96-55.96a4.49 4.49 0 0 1 6.36 0 4.49 4.49 0 0 1 0 6.36l-58.59 58.6z"></path><path d="M6.5 122.79a6.53 6.53 0 0 1-4.6-1.9 6.494 6.494 0 0 1 0-9.19l8.51-8.51a6.494 6.494 0 0 1 9.19 0 6.494 6.494 0 0 1 0 9.19l-8.51 8.51a6.49 6.49 0 0 1-4.59 1.9z"></path></symbol><symbol xmlns="http://www.w3.org/2000/svg" viewBox="0 0 161.51 161.51" id="icon-create_new"><circle cx="80.76" cy="80.76" r="80.76" fill="#3571b8"></circle><path d="M80.76 121.26c-2.49 0-4.5-2.01-4.5-4.5v-72a4.5 4.5 0 0 1 9 0v72c0 2.48-2.02 4.5-4.5 4.5z"></path><path d="M116.76 85.26h-72a4.5 4.5 0 0 1 0-9h72a4.5 4.5 0 0 1 0 9z"></path></symbol><symbol xmlns="http://www.w3.org/2000/svg" viewBox="0 0 111 111" id="icon-discussion"><path d="M5.5 2C3.3 2 1 3.3 1 5.5v82C1 89.7 3.3 92 5.5 92H70c2.2 0 4.81 1.36 5.81 3.32l5.38 10.49c.99 1.96 2.62 1.9 3.62-.06l5.38-10.4C91.19 93.39 93.8 92 96 92h9.5c2.2 0 3.5-2.3 3.5-4.5v-82c0-2.2-1.3-3.5-3.5-3.5H5.5z" fill="#fff"></path><path d="M83 108.65c-1.26 0-2.41-.84-3.15-2.29l-5.38-10.61C73.73 94.28 71.64 93 70 93H5.5A5.51 5.51 0 0 1 0 87.5v-82C0 2.47 2.47 0 5.5 0h100c3.03 0 5.5 2.47 5.5 5.5v82c0 3.03-2.47 5.5-5.5 5.5H96c-1.64 0-3.73 1.28-4.47 2.75l-5.38 10.62c-.74 1.45-1.89 2.28-3.15 2.28zM5.5 3A2.5 2.5 0 0 0 3 5.5v82A2.5 2.5 0 0 0 5.5 90H70c2.76 0 5.9 1.93 7.15 4.39L82.53 105c.24.47.46.63.51.66-.03-.02.19-.19.43-.66l5.38-10.62C90.1 91.93 93.24 90 96 90h9.5a2.5 2.5 0 0 0 2.5-2.5v-82a2.5 2.5 0 0 0-2.5-2.5H5.5z"></path><path d="M101 111H56c-.83 0-1.5-.67-1.5-1.5s.67-1.5 1.5-1.5h45c.83 0 1.5.67 1.5 1.5s-.67 1.5-1.5 1.5zm-54 0H29c-.83 0-1.5-.67-1.5-1.5s.67-1.5 1.5-1.5h18c.83 0 1.5.67 1.5 1.5s-.67 1.5-1.5 1.5zm36-81H20c-.83 0-1.5-.67-1.5-1.5S19.17 27 20 27h63c.83 0 1.5.67 1.5 1.5S83.83 30 83 30zM65 48H20c-.83 0-1.5-.67-1.5-1.5S19.17 45 20 45h45c.83 0 1.5.67 1.5 1.5S65.83 48 65 48zm18 18H20c-.83 0-1.5-.67-1.5-1.5S19.17 63 20 63h63c.83 0 1.5.67 1.5 1.5S83.83 66 83 66z"></path></symbol><symbol xmlns="http://www.w3.org/2000/svg" viewBox="0 0 98 79" id="icon-dislike"><path d="M12 0h56c1.66 0 3 1.34 3 3v45c0 1.66-1.34 3-3 3h-9.73L32.16 78.08c-.57.59-1.35.92-2.16.92h-.01c-.82 0-1.6-.34-2.16-.94l-9-9.5a3 3 0 0 1-.52-3.38L25.2 51H3c-.9 0-1.75-.4-2.32-1.1-.57-.69-.8-1.61-.62-2.49l9-45C9.34 1.01 10.57 0 12 0zm74 0h9c1.66 0 3 1.34 3 3v45c0 1.66-1.34 3-3 3h-9c-1.66 0-3-1.34-3-3V3c0-1.66 1.34-3 3-3z"></path></symbol><symbol xmlns="http://www.w3.org/2000/svg" viewBox="0 0 135 135" id="icon-emoticon"><path d="M67.5 135C30.28 135 0 104.72 0 67.5S30.28 0 67.5 0 135 30.28 135 67.5 104.72 135 67.5 135zm0-126C35.24 9 9 35.24 9 67.5S35.24 126 67.5 126 126 99.76 126 67.5 99.76 9 67.5 9z"></path><path d="M96 63c-4.96 0-9-4.04-9-9s4.04-9 9-9 9 4.04 9 9-4.04 9-9 9zm-57 0c-4.96 0-9-4.04-9-9s4.04-9 9-9 9 4.04 9 9-4.04 9-9 9zm29.52 43c-4.67 0-8.94-.9-12.57-2.1-11.01-3.67-18.33-10.91-18.63-11.21a4.49 4.49 0 0 1 0-6.36 4.509 4.509 0 0 1 6.36-.01c.98.97 24.22 23.43 47.65.01a4.49 4.49 0 0 1 6.36 0 4.49 4.49 0 0 1 0 6.36C87.52 102.84 77.3 106 68.52 106z"></path></symbol><symbol xmlns="http://www.w3.org/2000/svg" viewBox="0 0 159 186" id="icon-enter"><path fill="#3471b8" d="M84 183V39l72-36v144z" opacity=".4"></path><path d="M156 150c-1.66 0-3-1.34-3-3V6H33v33c0 1.66-1.34 3-3 3s-3-1.34-3-3V3c0-1.66 1.34-3 3-3h126c1.66 0 3 1.34 3 3v144c0 1.66-1.34 3-3 3z"></path><path d="M84 186a2.995 2.995 0 0 1-3-3V39c0-1.14.64-2.17 1.66-2.68l72-36a3.01 3.01 0 0 1 4.03 1.34 3.01 3.01 0 0 1-1.34 4.03L87 40.85v137.29l67.66-33.83a3.01 3.01 0 0 1 4.03 1.34 3.01 3.01 0 0 1-1.34 4.03l-72 36c-.43.21-.89.32-1.35.32z"></path><path d="M84 150H30c-1.66 0-3-1.34-3-3v-36c0-1.66 1.34-3 3-3s3 1.34 3 3v33h51c1.66 0 3 1.34 3 3s-1.34 3-3 3zm18-27c-1.66 0-3-1.34-3-3v-18c0-1.66 1.34-3 3-3s3 1.34 3 3v18c0 1.66-1.34 3-3 3zM57 78H3c-1.66 0-3-1.34-3-3s1.34-3 3-3h54c1.66 0 3 1.34 3 3s-1.34 3-3 3z"></path><path d="M39 96c-.77 0-1.54-.29-2.12-.88a3 3 0 0 1 0-4.24L52.76 75 36.88 59.12a3 3 0 0 1 0-4.24 3 3 0 0 1 4.24 0l18 18a3 3 0 0 1 0 4.24l-18 18c-.58.59-1.35.88-2.12.88z"></path></symbol><symbol xmlns="http://www.w3.org/2000/svg" viewBox="0 0 353.07 183.57" id="icon-error_404"><style type="text/css">
    .st0{fill:#E6E6E6;}
    .st1{fill:#CCCCCC;}
    .st2{fill:#B3B3B3;}
    .st3{fill:#3471B8;}
    .st4{fill:#F2F2F2;}
    .st5{opacity:0.35;}
    .st6{opacity:0.42;}
    .st7{fill:#808080;}
    .st8{fill:#677075;}
</style>
    <g>
        <path class="st0" d="M290.06,54H40.94C37.66,54,35,51.34,35,48.06V5.94C35,2.66,37.66,0,40.94,0h249.13c3.28,0,5.94,2.66,5.94,5.94
		v42.13C296,51.34,293.34,54,290.06,54z"/>
    </g>
    <g>
        <path class="st1" d="M62,38.5c-6.34,0-11.5-5.16-11.5-11.5S55.66,15.5,62,15.5S73.5,20.66,73.5,27S68.34,38.5,62,38.5z"/>
    </g>
    <g>
        <path class="st2" d="M270,20.5H89c-1.38,0-2.5-1.12-2.5-2.5s1.12-2.5,2.5-2.5h181c1.38,0,2.5,1.12,2.5,2.5S271.38,20.5,270,20.5z"
        />
    </g>
    <g>
        <path class="st2" d="M143,38.5H89c-1.38,0-2.5-1.12-2.5-2.5s1.12-2.5,2.5-2.5h54c1.38,0,2.5,1.12,2.5,2.5S144.38,38.5,143,38.5z"/>
    </g>
    <g>
        <path class="st3" d="M255.06,118H5.94C2.66,118,0,115.34,0,112.06V69.94C0,66.66,2.66,64,5.94,64h249.13
		c3.28,0,5.94,2.66,5.94,5.94v42.13C261,115.34,258.34,118,255.06,118z"/>
    </g>
    <g>
        <path class="st4" d="M27,102.5c-6.34,0-11.5-5.16-11.5-11.5S20.66,79.5,27,79.5S38.5,84.66,38.5,91S33.34,102.5,27,102.5z"/>
    </g>
    <g>
        <g>
            <path class="st4" d="M60,84.5h-6c-1.38,0-2.5-1.12-2.5-2.5s1.12-2.5,2.5-2.5h6c1.38,0,2.5,1.12,2.5,2.5S61.38,84.5,60,84.5z"/>
        </g>
        <g>
            <path class="st4" d="M189.73,84.5h-12.16c-1.38,0-2.5-1.12-2.5-2.5s1.12-2.5,2.5-2.5h12.16c1.38,0,2.5,1.12,2.5,2.5
			S191.11,84.5,189.73,84.5z M157.3,84.5h-12.16c-1.38,0-2.5-1.12-2.5-2.5s1.12-2.5,2.5-2.5h12.16c1.38,0,2.5,1.12,2.5,2.5
			S158.68,84.5,157.3,84.5z M124.87,84.5H112.7c-1.38,0-2.5-1.12-2.5-2.5s1.12-2.5,2.5-2.5h12.16c1.38,0,2.5,1.12,2.5,2.5
			S126.25,84.5,124.87,84.5z M92.43,84.5H80.27c-1.38,0-2.5-1.12-2.5-2.5s1.12-2.5,2.5-2.5h12.16c1.38,0,2.5,1.12,2.5,2.5
			S93.81,84.5,92.43,84.5z"/>
        </g>
        <g>
            <path class="st4" d="M216,84.5h-6c-1.38,0-2.5-1.12-2.5-2.5s1.12-2.5,2.5-2.5h6c1.38,0,2.5,1.12,2.5,2.5S217.38,84.5,216,84.5z"/>
        </g>
    </g>
    <g class="st5">
        <path class="st4" d="M134,102.5h-16c-1.38,0-2.5-1.12-2.5-2.5s1.12-2.5,2.5-2.5h16c1.38,0,2.5,1.12,2.5,2.5S135.38,102.5,134,102.5
		z M102,102.5H86c-1.38,0-2.5-1.12-2.5-2.5s1.12-2.5,2.5-2.5h16c1.38,0,2.5,1.12,2.5,2.5S103.38,102.5,102,102.5z M70,102.5H54
		c-1.38,0-2.5-1.12-2.5-2.5s1.12-2.5,2.5-2.5h16c1.38,0,2.5,1.12,2.5,2.5S71.38,102.5,70,102.5z"/>
    </g>
    <g>
        <path class="st0" d="M290.06,181H40.94c-3.28,0-5.94-2.66-5.94-5.94v-42.13c0-3.28,2.66-5.94,5.94-5.94h249.13
		c3.28,0,5.94,2.66,5.94,5.94v42.13C296,178.34,293.34,181,290.06,181z"/>
    </g>
    <g>
        <path class="st1" d="M62,165.5c-6.34,0-11.5-5.16-11.5-11.5s5.16-11.5,11.5-11.5s11.5,5.16,11.5,11.5S68.34,165.5,62,165.5z"/>
    </g>
    <g>
        <path class="st2" d="M224,147.5H89c-1.38,0-2.5-1.12-2.5-2.5s1.12-2.5,2.5-2.5h135c1.38,0,2.5,1.12,2.5,2.5S225.38,147.5,224,147.5
		z"/>
    </g>
    <g>
        <path class="st2" d="M152,165.5H89c-1.38,0-2.5-1.12-2.5-2.5s1.12-2.5,2.5-2.5h63c1.38,0,2.5,1.12,2.5,2.5S153.38,165.5,152,165.5z
		"/>
    </g>
    <g class="st6">
        <path class="st7" d="M276.02,166.51c-15.37,0-30.74-5.85-42.44-17.55c-23.4-23.4-23.4-61.48,0-84.88c23.4-23.4,61.48-23.4,84.88,0
		l0,0c23.4,23.4,23.4,61.48,0,84.88C306.76,160.66,291.39,166.51,276.02,166.51z M276.02,50.53c-14.35,0-28.69,5.46-39.61,16.38
		c-21.84,21.84-21.84,57.38,0,79.22c21.84,21.84,57.38,21.84,79.22,0c21.84-21.84,21.84-57.38,0-79.22
		C304.71,55.99,290.36,50.53,276.02,50.53z"/>
    </g>
    <g>
        <circle class="st4" cx="276.02" cy="106.52" r="36"/>
        <path class="st8" d="M276.02,145.52c-10.42,0-20.21-4.06-27.58-11.42s-11.42-17.16-11.42-27.58c0-10.42,4.06-20.21,11.42-27.58
		c7.37-7.37,17.16-11.42,27.58-11.42c10.42,0,20.21,4.06,27.58,11.42l0,0l0,0c7.37,7.37,11.42,17.16,11.42,27.58
		c0,10.42-4.06,20.21-11.42,27.58C296.23,141.46,286.44,145.52,276.02,145.52z M276.02,73.52c-8.81,0-17.1,3.43-23.33,9.67
		c-6.23,6.23-9.67,14.52-9.67,23.33c0,8.82,3.43,17.1,9.67,23.33c6.23,6.23,14.52,9.67,23.33,9.67c8.82,0,17.1-3.43,23.33-9.67
		s9.67-14.52,9.67-23.33c0-8.81-3.43-17.1-9.67-23.33l0,0C293.12,76.95,284.83,73.52,276.02,73.52z"/>
    </g>
    <g>
        <path class="st8" d="M301.48,143.97c-3.07,0-6.15-1.17-8.49-3.51c-1.17-1.17-1.17-3.07,0-4.24c1.17-1.17,3.07-1.17,4.24,0
		c2.34,2.34,6.15,2.34,8.49,0c2.34-2.34,2.34-6.15,0-8.49c-1.17-1.17-1.17-3.07,0-4.24c1.17-1.17,3.07-1.17,4.24,0
		c4.68,4.68,4.68,12.29,0,16.97C307.62,142.8,304.55,143.97,301.48,143.97z"/>
    </g>
    <g>
        <path class="st8" d="M341.07,183.57c-3.07,0-6.15-1.17-8.48-3.51l-18.38-18.38c-4.68-4.68-4.68-12.29,0-16.97
		c4.68-4.68,12.29-4.68,16.97,0l18.38,18.38c4.68,4.68,4.68,12.29,0,16.97C347.22,182.4,344.15,183.57,341.07,183.57z
		 M322.69,147.19c-1.54,0-3.07,0.58-4.24,1.75c-2.34,2.34-2.34,6.15,0,8.49l18.38,18.38c2.34,2.34,6.15,2.34,8.49,0
		c2.34-2.34,2.34-6.15,0-8.49l-18.38-18.38C325.76,147.78,324.22,147.19,322.69,147.19z"/>
    </g>
    <g>
        <path class="st8" d="M316.32,149.82c-0.77,0-1.54-0.29-2.12-0.88l-8.49-8.49c-1.17-1.17-1.17-3.07,0-4.24
		c1.17-1.17,3.07-1.17,4.24,0l8.49,8.49c1.17,1.17,1.17,3.07,0,4.24C317.86,149.53,317.09,149.82,316.32,149.82z"/>
    </g>
    <g>
        <path class="st8" d="M339.66,173.16c-0.77,0-1.54-0.29-2.12-0.88c-1.17-1.17-1.17-3.07,0-4.24l6.36-6.36
		c1.17-1.17,3.07-1.17,4.24,0c1.17,1.17,1.17,3.07,0,4.24l-6.36,6.36C341.19,172.87,340.43,173.16,339.66,173.16z"/>
    </g>
</symbol><symbol xmlns="http://www.w3.org/2000/svg" viewBox="0 0 159 186" id="icon-exit"><path fill="#980b3e" d="M84 183V39l72-36v144z" opacity=".4"></path><path d="M156 150c-1.66 0-3-1.34-3-3V6H33v33c0 1.66-1.34 3-3 3s-3-1.34-3-3V3c0-1.66 1.34-3 3-3h126c1.66 0 3 1.34 3 3v144c0 1.66-1.34 3-3 3z"></path><path d="M84 186c-.55 0-1.1-.15-1.58-.45A3.008 3.008 0 0 1 81 183V39c0-1.14.64-2.17 1.66-2.68l72-36c1.48-.74 3.28-.14 4.02 1.34a3.01 3.01 0 0 1-1.34 4.03L87 40.85v137.29l67.66-33.83c1.48-.74 3.28-.14 4.02 1.34a3.01 3.01 0 0 1-1.34 4.03l-72 36c-.42.21-.88.32-1.34.32z"></path><path d="M84 150H30c-1.66 0-3-1.34-3-3v-36c0-1.66 1.34-3 3-3s3 1.34 3 3v33h51c1.66 0 3 1.34 3 3s-1.34 3-3 3zm18-27c-1.66 0-3-1.34-3-3v-18c0-1.66 1.34-3 3-3s3 1.34 3 3v18c0 1.66-1.34 3-3 3zM57 78H3c-1.66 0-3-1.34-3-3s1.34-3 3-3h54c1.66 0 3 1.34 3 3s-1.34 3-3 3z"></path><path d="M21 96c-.77 0-1.54-.29-2.12-.88l-18-18a3 3 0 0 1 0-4.24l18-18a3 3 0 0 1 4.24 0 3 3 0 0 1 0 4.24L7.24 75l15.88 15.88a3 3 0 0 1 0 4.24c-.58.59-1.35.88-2.12.88z"></path></symbol><symbol xmlns="http://www.w3.org/2000/svg" viewBox="0 0 117 103.5" id="icon-favorite"><path d="M58.5 103.5c-8.9 0-23.73-8.36-35.24-19.88C8.26 68.62 0 50.11 0 31.5 0 14.13 14.13 0 31.5 0c11.44 0 21.48 6.14 27 15.29C64.02 6.14 74.06 0 85.5 0 102.87 0 117 14.13 117 31.5c0 18.61-8.26 37.12-23.26 52.12C82.22 95.14 67.4 103.5 58.5 103.5z"></path></symbol><symbol xmlns="http://www.w3.org/2000/svg" viewBox="0 0 72 71.67" id="icon-filter"><path d="M9.5 40.67h-5c-2.49 0-4.5-2.01-4.5-4.5s2.01-4.5 4.5-4.5h5c2.49 0 4.5 2.01 4.5 4.5s-2.01 4.5-4.5 4.5zm58 0H46.17c-2.49 0-4.5-2.01-4.5-4.5s2.01-4.5 4.5-4.5H67.5c2.49 0 4.5 2.01 4.5 4.5s-2.01 4.5-4.5 4.5zM28.5 45c-4.87 0-8.83-3.96-8.83-8.83s3.96-8.83 8.83-8.83 8.83 3.96 8.83 8.83S33.37 45 28.5 45zm0-9c-.09 0-.17.07-.17.17 0 .18.33.18.33 0 .01-.1-.07-.17-.16-.17zm-1-22.67h-23c-2.49 0-4.5-2.01-4.5-4.5s2.01-4.5 4.5-4.5h23c2.49 0 4.5 2.01 4.5 4.5s-2.01 4.5-4.5 4.5zm40 0h-3.33c-2.49 0-4.5-2.01-4.5-4.5s2.01-4.5 4.5-4.5h3.33c2.49 0 4.5 2.01 4.5 4.5s-2.01 4.5-4.5 4.5zm-21 4.34c-4.87 0-8.83-3.96-8.83-8.83S41.63 0 46.5 0s8.83 3.96 8.83 8.83-3.96 8.84-8.83 8.84zm0-9c-.09 0-.17.07-.17.17 0 .18.33.18.33 0 .01-.1-.07-.17-.16-.17zm-19 58.66h-23c-2.49 0-4.5-2.01-4.5-4.5s2.01-4.5 4.5-4.5h23c2.49 0 4.5 2.01 4.5 4.5s-2.01 4.5-4.5 4.5zm40 0h-3.33c-2.49 0-4.5-2.01-4.5-4.5s2.01-4.5 4.5-4.5h3.33c2.49 0 4.5 2.01 4.5 4.5s-2.01 4.5-4.5 4.5zm-21 4.34c-4.87 0-8.83-3.96-8.83-8.83S41.63 54 46.5 54s8.83 3.96 8.83 8.83-3.96 8.84-8.83 8.84zm0-9c-.09 0-.17.08-.17.17 0 .18.33.18.33 0 .01-.1-.07-.17-.16-.17z"></path></symbol><symbol xmlns="http://www.w3.org/2000/svg" viewBox="0 0 81 117" id="icon-flag"><path d="M4.5 117c-2.49 0-4.5-2.01-4.5-4.5V4.5C0 2.94.81 1.49 2.13.67c1.33-.82 2.98-.89 4.38-.2l72 36c1.53.77 2.49 2.33 2.49 4.03s-.96 3.26-2.49 4.02L9 79.28v33.22c0 2.49-2.01 4.5-4.5 4.5z"></path></symbol><symbol xmlns="http://www.w3.org/2000/svg" viewBox="0 0 111 111" id="icon-gallery"><path d="M5.5 2C3.3 2 1 3.3 1 5.5v82C1 89.7 3.3 92 5.5 92H70c2.2 0 4.81 1.36 5.81 3.32l5.38 10.49c.99 1.96 2.62 1.9 3.62-.06l5.38-10.4C91.19 93.39 93.8 92 96 92h9.5c2.2 0 3.5-2.3 3.5-4.5v-82c0-2.2-1.3-3.5-3.5-3.5H5.5z" fill="#fff"></path><path d="M83 108.65c-1.26 0-2.41-.84-3.15-2.29l-5.38-10.61C73.73 94.28 71.64 93 70 93H5.5A5.51 5.51 0 0 1 0 87.5v-82C0 2.47 2.47 0 5.5 0h100c3.03 0 5.5 2.47 5.5 5.5v82c0 3.03-2.47 5.5-5.5 5.5H96c-1.64 0-3.73 1.28-4.47 2.75l-5.38 10.62c-.74 1.45-1.89 2.28-3.15 2.28zM5.5 3A2.5 2.5 0 0 0 3 5.5v82A2.5 2.5 0 0 0 5.5 90H70c2.76 0 5.9 1.93 7.15 4.39L82.53 105c.24.47.46.63.51.66-.03-.02.19-.19.43-.66l5.38-10.62C90.1 91.93 93.24 90 96 90h9.5a2.5 2.5 0 0 0 2.5-2.5v-82a2.5 2.5 0 0 0-2.5-2.5H5.5z"></path><path d="M101 111H56c-.83 0-1.5-.67-1.5-1.5s.67-1.5 1.5-1.5h45c.83 0 1.5.67 1.5 1.5s-.67 1.5-1.5 1.5zm-54 0H29c-.83 0-1.5-.67-1.5-1.5s.67-1.5 1.5-1.5h18c.83 0 1.5.67 1.5 1.5s-.67 1.5-1.5 1.5zM11 18h24.55v24.55H11zm32.73 0h24.55v24.55H43.73zm32.73 0H101v24.55H76.46zM11 50.46h24.55V75H11zm32.73 0h24.55V75H43.73z"></path></symbol><symbol xmlns="http://www.w3.org/2000/svg" viewBox="0 0 99 117" id="icon-heading"><path d="M22.5 9h-18a4.5 4.5 0 0 1 0-9h18a4.5 4.5 0 0 1 0 9z"></path><path d="M13.5 117a4.5 4.5 0 0 1-4.5-4.5V4.5C9 2.02 11.02 0 13.5 0S18 2.02 18 4.5v108a4.5 4.5 0 0 1-4.5 4.5z"></path><path d="M22.5 117h-18a4.5 4.5 0 0 1 0-9h18c2.49 0 4.5 2.01 4.5 4.5s-2.01 4.5-4.5 4.5zm72-108h-18C74.01 9 72 6.99 72 4.5S74.01 0 76.5 0h18a4.5 4.5 0 0 1 0 9z"></path><path d="M85.5 117c-2.49 0-4.5-2.01-4.5-4.5V4.5a4.5 4.5 0 0 1 9 0v108c0 2.49-2.01 4.5-4.5 4.5z"></path><path d="M94.5 117h-18c-2.49 0-4.5-2.01-4.5-4.5s2.01-4.5 4.5-4.5h18c2.49 0 4.5 2.01 4.5 4.5s-2.01 4.5-4.5 4.5zm-9-54h-72a4.5 4.5 0 0 1 0-9h72c2.49 0 4.5 2.01 4.5 4.5S87.99 63 85.5 63z"></path></symbol><symbol xmlns="http://www.w3.org/2000/svg" viewBox="0 0 117 9" id="icon-horizontal_line"><path d="M112.5 9H4.5a4.5 4.5 0 0 1 0-9h108a4.5 4.5 0 0 1 0 9z" fill="#666f74"></path></symbol><symbol xmlns="http://www.w3.org/2000/svg" viewBox="0 0 81 117" id="icon-italic"><path d="M76.5 9h-45C29.01 9 27 6.99 27 4.5S29.01 0 31.5 0h45a4.5 4.5 0 0 1 0 9zm-27 108h-45a4.5 4.5 0 0 1 0-9h45c2.49 0 4.5 2.01 4.5 4.5s-2.01 4.5-4.5 4.5z"></path><path d="M22.5 117a4.504 4.504 0 0 1-4.27-5.92l36-108A4.508 4.508 0 0 1 59.92.23c2.36.79 3.63 3.33 2.85 5.69l-36 108A4.496 4.496 0 0 1 22.5 117z"></path></symbol><symbol xmlns="http://www.w3.org/2000/svg" viewBox="0 0 98 79" id="icon-like"><path d="M86 79H30c-1.66 0-3-1.34-3-3V31c0-1.66 1.34-3 3-3h9.73L65.84.92C66.41.33 67.19 0 68 0h.01c.82 0 1.6.34 2.16.94l9 9.5a3 3 0 0 1 .52 3.38L72.8 28H95c.9 0 1.75.4 2.32 1.1.57.69.8 1.61.62 2.49l-9 45A2.999 2.999 0 0 1 86 79zm-74 0H3c-1.66 0-3-1.34-3-3V31c0-1.66 1.34-3 3-3h9c1.66 0 3 1.34 3 3v45c0 1.66-1.34 3-3 3z"></path></symbol><symbol xmlns="http://www.w3.org/2000/svg" viewBox="0 0 68 86" id="icon-load_lore_icon"><path d="M65 86H3c-1.66 0-3-1.34-3-3V21c0-1.66 1.34-3 3-3h62c1.66 0 3 1.34 3 3v62c0 1.66-1.34 3-3 3zM6 80h56V24H6v56z"></path><path d="M47 15c-1.66 0-3-1.34-3-3V6H24v6c0 1.66-1.34 3-3 3s-3-1.34-3-3V3c0-1.66 1.34-3 3-3h26c1.66 0 3 1.34 3 3v9c0 1.66-1.34 3-3 3z" opacity=".25"></path><path d="M34 69.33c-.77 0-1.54-.29-2.12-.88L21.21 57.79a3 3 0 0 1 0-4.24 3 3 0 0 1 4.24 0L34 62.09l8.54-8.54a3 3 0 0 1 4.24 0 3 3 0 0 1 0 4.24L36.12 68.45c-.58.59-1.35.88-2.12.88z"></path><path d="M34 66c-1.66 0-3-1.34-3-3V37c0-1.66 1.34-3 3-3s3 1.34 3 3v26c0 1.66-1.34 3-3 3z"></path><path d="M56 24c-1.66 0-3-1.34-3-3v-6H15v6c0 1.66-1.34 3-3 3s-3-1.34-3-3v-9c0-1.66 1.34-3 3-3h44c1.66 0 3 1.34 3 3v9c0 1.66-1.34 3-3 3z" opacity=".5"></path></symbol><symbol xmlns="http://www.w3.org/2000/svg" viewBox="0 0 99 130.16" id="icon-locked"><path d="M84.5 130.16h-70c-7.99 0-14.5-6.5-14.5-14.5v-52c0-7.99 6.51-14.5 14.5-14.5h70c8 0 14.5 6.51 14.5 14.5v52c0 7.99-6.5 14.5-14.5 14.5z"></path><path d="M75.49 64.32c-3.04 0-5.5-2.46-5.5-5.5V31.49C69.99 20.19 60.8 11 49.5 11s-20.49 9.19-20.49 20.49v27.33c0 3.04-2.46 5.5-5.5 5.5s-5.5-2.46-5.5-5.5V31.49C18.01 14.13 32.14 0 49.5 0s31.49 14.13 31.49 31.49v27.33c0 3.04-2.46 5.5-5.5 5.5z"></path></symbol><symbol xmlns="http://www.w3.org/2000/svg" viewBox="0 0 73 63" id="icon-menu_icon"><path d="M68.5 9h-64a4.5 4.5 0 0 1 0-9h64a4.5 4.5 0 0 1 0 9zm0 27h-64a4.5 4.5 0 0 1 0-9h64c2.49 0 4.5 2.01 4.5 4.5S70.99 36 68.5 36zm0 27h-64a4.5 4.5 0 0 1 0-9h64c2.49 0 4.5 2.01 4.5 4.5S70.99 63 68.5 63z"></path></symbol><symbol xmlns="http://www.w3.org/2000/svg" viewBox="0 0 18 108" id="icon-more_options"><circle cx="9" cy="9" r="9"></circle><circle cx="9" cy="54" r="9"></circle><circle cx="9" cy="99" r="9"></circle></symbol><symbol xmlns="http://www.w3.org/2000/svg" viewBox="0 0 117.97 144.98" id="icon-notification"><path d="M58.91 122.04c-29.78 0-50.46-7.89-51.75-8.4-.64-.25-1.23-.63-1.71-1.12-9.2-9.2-5.04-20.03 0-25.07 5.68-5.68 10.73-29.47 12.58-43.14.04-.31.11-.61.21-.91C25.37 22 37.99 15.65 44.98 13.77V8.98c0-1.33.53-2.6 1.46-3.54 5.04-5.04 15.88-9.2 25.07 0 .94.94 1.46 2.21 1.46 3.54v4.79c7 1.88 19.61 8.23 26.74 29.63.1.3.17.6.21.91 1.85 13.66 6.9 37.45 12.58 43.14 5.04 5.04 9.2 15.87 0 25.07-.55.55-1.22.96-1.95 1.21-18.67 6.23-36.36 8.31-51.64 8.31zm.57 22.94c-10.37 0-18.5-6.15-18.5-14 0-2.76 2.24-5 5-5h27c2.76 0 5 2.24 5 5 0 7.85-8.12 14-18.5 14z"></path></symbol><symbol xmlns="http://www.w3.org/2000/svg" viewBox="0 0 113.66 113.66" id="icon-pencil"><path d="M4.5 113.66c-1.18 0-2.33-.47-3.18-1.32a4.516 4.516 0 0 1-1.23-4.06l6.36-31.82a4.5 4.5 0 0 1 7.6-2.29L39.5 99.61c1.17 1.17 1.6 2.9 1.13 4.49a4.51 4.51 0 0 1-3.42 3.11l-31.82 6.36c-.3.06-.6.09-.89.09zm9.13-27.19l-3.39 16.96 16.96-3.39-13.57-13.57z"></path><path d="M36.32 107.29c-1.15 0-2.3-.44-3.18-1.32a4.49 4.49 0 0 1 0-6.36l54.09-54.09-19.09-19.09-54.09 54.09a4.49 4.49 0 0 1-6.36 0 4.49 4.49 0 0 1 0-6.36l57.28-57.28c.84-.84 1.99-1.32 3.18-1.32 1.19 0 2.34.47 3.18 1.32l25.46 25.46a4.49 4.49 0 0 1 0 6.36L39.5 105.97c-.88.88-2.03 1.32-3.18 1.32z"></path><path d="M93.6 50.02c-1.15 0-2.3-.44-3.18-1.32a4.49 4.49 0 0 1 0-6.36l12.73-12.73c1.39-1.47 2.56-3.8 0-6.36L90.41 10.52c-1.47-1.39-3.8-2.56-6.36 0L71.32 23.24a4.49 4.49 0 0 1-6.36 0 4.49 4.49 0 0 1 0-6.36L77.69 4.15C81.52.32 86.27-.92 91.05.68c3.23 1.08 5.35 3.08 5.74 3.47l12.73 12.73c3.83 3.83 5.07 8.58 3.47 13.35-1.08 3.23-3.08 5.35-3.47 5.74L96.78 48.7c-.88.88-2.03 1.32-3.18 1.32z"></path></symbol><symbol xmlns="http://www.w3.org/2000/svg" viewBox="0 0 153 117" id="icon-performatted"><path d="M112.5 99c-1.15 0-2.3-.44-3.18-1.32a4.49 4.49 0 0 1 0-6.36l32.82-32.82-32.82-32.82a4.49 4.49 0 0 1 0-6.36 4.49 4.49 0 0 1 6.36 0l36 36a4.49 4.49 0 0 1 0 6.36l-36 36c-.88.88-2.03 1.32-3.18 1.32zm-72 0c-1.15 0-2.3-.44-3.18-1.32l-36-36a4.49 4.49 0 0 1 0-6.36l36-36a4.49 4.49 0 0 1 6.36 0 4.49 4.49 0 0 1 0 6.36L10.86 58.5l32.82 32.82a4.49 4.49 0 0 1 0 6.36c-.88.88-2.03 1.32-3.18 1.32zm18 18a4.504 4.504 0 0 1-4.27-5.92l36-108A4.508 4.508 0 0 1 95.92.23c2.36.79 3.63 3.33 2.85 5.69l-36 108A4.505 4.505 0 0 1 58.5 117z"></path></symbol><symbol xmlns="http://www.w3.org/2000/svg" viewBox="0 0 81 123" id="icon-pinned"><path d="M76.5 61h-5.24l-7.38-41h3.62c2.48 0 4.5-2.02 4.5-4.5v-11C72 2.02 69.98 0 67.5 0h-54C11.02 0 9 2.02 9 4.5v11c0 2.48 2.02 4.5 4.5 4.5h3.62L9.74 61H4.5A4.5 4.5 0 0 0 0 65.5v11C0 78.98 2.02 81 4.5 81h72c2.48 0 4.5-2.02 4.5-4.5v-11c0-2.48-2.02-4.5-4.5-4.5zM36 54c0 2.48-2.02 4.5-4.5 4.5S27 56.48 27 54V27c0-2.48 2.02-4.5 4.5-4.5S36 24.51 36 27v27zm4.5 69c-3.04 0-5.5-2.46-5.5-5.5v-25c0-3.04 2.46-5.5 5.5-5.5s5.5 2.46 5.5 5.5v25c0 3.04-2.46 5.5-5.5 5.5z"></path></symbol><symbol xmlns="http://www.w3.org/2000/svg" viewBox="0 0 98 98" id="icon-quote"><path d="M94 98c-1.04 0-2.06-.41-2.83-1.17L74.34 80H4c-2.21 0-4-1.79-4-4V4c0-2.21 1.79-4 4-4h90c2.21 0 4 1.79 4 4v90c0 1.62-.97 3.08-2.47 3.69-.49.21-1.01.31-1.53.31zM8 72h68c1.06 0 2.08.42 2.83 1.17L90 84.34V8H8v64z"></path></symbol><symbol xmlns="http://www.w3.org/2000/svg" viewBox="0 0 117 101.57" id="icon-reply"><path d="M112.5 101.57c-1.91 0-3.65-1.22-4.27-3.08-5.81-17.44-16.92-27.46-33.01-29.75-8.34-1.19-15.9.02-19.94.93v27.4c0 1.82-1.1 3.46-2.78 4.16-1.68.7-3.62.31-4.9-.98L1.32 53.97C.47 53.13 0 51.98 0 50.79s.47-2.34 1.32-3.18L47.6 1.32a4.503 4.503 0 0 1 4.9-.98c1.68.7 2.78 2.34 2.78 4.16v26.61c6 .55 17.14 2.32 28.37 7.94C98.87 46.65 117 62.89 117 97.07c0 2.21-1.6 4.09-3.78 4.44-.24.04-.48.06-.72.06z"></path></symbol><symbol xmlns="http://www.w3.org/2000/svg" viewBox="0 0 117 117" id="icon-search"><path d="M54 108C24.22 108 0 83.78 0 54S24.22 0 54 0s54 24.22 54 54-24.22 54-54 54zm0-99C29.19 9 9 29.19 9 54s20.19 45 45 45 45-20.19 45-45S78.81 9 54 9z"></path><path d="M112.5 117c-1.15 0-2.3-.44-3.18-1.32l-23.5-23.5a4.49 4.49 0 0 1 0-6.36 4.49 4.49 0 0 1 6.36 0l23.5 23.5a4.49 4.49 0 0 1 0 6.36c-.88.88-2.03 1.32-3.18 1.32z"></path></symbol><symbol xmlns="http://www.w3.org/2000/svg" viewBox="0 0 111.53 117" id="icon-settings"><path d="M55.77 81c-12.41 0-22.5-10.09-22.5-22.5S43.36 36 55.77 36s22.5 10.09 22.5 22.5S68.17 81 55.77 81zm0-36c-7.44 0-13.5 6.06-13.5 13.5S48.32 72 55.77 72s13.5-6.06 13.5-13.5S63.21 45 55.77 45zm18-16.79c-1.69 0-3.31-.96-4.08-2.59L61.9 9H49.37l-9.7 16.94a4.5 4.5 0 0 1-6.14 1.67 4.503 4.503 0 0 1-1.67-6.14l11-19.21A4.49 4.49 0 0 1 46.76 0h18c1.75 0 3.33 1.01 4.07 2.59l9 19.21a4.5 4.5 0 0 1-2.17 5.98c-.6.29-1.25.43-1.89.43z"></path><path d="M17.02 63c-1.47 0-2.91-.72-3.77-2.04L.73 41.75a4.49 4.49 0 0 1-.13-4.71l9-15.59c.8-1.39 2.29-2.25 3.9-2.25h22.27c2.49 0 4.5 2.01 4.5 4.5s-2.01 4.5-4.5 4.5H16.1L9.78 39.15l11.01 16.89c1.36 2.08.77 4.87-1.31 6.23-.77.49-1.62.73-2.46.73z"></path><path d="M37.77 97.79H13.5c-1.61 0-3.09-.86-3.9-2.25l-9-15.59a4.49 4.49 0 0 1 .13-4.71l12.52-19.21a4.501 4.501 0 0 1 6.23-1.31 4.503 4.503 0 0 1 1.31 6.23L9.78 77.85 16.1 88.8h21.67c2.49 0 4.5 2.01 4.5 4.5s-2.02 4.49-4.5 4.49z"></path><path d="M64.77 117h-18c-1.75 0-3.33-1.01-4.08-2.59l-9-19.21a4.492 4.492 0 0 1 2.17-5.98 4.492 4.492 0 0 1 5.98 2.17L49.63 108H61.9l7.78-16.61c1.06-2.25 3.74-3.22 5.98-2.17a4.503 4.503 0 0 1 2.17 5.98l-9 19.21a4.474 4.474 0 0 1-4.06 2.59z"></path><path d="M98.03 97.79H73.76c-2.49 0-4.5-2.01-4.5-4.5s2.01-4.5 4.5-4.5h21.67l6.31-10.92-11.22-16.88c-1.38-2.07-.81-4.86 1.26-6.24 2.07-1.38 4.86-.81 6.24 1.26l12.77 19.21a4.5 4.5 0 0 1 .15 4.74l-9 15.59a4.521 4.521 0 0 1-3.91 2.24z"></path><path d="M94.26 63c-.86 0-1.72-.24-2.49-.75a4.508 4.508 0 0 1-1.26-6.24l11.22-16.88-6.31-10.92H73.77c-2.49 0-4.5-2.01-4.5-4.5s2.01-4.5 4.5-4.5h24.27c1.61 0 3.09.86 3.9 2.25l9 15.59a4.5 4.5 0 0 1-.15 4.74l-12.77 19.2A4.52 4.52 0 0 1 94.26 63z"></path></symbol><symbol xmlns="http://www.w3.org/2000/svg" viewBox="0 0 111.53 117" id="icon-settings_fill"><path d="M64.77 117h-18c-1.75 0-3.33-1.01-4.07-2.59l-7.8-16.62H13.5c-1.61 0-3.09-.86-3.9-2.25l-9-15.59a4.49 4.49 0 0 1 .13-4.71L11.64 58.5.73 41.75a4.511 4.511 0 0 1-.13-4.71l9-15.59c.8-1.39 2.29-2.25 3.9-2.25h19.66l9.7-16.94A4.49 4.49 0 0 1 46.76 0h18c1.75 0 3.33 1.01 4.08 2.59l7.79 16.62h21.41c1.61 0 3.09.86 3.9 2.25l9 15.59a4.5 4.5 0 0 1-.15 4.74L99.67 58.5l11.11 16.71a4.5 4.5 0 0 1 .15 4.74l-9 15.59a4.502 4.502 0 0 1-3.9 2.25h-21.4l-7.79 16.61a4.492 4.492 0 0 1-4.07 2.6zm-9-75.75c-9.51 0-17.25 7.74-17.25 17.25s7.74 17.25 17.25 17.25 17.25-7.74 17.25-17.25c-.01-9.51-7.74-17.25-17.25-17.25z"></path></symbol><symbol xmlns="http://www.w3.org/2000/svg" viewBox="0 0 117 117" id="icon-share"><path d="M22.5 81C10.09 81 0 70.91 0 58.5S10.09 36 22.5 36 45 46.09 45 58.5 34.91 81 22.5 81zm72-36C82.09 45 72 34.91 72 22.5S82.09 0 94.5 0 117 10.09 117 22.5 106.91 45 94.5 45zm0 72C82.09 117 72 106.91 72 94.5S82.09 72 94.5 72 117 82.09 117 94.5 106.91 117 94.5 117z"></path><path d="M76.61 96.98c-.8 0-1.61-.21-2.35-.67l-39.14-24c-2.12-1.3-2.78-4.07-1.48-6.19s4.07-2.78 6.19-1.48l39.14 24a4.499 4.499 0 0 1 1.48 6.19 4.492 4.492 0 0 1-3.84 2.15zM38.7 55.15a4.5 4.5 0 0 1-3.88-2.21 4.502 4.502 0 0 1 1.58-6.17L75 23.92c2.13-1.27 4.9-.56 6.17 1.58 1.27 2.14.56 4.9-1.58 6.17l-38.6 22.85c-.72.43-1.51.63-2.29.63z"></path></symbol><symbol xmlns="http://www.w3.org/2000/svg" viewBox="0 0 102.04 102.03" id="icon-share_topic"><path d="M75.6 102.03c-6.78 0-13.55-2.58-18.7-7.74L46.54 83.95a4.49 4.49 0 0 1 0-6.36 4.49 4.49 0 0 1 6.36 0l10.35 10.35c6.81 6.8 17.88 6.8 24.68 0 6.8-6.8 6.8-17.88 0-24.68L72.41 47.73c-3.3-3.3-7.68-5.11-12.34-5.11s-9.04 1.81-12.34 5.11a4.49 4.49 0 0 1-6.36 0 4.49 4.49 0 0 1 0-6.36c5-5 11.64-7.75 18.71-7.75s13.71 2.75 18.71 7.75L94.3 56.89c10.31 10.31 10.31 27.1 0 37.41-5.16 5.15-11.93 7.73-18.7 7.73z"></path><path d="M41.96 68.41c-7.07 0-13.71-2.75-18.7-7.75L7.73 45.14c-10.31-10.31-10.31-27.09 0-37.41 10.31-10.31 27.1-10.31 37.41 0l11.21 11.21a4.49 4.49 0 0 1 0 6.36 4.49 4.49 0 0 1-6.36 0L38.78 14.1c-6.81-6.8-17.88-6.8-24.68 0-6.8 6.81-6.8 17.88 0 24.68L29.62 54.3c3.3 3.3 7.68 5.11 12.34 5.11s9.05-1.81 12.34-5.11a4.49 4.49 0 0 1 6.36 0 4.49 4.49 0 0 1 0 6.36c-4.99 5-11.63 7.75-18.7 7.75z"></path><path d="M75.6 49.05c-1.15 0-2.3-.44-3.18-1.32-3.3-3.3-7.68-5.11-12.34-5.11s-9.04 1.81-12.34 5.11a4.49 4.49 0 0 1-6.36 0 4.49 4.49 0 0 1 0-6.36c5-5 11.64-7.75 18.71-7.75s13.71 2.75 18.71 7.75a4.49 4.49 0 0 1 0 6.36c-.9.88-2.05 1.32-3.2 1.32z"></path></symbol><symbol xmlns="http://www.w3.org/2000/svg" viewBox="0 0 126 126" id="icon-time"><path d="M63 0C28.21 0 0 28.21 0 63s28.21 63 63 63 63-28.21 63-63S97.79 0 63 0zm31.6 94.6a6.471 6.471 0 0 1-4.6 1.9c-1.66 0-3.33-.63-4.6-1.9l-27-27a6.507 6.507 0 0 1-1.55-6.72l10-29a6.499 6.499 0 1 1 12.29 4.23l-8.67 25.16L94.6 85.4a6.525 6.525 0 0 1 0 9.2z" fill="#666f75"></path></symbol><symbol xmlns="http://www.w3.org/2000/svg" viewBox="0 0 99 108" id="icon-upload_files"><path d="M85.5 45c-1.15 0-2.3-.44-3.18-1.32L49.5 10.86 16.68 43.68a4.49 4.49 0 0 1-6.36 0 4.49 4.49 0 0 1 0-6.36l36-36a4.49 4.49 0 0 1 6.36 0l36 36a4.49 4.49 0 0 1 0 6.36c-.88.88-2.03 1.32-3.18 1.32z"></path><path d="M49.5 81c-2.49 0-4.5-2.01-4.5-4.5v-72a4.5 4.5 0 0 1 9 0v72c0 2.49-2.01 4.5-4.5 4.5zm45 27h-90a4.5 4.5 0 0 1-4.5-4.5v-9a4.5 4.5 0 0 1 9 0V99h81v-4.5c0-2.49 2.01-4.5 4.5-4.5s4.5 2.01 4.5 4.5v9c0 2.49-2.01 4.5-4.5 4.5z"></path></symbol><symbol xmlns="http://www.w3.org/2000/svg" viewBox="0 0 102.04 117.01" id="icon-user"><path d="M50.69 58.22c-14.61 0-26.38-17.42-26.38-31.85C24.31 11.83 36.14 0 50.69 0c14.54 0 26.37 11.83 26.37 26.38 0 14.42-11.76 31.84-26.37 31.84zm.33 58.79c-.22 0-.44-.02-.66-.05-22.3-3.27-46.36-11.8-47.37-12.16a4.502 4.502 0 0 1-2.94-4.89c1.19-8.14 3.67-22.39 6.85-26.28.95-1.16 2.18-2.28 3.66-3.34 8.98-6.41 21.6-10.32 22.14-10.48 1.86-.57 3.88.12 5 1.72 1.75 2.46 7.67 8.85 13.95 8.85h.03c4.29-.01 8.55-2.99 12.67-8.85a4.51 4.51 0 0 1 5-1.72c.53.16 13.16 4.08 22.13 10.48 1.5 1.07 2.72 2.19 3.66 3.34 3.18 3.91 5.66 18.15 6.86 26.29.31 2.12-.92 4.17-2.94 4.89-1.01.36-25.08 8.89-47.38 12.17-.22.02-.44.03-.66.03z"></path></symbol><symbol xmlns="http://www.w3.org/2000/svg" viewBox="0 0 108 108" id="icon-verified"><path d="M54 0C24.18 0 0 24.18 0 54s24.18 54 54 54 54-24.18 54-54S83.82 0 54 0zm31.6 40.6l-36 36a6.471 6.471 0 0 1-4.6 1.9c-1.66 0-3.33-.63-4.6-1.9l-18-18a6.494 6.494 0 0 1 0-9.19 6.494 6.494 0 0 1 9.19 0L45 62.81l31.4-31.4a6.494 6.494 0 0 1 9.19 0c2.54 2.53 2.54 6.65.01 9.19z" fill="#666f75"></path></symbol><symbol xmlns="http://www.w3.org/2000/svg" viewBox="0 0 144 90" id="icon-view"><path d="M72 0C32.24 0 0 36 0 45s32.24 45 72 45 72-36 72-45S111.76 0 72 0zm0 72c-14.91 0-27-12.09-27-27s12.09-27 27-27 27 12.09 27 27-12.09 27-27 27z"></path></symbol><symbol xmlns="http://www.w3.org/2000/svg" viewBox="0 0 96 132" id="Level_Up"><path d="M66 123H30c-1.66 0-3-1.34-3-3V60H3c-1.16 0-2.22-.67-2.72-1.73s-.33-2.3.41-3.19l45-54C46.27.4 47.11 0 48 0s1.73.4 2.3 1.08l45 54c.75.89.91 2.14.41 3.19S94.16 60 93 60H69v60c0 1.66-1.34 3-3 3zm-33-6h30V57c0-1.66 1.34-3 3-3h20.59L48 7.69 9.41 54H30c1.66 0 3 1.34 3 3v60z"></path><path d="M57 132H39c-.8 0-1.56-.32-2.12-.88l-9-9a3 3 0 0 1 0-4.24 3 3 0 0 1 4.24 0l8.12 8.12h15.52l8.12-8.12a3 3 0 0 1 4.24 0 3 3 0 0 1 0 4.24l-9 9c-.56.56-1.32.88-2.12.88zM30 69H12c-.8 0-1.56-.32-2.12-.88l-9-9a3 3 0 0 1 0-4.24 3 3 0 0 1 4.24 0L13.24 63H30c1.66 0 3 1.34 3 3s-1.34 3-3 3zm54 0H66c-1.66 0-3-1.34-3-3s1.34-3 3-3h16.76l8.12-8.12a3 3 0 0 1 4.24 0 3 3 0 0 1 0 4.24l-9 9c-.56.56-1.32.88-2.12.88z"></path></symbol><symbol xmlns="http://www.w3.org/2000/svg" viewBox="0 0 111 111" id="Others"><path d="M5.5 2C3.3 2 1 3.3 1 5.5v82C1 89.7 3.3 92 5.5 92H70c2.2 0 4.81 1.36 5.81 3.32l5.38 10.49c.99 1.96 2.62 1.9 3.62-.06l5.38-10.4C91.19 93.39 93.8 92 96 92h9.5c2.2 0 3.5-2.3 3.5-4.5v-82c0-2.2-1.3-3.5-3.5-3.5H5.5z" fill="#fff"></path><path d="M83 108.65c-1.26 0-2.41-.84-3.15-2.29l-5.38-10.61C73.73 94.28 71.64 93 70 93H5.5A5.51 5.51 0 0 1 0 87.5v-82C0 2.47 2.47 0 5.5 0h100c3.03 0 5.5 2.47 5.5 5.5v82c0 3.03-2.47 5.5-5.5 5.5H96c-1.64 0-3.73 1.28-4.47 2.75l-5.38 10.62c-.74 1.45-1.89 2.28-3.15 2.28zM5.5 3A2.5 2.5 0 0 0 3 5.5v82A2.5 2.5 0 0 0 5.5 90H70c2.76 0 5.9 1.93 7.15 4.39L82.53 105c.24.47.46.63.51.66-.03-.02.19-.19.43-.66l5.38-10.62C90.1 91.93 93.24 90 96 90h9.5a2.5 2.5 0 0 0 2.5-2.5v-82a2.5 2.5 0 0 0-2.5-2.5H5.5z"></path><path d="M101 111H56c-.83 0-1.5-.67-1.5-1.5s.67-1.5 1.5-1.5h45c.83 0 1.5.67 1.5 1.5s-.67 1.5-1.5 1.5zm-54 0H29c-.83 0-1.5-.67-1.5-1.5s.67-1.5 1.5-1.5h18c.83 0 1.5.67 1.5 1.5s-.67 1.5-1.5 1.5zM20 28h63m0 1.5H20c-.83 0-1.5-.67-1.5-1.5s.67-1.5 1.5-1.5h63c.83 0 1.5.67 1.5 1.5s-.67 1.5-1.5 1.5zM20 46h45m0 1.5H20c-.83 0-1.5-.67-1.5-1.5s.67-1.5 1.5-1.5h45c.83 0 1.5.67 1.5 1.5s-.67 1.5-1.5 1.5zM20 64h54m0 1.5H20c-.83 0-1.5-.67-1.5-1.5s.67-1.5 1.5-1.5h54c.83 0 1.5.67 1.5 1.5s-.67 1.5-1.5 1.5z"></path></symbol><symbol xmlns="http://www.w3.org/2000/svg" viewBox="0 0 111 111" id="Poll"><path d="M5.5 2C3.3 2 1 3.3 1 5.5v82C1 89.7 3.3 92 5.5 92H70c2.2 0 4.81 1.36 5.81 3.32l5.38 10.49c.99 1.96 2.62 1.9 3.62-.06l5.38-10.4C91.19 93.39 93.8 92 96 92h9.5c2.2 0 3.5-2.3 3.5-4.5v-82c0-2.2-1.3-3.5-3.5-3.5H5.5z" fill="#fff"></path><path d="M83 108.65c-1.26 0-2.41-.84-3.15-2.29l-5.38-10.61C73.73 94.28 71.64 93 70 93H5.5A5.51 5.51 0 0 1 0 87.5v-82C0 2.47 2.47 0 5.5 0h100c3.03 0 5.5 2.47 5.5 5.5v82c0 3.03-2.47 5.5-5.5 5.5H96c-1.64 0-3.73 1.28-4.47 2.75l-5.38 10.62c-.74 1.45-1.89 2.28-3.15 2.28zM5.5 3A2.5 2.5 0 0 0 3 5.5v82A2.5 2.5 0 0 0 5.5 90H70c2.76 0 5.9 1.93 7.15 4.39L82.53 105c.24.47.46.63.51.66-.03-.02.19-.19.43-.66l5.38-10.62C90.1 91.93 93.24 90 96 90h9.5a2.5 2.5 0 0 0 2.5-2.5v-82a2.5 2.5 0 0 0-2.5-2.5H5.5z"></path><path d="M101 111H56c-.83 0-1.5-.67-1.5-1.5s.67-1.5 1.5-1.5h45c.83 0 1.5.67 1.5 1.5s-.67 1.5-1.5 1.5zm-54 0H29c-.83 0-1.5-.67-1.5-1.5s.67-1.5 1.5-1.5h18c.83 0 1.5.67 1.5 1.5s-.67 1.5-1.5 1.5zm21-59H20c-2.76 0-5-2.24-5-5s2.24-5 5-5h48"></path><path d="M68 42h27c2.76 0 5 2.24 5 5s-2.24 5-5 5H68" fill="#b9c2c6"></path></symbol><symbol xmlns="http://www.w3.org/2000/svg" viewBox="0 0 111 111" id="Question"><path d="M5.5 1.5c-2.2 0-4 1.8-4 4v82c0 2.2 1.8 4 4 4H70c2.2 0 4.81 1.61 5.81 3.57l5.38 10.61c.99 1.96 2.62 1.96 3.62 0l5.38-10.61c.99-1.96 3.61-3.57 5.81-3.57h9.5c2.2 0 4-1.8 4-4v-82c0-2.2-1.8-4-4-4H5.5z" fill="#fff"></path><path d="M83 108.65c-1.26 0-2.41-.84-3.15-2.29l-5.38-10.61C73.73 94.28 71.64 93 70 93H5.5A5.51 5.51 0 0 1 0 87.5v-82C0 2.47 2.47 0 5.5 0h100c3.03 0 5.5 2.47 5.5 5.5v82c0 3.03-2.47 5.5-5.5 5.5H96c-1.64 0-3.73 1.28-4.47 2.75l-5.38 10.62c-.74 1.45-1.89 2.28-3.15 2.28zM5.5 3A2.5 2.5 0 0 0 3 5.5v82A2.5 2.5 0 0 0 5.5 90H70c2.76 0 5.9 1.93 7.15 4.39L82.53 105c.24.47.46.63.51.66-.03-.02.19-.19.43-.66l5.38-10.62C90.1 91.93 93.24 90 96 90h9.5a2.5 2.5 0 0 0 2.5-2.5v-82a2.5 2.5 0 0 0-2.5-2.5H5.5z"></path><path d="M101 111H66c-.83 0-1.5-.67-1.5-1.5s.67-1.5 1.5-1.5h35c.83 0 1.5.67 1.5 1.5s-.67 1.5-1.5 1.5zm-44 0H29c-.83 0-1.5-.67-1.5-1.5s.67-1.5 1.5-1.5h28c.83 0 1.5.67 1.5 1.5s-.67 1.5-1.5 1.5z"></path><path d="M52.36 54.22c0-1.36.25-2.59.74-3.69s1.09-2.04 1.79-2.84c.7-.79 1.64-1.74 2.81-2.84 1.44-1.32 2.5-2.47 3.21-3.43.7-.96 1.05-2.09 1.05-3.38 0-3.52-1.83-5.28-5.5-5.28-1.82 0-3.18.53-4.09 1.59-.91 1.06-1.53 2.5-1.87 4.31l-6.01-1.65c.3-2.72 1.56-4.95 3.77-6.69 2.21-1.74 5.04-2.61 8.48-2.61 3.52 0 6.4.91 8.65 2.72s3.38 4.31 3.38 7.49c0 1.66-.27 3.08-.79 4.25-.53 1.17-1.16 2.14-1.9 2.89-.74.76-1.73 1.63-2.98 2.61-1.59 1.21-2.77 2.33-3.55 3.35-.78 1.02-1.16 2.35-1.16 3.97v1.08h-6.01v-1.85zm-1.02 10.16v-.74c0-2.53 1.27-3.8 3.8-3.8h.68c2.53 0 3.8 1.27 3.8 3.8v.74c0 2.53-1.27 3.8-3.8 3.8h-.68c-2.54 0-3.8-1.27-3.8-3.8z" fill="#b9c2c6"></path></symbol><symbol xmlns="http://www.w3.org/2000/svg" viewBox="0 0 111 111" id="Video"><path d="M5.5 1.5c-2.2 0-4 1.8-4 4v82c0 2.2 1.8 4 4 4H70c2.2 0 4.81 1.61 5.81 3.57l5.38 10.61c.99 1.96 2.62 1.96 3.62 0l5.38-10.61c.99-1.96 3.61-3.57 5.81-3.57h9.5c2.2 0 4-1.8 4-4v-82c0-2.2-1.8-4-4-4H5.5z" fill="#fff"></path><path d="M83 108.65c-1.26 0-2.41-.84-3.15-2.29l-5.38-10.61C73.73 94.28 71.64 93 70 93H5.5A5.51 5.51 0 0 1 0 87.5v-82C0 2.47 2.47 0 5.5 0h100c3.03 0 5.5 2.47 5.5 5.5v82c0 3.03-2.47 5.5-5.5 5.5H96c-1.64 0-3.73 1.28-4.47 2.75l-5.38 10.62c-.74 1.45-1.89 2.28-3.15 2.28zM5.5 3A2.5 2.5 0 0 0 3 5.5v82A2.5 2.5 0 0 0 5.5 90H70c2.76 0 5.9 1.93 7.15 4.39L82.53 105c.24.47.46.63.51.66-.03-.02.19-.19.43-.66l5.38-10.62C90.1 91.93 93.24 90 96 90h9.5a2.5 2.5 0 0 0 2.5-2.5v-82a2.5 2.5 0 0 0-2.5-2.5H5.5z"></path><path d="M101 111H56c-.83 0-1.5-.67-1.5-1.5s.67-1.5 1.5-1.5h45c.83 0 1.5.67 1.5 1.5s-.67 1.5-1.5 1.5zm-54 0H29c-.83 0-1.5-.67-1.5-1.5s.67-1.5 1.5-1.5h18c.83 0 1.5.67 1.5 1.5s-.67 1.5-1.5 1.5z"></path><path d="M56 24.33c-11.97 0-21.67 9.7-21.67 21.67S44.03 67.67 56 67.67c11.97 0 21.67-9.7 21.67-21.67S67.97 24.33 56 24.33zm-2.13 28.8c-1.94 1.03-3.54.07-3.54-2.13V41c0-2.2 1.59-3.16 3.54-2.13l9.93 5.26c1.94 1.03 1.94 2.71 0 3.74l-9.93 5.26z" fill="#b9c2c6"></path></symbol></svg>
</body>
</html>
