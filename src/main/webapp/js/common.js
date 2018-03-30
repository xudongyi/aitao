/******************************************************************************************
 * 基础工具方法
 *****************************************************************************************/
/**
 * 查看按钮跳转
 * @author fengjian
 * @param viewUrl 跳转地址
 * @param id 主键值
 */
function goView(viewUrl, id) {
	if (viewUrl && id) {
		var url = "";
		if (viewUrl.indexOf("?") != -1) {
			url = viewUrl + "&id=" + id + "&d=" + new Date();
		} else {
			url = viewUrl + "?id=" + id + "&d=" + new Date();
		}
		window.location = url;
	}
}

/**
 * 转换日期格式
 * @author fengjian
 * @param dateObjStr 日期字符串
 * @return 字符串形式 格式如：2012-01-02
 */
function dateObj2View(dateObjStr) {
	var str = "";
	if (dateObjStr) {
		var d = new Date(dateObjStr);
		var year = d.getFullYear() + "";
		var month = (d.getMonth() + 1) + "";
		var day = d.getDate() + "";
		if (month < 10)
			month = "0" + month;
		if (day < 10)
			day = "0" + day;
		str = year + "-" + month + "-" + day;
	}
	return str;
}

/**
 * 转换日期格式
 * @author fengjian
 * @param dateObjStr 日期字符串
 * @return 字符串形式 格式如：2012-01-02 12:12:12
 */
function dateObj2ViewDe(dateObjStr) {
	var str = "";
	if (dateObjStr) {
		var d = new Date(dateObjStr);
		var year = d.getFullYear() + "";
		var month = (d.getMonth() + 1) + "";
		var day = d.getDate() + "";
		var hour = d.getHours();
		var min = d.getMinutes();
		var second = d.getSeconds();

		if (month < 10)
			month = "0" + month;
		if (day < 10)
			day = "0" + day;
		if (hour < 10)
			hour = "0" + hour;
		if (min < 10)
			min = "0" + min
		if (second < 10)
			second = "0" + second;
		str = year + "-" + month + "-" + day + " " + hour + ":" + min + ":"
				+ second;
	}
	return str;
}

/**
 * 截取日期字符串的前10位 2014-01-01
 * @author fengjian
 * @param str 日期字符串
 * @return 字符串形式 格式如：2012-01-02
 */
function subDate(str) {
	if (str && str.length > 10) {
		return str.substring(0, 10);
	}
	return str;
}

/**
 * 截取字符串固定位数并添加省略号
 * @author fengjian
 * @param str 字符串
 * @param len 指定长度
 * @return 字符串
 */
function subString(str, len) {
	// 先取出换行前的文字
	if (str) {
		if (str.indexOf("\n") != -1) {
			str = str.substring(0, str.indexOf("\n"));
		}
		if (str.length > len) {
			str = str.substring(0, len) + "...";
		}
	}
	return str;
}

/**
 * 去除前后空格
 * 类似java中string的trim方法
 * @author fengjian
 * @return 字符串
 */
// 类似java中string的trim方法，去除前后空格
String.prototype.trim = function() {
	return this.replace(/(^\s*)|(\s*$)/g, "");
};

/**
 * 删除左右两端的空格
 * @author fengjian
 * @param str
 */
function trimString(str) {
	return str.replace(/(^\s*)|(\s*$)/g, "");
}

/******************************************************************************************
 * miniUI的方法集
 *****************************************************************************************/
/**
 * 操作成功的通用提示
 * @author fengjian
 * @param content
 */
function showSuccessTip(content) {
	mini.showTips({
		content : content,
		state : 'success',// default、success、info、warning、danger
		x : 'center',// left、center、right
		y : 'top',// top、center、bottom
		timeout : 3000
	});
}
/**
 * 操作失败的通用提示
 * @author fengjian
 * @param content
 */
function showFailTip(content) {
	mini.showTips({
		content : content,
		state : 'warning',// default、success、info、warning、danger
		x : 'center',// left、center、right
		y : 'top',// top、center、bottom
		timeout : 3000
	});
}
/**
 * 提醒信息的通用提示
 * @author fengjian
 * @param content
 */
function showInfoTip(content) {
	mini.showTips({
		content : content,
		state : 'info',// default、success、info、warning、danger
		x : 'center',// left、center、right
		y : 'top',// top、center、bottom
		timeout : 3000
	});
}
/**
 * 提示信息的通用提示
 * @author fengjian
 * @param message
 */
function showInfoMessageBox(message) {
	var title = "信息";
	var icon = "mini-messagebox-info";
	mini.showMessageBox({
		title : title,
		message : message,
		buttons : [ "ok" ],
		iconCls : icon
	});
}
/**
 * 警告信息的通用提示
 * @author fengjian
 * @param message
 */
