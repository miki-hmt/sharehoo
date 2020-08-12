(function(){var CNPlugin=CNPlugin||{};CNPlugin.hash={};CNPlugin.createScript=function(url,data,callback,scriptCharset){var head,script,iscss=false;if(url.indexOf(".css")>-1){iscss=true;};if(data){url+='?'+encodeURI(data);};if(!this.hash.createScript){this.hash.createScript={}};if(this.hash.createScript[url]){if(callback){callback.call(window)};return false;}else{this.hash.createScript[url]=true;};head=document.getElementsByTagName("head")[0]||document.documentElement;if(iscss){script=document.createElement("link");script.rel="stylesheet";}else{script=document.createElement("script");};if(scriptCharset){script.charset=scriptCharset;};if(iscss){script.href=url;}else{script.src=url;};var done=false;script.onload=script.onreadystatechange=function(){if(!done&&(!this.readyState||this.readyState==="loaded"||this.readyState==="complete")){done=true;if(callback){callback.call(window)};script.onload=script.onreadystatechange=null;if(head&&script.parentNode&&!iscss){head.removeChild(script);}}};head.insertBefore(script,head.firstChild);};CNPlugin.getScript=function(url,data,callback,scriptCharset){var that=this,currentURL;if(typeof url==="string"){this.createScript(url,data,callback,scriptCharset);}else{this.hash.loadScriptArray=[];for(var i=0;i<url.length;i++){currentURL=url[i];this.createScript(currentURL,data,function(){that.hash.loadScriptArray.push(currentURL);if(that.hash.loadScriptArray.length==url.length&&callback){callback.call(window)};},scriptCharset);}};};CNPlugin.fire=function(file,config){var blacklist=config.blacklist,whitelist=config.whitelist,runtime=config.runtime,that=this;if(!this.isFire(blacklist,whitelist,runtime)){return false;};if(typeof(config.fn)=="undefined"){this.getScript(file);}else{this.getScript(file,"",function(){window[config.fn].apply(null,config.param);});};};CNPlugin.isFire=function(blacklist,whitelist,runtime){var black=[],white=[],url=window.location.href,realm,flag=false;if(blacklist==undefined&&(typeof(runtime)=="undefined"||(typeof(runtime)=="function"&&runtime()==true))){return true;};url=url.replace("http://","");realm=url.substring(0,url.indexOf("/"));typeof(blacklist)=="string"?black.push(blacklist):black=blacklist;typeof(whitelist)=="string"?white.push(whitelist):white=whitelist;if(black[0]=="*"){for(var i=0,l=white.length;i<l;i++){if(white[i]==realm){flag=true;};};}else{for(var j=0,le=black.length;j<le;j++){if(black[j]==realm){flag=false;};};};if(typeof(runtime)=="function"&&runtime()==false){flag=false;};return flag;};CNPlugin.ready=(function(fn){var dom=[];dom.isReady=false;dom.ready=function(fn){if(dom.isReady){fn();}else{dom.push(fn);};};dom.fireReady=function(){if(!dom.isReady){if(!document.body){return setTimeout(dom.fireReady,16);};dom.isReady=1;if(dom.length){for(var i=0,fn;fn=dom[i];i++){fn()};};};};if(document.readyState==="complete"){dom.fireReady();}else if(-[1,]){document.addEventListener("DOMContentLoaded",function(){document.removeEventListener("DOMContentLoaded",arguments.callee,false);dom.fireReady();},false);}else{document.attachEvent("onreadystatechange",function(){if(document.readyState=="complete"){document.detachEvent("onreadystatechange",arguments.callee);dom.fireReady();};});(function(){if(dom.isReady){return;};var node=new Image;try{node.doScroll();node=null}catch(e){setTimeout(arguments.callee,64);return;};dom.fireReady();})();};return dom.ready;})();window.CNPlugin=CNPlugin;})();

CNPlugin.ready(function(){

    /**
     * 初始化插件配置区域 ************
     */
    /*CNPlugin.fire(["all/newspush/js/main.js", "all/newspush/css/style.css"], {
        "fn":"popnews",
        "blacklist":["*"],
        "whitelist":["fuqi.china.com"],
        "param":["开火"],
        "runtime":function(){ return true}
    });*/

    
    CNPlugin.fire(["http://www.china.com/zh_cn/plugin/all/newspush/js/main.js", "http://www.china.com/zh_cn/plugin/all/newspush/css/style.css"], {
        //"blacklist":["*"],
        //"whitelist":["news.china.com", "pic.news.china.com", "military.china.com", "tuku.military.china.com"]
    });

    /*
    CNPlugin.fire(["http://fuqi.china.com/china/plugin/all/newspush/js/main.js?&b" + (+ new Date) + "=1", "http://fuqi.china.com/china/plugin/all/newspush/css/style.css"], {
        //"blacklist":["*"],
        "whitelist":["fuqi.china.com"],
        "runtime":function(){ return true; }
    });
    */


});