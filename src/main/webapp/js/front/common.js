var StringUtils = {

	/****************************************************************************
	 * 将字符串数组转换成以逗号隔开的字符串
	 * @author fgg047 <9110530@qq.com>
	 * @param {Array} array 字符串数组对象
	 * Note:
	 ****************************************************************************/
	toString: function(array) {
		var s = "";
		if(array == null || array.length == 0) {
			return s;
		}
		for(var i = 0; i < array.length; i++) {
			s = s + array[i] + ',';
		}
		return s.substring(0, s.length - 1);
	},

	/****************************************************************************
	 * 将JS日期对象转换成指定格式的字符串
	 * @author fgg047 <9110530@qq.com>
	 * @param {Date} d 日期对象
	 * @param {String} pattern 字符串格式
	 * Note:
	 ****************************************************************************/
	toString : function(d, pattern) {
		// 年
		var i = pattern.indexOf('y');
		var j = pattern.lastIndexOf('y');
		if(i != -1) {
			var v = pattern.substring(i, j + 1);
			pattern = pattern.replace(v, d.getFullYear());
		}
		// 月
		i = pattern.indexOf('M');
		j = pattern.lastIndexOf('M');
		if(i != -1) {
			var m = "M";
			if(i != j) {
				m = "MM";
			}
			var v = d.getMonth() + 1 + "";
			if(v.length == 2) {
				pattern = pattern.replace(m, v);
			} else {
				if(m == "MM") {
					v = "0" + v;
				}
				pattern = pattern.replace(m, v);
			}
		}
		// 日
		i = pattern.indexOf('d');
		j = pattern.lastIndexOf('d');
		if(i != -1) {
			var m = "d";
			if(i != j) {
				m = "dd";
			}
			var v = d.getDate() + "";
			if(v.length == 2) {
				pattern = pattern.replace(m, v);
			} else {
				if(m == "dd") {
					v = "0" + v;
				}
				pattern = pattern.replace(m, v);
			}
		}
		// 时
		i = pattern.indexOf('H');
		j = pattern.lastIndexOf('H');
		if(i != -1) {
			var m = "H";
			if(i != j) {
				m = "HH";
			}
			var v = d.getHours() + "";
			if(v.length == 2) {
				pattern = pattern.replace(m, v);
			} else {
				if(m == "HH") {
					v = "0" + v;
				}
				pattern = pattern.replace(m, v);
			}
		}
		// 分
		i = pattern.indexOf('m');
		j = pattern.lastIndexOf('m');
		if(i != -1) {
			var m = "m";
			if(i != j) {
				m = "mm";
			}
			var v = d.getMinutes() + "";
			if(v.length == 2) {
				pattern = pattern.replace(m, v);
			} else {
				if(m == "mm") {
					v = "0" + v;
				}
				pattern = pattern.replace(m, v);
			}
		}
		// 秒
		i = pattern.indexOf('s');
		j = pattern.lastIndexOf('s');
		if(i != -1) {
			var m = "s";
			if(i != j) {
				m = "ss";
			}
			var v = d.getSeconds() + "";
			if(v.length == 2) {
				pattern = pattern.replace(m, v);
			} else {
				if(m == "ss") {
					v = "0" + v;
				}
				pattern = pattern.replace(m, v);
			}
		}
		// 毫秒
		i = pattern.indexOf('S');
		j = pattern.lastIndexOf('S');
		if(i != -1) {
			var m = "S";
			if(i != j) {
				m = "SSS";
			}
			var v = d.getMilliseconds() + "";
			if(v.length == 3) {
				pattern = pattern.replace(m, v);
			} else {
				if(m == "SSS") {
					v = "00" + v;
					if(v.length == 2) {
						v = "00" + v;
					}
					v = v.length == 2 ? "0" + v : "00" + v;
				}
				pattern = pattern.replace(m, v);
			}
		}
		return pattern;
	}
}

/****************************************************************************
 * Html组件模板对象
 * @constructor
 * @param {String} id Html组件的id标识.
 * @author fgg047 <fgg047@sohu.com>
 * Note:
 ****************************************************************************/
function HtmlTemplet(id) {
		// 拆分模板
	var i = 0,
		j = 0;
	var key = "",
		val = "";
	this.html = "";
	this.htmlArray = [];
	this.keyArray = [];
	this.widget = $("#" + id);
	html = this.widget.html();
	// html = "<tr><td>${title}</td><td>${age}</td><td>===&gt;</td><td>1</td><td>2</td><td>===&gt;</td><td>2</td></tr>";
	i = html.indexOf("${");
	while(i != -1) {
		// 截取Html前段文本
		this.htmlArray.push(html.substring(j, i));
		j = html.indexOf("}", i);
		// 截取中间变量文本
		key = html.substring(i + 2, j);
		this.keyArray.push(key);
		// 回归下一个起点，找下一个变量位置
		j = j + 1;
		i = html.indexOf("${", j);
	}
	this.htmlArray.push(html.substring(j, html.length));
}

