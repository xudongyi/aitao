$(function() {

	//右侧轮播图

	(function() {
		var parentHeight = $(".right-goods-container").css("height"); //获取轮播容器的高度
		var length = $(".detail-right-goods").children("li").length; //获取轮播元素的子元素个数
		var height = $(".detail-right-goods").children("li").css("height"); //获取轮播元素的子元素的高
		var bottom = $(".detail-right-goods").children("li").css("margin-bottom"); //获取轮播元素的子元素的bottom
		var translate = parseInt(height) + parseInt(bottom); //计算每次移动的距离
		var shownum = Math.floor(parseInt(parentHeight) / translate); //计算未移动时页面元素个数
		var num = length - shownum; //计算轮播次数
		var limit = translate * num; //计算限制距离
		var time = setInterval(function() {
			var top = $(".detail-right-goods").css("top"); //获取轮播元素的top值
			var newtop = parseInt(top) - translate;
			if(newtop > -limit) {
				$(".detail-right-goods").css("top", newtop + 'px');
			} else {
				$(".detail-right-goods").css("top", 0);
			}
		}, 2000);
		$(".right-goods-container").mouseover(function() {
			clearInterval(time);
			time = null;
		});
		$(".right-goods-container").mouseleave(function() {
			time = setInterval(function() {
				var top = $(".detail-right-goods").css("top");
				var newtop = parseInt(top) - translate;
				if(newtop > -limit) {
					$(".detail-right-goods").css("top", newtop + 'px');
				} else {
					$(".detail-right-goods").css("top", 0);
				}
			}, 2000);
		});
	})();

	//左侧轮播图
	(function() {
		var parentHeight = $(".slide-container").css("height"); //获取轮播容器的高度
		var length = $(".goods-bottom-left-bot .same_content").children(".same_goods").length; //获取轮播元素的子元素个数
		var height = $(".goods-bottom-left-bot .same_content").children(".same_goods").css("height"); //获取轮播元素的子元素的高
		var bottom = $(".goods-bottom-left-bot .same_content").children(".same_goods").css("margin-bottom"); //获取轮播元素的子元素的bottom
		var translate = parseInt(height) + parseInt(bottom); //计算每次移动的距离
		var shownum = Math.floor(parseInt(parentHeight) / translate); //计算未移动时页面元素个数
		var num = length - shownum; //计算轮播次数
		var limit = translate * num; //计算限制距离
		var time = setInterval(function() {
			var top = $(".goods-bottom-left-bot .same_content").css("top");
			var newtop = parseInt(top) - translate;
			if(newtop > -limit) {
				$(".goods-bottom-left-bot .same_content").css("top", newtop + 'px');
			} else {
				$(".goods-bottom-left-bot .same_content").css("top", 7 + "px");
			}
		}, 2000);
		$(".goods-bottom-left-bot .slide-container").mouseover(function() {
			clearInterval(time);
			time = null;
		});
		$(".goods-bottom-left-bot .slide-container").mouseleave(function() {
			time = setInterval(function() {
				var top = $(".goods-bottom-left-bot .same_content").css("top");
				var newtop = parseInt(top) - translate;
				if(newtop > -limit) {
					$(".goods-bottom-left-bot .same_content").css("top", newtop + 'px');
				} else {
					$(".goods-bottom-left-bot .same_content").css("top", 7 + "px");
				}
			}, 2000);
		});
	}());

});

