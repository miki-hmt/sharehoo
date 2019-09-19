<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>下载频道 - sharehoo.cn</title>
	<meta name="description" content="下载频道 - sharehoo.cn" />
	<meta name="keywords" content="" />
	<meta name="author" content="sharehoo" />
	<meta name="Copyright" content="sharehoo" />
	<meta name="baidu-site-verification" content="5qKL5WPafahaSFtZ" />
	<meta http-equiv="X-UA-Compatible" content="IE=8,9" />
	<meta name="renderer" content="webkit|ie-stand" />
	<link href="${pageContext.request.contextPath}/shop/images/logo/favicon.ico" rel="SHORTCUT ICON" />
	<meta name="apple-mobile-web-app-status-bar-style" content="yes">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/shop/css/index.css">
	
	<!-- 2019.09.03 自定义弹窗所需插件 -->
	<link rel="stylesheet" type="text/css" href="${host}/sweetalert/sweetalert.css" />
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.11.1.js"></script>
	<script src="${host}/sweetalert/sweetalert.min.js"></script>

	<link rel="stylesheet" href="${pageContext.request.contextPath}/shop/css/bootstrap.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/shop/css/common.css">
	<link href="${pageContext.request.contextPath}/shop/css/quake.slider.css" rel="stylesheet" type="text/css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/font-awesome-4.4.0/css/font-awesome.min.css">
	
	<link rel="stylesheet" href="${pageContext.request.contextPath}/shop/css/download_index.css">
	<script src="${pageContext.request.contextPath}/shop/js/animateBackground-plugin.js" type="text/javascript"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/shop/js/tabSwitch.js" defer></script>
	<script src="${pageContext.request.contextPath}/shop/js/html5shiv.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/shop/js/placeholder.js"></script>
	<script language="javascript" type="text/javascript" src="${pageContext.request.contextPath}/shop/js/async_new.js"></script>
	
	<script type="text/javascript">
	
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
	
	function reP(){
	    document.getElementById('oImg').style.display = "block";
	}

	function logout() {
		/* if (confirm("您确定要退出系统吗？")) {
			window.location.href="User_logout.action";
		} */
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
	
	
		function validateLogin(){
			if ('${currentUser.nickName}'==null||'${currentUser.nickName}'=="") {
				alert("您还未登陆！");
			} else {
				window.location.href="${host}/shop/center";
			}	
		}
	</script>
	
	<script type="text/javascript">
		function Login(){	
			 if ('${currentUser.nickName}'==null||'${currentUser.nickName}'=="") {
			var curPage=window.location.href;
			window.location.href="${pageContext.request.contextPath}/login?prePage="+curPage;
			 }else{
				  alert("上了还想上嘛？");
			  }
	}
	</script>
</head>
<body>
<!doctype html>
<html lang="en">
 <head>
  <meta charset="UTF-8">
  <meta name="Generator" content="EditPlus®">
  <meta name="Author" content="">
  <meta name="Keywords" content="">
  <meta name="Description" content="">
  <title>Document</title>
 </head>
 <body>
  <div class="csdn-toolbar csdn-toolbar-skin-black ">
          <div class="container row center-block ">  
                  <div class="col-md-3 pull-left logo clearfix">
	                  <a href="http://sharehoo.cn/shop/Shop_home.action" title="sharehoo下载社区首页" target="_blank" class="icon"></a>
	                  <a title="下载首页" href="http://sharehoo.cn/shop/Shop_home.action" class="img down-icon"></a>
                  </div>         
                   <div class="pull-right login-wrap ">           
                    <ul class="btns">              
	                    <li class="loginlink">
	                    	<a href="#" target="_top">登录&nbsp;</a>|<a target="_top" href="#">&nbsp;注册</a>
	                    </li>             
	                     <li class="search">                
		                    <div class="icon on-search-icon">                  
			                     <div class="wrap">                    
			                     <div class="curr-icon-wrap">                     
			                      <div class="curr-icon"></div>                   
			                       </div>                    
			                       <form action="http://so.csdn.net/search" id="toolbar_search" method="get" target="_blank"> 
			                               <input type="hidden" value="toolbar" name="ref" accesskey="2">               
			                                <div class="border">                     
			                                   <input placeholder="搜索" type="text" value="" name="q" accesskey="2">
			                                       <span class="icon-enter-sm"></span>                     
			                                </div>                  
			                       </form>              
			                    </div>          
		                   </div>         
	                    </li>            
               		 <li class="favor"> 
               		   <div class="icon on-favor-icon">                 
               		      <div class="wrap">                   
               		       <div class="curr-icon-wrap">                      
               		       		<div class="curr-icon"></div>                    
               		       </div>                   
               		        <div style="display:none;" class="favor-success">
	               		        <span class="msg">收藏成功</span>                      
	               		        <div class="btns"><span class="btn btn-primary ok">确定</span></div>                    
               		        </div>                   
               		         <div style="display:none;" class="favor-failed">
	               		         <span class="icon-danger-lg"></span>
	               		         <span class="msg">收藏失败，请重新收藏</span>                      
	               		         <div class="btns"><span class="btn btn-primary ok">确定</span>
               		         	</div>                    
               		         </div>                    
               		        <form role="form" class="form-horizontal favor-form">                      
               		         <div class="form-group">                        
               		         <div class="clearfix">                          
	               		         <label for="input-title" class="col-sm-2 control-label">
	               		         	<span class="red_txt">*</span>标题
	               		         </label>                         
               		          <div class="col-sm-10">                            
               		          	<input id="inputTitle" type="text" placeholder="" class="title form-control">                         
               		          	 </div>                        
               		          	 </div>                        
               		          	 <div class="alert alert-danger"><strong></strong>标题不能为空</div>                      
               		          	 </div>                      
               		          	 <div class="form-group" style="display:none;">                        
               		          	 <label for="input-url" class="col-sm-2 control-label">网址</label>                       
               		          	  <div class="col-sm-10">                          
               		          	  <input id="input-url" type="text" placeholder="" class="url form-control">                        
               		          	  </div>                      
               		          	  </div>                      
               		          	  <div class="form-group">                       
               		          	   <label for="input-tag" class="col-sm-2 tag control-label">标签</label>                        
               		          	   <div class="col-sm-10">                          
               		          	   <input id="input-tag" type="text" class="form-control tag">                        
               		          	   </div>                      
               		          	   </div>                     
               		          	 <div class="form-group">                        
               		          	    <label for="input-description" class="description col-sm-2 control-label">位置</label>                       
               		          	     <div class="col-sm-10">                          
	               		          	     <div class="my_lib_box">                            
	               		          	     	个人主页&nbsp;-&nbsp;
	               		          	     	<a href="#" target="_blank">我的知识</a>                         
	               		          	      </div>                          
               		          	      <div class="checkbox">                            
	               		          	      <div class="pull-left">                              
		               		          	      <label>                                
		               		          	      		<input type="checkbox" name="share" class="save_lib_map" checked="checked">同时保存至：                            
		               		          	       </label>                           
	               		          	      </div>                           
	               		          	        <div class="pull-left">                              
	               		          	          <div class="dropdown">                                
		               		          	          <button id="toolbar_sele_map" type="button">                                  选择知识图谱                                 
		               		          	           	<i class="fa fa-chevron-down"></i>                                
		               		          	           </button>                                
		               		          	           <div class="top_arr"></div>                               
		               		          	            <div class="outside">                                  
			               		          	            <ul class="dropdown-menu" id="toolbar_Design_knowledge">
			               		          	            	<li>选择知识图谱</li>
			               		          	            </ul>                                
		               		          	            </div>                              
	               		          	            </div>                            
	               		          	       </div>                            
	               		          	        <div class="pull-left new_txt">                             
	               		          	          <a href="#" target="_blank">新建？</a>                           
	               		          	        </div>                          
               		          	         </div>                       
               		          	         </div>                      
               		          	       </div>                     
               		          	       <div class="form-group">                        
               		          	          <div class="col-sm-offset-2 col-sm-10 ft">                         
               		          	            <div class="col-sm-4 pull-left" style="display:none">                           
               		          	               <div class="checkbox">                             
               		          	                   <label>                                
               		          	                   		<input type="checkbox" name="share" checked="checked" class="share">公开                              
               		          	                   </label>                           
               		          	               </div>                          
               		          	            </div>                          
               		          	            <div class="col-sm-8 pull-right favor-btns">                            
               		          	                    <button type="button" class="cancel btn btn-default">取消</button>                            
               		          	                    <button type="submit" class="submit btn btn-primary">收藏</button>                          
               		          	             </div>                       
               		          	          </div>                     
               		          	      </div>                   
               		          	 </form>                  
               		          </div>               
               		       </div>             
               		    </li>              
               		    <li class="notify" style="display:none;">                
               		      <div style="display:none;" class="number"></div>                
               		      <div style="" class="icon-hasnotes-sm"></div>                
               		      <div id="header_notice_num">
               		      	<div class="icon-hasnotes" style="">
               		      	</div>
               		      </div>                
               		      <div class="icon on-notify-icon">                  
               		         <div class="wrap">                    
               		          	<div class="curr-icon-wrap">                     
               		          	    <div class="curr-icon"></div>                    
               		          	</div>                    
               		         <div id="note1" class="csdn_note" style="left: -212px; top: 25px;">      
               		          	<div class="box">
               		          	   <div class="notifications notice_list_con curr">  
               		          	       <div class="menu_title">    
               		          	          <span class="title"><a href="http://msg.csdn.net/letters" target="_blank" class="read_all">查看所有私信</a>
               		          	             <a href="http://msg.csdn.net" target="_blank" class="go_all">查看所有通知</a>
               		          	          </span>  
               		          	       </div> 
	               		          	       <div class="loading">
	               		          	       </div>  
               		          	      	 <div class="empty">暂没有新通知</div> 
               		          	       	<div class="notice_content" style="overflow-y: auto; max-height: 270px;">
               		          	      </div>
               		          	  </div>
               		          	  <div class="notifications detail_con" style="display: none"> 
               		          	      <div class="menu_title"> 
               		          	        <span class="title">     
               		          	          <a class="go_back" href="javascript:void 0;">返回通知列表</a>      
               		          	          <a class="notifications_page_none nextnote" href="javascript:void 0;">下一条</a>      
               		          	          <a class="notifications_page prvnote" href="javascript:void 0;">上一条</a>   
               		          	        </span>  
               		          	      </div>  
               		          	      <div class="notice_content" style="overflow-y: scroll; height: 250px;">
               		          	      </div>
               		          	 </div>
               		          	      <div class="error"></div>
               		          </div>                    
               		          <iframe src="about:block" frameborder="0" allowtransparency="true" style="z-index:-1;position:absolute;top:0;left:0;width:100%;height:100%;background:transparent">
               		          </iframe>
               		        </div>                 
               			</div>                
               		 </div>              
               		</li>             
               		<li class="ugc">               
               		   <div class="icon on-ugc-icon">                 
               		     <div class="wrap clearfix">                   
               		          <div class="curr-icon-wrap">                      
               		          	 <div class="curr-icon"></div>                    
               		          </div>                    
	               		  <dl>                      
	               		     <dt>
	               		       <a href="#" target="_blank" class="p-news clearfix" style="display:none;">
	               		          <em class="icon"></em>
	               		          <span>分享资讯</span>
	               		       </a>
	               		    </dt>                      
	               		    <dt style="border: none;">
	               		    	<a href="${pageContext.request.contextPath }/shop/Shop_upload.action" target="_blank" class="p-doc clearfix">
	               		          <em class="icon"></em>
	               		          <span>传音乐/文档</span>
	               		          </a>
	               		    </dt>                     
	               		    <dt>
	               		       <a href="http://sharehoo.cn/topic/section/11" target="_blank" class="p-ask clearfix">
	               		          <em class="icon"></em>
	               		          <span>提问题</span>
	               		       </a>
	               		    </dt>                      
	               		    <dt>
	               		       <a href="http://sharehoo.cn/blog/manage/Article_add.action?userId=${currentUser.id }" target="_blank" class="p-blog clearfix">
	               		          <em class="icon"></em>
	               		          <span>写博客</span>
	               		        </a>
	               		   </dt>                      
	               		   <dt>
	               		     <a href="${pageContext.request.contextPath }/shop/Shop_upload.action" target="_blank" class="p-src clearfix">
	               		         <em class="icon"></em>
	               		         <span>传资源</span>
	               		     </a>
	               		   </dt>                      
	               		   <dt>
	               		      <a href="#" target="_blank" class="c-obj clearfix">
	               		         <em class="icon"></em>
	               		          <span>创建项目</span>
	               		      </a>
	               		   </dt>                     
	               		   <dt>
	               		      <a href="http://sharehoo.cn/topic/write??sectionId=20" target="_blank" class="c-code clearfix">
	               		         <em class="icon"></em>
	               		         <span>创建代码片</span>
	               		      </a>
	               		  </dt> 
	               		                     
	               		</dl>                  
               		</div>                
               	</div>              
           </li>          	                                                      
           
		   <li class="profile">                
              <div class="icon on-profile-icon"><img src="${pageContext.request.contextPath }/${currentUser.face}" class="curr-icon-img">                  
               	<div class="wrap clearfix">                    
               		<div class="curr-icon-wrap">                      
               		    <div class="curr-icon">
               			</div>                    
               		</div>                    
               	<div class="bd">                      
               		<dl class="clearfix">                        
               		  <dt class="pull-left img">
               		  		<a target="_blank" href="${pageContext.request.contextPath }/${host}/user/center?page=1" class="avatar">
               		        	<img src="${pageContext.request.contextPath }/${currentUser.face}" style="width:100px;height:100px;">
               		       </a>
               		  </dt>                        
               		  <dd class="info" style="border: none;"><a target="_blank" href="#" class="nickname">${currentUser.nickName }
               		      </a>
               		      <span class="dec">在板砖这条路上一去不复返</span>
               		   </dd>                      
               	   </dl>                    
               </div>                   
               <div class="ft clearfix">
               		<a target="_blank" href="#" class="pull-left">
               		   <span class="icon-cog"></span>帐号设置
               		</a>
               		<a href="javascript:logout()" target="_top" class="pull-left" style="margin-left:132px; width:18px; height:27px; white-space:nowrap; overflow:hidden;">
               		   <span class="icon-signout"></span>
               		   <span class="out">退出</span>
               		</a>
               </div>                 
           </div>                
        </div>              
     </li>              
     
     <li class="apps">                
         <div id="chasnew123" class="hasnew" style="display: none;">
         </div>                
         <div id="cappsarea123" class="icon on-apps-icon">                  
         <div class="wrap clearfix">                   
             <div class="curr-icon-wrap">                      
	             <div class="curr-icon">
	             </div>                    
             </div>                  
             <div class="detail">                   
              <dl>                     
	               	<dt>                        
	               		<h5>社区</h5>                     
	               	</dt>                      
	               <dd> 
	               	<a href="#" target="_blank">博客</a>
	               </dd>                     
	               <dd> 
	               	 <a href="${pageContext.request.contextPath }/" target="_blank">论坛</a>
	               </dd>                      
	               	<dd> <a href="Shop_home.action" target="_blank">下载</a></dd>                      
	               	<dd> <a href="${pageContext.request.contextPath }/topic/section/21" target="_blank">知识库</a></dd>                      
	               	<dd><a href="${pageContext.request.contextPath }/topic/section/11" target="_blank">技术问答</a></dd>                      
	               	<dd><a href="#" target="_blank">博客头条</a></dd>                     
	               	<dd style="display:none"> <a href="${pageContext.request.contextPath }/Topic_leaveList.action" target="_blank">秘密墙</a></dd>                    
             	</dl>                  
               
	 		</div>                  
           <div class="detail">                    
             <dl>                      
               <dt>                        
               	<h5>服务</h5>                      
              </dt>                      
              <dd style=""> 
               	<a href="#" target="_blank">JOB
               		<img src="${pageContext.request.contextPath }/shop/images/logo/new.gif" style=" margin-top: -26px; width: 23px;">
               	</a>
               </dd>                      
             <dd> 
               	 <a href="" target="_blank">店铺
               		<img src="${pageContext.request.contextPath }/shop/images/logo/new.gif" style=" margin-top: -26px; width: 23px;">
               	</a>
              </dd>                      
             <dd> <a href="#" target="_blank">CODE</a></dd>                      
             <dd> <a href="#" target="_blank">店铺活动</a></dd>                      
             <dd> <a href="#" target="_blank">精彩瞬间</a></dd>                     
             <dd> <a href="#" target="_blank">虎豆兑换<img src="${pageContext.request.contextPath }/shop/images/logo/new.gif" style="display: none; margin-top: -26px; width: 23px;"></a>
             </dd>                    
           </dl>                 
		</div>                  
		<div class="detail last">                    
			<dl>                      
				<dt>                        
					<h5>情感寄托</h5>                      
				</dt>                      
				<dd> <a href="${pageContext.request.contextPath }/Topic_leaveList.action" target="_blank">告白气球</a></dd>                      
				<dd> <a href="${pageContext.request.contextPath }/Topic_leaveList.action" target="_blank">树洞秘密</a>
				</dd>                    
																				
			</dl>                  
		 </div>                
	  </div>             
    </div>            
	</li>           
	</ul>         
 </div>        
</div>    
</div>
 </body>
</html>

</body>
</html>