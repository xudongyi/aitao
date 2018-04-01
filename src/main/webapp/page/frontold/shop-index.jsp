<%--
  Created by IntelliJ IDEA.
  User: xudy
  Date: 2018/3/30 0030
  Time: 13:59
  To change this template use File | Settings | File Templates.
--%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/js/header.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>商家首页</title>
    <script src="${ctx}/js/boot_front.js"></script>
    <link rel="stylesheet" href="${ctx}/css/front/shop-index.css"/>
    <link rel="stylesheet" href="${ctx}/js/swiper/css/swiper.min.css"/>
    <script src="${ctx}/js/front/shop-index.js" type="text/javascript" charset="utf-8"></script>
    <script src="${ctx}/js/swiper/js/swiper.jquery.min.js" type="text/javascript" charset="utf-8"></script>
</head>
<body>
	<div  ms-controller="box">
		<div class="topImg" style="width:100%;height:163px;overflow:hidden; text-align: center">
				 <img style="height:163px;overflow:hidden;" ms-attr="{src: @baseUrl+'/imglibs/'+@sellerInfo[0].topImg}" alt="">
			</div>
			<div class="menu menu_color" style="height:40px;width:100%;">
				<div class="dropdown" ms-for="(index,el) in @menuInfo" >
					<div class="dropdown_child dropdown_first_div_a" :if="@index==0" >
						<a class="dropdown_div_a"> {{el}} </a>
						<ul :if="@index==0" class="sortList" style="margin-top: 30px;">
							<li ms-for="($i,obj) in @sellerSortInfo" :if="obj.parentNO==''" >
								<a class="dropdown_child_a">{{obj.sortName}}</a>
							</li>
						</ul>
					</div>
					<div class="dropdown_child" :if="@index!=0" >
						<a class="dropdown_div_a" > {{el}} </a>
					</div>
				</div>
			</div>
			<div class="swiper-container">
			    <div class="swiper-wrapper">
			        <div class="swiper-slide" ms-for="($i,obj) in @lunImg" >
			        	 <img style="width:100%;height:100%" ms-attr="{src: @baseUrl+'/imglibs/'+obj.fileUrl}" alt="">
					</div>
			    </div>
			    <!-- 如果需要分页器 -->
			    <div class="swiper-pagination"></div>
			    
			    <!-- 如果需要导航按钮 -->
			    <div class="swiper-button-prev"></div>
			    <div class="swiper-button-next"></div>
			</div>
			<div class="sellerSortClass" ms-for="($i,obj) in @sellerSortInfo" :if="obj.parentNO==''" >
				<div>
					<div class="hr"></div>
				</div>
				<div>
					<div class="sortType">{{obj.sortName}}</div>
				</div>
				<div>
					<div class="hr"></div>
				</div>
                <div style="text-align: center">
                    <div style="margin:50px 0 50px 30px;width: 360px; height: 400px;display: inline-table"
                         ms-for="($key,obj1) in goodsInfo"  ms-on-click="goodDetail(obj1.GOODS_NO)"  :if="(obj.sortNo==obj1.SELLER_SORT_NO||obj.sortNo==obj1.PARENT_NO)&&$key<3">
                        <div class="image-style" >
                            <a href="javascript:void(0)" target="_blank">
                                <img style=" width:100%;height:100%" ms-attr="{src: @baseUrl+'/imglibs/'+obj1.IMG1}" alt="" >
                            </a>
                        </div>
                        <div class="ibox2">
                            <div style="max-width:260px;overflow:hidden;height:30px;float:left">
                                {{obj1.GOODS_NAME}}
                            </div>

                            <span style="float: right; ">
			                <a href="javascript:void(0)"  style="color: #FF5160;font-size:16px">了解产品详情</a>
			            </span>
                        </div>
                        <div style="clear: both"></div>
                        <div style="border-bottom: 2px solid #828282;width: 360px; height: 2px"></div>

                    </div>
                </div>

			</div>
		
		
		<div style="clear: both"></div>
			
		</div>
	<xmp :widget="[{is:'ms-bt-nav'},{level:2}]">
	</xmp>
	<xmp :widget="[{is:'ms-copyright'},{level:2}]">
	</xmp>
</body>
</html>