(function() {
	//url参数
	var params = http.getJsonFromUrl(window.location.href);
	var user = JSON.parse(localStorage.getItem("user"));
	var vm = avalon.define({
		$id: "content",
		baseUrl: baseUrl,
		location: [], //头部
		detail: {}, //详细数据
		imgMaindetail: [], //轮播图片信息
		imgdetail: [], //详细的图片信息
		seller: {}, //商家信息
		comments: {}, //评价信息
		propertyValue: {}, //属性值
		sameSort: [], //同类新商品
		collection: [], //收藏记录
		categoryGoods: [], //同类商品
		klykGoods: [], //看了又看商品
		categorys: [], //商家分类
		goodsRank1: [], //商品热销排行
		goodsRank2: [], //商品收藏排行
		recommend: [], //推荐商品
		enterHome: function() {
			var that = this;
			//询问框
			layer.confirm('请选择您前往的官网!', {
				btn: ['平台官网', '商家官网', '取消'] //按钮
			}, function() {
				window.location.href = projectUrl + "/page/frontold/shop-index.jsp?sellerNo="+that.seller.sellerNo;
			}, function() {
				window.location.href = that.seller.mainPageUrl;
			});
		},
		addGoodsFollow: function() {
			try {
				var userid = user.userID;
				var re = http.post("/detail/addCollection.do?userID=" + userid + "&goodsNo=" + this.detail.goodsNo);
				if(re == -1) {
					alert('已经收藏');
				} else {
					alert("收藏成功");
				};
			} catch(e) {
				console.log(e)
				alert("请先登录");
			}
		},
        showCategory:function(event){
            $(event.target).parent().parent().children("ul").show();
            $(event.target).parent().parent().children(".ico-hide").show();
            $(event.target).parent().parent().children(".ico-show").hide();
        },
        hideCategory:function(event){
            $(event.target).parent().parent().children("ul").hide();
            $(event.target).parent().parent().children(".ico-show").show();
            $(event.target).parent().parent().children(".ico-hide").hide();
        },
        changeRank:function(type){
            $(".pngFix li").attr("class","");
            if(type==1){
                $("#hot_sales_tab").addClass("current");
                $("#hot_collect_list").hide();
                $("#hot_sales_list").show();

            }else if(type==2){
                $("#hot_collect_tab").addClass("current");
                $("#hot_sales_list").hide();
                $("#hot_collect_list").show();
            }
        },
		addFollow: function() {
			var pars = {};
			pars.sellerNo = this.seller.sellerNo;
			pars.userId = user.userID;
			var result = http.get("/shopmain/followSeller.do", pars);
			alert(result.msg);
		}

	});
	vm.$watch('onReady', function() {
		//详细数据
		vm.detail = http.get("/detail/getDetail.do?goodsNo=" + params.goodsNo);
		//商品轮播信息
		vm.imgMaindetail = http.get("/detail/getGoodsMainImg.do?goodsNo=" + vm.detail.goodsNo);
		//商品详细信息
		vm.imgdetail = http.get("/detail/getGoodsImg.do?goodsNo=" + vm.detail.goodsNo)
		//头部数据
		vm.location = http.get("/category/getCategoryName.do?sortNo=" + vm.detail.sortNo);
		//商家信息
		vm.seller = http.get("/detail/getSeller.do?sellerNo=" + vm.detail.sellerNo);
		//属性值
		vm.propertyValue = http.get("/detail/getPropertyAndValue.do?goodsNo=" + vm.detail.goodsNo);
		//评价信息
		vm.comments = http.get("/detail/getGoodsComments.do?goodsNo=" + vm.detail.goodsNo);
		//收藏的商品
		vm.collection = http.get("/detail/getCollectInfo.do?goodsNo=" + vm.detail.goodsNo)

		//同类新品
		vm.sameSort = http.get("/detail/sameSort.do?sortNo=" + vm.detail.sortNo)

		//同类商品
		vm.categoryGoods = http.get("/detail/getTLSP.do?sellerNo=" + vm.detail.sellerNo + "&sortNo=" + vm.detail.sortNo)
		//看了又看商品
		//		vm.klykGoods = http.get("/detail/getCollectInfo.do?goodsNo=");
		//商家分类
		vm.categorys = http.get("/seller/sort/treeTotalList.do?sellerNo="+vm.detail.sellerNo);
        console.log(vm.categorys)
        //商家商品排行
        vm.goodsRank1 = http.get("/seller/sellerGoodsRank.do?sellerNo="+vm.detail.sellerNo+"&type=1");
        vm.goodsRank2 = http.get("/seller/sellerGoodsRank.do?sellerNo="+vm.detail.sellerNo+"&type=2");

		//推荐商品
		vm.recommend = http.get("/home/getGoods.do?type=2")
		//轮播图
		$(".detail-left-bot li").click(function() {
			var index = $(this).index();
			$(this).addClass("active2").siblings().removeClass("active2");
			$(".img_container").css("left", -index * 418 + 'px');
		});

		var $tab_li = $('#tab ul li');
		$tab_li.hover(function() {
			$(this).addClass('selected').siblings().removeClass('selected');
			var index = $tab_li.index(this);
			$('div.tab_box > div').eq(index).show().siblings().hide();
		});
		//切换
		var properties = {};
		$(".size-right ul li").click(function() {
			$(this).addClass("size-actived").siblings().removeClass("size-actived");
			$(this).find("img").show();
			properties[$(this).parent().parent().siblings(".size-left").text()] = $(this).text();
			$(this).siblings().find("img").hide();
			var price = http.get("/detail/getPriceByKeyAndValue.do", {
				"properties": JSON.stringify(properties),
				"goodsNo": vm.detail.goodsNo
			})
			//var price = http.get("/detail/getPriceByKeyAndValue.do?properties=" + JSON.stringify(properties) + "&goodsNo=" + vm.detail.goodsNo)
			vm.detail.price = price.price;
			vm.detail.salseCount = price.salseCount;
			vm.detail.totalCount = price.totalCount;
		});

	});

	vm.$watch("onReady", function() {
		//底部轮播
		(function() {
			var parentWidth = $(".goods-last-content").css("width"); //获取轮播容器的宽度
			var length = $(".goods-last-content ul").children("li").length; //获取轮播元素的子元素个数
			var width = $(".goods-last-content ul").children("li").css("width"); //获取轮播元素的子元素的宽
			var right = $(".goods-last-content ul").children("li").css("margin-right"); //获取轮播元素的子元素的right
			var translate = parseInt(width) + parseInt(right); //计算每次移动的距离
			var shownum = Math.floor(parseInt(parentWidth) / translate); //计算未移动时页面元素个数
			var num = length - shownum; //计算轮播次数
			var limit = translate * num; //计算限制距离
			var time = setInterval(function() {
				var left = $(".goods-last-content ul").css("left");
				var newleft = parseInt(left) - translate;
				if(newleft > -limit) {
					$(".goods-last-content ul").css("left", newleft + 'px');
				} else {
					$(".goods-last-content ul").css("left", 0);
				}
			}, 2000);
			$(".goods-last-content").mouseover(function() {
				clearInterval(time);
				time = null;
			});
			$(".goods-last-content").mouseleave(function() {
				time = setInterval(function() {
					var left = $(".goods-last-content ul").css("left");
					var newleft = parseInt(left) - translate;
					if(newleft > -limit) {
						$(".goods-last-content ul").css("left", newleft + 'px');
					} else {
						$(".goods-last-content ul").css("left", 0);
					}
				}, 2000);
			});
		}());

		//选项卡
		(function() {
			var num = parseInt($(".result").text());
			if(num > 0) {
				$(this).css("color", "#dadada");
				$(this).css("background", "#f9f9f9");
			} else {
				$(this).css("color", "#666666");
				$(this).css("background", "#f1f1f1");
			};
			$(".down").click(function() {
				$(".up").css("color", "#666666");
				$(".up").css("background", "#f1f1f1");
				if(num > 0) {
					num -= 1;
					$(".result").text(num);
				}
				if(num == 0) {
					$(this).css("color", "#dadada");
					$(this).css("background", "#f9f9f9");
				};
			});
			$(".up").click(function() {
				$(".down").css("color", "#666666");
				$(".down").css("background", "#f1f1f1");
				if(num < 15) {
					num += 1;
					$(".result").text(num);
				};
				if(num == 15) {
					$(this).css("color", "#dadada");
					$(this).css("background", "#f9f9f9");
				};
			});

		}());
	})

})()