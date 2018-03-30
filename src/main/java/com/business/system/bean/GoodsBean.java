package com.business.system.bean;

import java.util.Date;

import net.sf.rose.jdbc.bean.annotation.Column;
import net.sf.rose.jdbc.bean.annotation.Table;
import net.sf.rose.jdbc.bean.annotation.Type;

/**
 * @description 商品信息信息表
 * @author system
 * @since 2017-02-24 20:24:16
 */
@Table(name = "GOODS", description = "商品信息信息表")
public class GoodsBean {

	/** 商品编号 */
	@Column(pk = true, name = "GOODS_NO", type = Type.定长文本, description = "商品编号", canNull = false, size = 32, policy = "UUID")
	private String goodsNo;

	/** 商品名称 */
	@Column(name = "GOODS_NAME", type = Type.变长文本, description = "商品名称", canNull = false, size = 100)
	private String goodsName;

	/** 商品价格 */
	@Column(name = "PRICE", type = Type.数字双精度型, description = "商品价格", canNull = false)
	private double price;

	/** 商品分类 */
	@Column(name = "SORT_NO", type = Type.变长文本, description = "商品分类", canNull = false, size = 50)
	private String sortNo;

	/** 市场价 */
	@Column(name = "MARKET_PRICE", type = Type.数字双精度型, description = "市场价", canNull = false)
	private double marketPrice;

	/** 供货总量 */
	@Column(name = "TOTAL_COUNT", type = Type.数字整型, description = "供货总量", canNull = false)
	private int totalCount;

	/** 累计销量 */
	@Column(name = "SALSE_COUNT", type = Type.数字整型, description = "累计销量", canNull = false)
	private int salseCount;

	/** 品牌 */
	@Column(name = "BRAND", type = Type.变长文本, description = "品牌", canNull = false, size = 255)
	private String brand;

	/** 上架时间 */
	@Column(name = "SHELF_TIME", type = Type.日期时间, description = "上架时间", canNull = false)
	private Date shelfTime;

	/** 商品毛重 */
	@Column(name = "GROSS_WEIGHT", type = Type.数字双精度型, description = "商品毛重", canNull = false)
	private double grossWeight;

	/** 商品净重 */
	@Column(name = "NET_WEIGHT", type = Type.数字双精度型, description = "商品净重", canNull = false)
	private double netWeight;

	/** 商品图片1 */
	@Column(name = "IMG1", type = Type.变长文本, description = "商品图片1", canNull = false, size = 255)
	private String img1;

	/** 商品图片2 */
	@Column(name = "IMG2", type = Type.变长文本, description = "商品图片2", size = 255)
	private String img2;

	/** 商品图片3 */
	@Column(name = "IMG3", type = Type.变长文本, description = "商品图片3", size = 255)
	private String img3;

	/** 商品图片4 */
	@Column(name = "IMG4", type = Type.变长文本, description = "商品图片4", size = 32)
	private String img4;

	/** 创建人 */
	@Column(name = "CREATE_USER", type = Type.变长文本, description = "创建人", canNull = false, size = 50)
	private String createUser;

	/** 创建时间 */
	@Column(name = "CREATE_TIME", type = Type.日期时间, description = "创建时间", canNull = false)
	private java.sql.Timestamp createTime;

	/** 修改人 */
	@Column(name = "UPDATE_USER", type = Type.变长文本, description = "修改人", canNull = false, size = 50)
	private String updateUser;

	/** 修改时间 */
	@Column(name = "UPDATE_TIME", type = Type.日期时间, description = "修改时间", canNull = false)
	private java.sql.Timestamp updateTime;

	/** 虚拟销量 */
	@Column(name = "VIRTUAL_SALES", type = Type.数字整型, description = "虚拟销量", canNull = false)
	private int virtualSales;

	/** 商品关键词 */
	@Column(name = "KEY_WORDS", type = Type.变长文本, description = "商品关键词", canNull = false, size = 255)
	private String keyWords;

