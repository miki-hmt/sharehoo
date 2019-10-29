function OnlineuserObject() {
    this.getCookie = function (str) {
        var tmp, reg = new RegExp("(^| )" + str + "=([^;]*)(;|$)", "gi");
        if (tmp = reg.exec(document.cookie)) {
            return (unescape(tmp[2]));
        }
        return null;
    };

    this.saveCookie = function(name, value) {
        var date = new Date();
        date.setTime(date.getTime() + (5 * 60 * 1000));
        var expires = "; expires=" + date.toGMTString();
        document.cookie = name + "=" + value + expires + "; domain=.china.com; path=/";
    };

    this.send_request = function(url) {
        var scr = document.createElement("SCRIPT");
        document.getElementsByTagName("HEAD")[0].appendChild(scr);
        scr.src = url;
        document.getElementsByTagName("HEAD")[0].removeChild(scr);
    };

    var baseURL = "http://ol.passport.china.com/onlineuser?method=refresh";
    this.refresh = function() {
        try {
        var userid = this.getCookie("nickname");
        if (userid != null) {
            var refresh = this.getCookie("onlineuser_refresh");
            if (refresh == null) {
                this.saveCookie("onlineuser_refresh", 1);
                this.send_request(baseURL + "&" + Math.random());
            }
        }
        } catch (e) {
            alert(e);
        }
        setTimeout("onlineuserObject.refresh();", 1000 * 60 * 5);
    };

}

onlineuserObject = new OnlineuserObject();