function showWarnMessageBox(message) {
	var title = "警告";
	var icon = "mini-messagebox-warn";
	mini.showMessageBox({
		title : title,
		message : message,
		buttons : [ "ok" ],
		iconCls : icon
	});
}
/**
 * 错误信息的通用提示
 * @author fengjian
 * @param message
 */
function showErrorMessageBox(message) {
	var title = "错误";
	var icon = "mini-messagebox-error";
	mini.showMessageBox({
		title : title,
		message : message,
		buttons : [ "ok" ],
		iconCls : icon
	});
}
/**
 * 列表数据加载失败时的提示信息
 * @author fengjian
 * @param message
 */
function showLoadErrorMessageBox() {
	showErrorMessageBox("列表数据加载失败！");
}
/**
 * 绑定二个控件不能一个非空，一个空值
 * @author fengjian
 * @param c1, c2 - 二个控件
 */
function synchronousRequired(c1, c2) {
	if (c1.value) {
		c1.setRequired(true);
		c2.setRequired(true);
	} else if (c2.value) {
		c1.setRequired(true);
		c2.setRequired(true);
	} else {
		c1.setRequired(false);
		c2.setRequired(false);
	}
	c1.validate();
	c2.validate();
}

/**
 * 从列表中根据键名和键值取得对应的所有属性数据
 * @author fengjian
 * @createDate 2015-03-09
 * @param list - 列表
 * @param key - 键名
 * @param val - 键值
 */
function getDetail(list, key, val) {
	for ( var i in list) {
		if (list[i][key] == val) {
			return list[i];
		}
	}
	return null;
}

/**
 * 从列表中根据键名取得对应的键值，拼接成字符串，以逗号隔开
 * @author fengjian
 * @createDate 2015-05-27
 * @param list - 列表
 * @param key - 键名
 */
function getListKeys(list, key) {
	var str = "";
	for (var i = 0; i < list.length; i++) {
		if (list[i][key] != "") {
			str = str + list[i][key] + ',';
		}
	}
	if (str != "") {
		str = str.substr(0, str.length - 1);
	}
	return str;
}

/**
 * 部分更新Json格式数据
 * @author fengjian
 * @createDate 2015-03-09
 * @param source - 源数据
 * @param target - 目标数据
 */
function updateJson(source, target) {
	for ( var key in source) {
		target[key] = source[key];
	}
}

/**
 * 从源到目的更新Json格式数据，根据Key参数是否存在执行更新或新增操作
 * @author fengjian
 * @createDate 2015-03-09
 * @param source - 源数据
 * @param target - 目标数据
 * @param key - 主键
 */
function updateJsonList(source, target, key) {
	for ( var i in source) {
		// 如果源数据中主键存在，则更新此数据至目标对象
		if (source[i][key]) {
			var t = getDetail(target, key, source[i][key]);
			updateJson(source[i], t);
		}
		// 如果源数据中主键不存在，则添加此数据至目标对象
		else {
			target.push(source[i]);
		}
	}
}

/**
 * 设置表单的所有控件是否可编辑
 * @author fengjian
 * @createDate 2015-03-09
 * @param form - 表单对象
 * @param enable - true or false
 */
function setFormControlEnable(form, enable) {
	var controls = form.getFields();
	for (var i = 0; i < controls.length; i++) {
		controls[i].setEnabled(enable);
	}
}

/**
 * 加遮罩层
 * @author fengjian
 * @createDate 2015-03-24
 * @param title - 标题
 */
function miniUIMask(title) {
	mini.mask({
		el : document.body, // 要遮罩的元素
		cls : 'mini-mask-loading', // 图标样式
		html : title
	// 内容
	});
}

/**
 * 取消遮罩层
 * @author fengjian
 * @createDate 2015-03-24
 */
function unMiniUIMask() {
	mini.unmask(document.body);
}


/**
 * 获取上传文件大小
 * @param file
 * @returns
 */
function getFileSize(file){
	var filesize = 0;
	if(file.value==""){
		return filesize;
	}
	var  Sys = {};
	if(navigator.userAgent.indexOf("MSIE")>0)
	{
	    Sys.ie=true;
	}
  
     if(Sys.ie)
    {
    	var fileobject ;
    	try{
    		fileobject  = new ActiveXObject ("Scripting.FileSystemObject");//获取上传文件的对象
    	}catch(e){
    		mini.alert("当前浏览器不支持ActiveX控件，无法获取文件大小");
    	}
    	if(fileobject){
    		  var file = fileobject.GetFile (file.value);//获取上传的文件
  	          var filesize = file.Size;//文件大小
    	}
    }else{
    	try{
    		filesize = file.files[0].size;
    	}catch(e){
    		mini.alert("当前浏览器无法获取文件大小");
    	}
    }
    return filesize;
}