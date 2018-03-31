
// 对Date的扩展，将 Date 转化为指定格式的String
// 月(M)、日(d)、小时(h)、分(m)、秒(s)、季度(q) 可以用 1-2 个占位符， 
// 年(y)可以用 1-4 个占位符，毫秒(S)只能用 1 个占位符(是 1-3 位的数字) 
// 例子： 
// (new Date()).Format("yyyy-MM-dd hh:mm:ss.S") ==> 2006-07-02 08:09:04.423 
// (new Date()).Format("yyyy-M-d h:m:s.S")      ==> 2006-7-2 8:9:4.18 
Date.prototype.Format = function(fmt) { //author: meizz 
    var o = {
        "M+": this.getMonth() + 1, //月份
        "d+": this.getDate(), //日
        "h+": this.getHours(), //小时
        "m+": this.getMinutes(), //分
        "s+": this.getSeconds(), //秒
        "q+": Math.floor((this.getMonth() + 3) / 3), //季度
        "S": this.getMilliseconds() //毫秒
    };
    if(/(y+)/.test(fmt)) fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
    for(var k in o)
        if(new RegExp("(" + k + ")").test(fmt)) fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
    return fmt;
}

/**将多个js引入在同一个文件中****/
__CreateJSPath = function(js) {
    var scripts = document.getElementsByTagName("script");
    var path = "";
    for(var i = 0; i < scripts.length; i++) {
        var src = scripts[i].src;
        if(src.indexOf(js) != -1) {
            var ss = src.split(js)[0].split("/js");
            path = ss[0];
            break;
        }
    }
    var href = location.href;
    href = href.split("#")[0];
    href = href.split("?")[0];
    var ss = href.split("/");
    ss.length = ss.length - 1;
    href = ss.join("/");
    if(path.indexOf("https:") == -1 && path.indexOf("http:") == -1 && path.indexOf("file:") == -1 && path.indexOf("\/") != 0) {
        path = href + "/" + path;
    }
    return path;
}

var bootPATH = __CreateJSPath("boot_front.js");
/***框架的引入***/
document.write('<script src="' + bootPATH + '/js/jquery-1.9.1.min.js"></script>');
document.write('<script src="' + bootPATH + '/js/common_front.js"></script>');
document.write('<script src="' + bootPATH + '/js/layer/layer.js"></script>');
document.write('<script src="' + bootPATH + '/js/avalon/avalon.js"></script>');
document.write('<script src="' + bootPATH + '/js/front/all.js"></script>');
document.write('<script src="' + bootPATH + '/js/front/temp.js"></script>');


/***通用的css文件引入***/
document.write('<link href="' + bootPATH + '/css/front/all.css" rel="stylesheet" type="text/css" />');