	/** 上架 */
	@Column(name = "ON_SHELVE", type = Type.数字整型, description = "上架", canNull = false)
	private int onShelve;

	/** 精品 */
	@Column(name = "FINE", type = Type.数字整型, description = "精品", canNull = false)
	private int fine;

	/** 新品 */
	@Column(name = "NEW_GOODS", type = Type.数字整型, description = "新品", canNull = false)
	private int newGoods;

	/** 热销 */
	@Column(name = "HOT_SALES", type = Type.数字整型, description = "热销", canNull = false)
	private int hotSales;

	/** 商家编号 */
	@Column(name = "SELLER_NO", type = Type.定长文本, description = "商家编号", canNull = false, size = 32)
	private String sellerNo;

	/** 排序 */
	@Column(name = "GOOD_ORDER", type = Type.数字整型, description = "排序", canNull = false)
	private int goodOrder;

	/** 商城分类 */
	@Column(name = "SHOP_SORT", type = Type.变长文本, description = "商城分类",  size = 50)
	private String shopSort;

	@Column(name = "POPULAR_SALES", type = Type.数字整型, description = "", canNull = false)
	private int popularSales;

	@Column(name = "REC_SALES", type = Type.数字整型, description = "", canNull = false)
	private int recSales;

	/**
	 * @description 获取商品编号
	 * @author system
	 * @since 2017-02-24 20:24:16
	 */
	public String getGoodsNo() {
		return goodsNo;
	}

	/**
	 * @description 设置商品编号
	 * @author system
	 * @since 2017-02-24 20:24:16
	 */
	public void setGoodsNo(String goodsNo) {
		this.goodsNo = goodsNo;
	}

	/**
	 * @description 获取商品名称
	 * @author system
	 * @since 2017-02-24 20:24:16
	 */
	public String getGoodsName() {
		return goodsName;
	}

	/**
	 * @description 设置商品名称
	 * @author system
	 * @since 2017-02-24 20:24:16
	 */
	public void setGoodsName(String goodsName) {
		this.goodsName = goodsName;
	}

	/**
	 * @description 获取商品价格
	 * @author system
	 * @since 2017-02-24 20:24:16
	 */
	public double getPrice() {
		return price;
	}

	/**
	 * @description 设置商品价格
	 * @author system
	 * @since 2017-02-24 20:24:16
	 */
	public void setPrice(double price) {
		this.price = price;
	}

	/**
	 * @description 获取商品分类
	 * @author system
	 * @since 2017-02-24 20:24:16
	 */
	public String getSortNo() {
		return sortNo;
	}

	/**
	 * @description 设置商品分类
	 * @author system
	 * @since 2017-02-24 20:24:16
	 */
	public void setSortNo(String sortNo) {
		this.sortNo = sortNo;
	}

	/**
	 * @description 获取市场价
	 * @author system
	 * @since 2017-02-24 20:24:16
	 */
	public double getMarketPrice() {
		return marketPrice;
	}

	/**
	 * @description 设置市场价
	 * @author system
	 * @since 2017-02-24 20:24:16
	 */
	public void setMarketPrice(double marketPrice) {
		this.marketPrice = marketPrice;
	}

	/**
	 * @description 获取供货总量
	 * @author system
	 * @since 2017-02-24 20:24:16
	 */
	public int getTotalCount() {
		return totalCount;
	}

