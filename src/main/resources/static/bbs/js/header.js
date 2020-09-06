

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
    if(key==""){
        alert("关键字不能为空！");
    }
    else{
        //key=key.replace(/\+/g,"%2B").replace(/\//g,"%2F");
        key =  encodeURIComponent(key);
        var url="${host}/solr/search?keyword="+encodeURIComponent(key);
        window.open(url);
        //var url="shop/${host}/shop/source/serach?keyword="+encodeURIComponent(key);
        //window.location.href=url;
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

function operate(type,userId) {
    switch (type) {
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
            window.open("${host}/blog/manage/article/preview?articleId=" + articleId);
            break;
    }
}