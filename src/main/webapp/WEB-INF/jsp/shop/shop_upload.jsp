<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
   <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>上传资源-下载频道</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="description" content="上传资源-下载频道" />
<meta name="keywords" content="" />
<meta name="baidu-site-verification" content="5qKL5WPafahaSFtZ" />
<meta http-equiv="X-UA-Compatible" content="IE=8,9" />
<meta name="renderer" content="webkit|ie-stand" />
<link href="${pageContext.request.contextPath}/shop/images/logo/favicon.ico" rel="SHORTCUT ICON" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/shop/css/index.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/font-awesome-4.4.0/css/font-awesome.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/shop/css/bootstrap.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/shop/css/common.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/shop/css/download_new.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/shop/css/footer.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/shop/css/upload_resources.css"/>
<script src="${pageContext.request.contextPath}/js/jquery-1.11.1.js" type="text/javascript"></script>
<script type="text/javascript"  src="${pageContext.request.contextPath}/shop/js/jquery-version.js" type="text/javascript"></script>
<script type='text/javascript' src='${pageContext.request.contextPath}/shop/js/jquery.form.js'></script>
<script src="${pageContext.request.contextPath}/shop/js/html5shiv.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/shop/js/sharehoo_download_comment.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/shop/js/placeholder.js"></script>
<script src="${pageContext.request.contextPath}/ckeditor4.12/ckeditor/ckeditor.js"></script>
<script type="text/javascript">
	$(function() {
		//初始换编辑器
		CKEDITOR.replace('description', {
			filebrowserImageUploadUrl : "${host}/topic/ckupload?", //2019.09.07 miki 加上？可以实现拖动图片上传
			codeSnippet_theme : 'zenburn',
			height : '300'
		});
	});
</script>

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/animate.css">
<style type="text/css">	
		/*2018.11.27	miki	进度条内容 start*/
		.progressContent{
			float:center;
			margin:0 auto;
			margin-top:5px;
			padding:15px;
			width:460px;
			border-radius:20px;
			background:#fff;
			box-shadow:0 0 2em #a4be27;
			font-size:10px;
			line-height:2px;		
		}
		.progressBar{	
			background:blue;
			border-radius:6px;
			box-shadow:0 0 6px #276EBE;
			height:15px;
			width:0%;
			color:#fff;
			margin-left:-10px;
			padding:10px;		/*2017.10.09 加上padding，不然div高度会无法控制*/
			position:relative;
		}
		#upload_name{
			height:auto;
			border:0px solid red;
			color:gray;			
			text-align:left;
			width:470px;
			padding:10px;		/*2017.10.09 加上padding，不然div高度会无法控制*/
			font-size:10px;
			line-height:10px;
		}
		/*进度条end*/
		
	</style>

</head>
<body>

	<c:choose>
		 <c:when test="${currentUser==null }">
		 	<script id="toolbar-tpl-scriptId" prod="download" skin="black" src="${pageContext.request.contextPath}/shop/js/html.js" type="text/javascript" domain="http://download.csdn.net"></script>	
		 </c:when>
		 <c:otherwise>
		 	 <%@ include file="./common/login.jsp" %> 
		 </c:otherwise>
	</c:choose>    <script type="text/javascript">
 		 //var protocol = window.location.protocol;
		 // document.write('<script type="text/javascript" src="' +protocol+ '//c.csdnimg.cn/pubfooter/js/repoAddr2.js?v=' + Math.random() + '"></'+'script>');
	</script>
<div class="news-nav">
	<div class="container clearfix">
		<div class="nav-bar">
			<a href="${host}/shop/index.html">首页</a>
			<a href="${pageContext.request.contextPath}/shop/SolrJ_searchItemList.action" target="_blank">资源分类</a>
			<a class=" " href="${host}/shop/rank" target="_blank">精品铺子</a>
			<a class=" " href="http://sharehoo.cn/topic/section/4" target="_blank">赏金平台</a>
			<a href="${host}/shop/download/rank" target="_blank">下载排行</a>			
			<a class=" " href="${pageContext.request.contextPath}/Notice_listpr.action" target="_blank">论坛</a>			
			<a href="${host}/shop/cdk/buy" target="_blank">虎豆充值</a>
			<a href="javascript:void(0)" onclick="javascript:validateLogin()" target="_blank" class="current">我的店铺</a>
		</div>
		<div class="search-download">
			<form action="http://download.csdn.net/search" method="get" onsubmit="return check_up(this);" name="download_search">
				<input type="text" placeholder="搜索资源" value="" id="tagff" name="keywords"/>
				<a href="javascript:check_up(download_search);void(0);" class="download-search-bth"></a>
			</form>
			<a href="/help" class="help"><i class="fa fa-question-circle"></i>帮助</a>
		</div>
	</div>
