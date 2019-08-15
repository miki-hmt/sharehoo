$(function() {
    var signFun = function() {          
        var $dateBox = $("#js-qiandao-list"),
            $currentDate = $(".current-date"),
            $qiandaoBnt = $("#js-just-qiandao"),
            _html = '',
            _handle = true,
            myDate = new Date();
        $currentDate.text(myDate.getFullYear() + '年' + parseInt(myDate.getMonth() + 1) + '月' + myDate.getDate() + '日');

        var monthFirst = new Date(myDate.getFullYear(), parseInt(myDate.getMonth()), 1).getDay();

        var d = new Date(myDate.getFullYear(), parseInt(myDate.getMonth() + 1), 0);
        var totalDay = d.getDate(); //获取当前月的天数

        for (var i = 0; i < 42; i++) {
            _html += ' <li><div class="qiandao-icon"></div></li>'
        }
        $dateBox.html(_html) //生成日历网格

        var $dateLi = $dateBox.find("li");           
            $.ajax({
            	cache: false,
            	type: "post",  
           	 dataType: "json",  
            	url: "Sign_show.action",  
            	data: {},  
        	success: function(sign) { 
        		//alert(msg.length);          	 	
           	 	 for (var i = 0; i < totalDay; i++) {
                     $dateLi.eq(i + monthFirst).addClass("date" + parseInt(i + 1));
		           	 	for (var key in sign) {
		                    if (i == sign[key]-1) {
		                        $dateLi.eq(i + monthFirst).addClass("qiandao");
		                    	}
		           	 		}      
                     	}      
                    },  
                    error: function () {  
                        alert("查询失败")  
                    }  
                });    
                      
        $(".date" + myDate.getDate()).addClass('able-qiandao');

        $dateBox.on("click", "li", function() {
                if ($(this).hasClass('able-qiandao') && _handle) {
                    $(this).addClass('qiandao');
                    qiandaoFun();
                }
            }) //签到
            //2018.02.07签到函数实现
        $qiandaoBnt.on("click", function() {
        	if($("#js-just-qiandao").prop("className")=="just-qiandao qiandao-sprits actived"){
        			_handle=false;
        			}
	            if (_handle) {
					$.ajax({
						cache: false,
						type: "POST",
						dataType: "json",
						data: {},
						url: "Sign_save.action",
						success: function(result) {
							if(result.mes){
								qiandaoFun();
							}else{
								alert("您尚未登录或激活店铺");
							}
						}
					});
	            }
        }); //签到

        function qiandaoFun() {
        	$.ajax({
				cache: false,
				type: "POST",
				dataType: "json",
				data: {},
				url: "Sign_getSign.action",
				success: function(result) {
					if(result.mes){
						$("#conti").html(result.continu);
						$("#hu").html(result.dou+"虎豆");
					}else{
						$("#conti").html("0");
						$("#hu").html("0");
					}
				}
			});
            $qiandaoBnt.addClass('actived');
            openLayer("qiandao-active", qianDao);
            _handle = false;
        }

        function qianDao() {
            $(".date" + myDate.getDate()).addClass('qiandao');
        }
    }();

    function openLayer(a, Fun) {
        $('.' + a).fadeIn(Fun)
    } //打开弹窗
    
    var closeLayer = function() {
            $("body").on("click", ".close-qiandao-layer", function() {
                $(this).parents(".qiandao-layer").fadeOut()
            });
            $("body").on("click", ".qiandao-share", function() {
                $(this).parents(".qiandao-layer").fadeOut()		//2018.02.07关闭按钮实现
            })
        }() //关闭弹窗

    $("#js-qiandao-history").on("click", function() {
        openLayer("qiandao-history-layer", myFun);

        function myFun() {
            console.log(1)
        } //打开弹窗返回函数
    })

})