HtmlTemplet.prototype = {
    constructor : HtmlTemplet,

	/****************************************************************************
	 * 加载Html组件数据
	 * @author fgg047 <9110530@qq.com>
	 * @param {Object} data 数据对象
	 * Note:
	 ****************************************************************************/
	setData : function(data) {
		// 拆分模板
		var i = 0,
			j = 0;
		var html = "";
		// 生成数据
		if(data instanceof Array) {
			for(i = 0; i < data.length; i++) {
				data[i]["index"] = i + 1;
				for(j = 0; j < this.keyArray.length; j++) {
					html = html + this.htmlArray[j];
					html = html + this._getValue(this.keyArray[j], data[i]);
				}
				html = html + this.htmlArray[this.keyArray.length];
			}
		} else {
			for(j = 0; j < this.keyArray.length; j++) {
				html = html + this.htmlArray[j];
				html = html + this._getValue(this.keyArray[j], data);
			}
			html = html + this.htmlArray[this.keyArray.length];
		}
		this.widget.empty();
		this.widget.append(html);
	},

	/****************************************************************************
	 * 根据键名从对象属性中获取值
	 * @author fgg047 <9110530@qq.com>
	 * @param {String} key 键名
	 * @param {Object} val 数据对象
	 * @return 值数据
	 * Note:
	 ****************************************************************************/
	_getValue : function(key, val) {
		var format = "";
		key = $.trim(key);
		if(key.indexOf(".") != -1) {
			var arr = key.split(".");
			if(arr[arr.length - 1].indexOf("format") != -1) {
				format = arr.pop();
				format = format.substring(format.indexOf("(") + 1, format.indexOf(")"));
			}
			for(var i = 0; i < arr.length; i++) {
				val = val[arr[i]];
			}
			format = $.trim(format);
			if(format != "") {
				// 格式化字符串
				// type:string;pattern:YY-MM-DD;render:sexAction;
				var key, value;
				var type = "",
					pattern = "",
					render = "";
				if(format.indexOf(";") != -1) {
					var arr = format.split(";");
					for(var i = 0; i < arr.length; i++) {
						var v = arr[i].split(":");
						key = $.trim(v[0]);
						value = $.trim(v[1]);
						if(key == "type") {
							type = value;
						} else if(key == "pattern") {
							pattern = value;
						} else if(key == "render") {
							render = value;
						}
					}
				} else {
					var v = format.split(":");
					key = $.trim(v[0]);
					if(key == "type") {
						type = $.trim(v[1]);
					} else if(key == "pattern") {
						pattern = $.trim(v[1]);
					} else if(key == "render") {
						render = $.trim(v[1]);
					}
				}
				// 如果有格式化函数，直接使用它
				if(render != "") {
					val = eval(render + "(" + val + ")");
				} else {
					// 如果有格式
					if(pattern != "") {
						if(type = "date") {
							if(val != undefined) {
								var d = new Date(val);
								val = StringUtils.toString(d, pattern);
							}
						}
					}
				}
			}
		} else {
			val = val[key];
		}
		if(val == undefined) {
			val = "";
		}
		return val;
	}
};

/****************************************************************************
 * Cookie操作对象
 * @constructor
 * @author fgg047 <fgg047@sohu.com>
 * Note:
 ****************************************************************************/
function CookieBean() {
}

CookieBean.prototype = {
    constructor : CookieBean,

	/****************************************************************************
	 * 写入cookie
	 * @author fgg047 <9110530@qq.com>
	 * @param {String} name 键名称
	 * @param {Object} value 值对象
	 * Note:
	 ****************************************************************************/
	setCookie: function(name, value) {
		var Days = 30; //此 cookie 将被保存 30 天
		var exp = new Date();
		exp.setTime(exp.getTime() + Days * 24 * 60 * 60 * 1000);
		document.cookie = name + "=" + escape(value) + ";expires=" + exp.toGMTString();
	},
	
	/****************************************************************************
	 * 删除cookie
	 * @author fgg047 <9110530@qq.com>
	 * @param {String} name 键名称
	 * Note:
	 ****************************************************************************/
	delCookie: function(name) {
		var exp = new Date();
		exp.setTime(exp.getTime() - 1);
		var cval = getCookie(name);
		if(cval != null) document.cookie = name + "=" + cval + ";expires=" + exp.toGMTString();
	},
	
	/****************************************************************************
	 * 读取cookie
	 * @author fgg047 <9110530@qq.com>
	 * @param {String} name 键名称
	 * Note:
	 ****************************************************************************/
	getCookie: function(name) {
		var arr = document.cookie.match(new RegExp("(^| )" + name + "=([^;]*)(;|$)"));
		if(arr != null)
			return unescape(arr[2]);
		return null;
	}
}

/****************************************************************************
 * Http请求对象
 * @constructor
 * @param {String} url 根目录.
 * @author fgg047 <fgg047@sohu.com>
 * Note:
 ****************************************************************************/
function HttpBean(url) {
	this.rootUrl = arguments[0] ? arguments[0] : "";
}

