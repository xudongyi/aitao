$(function() {
	//搜索选项卡 
	$(".sec_right>div>div").click(function() {
		var index = $(this).index();
		$(this).parent().children().removeClass("tab_active").eq(index).addClass('tab_active');
		var a = ["请输入供货商名", "请输入商品名"];
		$(".sousuo input").attr("placeholder", a[index]);
	});
});