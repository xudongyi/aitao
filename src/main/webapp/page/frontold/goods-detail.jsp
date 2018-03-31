<%--
  Created by IntelliJ IDEA.
  User: xudy
  Date: 2018/3/30 0030
  Time: 13:59
  To change this template use File | Settings | File Templates.
--%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/js/header.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
    <meta charset="utf-8"/>
    <title>爱淘网</title>
    <script src="${ctx}/js/boot_front.js"></script>
    <link rel="stylesheet" href="${ctx}/css/front/detail.css"/>
    <script src="${ctx}/js/front/goodsdetail.js" type="text/javascript" charset="utf-8"></script>
</head>

<body>
<xmp :widget="[{is:'ms-top'},{level:2}]">
</xmp>
<xmp :widget="[{is:'ms-search'},{level:2}]">
</xmp>

<div class="content">
    <xmp :widget="[{is:'ms-nav'},{level:2}]">
    </xmp>
    <!--左侧菜单结束-->
    <div class="goods" ms-controller="content">
        <div class="location">

            <span>您所在的位置：</span>
            <span>首页</span>
            <span ms-for="($index,el) in @location">
						   	<span>></span>
					<span>{{el.sortName}}</span>
					</span>

        </div>
        <div class="goods-detail cl">
            <div class="detail-left">
                <div class="detail-left-top" style="display:block;">
                    <div class="img_container">
                        <img :if="@detail.img1!=null&&@detail.img1!=''"
                             ms-attr="{src: @baseUrl+'/imglibs/'+@detail.img1}" alt="">
                        <img :if="@detail.img2!=null&&@detail.img2!=''"
                             ms-attr="{src: @baseUrl+'/imglibs/'+@detail.img2}" alt="">
                        <img :if="@detail.img3!=null&&@detail.img3!=''"
                             ms-attr="{src: @baseUrl+'/imglibs/'+@detail.img3}" alt="">
                        <img :if="@detail.img4!=null&&@detail.img4!=''"
                             ms-attr="{src: @baseUrl+'/imglibs/'+@detail.img4}" alt="">
                        <img ms-for="($index,el) in @imgMaindetail" ms-attr="{src: @baseUrl+'/imglibs/'+@el.fileUrl}"
                             alt="">
                    </div>

                </div>
                <ul class="detail-left-bot">
                    <li :if="@detail.img1!=null&&@detail.img1!=''" class="active2"><img
                            ms-attr="{src: @baseUrl+'/imglibs/'+@detail.img1}" alt=""></li>
                    <li :if="@detail.img2!=null&&@detail.img2!=''"><img
                            ms-attr="{src: @baseUrl+'/imglibs/'+@detail.img2}" alt=""></li>
                    <li :if="@detail.img3!=null&&@detail.img3!=''"><img
                            ms-attr="{src: @baseUrl+'/imglibs/'+@detail.img3}" alt=""></li>
                    <li :if="@detail.img4!=null&&@detail.img4!=''"><img
                            ms-attr="{src: @baseUrl+'/imglibs/'+@detail.img4}" alt=""></li>
                    <li ms-for="($index,el) in @imgMaindetail"><img ms-attr="{src: @baseUrl+'/imglibs/'+@el.fileUrl}"
                                                                    alt=""></li>
                </ul>
            </div>
            <div class="detail-middle">
                <p class="big-title">{{@detail.goodsName}}</p>
                <div class="price">
                    <p class="goods-price">商&nbsp;场&nbsp;价：<span>￥<i>{{@detail.price}}</i></span></p>
                    <p class="shop-price">市&nbsp;场&nbsp;价：<span>￥<i><strike>{{@detail.marketPrice}}</strike></i></span>
                    </p>
                    <p class="total-number">浏&nbsp;览&nbsp;量：<span>{{@detail.totalCount}}</span></p>
                </div>

                <div class="detail-message">
                    <div class="detail-message-left">
                        <span>商品品牌 </span>
                        <span>商品地区 </span>
                        <span>商品销量</span>
                    </div>
                    <div class="detail-message-right">
                        <span class="weight">{{@detail.brand}}</span>
                        <span>{{@seller.area}}</span>
                        <span>{{@detail.salseCount}}</span>

                    </div>
                    <div class="detail-message-left2">
                        <span>商品评价 </span>
                        <span>上架时间</span>
                        <span>更新时间</span>
                    </div>
                    <div class="detail-message-right2">
                        <span>已有<i>{{@comments.total.length}}</i>人评价</span>
                        <span>{{new Date(@detail.createTime).Format('yyyy-MM-dd hh:mm:ss')}}</span>
                        <span>{{new Date(@detail.updateTime).Format('yyyy-MM-dd hh:mm:ss')}}</span>
                    </div>

                </div>
                <div class="size" ms-for="(key, value) in @propertyValue">
                    <div class="size-left">{{@key}}:</div>
                    <div class="size-right">
                        <ul>
                            <li ms-for="(key1, value1) in @value" class="size-detail">{{@key1}}
                                <img src="${ctx}/images/front/detail/xuanz.png"/>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="size">
                    <div class="size-left">数量</div>
                    <div class="size-right" style="padding-top: 9px;">
                        <span class="add down">-</span>
                        <span class="result">1</span>
                        <span class="add up">+</span>
                        <p>您选择的商品库存<i>{{@detail.totalCount}}</i>件</p>
                    </div>
                </div>
                <div class="dashed-line"></div>
                <div class="btns">
                    <%-- <button class="btn-add" ms-click="addGoodsFollow()">收藏商品</button>
                     <button class="btn-release" ms-click="addFollow()">收藏店铺</button>--%>
                    <!--<button class="btn-publish">发布到淘宝</button>
                    <button class="btn-datapackage">加入数据包</button>-->
                </div>
            </div>
            <div class="detail-right">
                <div class="detail-right-title">
                    <span>....................</span>
                    <span>看了又看</span>
                    <span>....................</span>
                </div>
                <div class="right-goods-container">
                    <ul class="detail-right-goods">
                        <li ms-for="($index,value) in @sameSort">
                            <a ms-attr="{href:'Detail2.html?goodsNo='+value.goodsNo}">
                                <img ms-attr="{src: @baseUrl+'/imglibs/'+@value.img1}"/>
                                <span>￥<i>{{@value.price}}</i></span>
                            </a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="goods-bottom">
            <div class="goods-bottom-left">
                <div class="goods-bottom-left-top">
                    <div class="goods-bottom-left-content">
                        <span class="weight indent indent_right">{{@seller.sellerName}}</span>
                        <span class="inline">在线咨询：</span>
                        <a target="_blank"
                           ms-attr="{href:'tencent:/message/?uin='+@seller.qq1+'&Site=sc.chinaz.com&Menu=yes'}"><img
                                src="${ctx}/images/front/detail/QQ1.png"/></a>
                    </div>
                    <div class="goods-bottom-left-content">
                        <span class="weight indent">进入商家官网</span>
                        <!--ms-attr="{href:'../shop/shopMain.html?sellerNo='+@seller.sellerNo}"-->
                        <a ms-on-click="enterHome" href="javascript:;"><img src="${ctx}/images/front/detail/guanw.png"/></a>
                    </div>
                    <div class="service">
                        <p class="">售前客服&nbsp;:
                            <span class="font-gray service-name">
									    <span><a target="_blank"
                                                 ms-attr="{href:'tencent:/message/?uin='+@seller.qq2+'&Site=sc.chinaz.com&Menu=yes'}"><img
                                                src="${ctx}/images/front/detail/qq——kf.png" alt=""/>客服一</a></span>
									</span>
                        </p>
                        <p class="">售后客服&nbsp;:
                            <span class="font-gray service-name">
									    <span><a target="_blank"
                                                 ms-attr="{href:'tencent:/message/?uin='+@seller.qq3+'&Site=sc.chinaz.com&Menu=yes'}"><img
                                                src="${ctx}/images/front/detail/qq——kf.png" alt=""/>客服一</a></span>
									</span>
                        </p>
                        <div class="service_phone">
                            <div>
                                <div>
                                    <img src="${ctx}/images/front/detail/tele.png" alt=""/>
                                    <p>{{@seller.tel}}</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="goods-bottom-left-bot">
                    <div class="same">同类商品</div>
                    <div class="slide-container">
                        <div class="same_content">
                            <div class="same_goods" ms-for="($index,el) in @categoryGoods">
                                <a ms-attr="{href:'Detail2.html?goodsNo='+el.goodsNo}">
                                    <img onerror="this.src='${ctx}/images/front/detail/spp-q.png'"
                                         ms-attr="{src: @baseUrl+'/imglibs/'+@el.img1}"/>
                                    <span>
											<p>{{@el.goodsName}}</p>
											<p>￥{{@el.price}}</p>
											<p>浏览量{{@el.totalCount}}</p>
										</span>
                                </a>

                            </div>

                        </div>
                    </div>
                </div>
                <div class="goods-bottom-left-bot1">
                    <div class="same">商品分类</div>
                    <ul class="category">
                        <li ms-for="($index,el) in @categorys"><span class="ico-hide" ms-on-click="hideCategory($event)"
                                                                    style="cursor: pointer;"><em>－</em></span>
                            <span class="ico-show" ms-on-click="showCategory($event)"
                                  style="cursor: pointer;display: none"><span>+</span></span>
                            <a ms-attr="{href:'Detail2.html?categoryId='+el.id}">{{@el.name}}</a>
                            <ul>
                                <li ms-for="($index1,el1) in @el.childs"><span class="ico-sub">&nbsp;&nbsp;</span><a
                                        ms-attr="{href:'Detail2.html?categoryId='+el1.id}">{{el1.name}}</a>
                                </li>
                            </ul>
                        </li>
                    </ul>

                </div>

                <div class="goods-bottom-left-bot1">
                    <div class="same">商品排行</div>
                    <div class="rank-content">
                        <ul class="ncs-top-tab pngFix">
                            <li ms-on-click="changeRank(1)" id="hot_sales_tab" class="current"><a>热销商品排行</a></li>
                            <li ms-on-click="changeRank(2)" id="hot_collect_tab"><a>热门收藏排行</a></li>
                        </ul>
                        <div id="hot_sales_list" class="ncs-top-panel">
                            <ol>
                                <li ms-for="($index,el) in @goodsRank1">
                                    <dl>
                                        <dt><a href="index.php?act=goods&amp;goods_id=2573353">{{@el.goodsName}}</a></dt>
                                        <dd class="goods-pic"><a href="index.php?act=goods&amp;goods_id=2573353"><span
                                                class="thumb size40"><i></i><img ms-attr="{src: @baseUrl+'/imglibs/'+@el.img1}"
                                                width="40"
                                                height="40"></span></a>
                                        </dd>
                                        <dd class="price pngFix"><strong>¥{{@el.price}}</strong></dd>
                                        <dd class="selled pngFix">售出：<strong>{{@el.salseCount}}</strong>笔</dd>
                                    </dl>
                                </li>
                            </ol>
                        </div>
                        <div id="hot_collect_list" class="ncs-top-panel hide">
                            <ol>
                                <li ms-for="($index,el) in @goodsRank2">
                                    <dl>
                                        <dt><a href="index.php?act=goods&amp;goods_id=2573353">{{@el.GOODS_NAME}}</a></dt>
                                        <dd class="goods-pic"><a href="index.php?act=goods&amp;goods_id=2573353"><span
                                                class="thumb size40"><i></i><img
                                                ms-attr="{src: @baseUrl+'/imglibs/'+@el.IMG1}" width="40"
                                                height="40"></span></a>
                                        </dd>
                                        <dd class="price pngFix"><strong>¥{{@el.PRICE}}</strong></dd>
                                        <dd class="collection pngFix" style="margin-left:0px">收藏人气：<strong>{{@el.counts==null?0:@el.counts}}</strong>
                                        </dd>
                                    </dl>
                                </li>
                            </ol>
                        </div>
                        <p>
                            <a href="https://www.zhaojiafang.wang/shop/index.php?act=show_store&amp;op=goods_all&amp;store_id=119">查看本店其他商品</a>
                        </p>
                    </div>
                </div>

            </div>
            <div class="goods-bottom-right">
                <div id="tab">
                    <ul class="tab_menu">
                        <li class="selected">商品详情</li>
                        <li>商品评价<i>({{@comments.total.length}})</i></li>
                        <li>收藏记录<i>({{@collection.length}})</i></li>
                    </ul>
                    <div class="tab_box">
                        <div style="display: block;">
                            <div class="tab-content-head">
                                <!--<div class="tab-content-head-cont">
                                    <span>品牌：<i>1111</i></span>
                                    <span>床垫类型：<i>不限</i></span>
                                    <span>填充物：<i>不限</i></span>
                                    <span>产品等级：<i>一等品</i></span>
                                    <span>面料：<i>不限</i></span>
                                    <span>图案：<i>不限</i></span>
                                    <span>：<i>不限</i></span>
                                    <span>印花工艺：<i>不限</i></span>
                                    <span>织造工艺：<i>贡缎</i></span>
                                    <span>面料密度：<i>不限</i></span>
                                    <span>面料支数：<i>不限</i></span>
                                    <span>床品工艺：<i>不限</i></span>

                                    <span>被里材质：<i>棉</i></span>
                                    <span>件数：<i>4件</i></span>
                                    <span>风格：<i>不限</i></span>
                                    <span>款式：<i>不限</i></span>
                                    <span>被面材质：<i>不限</i></span>
                                    <span>材质：<i>棉布</i></span>
                                    <span>商品条形码：<i>不限</i></span>
                                    <span>织造工艺：<i>线缝</i></span>
                                    <span>季节：<i>不限</i></span>
                                    <span>被子面料：<i>不限</i></span>
                                    <span>填充物净重（不含布套）：<i>不限</i></span>
                                    <span>使用季节：<i>不限</i></span>
                                    <span>毯类型：<i>不限</i></span>
                                    <span>适用对象：<i>不限</i></span>
                                </div>-->
                            </div>
                            <div class="tab-content-bot">
                                <div class="tab-content-bot-detail">
                                    <img ms-for="($index, value) in @imgdetail"
                                         ms-attr="{src: @baseUrl+'/imglibs/'+@value.fileUrl}"/>
                                    <!--<img src="${ctx}/images/front/detail/spxq1.png" />
                                        <img src="${ctx}/images/front/detail/spxq2.png" />-->
                                </div>
                            </div>
                        </div>
                        <div class="hide">
                            <div class="tab-content-head">
                                <div class="tab-content-head-left">
                                    <p class="percent">
                                        {{@comments.percent.pgood*100+@comments.percent.pmiddle*100}}%</p>
                                    <p class="twelvesize font-a5">好评度</p>
                                </div>
                                <div class="tab-content-head-middle">
                                    <div class="discuss">
                                        <span>好评<i class="font-a5">({{@comments.percent.pgood*100}}%)</i></span>
                                    </div>
                                    <div class="discuss">
                                        <span>中评<i class="font-a5">({{@comments.percent.pmiddle*100}}%)</i></span>
                                    </div>
                                    <div class="discuss">
                                        <span>差评<i class="font-a5">({{@comments.percent.pbad*100}}%)</i></span>
                                    </div>
                                </div>
                            </div>
                            <div class="tab-content-middle">
                                <ul>
                                    <li>
                                        <span class="checked">全部评价<i>({{@comments.total.length}})</i></span>
                                    </li>
                                    <li>
                                        <span>晒<i>(0)</i></span>
                                    </li>
                                    <li>
                                        <span>好评<i>({{@comments.data.good.length}})</i></span>
                                    </li>
                                    <li>
                                        <span>中评<i>({{@comments.data.middle.length}})</i></span>
                                    </li>
                                    <li>
                                        <span>差评<i>({{@comments.data.bad.length}})</i></span>
                                    </li>
                                </ul>
                                <div class="discuss-content" ms-for="($index,el) in @comments.total">
                                    <div class="discuss-person">
                                        <img src="${ctx}/images/front/detail/tx11.png"/>
                                        <span>{{@el.userName}}</span>
                                    </div>
                                    <div class="discuss-level">
                                        <div class="level">
                                            <ul ms-if="@el.grade==1">
                                                <li class="bg-red"></li>
                                                <li class="bg-gray"></li>
                                                <li class="bg-gray"></li>
                                                <li class="bg-gray"></li>
                                                <li class="bg-gray"></li>
                                            </ul>
                                            <ul ms-if="@el.grade==2">
                                                <li class="bg-red"></li>
                                                <li class="bg-red"></li>
                                                <li class="bg-gray"></li>
                                                <li class="bg-gray"></li>
                                                <li class="bg-gray"></li>
                                            </ul>
                                            <ul ms-if="@el.grade==3">
                                                <li class="bg-red"></li>
                                                <li class="bg-red"></li>
                                                <li class="bg-red"></li>
                                                <li class="bg-gray"></li>
                                                <li class="bg-gray"></li>
                                            </ul>
                                            <ul ms-if="@el.grade==4">
                                                <li class="bg-red"></li>
                                                <li class="bg-red"></li>
                                                <li class="bg-red"></li>
                                                <li class="bg-red"></li>
                                                <li class="bg-gray"></li>
                                            </ul>
                                            <ul ms-if="@el.grade==5">
                                                <li class="bg-red"></li>
                                                <li class="bg-red"></li>
                                                <li class="bg-red"></li>
                                                <li class="bg-red"></li>
                                                <li class="bg-red"></li>
                                            </ul>
                                        </div>
                                        <p class="discuss-detail">{{@el.content}}</p>
                                        <p class="font-a5">{{new Date(@el.createTime).Format("yyyy-MM-dd
                                            hh:mm:ss")}}</p>
                                    </div>
                                    <!--<div class="discuss-third">
                                            <div class="restore">
                                                <img src="${ctx}/images/front/detail/z_yy1.png" />
                                                <span>有用<i>(1)</i></span>
                                            </div>
                                            <div class="restore2">
                                                <span>回复<i>(1)</i></span>
                                            </div>
                                        </div>-->
                                    <div class="discuss-right">
                                        <!--<p class="font-a5">花色：<span>布鲁塞尔</span></p>
                                            <p class="font-a5">尺码：<span>1.5m(5英尺)床</span></p>-->
                                        <p class="font-a5">卖家：<span>{{@seller.sellerName}}</span></p>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="hide border">
                            <p class="sale-price">商城价<span class="red weight"> {{@detail.price}}</span>元 <span
                                    class="change">购买的价格不同可能是由于店铺往期促销活动引起的，详情可以咨询卖家</span></p>
                            <ul class="record_table">
                                <li class="record_title">
                                    <ul>
                                        <li>买家</li>
                                        <li>商品名字</li>
                                        <li>收藏时间</li>
                                    </ul>
                                </li>
                                <li class="record_content" ms-for="($index,el) in @collection">
                                    <ul>
                                        <li>{{@el.userName}}</li>
                                        <li>
                                            {{@detail.goodsName}}
                                        </li>
                                        <li>{{new Date(@el.createTime).Format("yyyy-MM-dd hh:mm:ss")}}</li>
                                    </ul>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="goods-last">
            <div class="goods-last-head">
                <span>推荐商品</span>
            </div>
            <div class="goods-last-content">
                <ul>

                    <li ms-for="($index,el) in @recommend">
                        <a ms-attr="{href:'Detail2.html?goodsNo='+el.goodsNo}">
                            <img onerror="this.src='${ctx}/images/front/detail/tj_sp1.png'"
                                 ms-attr="{src: @baseUrl+'/imglibs/'+@el.img1}"/>

                            <span>{{@el.goodsName}}</span>
                            <span class="red weight">￥<i>{{@el.price}} </i></span>
                        </a>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</div>
<xmp :widget="[{is:'ms-bt-nav'},{level:2}]">
</xmp>
<xmp :widget="[{is:'ms-copyright'},{level:2}]">
</xmp>

</body>

</html>
