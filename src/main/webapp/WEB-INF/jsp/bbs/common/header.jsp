<%--
  Created by IntelliJ IDEA.
  User: miki
  Date: 2020/9/6
  Time: 11:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!--修改日期格式只显示年月日  -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script type="text/javascript">
    function reP(){
        document.getElementById('oImg').style.display = "block";
    }

    function logout() {
        //$.confirm("<p>您确定要退出sharehoo社区</p><p>一个人浪迹天涯吗？</P>");
        swal({
            title : "您确定要退出sharehoo社区",
            text : '<span style="color:red">一个人浪迹天涯吗？</span>',
            type : "warning",
            html : true,
            showCancelButton : true,
            closeOnConfirm : false,
            confirmButtonText : "是的，忍心退出",
            confirmButtonColor : "#ec6c62"
        }, function() {
            $.post("${host}/logout", {
                id : '521'
            }, function(result) {
                if (result.status == 200) {
                    location.reload(true);
                } else {
                    tipError("退出登录失败！！");
                }
            }, "json");
        });
    }

    function tipError(content) {
        swal("操作失败", content, "error");
    }
    function login(){
        var curPage=window.location.href;
        window.location.href="${host}/login?prePage="+curPage;
    }
    function checkUserLogin(){
        if ('${currentUser.nickName}'==null||'${currentUser.nickName}'=="") {
            alert("您还未登陆！");
        } else {
            window.location.href="${host}/user/center?page=1";
        }
    }

    function checkUserLoginForSetting(){
        if ('${currentUser.nickName}'==null||'${currentUser.nickName}'=="") {
            alert("您还未登陆！");
        } else {
            window.location.href="${host}/user/modify";
        }
    }

    //底部热门标签关键字搜索  2018.08.23 miki

    function check_up(thisform){
        var key=$.trim(thisform.keywords.value);
        var category=$.trim(thisform.section_name.value);
        if(key==""){
            alert("关键字不能为空！");
        }else{
            category = encodeURIComponent(category);
            //key=key.replace(/\+/g,"%2B").replace(/\//g,"%2F");
            key =  encodeURIComponent(key);
            var url="${host}/solr/search?keyword="+encodeURIComponent(key)+"&category_name="+encodeURIComponent(category );
            window.open(url);
        }
        return false;
    }

    $(document).ready(function(){
        $.post("${host}/user/news",function(result){
            if(result.mes){
                $("#news").show();
            }else{
                $("#news").css("display","none");
            }
        },"json");

    });

    function operate(type,userId){
        switch(type){
            case "userCenter" :
                window.open("${host}/user/center");
                break;
            case "setting" :
                checkUserLoginForSetting();
                break;
            case "logout" :
                logout();
                break;
            case "update" :
                window.open("${host}/blog/manage/article/preview?articleId="+articleId);
                break;
        }
    }
</script>

<!-- tt-mobile menu -->
<nav class="panel-menu" id="mobile-menu">
    <ul>

    </ul>
    <div class="mm-navbtn-names">
        <div class="mm-closebtn">
            Close
            <div class="tt-icon">
                <svg>
                    <use xlink:href="#icon-cancel"></use>
                </svg>
            </div>
        </div>
        <div class="mm-backbtn">Back</div>
    </div>