	/**
	 * @description 设置供货总量
	 * @author system
	 * @since 2017-02-24 20:24:16
	 */
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}

	/**
	 * @description 获取累计销量
	 * @author system
	 * @since 2017-02-24 20:24:16
	 */
	public int getSalseCount() {
		return salseCount;
	}

	/**
	 * @description 设置累计销量
	 * @author system
	 * @since 2017-02-24 20:24:16
	 */
	public void setSalseCount(int salseCount) {
		this.salseCount = salseCount;
	}

	/**
	 * @description 获取品牌
	 * @author system
	 * @since 2017-02-24 20:24:16
	 */
	public String getBrand() {
		return brand;
	}

	/**
	 * @description 设置品牌
	 * @author system
	 * @since 2017-02-24 20:24:16
	 */
	public void setBrand(String brand) {
		this.brand = brand;
	}

	/**
	 * @description 获取上架时间
	 * @author system
	 * @since 2017-02-24 20:24:16
	 */
	public Date getShelfTime() {
		return shelfTime;
	}

	/**
	 * @description 设置上架时间
	 * @author system
	 * @since 2017-02-24 20:24:16
	 */
	public void setShelfTime(Date shelfTime) {
		this.shelfTime = shelfTime;
	}

	/**
	 * @description 获取商品毛重
	 * @author system
	 * @since 2017-02-24 20:24:16
	 */

	public double getGrossWeight() {
		return grossWeight;
	}

	/**
	 * @description 设置商品毛重
	 * @author system
	 * @since 2017-02-24 20:24:16
	 */
	public void setGrossWeight(double grossWeight) {
		this.grossWeight = grossWeight;
	}

	/**
	 * @description 获取商品净重
	 * @author system
	 * @since 2017-02-24 20:24:16
	 */
	public double getNetWeight() {
		return netWeight;
	}

	/**
	 * @description 设置商品净重
	 * @author system
	 * @since 2017-02-24 20:24:16
	 */
	public void setNetWeight(double netWeight) {
		this.netWeight = netWeight;
	}

	/**
	 * @description 获取商品图片1
	 * @author system
	 * @since 2017-02-24 20:24:16
	 */
	public String getImg1() {
		return img1;
	}

	/**
	 * @description 设置商品图片1
	 * @author system
	 * @since 2017-02-24 20:24:16
	 */
	public void setImg1(String img1) {
		this.img1 = img1;
	}

	/**
	 * @description 获取商品图片2
	 * @author system
	 * @since 2017-02-24 20:24:16
	 */
	public String getImg2() {
		return img2;
	}

	/**
	 * @description 设置商品图片2
	 * @author system
	 * @since 2017-02-24 20:24:16
	 */
	public void setImg2(String img2) {
		this.img2 = img2;
	}

	/**
	 * @description 获取商品图片3
	 * @author system
	 * @since 2017-02-24 20:24:16
	 */
	public String getImg3() {
		return img3;
	}

	/**
	 * @description 设置商品图片3
	 * @author system
	 * @since 2017-02-24 20:24:16
	 */
	public void setImg3(String img3) {
		this.img3 = img3;
	}

	/**
	 * @description 获取商品图片4
	 * @author system
	 * @since 2017-02-24 20:24:16
	 */
	public String getImg4() {
		return img4;
	}

	/**
	 * @description 设置商品图片4
	 * @author system
	 * @since 2017-02-24 20:24:16
	 */
	public void setImg4(String img4) {
		this.img4 = img4;
	}

	/**
	 * @description 获取创建人
	 * @author system
	 * @since 2017-02-24 20:24:16
	 */
	public String getCreateUser() {
		return createUser;
	}

	/**
	 * @description 设置创建人
	 * @author system
	 * @since 2017-02-24 20:24:16
	 */
	public void setCreateUser(String createUser) {
		this.createUser = createUser;
	}

	/**
	 * @description 获取创建时间
	 * @author system
	 * @since 2017-02-24 20:24:16
	 */
	public java.sql.Timestamp getCreateTime() {
		return createTime;
	}

	/**
	 * @description 设置创建时间
	 * @author system
	 * @since 2017-02-24 20:24:16
	 */
	public void setCreateTime(java.sql.Timestamp createTime) {
		this.createTime = createTime;
	}

	/**
	 * @description 获取修改人
	 * @author system
	 * @since 2017-02-24 20:24:16
	 */
	public String getUpdateUser() {
		return updateUser;
	}

	/**
	 * @description 设置修改人
	 * @author system
	 * @since 2017-02-24 20:24:16
	 */
	public void setUpdateUser(String updateUser) {
		this.updateUser = updateUser;
	}

	/**
	 * @description 获取修改时间
	 * @author system
	 * @since 2017-02-24 20:24:16
	 */
	public java.sql.Timestamp getUpdateTime() {
		return updateTime;
	}

	/**
	 * @description 设置修改时间
	 * @author system
	 * @since 2017-02-24 20:24:16
	 */
	public void setUpdateTime(java.sql.Timestamp updateTime) {
		this.updateTime = updateTime;
	}

	/**
	 * @description 获取虚拟销量
	 * @author system
	 * @since 2017-02-24 20:24:16
	 */
	public int getVirtualSales() {
		return virtualSales;
	}

	/**
	 * @description 设置虚拟销量
	 * @author system
	 * @since 2017-02-24 20:24:16
	 */
	public void setVirtualSales(int virtualSales) {
		this.virtualSales = virtualSales;
	}

	/**
	 * @description 获取商品关键词
	 * @author system
	 * @since 2017-02-24 20:24:16
	 */
	public String getKeyWords() {
		return keyWords;
	}

	/**
	 * @description 设置商品关键词
	 * @author system
	 * @since 2017-02-24 20:24:16
	 */
	public void setKeyWords(String keyWords) {
		this.keyWords = keyWords;
	}

	/**
	 * @description 获取上架
	 * @author system
	 * @since 2017-02-24 20:24:16
	 */
	public int getOnShelve() {
		return onShelve;
	}

	/**
	 * @description 设置上架
	 * @author system
	 * @since 2017-02-24 20:24:16
	 */
	public void setOnShelve(int onShelve) {
		this.onShelve = onShelve;
	}

	/**
	 * @description 获取精品
	 * @author system
	 * @since 2017-02-24 20:24:16
	 */
	public int getFine() {
		return fine;
	}

	/**
	 * @description 设置精品
	 * @author system
	 * @since 2017-02-24 20:24:16
	 */
	public void setFine(int fine) {
		this.fine = fine;
	}

	/**
	 * @description 获取新品
	 * @author system
	 * @since 2017-02-24 20:24:16
	 */
	public int getNewGoods() {
		return newGoods;
	}

	/**
	 * @description 设置新品
	 * @author system
	 * @since 2017-02-24 20:24:16
	 */
	public void setNewGoods(int newGoods) {
		this.newGoods = newGoods;
	}

	/**
	 * @description 获取热销
	 * @author system
	 * @since 2017-02-24 20:24:16
	 */
	public int getHotSales() {
		return hotSales;
	}

	/**
	 * @description 设置热销
	 * @author system
	 * @since 2017-02-24 20:24:16
	 */
	public void setHotSales(int hotSales) {
		this.hotSales = hotSales;
	}

	/**
	 * @description 获取商家编号
	 * @author system
	 * @since 2017-02-24 20:24:16
	 */
	public String getSellerNo() {
		return sellerNo;
	}

	/**
	 * @description 设置商家编号
	 * @author system
	 * @since 2017-02-24 20:24:16
	 */
	public void setSellerNo(String sellerNo) {
		this.sellerNo = sellerNo;
	}

	/**
	 * @description 获取排序
	 * @author system
	 * @since 2017-02-24 20:24:16
	 */
	public int getGoodOrder() {
		return goodOrder;
	}

	/**
	 * @description 设置排序
	 * @author system
	 * @since 2017-02-24 20:24:16
	 */
	public void setGoodOrder(int goodOrder) {
		this.goodOrder = goodOrder;
	}

	/**
	 * @description 获取商城分类
	 * @author system
	 * @since 2017-02-24 20:24:16
	 */
	public String getShopSort() {
		return shopSort;
	}

	/**
	 * @description 设置商城分类
	 * @author system
	 * @since 2017-02-24 20:24:16
	 */
	public void setShopSort(String shopSort) {
		this.shopSort = shopSort;
	}

	public int getPopularSales() {
		return popularSales;
	}

	public void setPopularSales(int popularSales) {
		this.popularSales = popularSales;
	}

	public int getRecSales() {
		return recSales;
	}

	public void setRecSales(int recSales) {
		this.recSales = recSales;
	}
}