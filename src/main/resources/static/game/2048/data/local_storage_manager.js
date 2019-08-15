
window.fakeStorage = {
  _data: {},

  setItem: function (id, val) {
    return this._data[id] = String(val);
  },

  getItem: function (id) {
    return this._data.hasOwnProperty(id) ? this._data[id] : undefined;
  },

  removeItem: function (id) {
    return delete this._data[id];
  },

  clear: function () {
    return this._data = {};
  }
};

function getQueryString(name) {
    var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)", "i");
    var r = window.location.search.substr(1).match(reg);
    if (r != null) return unescape(r[2]); return null;
}

function LocalStorageManager() {
  this.gamename 		= "flappy2048";
  this.bestScoreKey     = "bestScore" + this.gamename ;
  this.gameStateKey     = "gameState" + this.gamename ;
  this.userInfoKey		= "userKey";
  this.userInfoName		= "userName";
  

  var supported = this.localStorageSupported();
  this.storage = supported ? window.localStorage : window.fakeStorage;
}

LocalStorageManager.prototype.localStorageSupported = function () {
  var testKey = "test";
  var storage = window.localStorage;

  try {
    storage.setItem(testKey, "1");
    storage.removeItem(testKey);
    return true;
  } catch (error) {
    return false;
  }
};

// Best score getters/setters
LocalStorageManager.prototype.getBestScore = function () {
  return this.storage.getItem(this.bestScoreKey) || 0;
};

LocalStorageManager.prototype.setBestScore = function (score) {
  this.storage.setItem(this.bestScoreKey, score);
};

LocalStorageManager.prototype.getUserInfoKey = function () {
  return this.storage.getItem(this.userInfoKey) || "";
};

LocalStorageManager.prototype.getUserInfoName = function () {
  return this.storage.getItem(this.userInfoName) || "";
};

LocalStorageManager.prototype.setUserInfo = function (key,name) {
  this.storage.setItem(this.userInfoKey, key);
  this.storage.setItem(this.userInfoName, name);
};


LocalStorageManager.prototype.creatUserInfo = function (userinfo,manager,callback) {
	
	
    var url="http://bbs.y3.cn/wechat/website/server/token.php";
	$.ajax({
		url : url,
		dataType : "jsonp",
		jsonp:"callback",
		success : function(json){
			manager.creatUserInfoTodo(json,userinfo,manager,callback);
		},
		error : function(e){
			//alert("json_error");
		}
	});
	
};
LocalStorageManager.prototype.creatUserInfoTodo = function (sign,userinfo,manager,callback) {
	var valuetxt = "";
	for(var i in userinfo){
		if(userinfo[i]){
			valuetxt += i + "=" + userinfo[i] + "&";
		}
	}
	valuetxt += "ip=" + ILData[0] + "&";
	if(typeof(getQueryString("pr")) == "undefined"){
		valuetxt += "pr=" + getQueryString("pr") + "&";
	}
	var url="http://bbs.y3.cn/wechat/website/server/reg.php?sign=" + sign + "&" + valuetxt;
	//alert(url);
	$.ajax({
		url : url,
		dataType : "jsonp",
		jsonp:"callback",
		success : function(json){
			manager.setUserInfo(json,"玩家");
			callback();
		},
		error : function(e){
			//alert("json_error");
		}
	});
}

LocalStorageManager.prototype.updateUserInfo = function (value,manager,actuator,gameManager) {
    var url="http://bbs.y3.cn/wechat/website/server/token.php";
	$.ajax({
		url : url,
		dataType : "jsonp",
		jsonp:"callback",
		success : function(json){
			//alert(json);
			manager.updateUserInfoTodo(json,value,manager,actuator,gameManager);
		},
		error : function(e){
			//alert("json_error");
		}
	});
	
};
LocalStorageManager.prototype.updateUserInfoTodo = function (sign,value,manager,actuator,gameManager) {
	var valuetxt = "";
	for(var i in value){
		if(value[i]){
			valuetxt += i + "=" + value[i] + "&";
		}
	}
	
	var url="http://bbs.y3.cn/wechat/website/server/user.php?sign=" + sign + "&order=update_name&" + valuetxt;
	//alert(url);
	$.ajax({
		url : url,
		dataType : "jsonp",
		jsonp:"callback",
		success : function(json){
			manager.setUserInfo(value["key"],value["name"]);
			actuator.updateUserInfo(manager.getUserInfoName());
			gameManager.updateUserTodo();
		},
		error : function(e){
			//alert("json_error");
		}
	});
}