HttpBean.prototype = {
    constructor : HttpBean,

    /****************************************************************************
	 * 从Url请求地址中获取请求参数并转换成Json对象格式
	 * @author fgg047 <9110530@qq.com>
	 * @param {String} url 请求地址
	 * Note:
	 ****************************************************************************/
	getJsonFromUrl: function(url) {
		var paraString = url.substring(url.indexOf("?") + 1, url.length).split("&");
		var json = {}
		for(i = 0; j = paraString[i]; i++) {
			json[j.substring(0, j.indexOf("="))] = j.substring(j.indexOf("=") + 1, j.length);
		}
		return json;
	},

    /****************************************************************************
	 * 将Json对象格式的请求参数附加到Url请求上
	 * @author fgg047 <9110530@qq.com>
	 * @param {String} url 请求地址
	 * @param {JSON} json 请求参数
	 * Note:
	 ****************************************************************************/
	getUrlFromJson: function(url, json) {
		var html = "";
		for(var p in json) {
			html = html + p + "=" + json[p] + "&";
		}
		if(html != "") {
			url = url + "?" + html.substring(0, html.length - 1);
		}
		return url;
	},

    /****************************************************************************
	 * 发起http的同步get请求
	 * @author fgg047 <9110530@qq.com>
	 * @param {String} url 请求地址
	 * @param {String} params 请求参数(非必须)
	 * @param {String} header 请求头部(非必须)
	 * Note:
	 ****************************************************************************/
	get: function(url, params, header) {
		_params = arguments[1] ? arguments[1] : {};
		_header = arguments[2] ? arguments[2] : {};
		return this._httpRequest(url, _params, _header, "GET", false, null);
	},

    /****************************************************************************
	 * 发起http的异步get请求
	 * @author fgg047 <9110530@qq.com>
	 * @param {String} url 请求地址
	 * @param {Function} success 请求成功后的回调函数
	 * @param {String} params 请求参数(非必须)
	 * @param {String} header 请求头部(非必须)
	 * Note:
	 ****************************************************************************/
	getAsync: function(url, success, params, header) {
		_params = arguments[2] ? arguments[2] : {};
		_header = arguments[3] ? arguments[3] : {};
		return this._httpRequest(url, _params, _header, "GET", true, success);
	},

	/****************************************************************************
	 * 发起http的同步post请求
	 * @author fgg047 <9110530@qq.com>
	 * @param {String} url 请求地址
	 * @param {String} params 请求参数(非必须)
	 * @param {String} header 请求头部(非必须)
	 * Note:
	 ****************************************************************************/
	post: function(url, params, header) {
		_params = arguments[1] ? arguments[1] : {};
		_header = arguments[2] ? arguments[2] : {};
		return this._httpRequest(url, _params, _header, "POST", false, null);
	},

	/****************************************************************************
	 * 发起http的异步post请求
	 * @author fgg047 <9110530@qq.com>
	 * @param {String} url 请求地址
	 * @param {Function} success 请求成功后的回调函数
	 * @param {String} params 请求参数(非必须)
	 * @param {String} header 请求头部(非必须)
	 * Note:
	 ****************************************************************************/
	postAsync: function(url, success, params, header) {
		_params = arguments[2] ? arguments[2] : {};
		_header = arguments[3] ? arguments[3] : {};
		return this._httpRequest(url, _params, _header, "GET", true, success);
	},

    /****************************************************************************
	 * 发起http的get请求
	 * @author fgg047 <9110530@qq.com>
	 * @param {String} url 请求地址
	 * @param {String} params 请求参数
	 * @param {String} header 请求头部
	 * @param {String} type 请求类型
	 * @param {Boolean} async 是否为异步
	 * @param {Function} success 请求成功后的回调函数
	 * Note:
	 ****************************************************************************/
	_httpRequest: function(url, params, header, type, async, success) {
		_url = this.rootUrl + url;	
		var val;
		$.ajax({
			url: _url,
			type: type, // GET或POST
			async: async, // 或false,是否异步
			data: params,
			timeout: 5000, //超时时间
			dataType: 'json', //返回的数据格式：json/xml/html/script/jsonp/text
			beforeSend: function(XMLHttpRequest) {
				for(var p in header) {
					XMLHttpRequest.setRequestHeader(p, _header[p]);
				}
			},
			success: function(data, textStatus, jqXHR) {
				// 如果是异步，则执行回调函数
				if(async) {
					success(data);
				} else {
					val = data;
				}
//				console.log(data);
			},
			error: function(jqXHR, textStatus, errorThrown) {
				switch(jqXHR.status) {
					case(500):
						alert("服务器系统内部错误");
						break;
					case(401):
						alert("未登录");
						break;
					case(403):
						alert("无权限执行此操作");
						break;
					case(408):
						alert("请求超时");
						break;
					default:
					console.log(jqXHR.status)
				}
			}
		});
		// 如果是同步，返回请求结果
		if(!async) {
			return val;
		}
	}
}

//API服务地址
var baseUrl = "http://139.196.225.100:8090";
//   var baseUrl = "http://localhost:9090";
//http请求实例
var http = new HttpBean(baseUrl);


