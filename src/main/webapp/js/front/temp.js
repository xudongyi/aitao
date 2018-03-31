//组件
//顶部组件
avalon.component('ms-top', {
	template: '<div class="login">' +
		'<div class="login_menu">' +
		'<div :if="@isLogin" class="login_left">' +
		'<span>您好！{{@user.userName}}</span>' +
		'<span>{{@user.tel}}</span>' +
		'<span><a href="javascript:;" ms-on-click="@loginout">[退出]</a></span>' +
		'</div>' +
		'<div :if="!@isLogin" class="login_left">' +
		'<span>您好,欢迎来到爱淘网</span>' +
		'<span><a ms-attr="{href:@pagePath+\'login/login.html\'}">[请登录]</a></span>' +
		'</div>' +
		'<div class="login_right">' +
		'<a ms-attr="{href:@pagePath+\'home.html\'}"><span>首页</span><span class="shu">|</span></a>' +
        '<a ms-attr="{href:@pagePath+\'home.html\'}"><span>我是商家</span><span class="shu">|</span></a>' +
		'<a :if="@isLogin"  ms-attr="{href:@pagePath+\'user/index.html?userID=\'+@user.userID}"><span><img ms-attr="{src:@imgPath+\'images/front/home/xinxi.png\'}"/>我的信息</span><span class="shu">|</span></a>' +
		'<a :if="@isLogin" ms-attr="{href:@pagePath+\'user/user-addition.html?userID=\'+@user.userID}"><span><img ms-attr="{src:@imgPath+\'images/front/home/shop.png\'}"/>我的收藏</span><span class="shu">|</span></a>' +
		'<a href="javascript:;" ms-on-click="@shopsurport"><span>商家支持</span></a><span class="shu">|</span>' +
		'<a href="javascript:;" ms-on-click="@customer"><span>客服中心</span></a><span class="shu">|</span>' +
		'<span>服务电话：<span class="phone">18651072708</span></span>' +
		'</div>' +
		'</div>' +
		'</div>',
	defaults: {
		level: 0, //路径的层级
		imgPath: "../../",
		pagePath: "",
		isLogin: false,
		login: function() { //登录

		},
		loginout: function() { //退出
			this.isLogin = false;
			localStorage.removeItem("user");
			window.location.href=this.pagePath+'home.html';
		},
		onInit: function() {
            var hostname = location.hostname;
            var port = location.port;
            var baseUrl = "http://"+hostname+":"+port;
            this.imgPath = baseUrl+"/aitao/";
			//初始化数据
			if(localStorage.getItem("user")!=null){
				var user = JSON.parse(localStorage.getItem("user"));
				this.user = user;
				this.isLogin = true;
			}
			
		},
		myCollection: function() {
			alert("我的收藏")
		},
		customer: function() {
			// alert("客服中心")
		},
		shopsurport: function() {
			// alert("商家支持");
		}
	},

});

//logo+搜索栏
avalon.component('ms-search', {
	template: '<div class="search">' +
		'<div class="sec">' +
		'<div class="sec_left">' +
		'<a ms-attr="{href:@pagePath+\'home.html\'}">' +
		'<img ms-attr="{src:@imgPath+\'images/aitao_logo.jpg\'}"/>' +
		'</a>' +
		'</div>' +
		'<div class="sec_right" >' +
		'<div>' +
		'<div ms-on-click="@serachChange(1)" :class="[\'ghs\', (@searchType==1?\'tab_active\':\'\')]">' +
		'商品' +
		'</div>' +
		'<div ms-on-click="@serachChange(2)" :class="[\'sp\', (@searchType==2?\'tab_active\':\'\')]">' +
		'厂家 ' +
		'</div>' +
		'</div>' +
		'<div class="sousuo">' +
		'<img ms-attr="{src:@imgPath+\'images/front/home/ss.png\'}"/>' +
		'<input type="text" ms-duplex="inputValue" ms-attr="{placeholder:@placeholder}" />' +
		'<div ms-on-click="@search" class="ss">搜索</div>' +
		'</div>' +
		'</div>' +
		'</div>' +
		'</div>',
	defaults: {
		level: 1, //路径的层级
		imgPath: "../",
		pagePath: "",
		searchType: 1, //默认
		inputValue:"",
		placeholder: "请输入您需要搜索的内容",
		onInit: function() {
            var hostname = location.hostname;
            var port = location.port;
            var baseUrl = "http://"+hostname+":"+port;
		    this.imgPath = baseUrl+"/aitao/";
		},
		serachChange: function(type) {
			this.searchType = type;
			if(type == 1) {
				this.placeholder = "请输入商品关键词";
			} else if(type == 2) {
				this.placeholder = "请输入厂商关键词";
			}
		},
		search: function() {
			var user = JSON.parse(localStorage.getItem("user"));
			if(this.searchType!=1&&this.inputValue==""){
				alert("请输入您需要搜索的内容!");
				return;
			}
			if(this.searchType==1){
				window.location.href=this.pagePath+"shop/shopList.html?sellerName="+this.inputValue+"&userId="+user.userID
			}else if(this.searchType==2){
				window.location.href=this.pagePath+"category/sea-category.html?goodsName="+this.inputValue
			}
		}

	},

});

