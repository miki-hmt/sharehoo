/**
 * 评论stats
 * Created by zhoafang nie on 16-10-26.
 */
$(function(){
    $('#csdn_dl_commentbox li.stats i').on('click',function(){
        var currNum = $(this).index();
        $("#star").val(currNum + 1);
        if(currNum == 0){
            if( $(this).parent('li').hasClass('star_0')){
                $(this).parent('li').attr('class','stars');
            }else{
                $(this).parent('li').attr('class','stars star_0');
            }
        }else if(currNum == 1){
            $(this).parent('li').attr('class','stars star_1');
        }else if(currNum == 2){
            $(this).parent('li').attr('class','stars star_2');
        }else if(currNum == 3){
            $(this).parent('li').attr('class','stars star_3');
        }else if(currNum == 4){
            $(this).parent('li').attr('class','stars star_4');
        }
    });

    centerPop();

});
function centerPop() {
    var popNh = $(".dl_popup_new").height();
    $(".dl_popup_new").css('marginTop',-(popNh/2))
}