LocalStorageManager.prototype.updateGameScore= function (value,manager,callback) {
    var url="http://bbs.y3.cn/wechat/website/server/token.php";
	$.ajax({
		url : url,
		dataType : "jsonp",
		jsonp:"callback",
		success : function(json){
			//alert(json);
			manager.updateGameScoreTodo(json,value,manager,callback);
		},
		error : function(e){
			//alert("json_error");
		}
	});
	
};
LocalStorageManager.prototype.updateGameScoreTodo = function (sign,value,manager,callback) {
	var valuetxt = "";
	for(var i in value){
		//if(value[i]){
			valuetxt += i + "=" + value[i] + "&";
		//}
	}
	
	var url="http://bbs.y3.cn/wechat/website/server/user.php?sign=" + sign + "&order=update_score&" + valuetxt;
	//alert(url);
	$.ajax({
		url : url,
		dataType : "jsonp",
		jsonp:"callback",
		success : function(json){
			//alert(json.split("|"));
			callback(json.split("|"));
		},
		error : function(e){
			//alert("json_error");
		}
	});
}


LocalStorageManager.prototype.getRank = function (value,manager,callback) {
    var url="http://bbs.y3.cn/wechat/website/server/token.php";
	$.ajax({
		url : url,
		dataType : "jsonp",
		jsonp:"callback",
		success : function(json){
			
			manager.getRankTodo(json,value,manager,callback);
		},
		error : function(e){
			//alert("json_error");
		}
	});
	
};

LocalStorageManager.prototype.getRankTodo = function (sign,value,manager,callback) {
	var valuetxt = "";
	for(var i in value){
		if(value[i]){
			valuetxt += i + "=" + value[i] + "&";
		}
	}
	
	var url="http://bbs.y3.cn/wechat/website/server/user.php?sign=" + sign + "&order=get_rank&" + valuetxt;
	//alert("--" + url);
	$.ajax({
		url : url,
		dataType : "jsonp",
		jsonp:"callback",
		success : function(json){
			//alert(json.split("|"));
			callback(json.split("|"));
		},
		error : function(e){
			//alert("json_error");
		}
	});
}


// Game state getters/setters and clearing
LocalStorageManager.prototype.getGameState = function () {
  var stateJSON = this.storage.getItem(this.gameStateKey);
  return stateJSON ? JSON.parse(stateJSON) : null;
};

LocalStorageManager.prototype.setGameState = function (gameState) {
  this.storage.setItem(this.gameStateKey, JSON.stringify(gameState));
};

LocalStorageManager.prototype.clearGameState = function () {
  this.storage.removeItem(this.gameStateKey);
};


LocalStorageManager.prototype.clearAll = function () {
  this.storage.removeItem(this.gameStateKey);
  this.storage.removeItem(this.bestScoreKey);
  this.storage.removeItem(this.userInfoKey);
  this.storage.removeItem(this.userInfoName);
};


LocalStorageManager.prototype.getUserOS = function () {
	var i_userinfo = window.navigator.userAgent.toLowerCase();
	var osArr = {
		Android:["android"],
		Apple:["ipad","ipod","iphone"],
		Windows:["windows"],
	};
	var returnObj = new Object();
	returnObj["sys"] = "Other";
	returnObj["sys_beta"] = "";
	returnObj["browse"]  = "Other";
	returnObj["browse_beta"] = "";
	returnObj["px"] = + window.screen.width + "|" + + window.screen.height;
	for(var i in osArr){
		for (var j in osArr[i]){
			if(i_userinfo.indexOf(osArr[i][j]) >= 0){
				returnObj["sys"] = i;
				returnObj["browse"]  = osArr[i][j];
				break;
			}
		}
	}
	switch(returnObj["sys"]){
		case "Android":
			returnObj["sys_beta"] = i_userinfo.split("android ")[1].split(";")[0];
			tempArr = i_userinfo.split(" build")[0].split(";")
			returnObj["browse"] = tempArr[tempArr.length -1];
			returnObj["browse_beta"] = "none";
			break;
		case "Apple":
			returnObj["sys_beta"] = i_userinfo.split("iphone os ")[1].split(" ")[0].replace("_",".").replace("_",".");
			returnObj["browse"] = "none";
			returnObj["browse_beta"] = "none";
			break;
		case "Windows":
			returnObj["sys_beta"] = i_userinfo.split("windows nt ")[1].split(")")[0].replace("_",".").replace("_",".");
		default:
			temp = i_userinfo.split("like gecko) ")[1].split(" ")[0]
			returnObj["browse"]  = i_userinfo.split("like gecko) ")[1].split(" ")[0].split("/")[0];
			returnObj["browse_beta"] = temp.split("/")[1].replace("_",".");
	}
	
	return returnObj;
};