//头部导航开始

avalon.component('ms-nav', {
	template: '<div class="header">' +
		'<div class="qbfl">' +
		'<span><a ms-attr="{href:@pagePath+\'category/allcategory.html\'}">爱淘网采购平台</a></span>' +
		'</div>' +
		'<ul>' +
		'<li><a class="blue" ms-attr="{href:@pagePath+\'home.html\'}">首页</a></li>' +
		'<li  ms-for="($index, value) in @indexCategory" ms-on-click="clickNav($index)">{{@value.sortName}}</li>' +
		'</ul>' +
		'</div>',
	defaults: {
		level: 1, //路径的层级
		imgPath: "../",
		pagePath: "",
		indexCategory:[],
		onInit: function() {
            var hostname = location.hostname;
            var port = location.port;
            var baseUrl = "http://"+hostname+":"+port;
            this.imgPath = baseUrl+"/aitao/";
			//初始化数据
			this.indexCategory = http.get("/home/getIndexSort.do");
		},
		clickNav:function(index){
			window.location.href=this.pagePath+"category/category.html?sortNo="+this.indexCategory[index].sortNo;
		}
	}

});

//底部导航
avalon.component('ms-bt-nav', {
	template: '<div class="link">' +
		'<div class="link_detail">' +
		'<div class="top_left">' +
		'<ul class="left_info">' +
		'<li>新手指南</li>' +
		'<li>数据包使用教程</li>' +
		'<li>如何入驻我们</li>' +
		'<li>海报广告</li>' +
		'<li>注册新用户</li>' +
		'</ul>' +
		'<ul class="left_info">' +
		'<li>配送安装</li>' +
		'<li>收获指南</li>' +
		'<li>物流配送</li>' +
		'</ul>' +
		'<ul class="left_info">' +
		'<li>关于爱淘网</li>' +
		'<li>公司简介</li>' +
		'<li>诚聘英才</li>' +
		'<li>招商加盟</li>' +
		'<li>联系我们</li>' +
		'</ul>' +
		'<ul class="left_info">' +
		'<li>售后服务</li>' +
		'<li>45天无理由退换货</li>' +
		'<li>如何申请退款</li>' +
		'<li>维修说明</li>' +
		'<li>第三方订单售后服务</li>' +
		'</ul>' +
		'<ul class="left_info">' +
		'<li>购物保障</li>' +
		'<li>正品保证</li>' +
		'<li>注册协议</li>' +
		'<li>隐私保护</li>' +
		'<li>负责声明</li>' +
		'</ul>' +
		'</div>' +
		'<div class="lxfs">' +
		'<div class="lxfs_left">' +
		'<span class="limg1"><img ms-attr="{src:@imgPath+\'images/front/home/phone.png\'}"/></span>' +
		'<span class="limg2"><img ms-attr="{src:@imgPath+\'images/front/home/QQ.png\'}"/></span>' +
		'</div>' +
		'<div class="lxfs_right">' +
		'<span class="l1">服务热线</span>' +
		'<span class="l2">7×24小时&nbsp;金牌服务</span><br />' +
		'<span class="l3">186-5107-2708</span><br />' +
		'<span class="l4">爱淘网QQ交流群</span><br />' +
		'<span class="l5">291-511-8091</span><br />' +
		'<span class="l6"><img ms-attr="{src:@imgPath+\'images/front/home/listen.png\'}"/>联系在线客服</span>' +
		'</div>' +
		'</div>' +
		'<div class="wechat">' +
		'微信公众平台' +
		'<img ms-attr="{src:@imgPath+\'images/front/home/erwm.png\'}"/>' +
		'<span class="we">扫一扫关注</span>' +
		'</div>' +
		'</div>' +
		'</div>',
	defaults: {
		level: 1, //路径的层级
		imgPath: "../",
		pagePath: "",
		onInit: function() {
            var hostname = location.hostname;
            var port = location.port;
            var baseUrl = "http://"+hostname+":"+port;
            this.imgPath = baseUrl+"/aitao/";
		},
	}
});

//copyright
avalon.component('ms-copyright', {
	template: '<div class="bottom">' +
		'<div class="about">' +
		'<ul>' +
		'<li>版权隐私</li>' +
		'<li>使用协议</li>' +
		'<li>联系方式</li>' +
		'<li>关于我们</li>' +
		'</ul>' +
		'</div>' +
		'<span class="copy">Copyright&nbsp;&copy;&nbsp;爱淘网</span>' +
		'</div>',
	defaults: {
		level: 1, //路径的层级
		imgPath: "../",
		pagePath: "",
		onInit: function() {
            var hostname = location.hostname;
            var port = location.port;
            var baseUrl = "http://"+hostname+":"+port;
            this.imgPath = baseUrl+"/aitao/";
		},
	},

});