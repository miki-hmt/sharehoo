$(function () {
    var autoHideType = true;
    var select_option = $(".select_option");
    var select_box = $(".select_box");
    var select_showbox = $(".select_showbox");
    select_box.hover(function () {
        select_option.show();
        select_option.parent().find(".select_showbox").addClass("active");
    }, function () {
        select_option.hide();
        select_option.parent().find(".select_showbox").removeClass("active");
    });

    var li_option = select_option.children('li');
    var search_type = $("input[name='search_type']");
    li_option.click(function(){
        var current_text = $(this).text();
        select_showbox.text(current_text);
        var current_value = $(this).attr('value');
        search_type.val(current_value);
        $(this).css({'display':'none'}).siblings().css({'display':'block'});
        if(autoHideType) select_option.hide();
    });
    li_option.hover(function () {
        $(this).addClass('hover').siblings().removeClass('hover');
    }, function () {
        li_option.removeClass('hover');
    });

    var navSearItem = $('.nav_search');
    var navSearBut = $('.btn_srh');
    var search_input = $("input[name='search_value']");
    var search_timeout;
    navSearItem.hover(function () {
        clearTimeout(search_timeout);
        if(!navSearItem.hasClass('nav_search_current')){
            navSearItem.addClass('nav_search_current');
            navSearBut.css('height', '30px');
        }
    }, function () {
        search_value = search_input.val() || false;
        if(search_value == null || search_value == '' || !search_value){
            clearTimeout(search_timeout);
            search_timeout = setTimeout(function(){
                navSearItem.removeClass('nav_search_current');
                navSearBut.css('height', '');
            } , 5000);
        }
    });
});