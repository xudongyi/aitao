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

var bootPATH = __CreateJSPath("boot.js");

//debugger
mini_debugger = false;

/*****miniui导入开始******/
document.write('<link href="' + bootPATH + '/js/miniui/themes/default/miniui.css" rel="stylesheet" type="text/css" />');
document.write('<link href="' + bootPATH + '/js/miniui/themes/icons.css" rel="stylesheet" type="text/css" />');
document.write('<script src="' + bootPATH + '/js/jquery-1.9.1.min.js" type="text/javascript"></script>');
document.write('<script src="' + bootPATH + '/js/common.js" type="text/javascript"></script>');
document.write('<script src="' + bootPATH + '/js/miniui/miniui.js"></script>');
//miniui改版
document.write('<link href="' + bootPATH + '/js/miniui/themes/hh/skin.css" rel="stylesheet" type="text/css" />');
//汇环miniui框架
document.write('<link href="' + bootPATH + '/js/miniui/themes/hh/huihuan.css" rel="stylesheet" type="text/css" />');
/*****miniui导入结束******/

////////////////////////////////////////////////////////////////////////////////////////
function getCookie(sName) {
    var aCookie = document.cookie.split("; ");
    var lastMatch = null;
    for (var i = 0; i < aCookie.length; i++) {
        var aCrumb = aCookie[i].split("=");
        if (sName == aCrumb[0]) {
            lastMatch = aCrumb;
        }
    }
    if (lastMatch) {
        var v = lastMatch[1];
        if (v === undefined) return v;
        return unescape(v);
    }
    return null;
}

function setcookie(name, value,days) {
    var Days = 30;
    var exp = new Date();
    exp.setTime(exp.getTime() + Days * 24 * 60 * 60 * 1000);
    document.cookie = name + "=" + escape(value) + ";expires=" + exp.toGMTString();
}