</nav>
<header id="tt-header">
    <!--自定义顶部header，兼容社区网站整体风格  2020.09.06 miki-->
    <div class="header"></div>

    <div class="container">
        <div class="row tt-row no-gutters">
            <div class="col-auto">
                <!-- toggle mobile menu -->
                <a class="toggle-mobile-menu" href="#">
                    <svg class="tt-icon">
                        <use xlink:href="#icon-menu_icon"></use>
                    </svg>
                </a>
                <!-- /toggle mobile menu -->
                <!-- logo -->
                <div class="tt-logo">
                    <a href="${host}"><img src="${host}/common/images/logo/logo1.jpg" alt=""></a>
                </div>
                <!-- /logo -->
                <!-- desctop menu -->
                <div class="tt-desktop-menu">
                    <nav>
                        <ul>
                            <li><a href="${host}/topic/sections?page=1"><span>精选板块</span></a></li>
                            <li><a href="${host}/topic/map"><span>社区说明</span></a></li>
                            <li><a href="${host}/topic/write?sectionId=${empty section.id ? 0 : section.id}"><span>发布话题</span></a></li>
                            <li>
                                <a href="#"><span>社区地图</span></a>
                                <ul>
                                    <li><a href="index.html">首页</a></li>
                                    <li><a href="page-single-topic.html">Single Topic</a></li>
                                    <li><a href="${host}/topic/write?sectionId=${empty section.id ? 21 : section.id }">Create Topic</a></li>
                                    <li><a href="page-single-user.html">Single User Activity</a></li>
                                    <li><a href="page-single_threads.html">Single User Threads</a></li>
                                    <li><a href="page-single_replies.html">Single User Replies</a></li>
                                    <li><a href="page-single_followers.html">Single User Followers</a></li>
                                    <li><a href="page-single_categories.html">Single User Categories</a></li>
                                    <li><a href="page-single_settings.html">Single User Settings</a></li>
                                    <li><a href="page-signup.html">Sign up</a></li>
                                    <li><a href="page-login.html">Log in</a></li>
                                    <li><a href="page-categories.html">Categories</a></li>
                                    <li><a href="page-categories-single.html">Single Category</a></li>
                                    <li><a href="page-tabs.html">About</a></li>
                                    <li><a href="page-tabs_guidelines.html">Guidelines</a></li>
                                    <li><a href="_demo_modal-advancedSearch.html">Advanced Search</a></li>
                                    <li><a href="error404.html">Error 404</a></li>
                                    <li><a href="_demo_modal-age-confirmation.html">Age Verification</a></li>
                                    <li><a href="_demo_modal-level-up.html">Level up Notification</a></li>
                                    <li><a href="messages-page.html">Message</a></li>
                                    <li><a href="messages-compose.html">Message Compose</a></li>
                                </ul>
                            </li>
                        </ul>
                    </nav>
                </div>
                <!-- /desctop menu -->
                <!-- tt-search -->
                <div class="tt-search">
                    <!-- toggle -->
                    <button class="tt-search-toggle" data-toggle="modal" data-target="#modalAdvancedSearch">
                        <svg class="tt-icon">
                            <use xlink:href="#icon-search"></use>
                        </svg>
                    </button>
                    <!-- /toggle -->
                    <form class="search-wrapper" method="post" onsubmit="return check_up(this);">
                        <div class="search-form">
                            <input type="text" class="tt-search__input" placeholder="Search" id="tagff" name="keywords"/>
                            <input style="display:none;" value="${section.name }" id="section_name" name="section_name"/>
                            <button class="tt-search__btn" type="submit">
                                <svg class="tt-icon">
                                    <use xlink:href="#icon-search"></use>
                                </svg>
                            </button>
                            <button class="tt-search__close">
                                <svg class="tt-icon">
                                    <use xlink:href="#cancel"></use>
                                </svg>
                            </button>
                        </div>
                        <div class="search-results">
                            <div class="tt-search-scroll">
                                <ul>
                                    <li>
                                        <a href="page-single-topic.html">
                                            <h6 class="tt-title">Rdr2 secret easter eggs</h6>
                                            <div class="tt-description">
                                                Here’s what I’ve found in Red Dead Redem..
                                            </div>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="page-single-topic.html">
                                            <h6 class="tt-title">Top 10 easter eggs in Red Dead Rede..</h6>
                                            <div class="tt-description">
                                                You can find these easter eggs in Red Dea..
                                            </div>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="page-single-topic.html">
                                            <h6 class="tt-title">Red Dead Redemtion: Arthur Morgan..</h6>
                                            <div class="tt-description">
                                                Here’s what I’ve found in Red Dead Redem..
                                            </div>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="page-single-topic.html">
                                            <h6 class="tt-title">Rdr2 secret easter eggs</h6>
                                            <div class="tt-description">
                                                Here’s what I’ve found in Red Dead Redem..
                                            </div>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="page-single-topic.html">
                                            <h6 class="tt-title">Top 10 easter eggs in Red Dead Rede..</h6>
                                            <div class="tt-description">
                                                You can find these easter eggs in Red Dea..
                                            </div>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="page-single-topic.html">
                                            <h6 class="tt-title">Red Dead Redemtion: Arthur Morgan..</h6>
                                            <div class="tt-description">
                                                Here’s what I’ve found in Red Dead Redem..
                                            </div>
                                        </a>
                                    </li>
                                </ul>
                            </div>
                            <button type="button" class="tt-view-all" data-toggle="modal" data-target="#modalAdvancedSearch">Advanced Search</button>
                        </div>
                    </form>
                </div>
                <!-- /tt-search 内容搜索-->
            </div>

            <!--用户信息模块  2020.09.06 miki-->
            <div class="col-auto ml-auto">
                <c:choose>
                    <c:when test="${not empty currentUser }">
                        <div class="tt-user-info d-flex justify-content-center">
                            <a href="${host}/user/reply?page=1" target="_blank" class="tt-btn-icon">
                                <i class="tt-icon">
                                    <svg><use xlink:href="#icon-notification"></use></svg>
                                    <img id="news" src="${pageContext.request.contextPath}/common/images/logo/mess.png" style="width:6px;height:21px;display:none;"/>
                                </i>
                            </a>
                            <div class="tt-avatar-icon tt-size-md">
                                <i class="tt-icon">
                                    <c:choose>
                                        <c:when test="${(currentUser.face==null||currentUser.face=='')&&currentUser.sex=='男'}">
                                            <a href="javascript:checkUserLogin()" title="${currentUser.nickName }">
                                                <img alt=""
                                                     src="${pageContext.request.contextPath}/images/user/user0.gif"
                                                     style="width: 40px; height: 40px;border-radius:50%"></a>
                                        </c:when>
                                        <c:when test="${(currentUser.face==null||currentUser.face=='')&&currentUser.sex=='女'}">
                                            <a href="javascript:checkUserLogin()" title="${currentUser.nickName }">
                                                <img alt=""
                                                     src="${pageContext.request.contextPath}/images/user/female.gif"
                                                     style="width: 40px; height: 40px;border-radius:50%"></a>
                                        </c:when>
                                        <c:otherwise>
                                            <a href="javascript:checkUserLogin()" title="${currentUser.nickName }">

                                                <img alt="" src="${pageContext.request.contextPath}/${currentUser.face}"
                                                     style="width: 40px; height: 40px;border-radius:50%"></a>
                                        </c:otherwise>

                                    </c:choose>
                                </i>
                            </div>
                            <div class="custom-select-01">
                                <select onchange='operate(this.options[this.selectedIndex].value,${currentUser.id })'>
                                    <option value="userCenter">${currentUser.nickName }</option>
                                    <option value="userCenter">个人中心</option>
                                    <option value="setting">我的设置</option>
                                    <option value="logout">退出登录</option>
                                </select>
                            </div>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <div class="tt-account-btn">
                            <a href="javascript:login()" class="btn btn-primary">登录</a>
                            <a href="${host}/register" class="btn btn-secondary">注册</a>
                        </div>
                    </c:otherwise>
                </c:choose>

            </div>
        </div>
    </div>
</header>