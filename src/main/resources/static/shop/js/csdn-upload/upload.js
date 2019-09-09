/**
 * 
 */
	function getStrLength(str) {
    	var len = 0;
    	for (var i=0; i<str.length; i++) {
    		var c = str.charCodeAt(i);
    		//单字节加1
    		if ((c >= 0x0001 && c <= 0x007e) || (0xff60<=c && c<=0xff9f)) {
    			len++;
    		}else {
    			len+=2;
    		}
    	}
    	return len;
    }
    function stopupload()
    {
    	if(navigator.appName == "Microsoft Internet Explorer")
        	window.document.execCommand('Stop');
    	else
        	window.stop();
    }
    var xhr;
    $(document).ready(function() {

    	$('#btn_submit').click(function(){

    		if(validate())
    		{
    			$.getJSON("/index.php/upload/checkform/"+ $("#txt_validcode").serialize(),
    					function(data){
    						if(data.succ==0)
    						{
//     							alert(data.errmsg+'asdasdasd');
    							$("#imgValidcode").attr('src','/index.php/rest/tools/validcode/uploadvalidcode/'+Math.random());
    							var $em = $("#txt_validcode").parent().find( 'em' );
    	        			    $em.html( '验证码错误!' );
    	        			    $em.addClass( 'form_error' );
    	        			    $em.removeClass( 'form_correction' );
    	        			    $("#txt_validcode").focus();
    						}else{
    			xhr = $('#uploadform').ajaxSubmit({
    				dataType:  'json',
    				beforeSubmit: function(a,f,o) {
    					startProgress();
    				 },
    			    success: function(data) {

    		    		$("#txt_title").val('');
    		    		$("#txt_tag").val('');
    		    		$("#txt_desc").val('');
    		    		$("#txt_userfile").val('');
    		    		$('#li_userfile').html('未选择文件');
    		    		$("#sel_filetype").empty();
    		    		$("#sel_primary").empty();
    		    		$("#sel_subclass").empty();
    		    		$("#sel_score").empty();
    		    		$("#txt_validcode").val('');
    		    		$("#imgValidcode").click();
    		    		stopProgress();
    		    		
    		    		if(data.succ==1)
    			    	{
    						
    			    		window.location.href='/upload/success';
    			    	}
    			    	
    		    		else
    			    	{
    			    		alert(data.errmsg);
    			    		window.location.reload();
    			    	}
    			    }
    		    });
    					}
    			});
    		}
    		return false;
    	});

    	$("#imgValidcode").click(function(){
    		$("#imgValidcode").attr("src","/index.php/rest/tools/validcode/uploadvalidcode/1"+Math.random());
    	});

    	//$('#sel_primary').selectsort('#sel_primary','#sel_subclass','0');

    	$('#sel_filetype').change(function(){
    		var allow_recommend_item = $('#allow_recommend');
    		if($(this).val() == 1){
    			if(allow_recommend_item){
    				allow_recommend_item.show();
    			}
    		}else{
    			if(allow_recommend_item){
    				allow_recommend_item.hide();
    			}
    		}
    	})

    	$('#recommend_essence').click(function(){
    		if($(this).attr("checked") == true){
    			$(this).val(1);
    		}else{
    			$(this).val(0);
    		}
    	})
    });
    
    
    
    function stopProgress()
    {
    	$(document).progressDialog.hideDialog("#pop_add_org");
    }

    function startProgress(){
    	$(document).progressDialog.showDialog("#pop_add_org");
    	$("#pop_add_org").fadeTo("slow",0.8);
    	setTimeout("getProgress()", 500);
    }
    function getProgress(){
    	$.getJSON("/index.php/upload/get_progress/a618d39e13a528d5e8077a9c53c7562f",
    	function(data){
    		if(data.succ<0){
    			alert(data.errmsg);
    			window.location.reload();
    		}

    		if (data.done==0 && data.succ>0){
    			$("#uploadprogressbar").html(data.percent+"%");
    			$("#uploadprogressbarimg").html('<span style="width:'+data.percent+'%;"></span>');
    			$("#uploadrate").html(data.rate_hum);
    			$("#uploadelapsetime").html(data.elapsetime);
    			$("#uploadlefttime").html(data.lefttime);
    			$("#uploadtotal").html(data.total_hum);
    			$("#uploadcurrent").html(data.current_hum);

    			setTimeout("getProgress()", 500);
    		}
    	});
    }