</div>
<!-- //toolbar nav -->
	
    <div class="meeting_main">
      <div class="download_new clearfix">
        <div class="container clearfix csdn_dl_bread">
          <div class="row">
            <div class="col-md-12"><a href="${host}/shop/index.html">下载频道</a>&nbsp;&nbsp;>&nbsp;&nbsp;资源上传</div>
          </div>
        </div>
        <div class="create_album_wrap">
          <h4 class="dl_common_t"><span>
          	上传资源          	</span>
            <!--搜索页面热点资源-->
          </h4>
          <!--
          Created by zhangw on 2017-3-16.
          -->
          <div class="create_album upl_resources">
          
            <form action="" id="upload_form" enctype="multipart/form-data" method="POST" class="form">
              <input type="hidden" value="" id="hfile" />
			  <input type="hidden" id="sourceId" name="shop.id" value="${shop.id }"/>
              <ul class="create_album_list clearfix">
                
                <li>
                  <label></label>
                  <span class="choose_intro">             
                  <a href="javascript:void(0);" class="choose_file_btn updata-file">选择文件</a>
                                                	
                  <input id="txt_userfile" type="file" name="upload" class="file" onchange="show_uploadfile();"></span>
                  <span class="choose_intro"><em id="li_userfile">(未选择文件)</em>
                  <em>您可以上传小于<em style="display: inline; color:#e33f3f">50MB</em>的文件</em></span>
                </li>
                 <li>
                  <label>操作记录：</label>
                  <input type="text" id="log" name="log"  readonly="readonly" 
                   class="album_inpt" value="<fmt:formatDate value="${source1.upload_time}" pattern="yy-MM-dd HH:mm "/>&nbsp;&nbsp;&nbsp;&nbsp;上传文件：${source1.name }&nbsp;&nbsp;&nbsp;&nbsp;状态：成功！" style="color:#F74519;"/><em></em>
                </li>
                 <li>
                  <label>资源数目：</label>
                  <input type="text" id="num" name="num"  readonly="readonly" 
                   class="album_inpt" value="${shop.sourceNum }&nbsp;&nbsp;&nbsp;&nbsp;店铺容量上限：${shop.maxNum}" style="color:silver;"/><em></em>
                </li>
                <li>
                  <label>资源名称：</label>
                  <input type="text" id="name" name="name" 
                   class="album_inpt" value="${source.name }"/><em></em>
                </li>
                <li>
                  <label>资源类型：</label>
                  <select def="0" class="select category-1" id="type" name="type.id">
					<option value="0" >请选择</option>
					 <c:forEach  items="${types }" var="type">
					 	<option value="${type.id }" >${type.name}</option>
					 </c:forEach>									
				 </select>
				 <em></em>
            
                </li>
                <li>
                  <label>关键词（tag）：</label>
                  <input type="text" id="tag" name="tag" max="50"
                   value="${source.tag }" class="album_inpt" placeholder="关键词请用 ; 隔开越详细，搜索越准确"/>
                   <em></em>
                </li>
                 <li>
                  <label>大小（M）：</label>
                  <input id="file_size" readonly="readonly" type="text" id="size" name="size" max="50"
                   value="${source.size}" class="album_inpt" />
                   <em></em>
                </li>
                <li>
                  <label>所属分类：</label>
                  <select id="category" name="category.id" class="select category-1" onchange= "change()">
                  	<option value="0">请选择</option>
	                  <c:forEach  items="${categoryList }" var="category">
						<option value="${category.id }" ${curCategory.id==category.id?'selected':'' }>${category.name }</option>
					  </c:forEach>
                  </select>&nbsp;
                  
                  <select id="sel_subclass" style="display:" name="menu.id">
				  	<option value="0">请选择</option>		  	
				  </select>
				 
				  <em></em>                                
                </li>
                           	          	           	
                <li>
                  <label>下载豆：</label>
                  	<select def="0" class="select category-1" name="douNum" id="douNum">
                    	<option value="0" > 0</option>
			  		    <option value="1" > 1</option>
			  		    <option value="2" > 2</option>
			  		    <option value="3" > 3</option>
			  		    <option value="4" > 4</option>
			  		    <option value="5" > 5</option>
			  		    <option value="6" > 6</option>
			  		    <option value="7" > 7</option>
			  		    <option value="8" > 8</option>
			  		    <option value="9" > 9</option>
			  		    <option value="10" > 10</option>
                  </select>
                  <em></em>
                </li>
                
                 <li>
                  <label>验证码：</label>
                  <input name="imageCode" id="imageCode" tabindex="6" style="width: 80px;" onblur="checkImageCode(this.value)" value="${imageCode }" type="text" class="album_inpt">
                  <label style="width:auto;cursor:pointer;">
              
                  <img onclick="javascript:loadimage();" title="换一张试试" name="randImage" id="randImage" src="${host}/imageCode"  style="margin-left:5px;" border="0">
                  <span class="pull-left"></span><font id="imageErrorInfo" style="float:right;" color="red"></font>
                  </label><em></em>

					<!-- 2018.11.27		miki	文件上传进度条设置 -->
					<div id="upload_bar">
		   				
		   			</div>	
                </li>
                
                
                <li>
                  <label>资源描述：</label>
                  		<textarea name="source.description" id="description" cols="50"
                  			max="1000" placeholder="描述不支持HTML标签；详细的资源描述有机会获得我们的推荐，更有利于他人下载，赚取更多积分。如资源描述不清，有可能审核不通过。"></textarea>
                  <em></em>
                </li>
                
                                    
                <li class="source_tips">
                  <input id="cb_agree" name="cb_agree" type="checkbox">
                  <label style="width:auto;">同意</label><a href="http://sharehoo.cn/help" target="_blank">SHAREHOO资源上传协议<em></em></a>
                </li>
                            
              </ul>
              <div class="create_album_b">
                
                <input id="okBtn" type="button" value="提交" class="album_submit submit-btn">
              </div>
              <div style="text-align:center;">
              	<font id="error" color="red"></font>
              </div>
              <dl class="create_album_list upld_tips clearfix">
                <dt class="source_tips">上传须知</dt>
                <dd class="source_tips">* 如涉及侵权内容,您的资源将被移除</dd>
                <dd class="source_tips">* 请勿上传小说、mp3、图片等与技术无关的内容.一旦发现将被删除</dd>
                <dd class="source_tips">* 请勿在未经授权的情况下上传任何涉及著作权侵权的资源，除非该资源完全由您个人创作</dd>
                <dd class="source_tips">* 点击上传资源即表示您确认该资源不违反资源分享的使用条款，并且您拥有该资源的所有版权或者上传资源的授权</dd>
              </dl>
            </form>
            
            
			<div id="pop_add_org" class="pop" style="display:none;">
				<h1>资源上传状态</h1>
				<div class="con">
					<form>
			        <div class="tempo">
			        	<div class="tempo_bg" id="uploadprogressbarimg"><span style="width:0%;"></span></div><span id="uploadprogressbar">0%</span>
			        </div>
					<ul>
			        <li>上传速度：<span id="uploadrate"></span></li>
			        <li>已用时：<span id="uploadelapsetime"></span></li>
			        <li>预计剩余时间：<span id="uploadlefttime"></span></li>
			        <li>上传文件大小: <span id="uploadtotal"></span></li>
			        <li>已上传大小：<span id="uploadcurrent"></span></li>
			        </ul>
					</form>
			</div>
			</div>
            
            
          </div>
        </div>
      </div>
    </div>
    <div class="album_wrap">
    </div>


 <script type="text/javascript">
    
    //springboot框架提交表单实体对象到后台尽量使用ajax提交，将表单序列化提交	2019.08.31 miki
	$("#okBtn").on("click", function() {

		//ckeditor4.12新特性，提交表单前需要更新textAera字段内容	2019.09.02
		for (instance in CKEDITOR.instances) {
			CKEDITOR.instances[instance].updateElement();
		}
		
		if (checkForm()) {
			//进度条上传...
			createProgress();
			setTimeout("getProgressBar()",1000);
			
			var formData = new FormData($("#upload_form")[0]);
			$.ajax({
				type : "POST",
				url : "${host}/shop/source/upload",
				data : formData,
				cache : false,
				async : true,
				processData : false, //必须false才会避开jQuery对 formdata 的默认处理
				contentType : false, //必须false才会自动加上正确的Content-Type
				success : function(data) {
					if (data.status == 200) {
						//swal("Good!", "上传成功", "success");
						tipOk("上传成功!!",function(){
							location.reload();
						});
					} else {
						tipError("资源上传失败!!" + data.msg);
					}
				}
			});			
		}
		return false;	//阻止ajax结束自动刷新页面
	});
    
    
    //ajax异步提交
	var flag=false;
	var file;
	function getProgressBar(){
		if(!flag){
		$.ajax({
			cache : false,
			async : true,
			url:"${host}/shop/upload/status?shopId="+${shop.id},		//!!!注意：ajax不能同时调用同一个controller里的两个方法，否则定时会卡住
			type:"post",
			success:function(data){
				debugger;
				if(data.length>0){
					/* flag=true;
					return; */
					eval(data);
					//上传完毕，全部状态设为100
					if(info.read==info.total){
						flag=true;
						$("#progress").css("width","100%");					
						$("#progress").html("100%");
						$("#upload_name").html("【"+info.items+"/"+file.files.length+"】"+file.files[(info.items-1)].name+"【100%】");
					}else{
						info.read=parseFloat(info.read);
						info.total=parseFloat(info.total);
						var percent=Math.round(info.read/info.total*10000)/100.00;
						$("#progress").css("width",percent+"%");					
						$("#progress").html(percent+"%");					
						$("#upload_name").html("【"+info.items+"/"+file.files.length+"】"+file.files[(info.items-1)].name+"【"+percent+"%】");
					}
				}
			}
		});
		setTimeout("getProgressBar();",1000);	//间隔一秒
		}
	}
		
	//创建进度条
	function createProgress(){
		$("#upload_bar").html("");
		file=document.getElementById("txt_userfile");
		var divContent="<div class='progressContent'>";
		divContent=divContent+"<div id='upload_name' class='upload_name'>等待上传..</div><div id='progress' class='progressBar animated rotateIn' align=right>0%</div></div>";
		$("#upload_bar").html(divContent);
	}
    
    function tipOk(content,callback){
		swal({   
			title: content,   
			text: '来自<span style="color:red">sharehoo社区</span>、<a href="#">温馨提示</a>。<br/>2秒后自动关闭..',   
			imageUrl: "${host}/sweetalert/images/thumbs-up.jpg",
			html: true,
			timer: 2000,   
			showConfirmButton: false
		},function(){
				if (callback) {
					callback();
				}
			});
	};
	function tipError(content){
		swal("操作失败", content, "error");
	};
    
    //验证码生成机制	2017.08.01 miki
    function loadimage(){
    	document.getElementById("randImage").src = "${pageContext.request.contextPath }/imageCode?"+Math.random();
    }
    
    //检验验证码是否正确	2017.08.01 miki
    function checkImageCode(imageCode){
    	
    	$.post("${host}/shop/exitCode",{imageCode:imageCode},
    			function(result){
    				if(result.status==401){
    					$("#imageErrorInfo").html("验证码错误，亲亲，请戴上眼镜认真看看！");
    					$("#imageCode").focus();
    				}else{
    					$("#imageErrorInfo").html("");
    				}
    			}
    	);
    }
      
    //表单检验 2017.08.01 miki   
    function checkForm(){
		var dom = document.getElementById("txt_userfile");
		var name=$("#name").val();
		var sex=$("#txt_userfile").val();
		var imageCode=$("#imageCode").val();
		var tag=$("#tag").val();
		var size=$("#size").val();
		var cb_agree=$("#cb_agree").is(":checked");
		if (name=="") {
			$("#error").html("* 资源名称不能为空 *");
			return false;
		}else if (sex=="") {
			$("#error").html("*文件不能为空*");
			return false;
		}else if(50<Math.round((Math.round(dom.files[0].size/1024*100)/100)/1024*100)/100){
				$("#error").html("*超出最大上传文件大小*");
				return false;
			}
		else if (imageCode=="") {
			$("#error").html("*验证码不能为空*");
			return false;
		}
		else if (tag=="") {
			$("#error").html("*关键词不能为空*");
			return false;
		}
		else if (size=="") {
			$("#error").html("*size不能为空*");
			return false;
		}
		else if (cb_agree==false) {
			$("#error").html("*您尚未同意资源上传协议*");
			return false;
		}
		else if('${shop.sourceNum}'=='${shop.maxNum}'){
			$("#error").html("*您已达到资源上传上限，请升级权限再来*");
			return false;
		}
		$("#error").html("");
		return true;
	}
    	    	  	
   //二级菜单显示  miki 2017.08.13
   
	 function change() {
	  	var categoryId=$("#category").val();
	  	var tbody=window.document.getElementById("sel_subclass");	//获取select选择框元素 2017.08.13 miki		  
	  
		$.ajax({  
	    	type: "post",  
	   	 	dataType: "json",  
	    	url: "${host}/shop/source/menu",  
	    	data: {categoryId:categoryId  },  
			success: function (msg) { 
		   	 	if (msg.length>0) {  			
		       	 	var str = "";       	    
		        	for (var key in msg) {        		        		   		
		        		 str += "<option value="+ msg[key].id+" ${curMenu.id==menu.id?'selected':'' }>" +msg[key].name+ "</option>";   
		               }  
		            tbody.innerHTML = str;              
		           }  
		        },  
            error: function () {  
                alert("查询失败")  
            }  
	      });    
		}  
    	
    	
    //获得字符串长度	   	
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
    		if(validate()){
    			$.getJSON("/index.php/upload/checkform/"+ $("#txt_validcode").serialize(),
    					function(data){
    						if(data.succ==0){
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
				    		    		if(data.succ==1){	
				    			    		window.location.href='/upload/success';
				    			    	}else{
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

	<!--2018.11.28	读取文件上传大小回显到表单框中-->
    function show_uploadfile(){
    	var filename = $('#txt_userfile').val();
    	if ( filename )
    	{
    		filename = filename.replace(/C:\\fakepath\\/, '');
    		$('#li_userfile').html('( '+filename+' )');
		var dom = document.getElementById("txt_userfile");
    		if(Math.round(dom.files[0].size/1024*100)/100>1024){
				$("#file_size").val(Math.round((Math.round(dom.files[0].size/1024*100)/100)/1024*100)/100+"M");
			}else{
		 		$("#file_size").val(Math.round(dom.files[0].size/1024*100)/100+"K");
			}
    	}
    }
    
    function addtag( tag ){
    	  var tags = $("#txt_tag").val();
    	  var arrtags=tags.split(" ");
    	  var dtags = new Array;
    	  var j=0;
    	  for(var i=0;i<arrtags.length;i++){
    	    if(jQuery.trim(arrtags[i])!=''){
    	      dtags[j] = arrtags[i];
    	      j++;
    	    }
    	  }
    	  for(i=0;i<dtags.length;i++){
    	    if(tag==dtags[i]){
    	      return ;
    	    }
    	  }
    	  if(dtags.length>4){
    	    alert('最多允许填写5个Tag!');
    	    return ;
    	  }
    	  tags = tags + " "+tag;
    	  $("#txt_tag").val(tags);
    	}

    	function validate(){
    	  slCtl = document.getElementById("MultiFileUploader");
    	  var isOK = false;
    	  if(jQuery.trim($("#txt_title").val())==''){
    	    //alert('请填写资源的标题!');
    	    var $em = $("#txt_title").parent().find( 'em' );
    	    // $("#txt_title").parent().append( '<em class="form_error">请填写资源的标题!</em>' );
    	    $em.addClass( 'form_error' );
    	    $em.removeClass( 'form_correction' );
    	    $em.html( '请填写资源的标题!' );
    	    $("#txt_title").focus();
    	    isOk = false;
    	    return false;
    	  }
    	  else{
    	    isOk = true;
    	  }

    	  if(jQuery.trim($("#txt_title").val()).length>80){
    	    //alert('您的资源名称太长了!');
    	    var $em = $("#txt_title").parent().find( 'em' );
    	    $em.addClass( 'form_error' );
    	    $em.removeClass( 'form_correction' );
    	    $em.html( '您的资源名称太长了!' );
    	    $("#txt_title").focus();
    	    isOk = false
    	    return false;
    	  }else{
    	    isOk = true;
    	  }


    	  if(getStrLength(jQuery.trim($("#txt_title").val()))<10){
    	    //alert('您填写的资源名称长度不符合规则，请检查!');
    	    var $em = $("#txt_title").parent().find( 'em' );
    	    $em.addClass( 'form_error' );
    	    $em.removeClass( 'form_correction' );
    	    $em.html( '您填写的资源名称长度不符合规则，请检查!' );
    	    // $em.css( { display: 'block' } );
    	    $("#txt_title").focus();
    	    isOk = false;
    	    return false;
    	  }
    	  if ( isOk ){
    	    var $em = $("#txt_title").parent().find( 'em' );
    	    $em.addClass( 'form_correction' );
    	    $em.removeClass( 'form_error' );
    	    $em.html( '' );
    	  }

    	  if($("#sel_filetype").val()<1){
    	    //alert('请选择资源类型!');
    	  // $("#sel_filetype").parent().append( '<em class="form_error">请选择资源类型!</em>' );
    	    var $em = $("#sel_filetype").parent().find( 'em' );
    	    $em.addClass( 'form_error' );
    	    $em.removeClass( 'form_correction' );
    	    $em.html( '请选择资源类型!' );
    	    $("#sel_filetype").focus();
    	    isOk = false;
    	    return false;
    	  }
    	  else{
    	    isOk = true;
    	  }
    	  if ( isOk ){
    	    var $em = $("#sel_filetype").parent().find( 'em' );
    	    $em.addClass( 'form_correction' );
    	    $em.removeClass( 'form_error' );
    	    $em.html( '' );
    	  }

    	  if(jQuery.trim($("#txt_tag").val())==''){
    	    //alert('请填写资源的Tag!');
    	    var $em = $("#txt_tag").parent().find( 'em' );
    	    $em.html( '请填写资源的Tag!' );
    	    $em.addClass( 'form_error' );
    	    $em.removeClass( 'form_correction' );
    	    $("#txt_tag").focus();
    	    isOk = false;
    	    return false;
    	  }
    	  else{
    	    isOk = true;
    	  }
    	  if(jQuery.trim($("#txt_tag").val()).length<2){
    	    var $em = $("#txt_tag").parent().find( 'em' );
    	    $em.html( '资源Tag需要大于2个字符!' );
    	    $em.addClass( 'form_error' );
    	    $em.removeClass( 'form_correction' );
    	    $("#txt_tag").focus();
    	    isOk = false;
    	    return false;
    	  }
    	  else{
    	    isOk = true;
    	  }
    	  var tags = jQuery.trim($("#txt_tag").val()).split(/\s+/);
    	  if(tags.length>5){
    	    var $em = $("#txt_tag").parent().find( 'em' );
    	    $em.html( '最多允许填写5个Tag!' );
    	    $em.addClass( 'form_error' );
    	    $em.removeClass( 'form_correction' );
    	    $("#txt_tag").focus();
    	    isOk = false;
    	    return false;
    	  }
    	  else{
    	    isOk = true;
    	  }
    	  for(var i=0;i<tags.length;i++){
    	    if(tags[i].replace(/[^\x00-\xff]/g,"**").length > 12){
    	      // alert('您填写的'+'"'+tags[i]+'"长度超出了限制，请检查');
    	      $em = $("#txt_tag").parent().find( 'em' );
    	      $em.html( '您填写的'+'"'+tags[i]+'"长度超出了限制，请检查' );
    	      $em.addClass( 'form_error' );
    	      $em.removeClass( 'form_correction' );
    	      $("#txt_tag").focus();
    	      isOk = false;
    	      return false;
    	    }
    	    else{
    	      isOk = true;
    	    }
    	  }
    	  if ( isOk ){
    	    var $em = $("#txt_tag").parent().find( 'em' );
    	    $em.addClass( 'form_correction' );
    	    $em.removeClass( 'form_error' );
    	    $em.html( '' );
    	  }

    	  if($("#sel_subclass").val()<1000){	   
    	    $em = $("#sel_subclass").parent().find( 'em' );
    	    $em.html( '请选择分类!' );
    	    $em.addClass( 'form_error' );
    	    $em.removeClass( 'form_correction' );
    	    $("#sel_primary").focus();
    	    isOk = false;
    	    return false;
    	  }
    	  else{
    	    isOk = true;
    	  }
    	  if ( isOk ){
    	    var $em = $("#sel_primary").parent().find( 'em' );
    	    $em.addClass( 'form_correction' );
    	    $em.removeClass( 'form_error' );
    	    $em.html( ''  );
    	  }

    	  if(jQuery.trim($("#sel_score").val()) > 10){	   
    	    $em = $("#txt_tag").parent().find( 'em' );
    	    $em.html( '请选择正确的资源分!' );
    	    $em.addClass( 'form_error' );
    	    $em.removeClass( 'form_correction' );
    	    $("#sel_score").focus();
    	    isOk = false;
    	    return false;
    	  }
    	  else{
    	    isOk = true;
    	  }
    	  if ( isOk ){
    	      var $em = $("#sel_score").parent().find( 'em' );
    	    $em.addClass( 'form_correction' );
    	    $em.removeClass( 'form_error' );
    	    $em.html( ''  );
    	  }

    	//资源描述信息必填  update 20170511
    	  if(jQuery.trim($("#txt_desc").val())==''){	    
      	    $em = $("#txt_desc").parent().find( 'em' );
      	    $em.html( '请填写资源描述!' );
      	    $em.addClass( 'form_error' );
      	    $em.removeClass( 'form_correction' );
      	    $("#txt_desc").focus();
      	    isOk = false;
      	    return false;
      	  }
    	  else{
      	    isOk = true;
      	  }
    	  if ( isOk ){
    	      var $em = $("#sel_score").parent().find( 'em' );
    	    $em.addClass( 'form_correction' );
    	    $em.removeClass( 'form_error' );
    	    $em.html( ''  );
    	  }
      	  
    	  if ( isOk ){
    	    var $em = $("#txt_desc").parent().find( 'em' );
    	    $em.addClass( 'form_correction' );
    	    $em.removeClass( 'form_error' );
    	    $em.html( ''  );
    	  }

    	  if($("#cb_agree").attr("checked")==false){
    	    $em = $("#cb_agree").parent().find( 'em' );
    	    $em.html( '请先同意资源上传协议!' );
    	    $em.addClass( 'form_error' );
    	    $em.removeClass( 'form_correction' );
    	    $("#cb_agree").focus();
    	    isOk = false;
    	    return false;
    	  }
    	  else{
    	    isOk = true;
    	  }
    	  if ( isOk ){
    	      var $em = $("#cb_agree").parent().find( 'em' );
    	    $em.addClass( 'form_correction' );
    	    $em.removeClass( 'form_error' );
    	    $em.html( ''  );
    	  }

    	  if(jQuery.trim($("#txt_validcode").val())==''){   	  
    	    $em = $("#txt_validcode").parent().find( 'em' );
    	    $em.html( '请输入验证码!' );
    	    $em.addClass( 'form_error' );
    	    $em.removeClass( 'form_correction' );
    	    $("#txt_validcode").focus();
    	    isOk = false;
    	    return false;
    	  }
    	  else{
    	    isOk = true;
    	  }
    	  if ( isOk ){
    	      var $em = $("#txt_validcode").parent().find( 'em' );
    	    $em.addClass( 'form_correction' );
    	    $em.removeClass( 'form_error' );
    	    $em.html( ''  );
    	  }
    	  return true;
    	}

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
    </script>

<script type="text/javascript">
	
	function setTab(m,n){
		var tli=document.getElementById("menu"+m).getElementsByTagName("a");
		var mli=document.getElementById("main"+m).getElementsByTagName("ul");
		for(i=0;i<tli.length;i++){
			tli[i].className=i==n?"current1 current2":"";
			mli[i].style.display=i==n?"block":"none";
		}
	}

	function check_up(thisform){
		var key=$.trim(thisform.keywords.value);
		if(key==""){
			alert("关键字不能为空！");
		}
		else{
			//key=key.replace(/\+/g,"%2B").replace(/\//g,"%2F");
			key =  encodeURIComponent(key)
			var url="http://download.csdn.net/search?keywords="+key;
			window.location.href=url;
		}
		return false;
	}

</script>

  <!-- ask 全局悬浮按钮  -->
  <!-- 优化脚本代码 start-->				
<div id="a6a4aba9d" style="width: 1px; height: 1px; display: none;">
</div>
<%@ include file="./common/footer.jsp" %> 
<!-- 优化脚本代码 end-->		
</body>
</html>
    
