$(function(){
	
	var params = http.getJsonFromUrl(window.location.href);
	var user = JSON.parse(localStorage.getItem("user"));
	var vm = avalon.define({
		$id: "box",
		baseUrl: baseUrl,
		sellerInfo:[],//商家信息
		menuInfo:["全部商品分类","首页"],//菜单栏信息
		lunImg:[],//轮播图片
		sellerSortInfo:[],//商家分类
		goodsInfo:[],
		goodDetail:function(goodNo){
			
			self.location='../../page/frontold/goods-detail.jsp?goodsNo='+goodNo;
		}
	});
	vm.$watch('onReady', function() {
		//详细数据
		vm.sellerInfo = http.get("/seller/list.do?sellerNo=" + params.sellerNo+"&pageIndex=0&pageSize=10");
		vm.sellerSortInfo = http.get("/seller/sort/list.do?sellerNo=" + params.sellerNo);
		vm.lunImg = http.get("/seller/file/list.do?sellerNo=" + params.sellerNo);
		vm.goodsInfo = http.get("/goods/totalSortList.do?sellerNo=" + params.sellerNo+"&sellerSortNo_link=1");
		
		$(".dropdown_first_div_a").hover(
			  function () {
			    $(".sortList").css("display","block");
			  },
			  function () {
				 $(".sortList").css("display","none");
			  }
		);
		
		var mySwiper = new Swiper ('.swiper-container', {
		    direction: 'horizontal',
		    autoplay:4000,
		    loop: true,
		    // 如果需要分页器
		    pagination: '.swiper-pagination',
		    // 如果需要前进后退按钮
		    nextButton: '.swiper-button-next',
		    prevButton: '.swiper-button-prev',
		  
		 })  
		
	});
})
