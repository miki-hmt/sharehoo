/*����ƶ���*/
var browser={
		url:window.location.href,
		host:window.location.host,
		m_url :'m.xiazaiba.com',
                i_url : 'i.xiazaiba.com',
                a_url : 'a.xiazaiba.com',
        run:function(){
		if(/AppleWebKit.*Mobile/i.test(navigator.userAgent) || (/MIDP|SymbianOS|NOKIA|SAMSUNG|LG|NEC|TCL|Alcatel|BIRD|DBTEL|Dopod|PHILIPS|HAIER|LENOVO|MOT-|Nokia|SonyEricsson|SIE-|Amoi|ZTE/.test(navigator.userAgent))){
    if(window.location.href.indexOf("?mobile")<0){
        try{
            if(this.host.indexOf(this.i_url) != -1 || this.host.indexOf(this.a_url) != -1){
                return false;
            }
            if(/Android|webOS|iPhone|iPod|BlackBerry/i.test(navigator.userAgent)){
               var r_url = this.url.replace(this.host,this.m_url);
	    	   window.location.href = r_url;
            }else if(/iPad/i.test(navigator.userAgent)){
                    var r_url = this.url.replace(this.host,this.m_url);
	    	   window.location.href = r_url;
            }else{
            }
        }catch(e){}
        }
        }
		}
		}
browser.run();
/*����ƶ���*/

var fckNum = null,
    isSG = false,
    goTest = function(data){
    /*if(data == null && isSG){data = '65,56,78,55,61,62';} //���ajax��������Ϊ�գ��ù̶�ֵ��
    var idArr = data.split(',');
    for(var i=0;i<idArr.length;i++){
        if(idArr[i] != ''){
            $('#xiazaiba'+idArr[i]).hide();
        }
    }*/

    //55,61,62,

	/*var strs2 = new Array(); //����һ����
    strs2=data.split("paceid="); //�ַ��ָ�adsid=
	 var idd2 =strs2[1] ;
	 str=idd2; //����һ�ַ���
     var strs = new Array(); //����һ����
     strs=str.split(","); //�ַ��ָ�
     for (i=0;i<strs.length ;i++ ){
         var idd =strs[i] ;
         if(idd !='' && !isNaN(idd) ){     
         var cc =  $("#xiazaiba"+idd );
         cc.hide();
         }
     }

         
     //������е���������   
    if(data !='' && data != null){   
        str=data; 
        var strs = new Array();
        strs=str.split("city="); 
        var down_city =strs[1] ;
        if(down_city !='' && isNaN(down_city) ){
        	//alert(down_city);
            var h_val = $(".down_xzb").eq(1).attr("href");
            $("#base_download").attr("href",h_val);
        }
    }
    
 	$(function(){
 		var strs3 =
         new Array(); //����һ����
    	strs3=data.split("adsid="); //�ַ��ָ�adsid=
    	 str=strs3[1]; //����һ�ַ���
         var strsad = new Array(); //����һ����
         strsad=str.split(","); //�ַ��ָ�
         for (i=0;i<strsad.length ;i++ ){
             var id=strsad[i] ;
            
             if(id !='' && !isNaN(id) ){     
                var cc =  $("." +'rep_xzb' +id).eq(0).parent().attr('id');;
               
                var child =  $("#"+cc).children().attr('class');
                var rep_child =  $("." +'rep_xzb' +id).eq(0).attr('class');
                if(rep_child !=child){
                	$("."+child).css("display", "none");
                }
                $("." +'rep_xzb' +id).css("display", "block");
                $("#"+cc).css("display", "block");
             }
         }
    });*/
}

/*******151112ȥ��
var pageRef = document.referrer;
if(pageRef.indexOf('sogou') > 0){
    isSG = true;
    $.ajax({
        url:'/?ct=stat&ac=get_all_paceid',
        success: function(data){
            fckNum = data;
        }
    });
    //fckNum = '55,61,62';
}*/

/*
$.ajax({  
    type : "post",  
    url : "../?ct=stat&ac=ads_forbid_city&id=ids",  
    data : "ids=61",  
    async : false,  
    success : function(data){
        fckNum = data;
    }  
});*/









