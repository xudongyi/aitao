package com.business.system.bean;

import net.sf.rose.jdbc.bean.annotation.Column;
import net.sf.rose.jdbc.bean.annotation.Table;
import net.sf.rose.jdbc.bean.annotation.Type;

/**
 * @description 商品价格信息表
 * @author system
 * @since 2017-03-24 17:04:33
 */
@Table(name = "GOODS_PRICE", description = "商品价格信息表")
public class GoodsPriceBean {

	/** 商品价格编号 */
	@Column(pk = true, name = "GOODS_PRICE_NO", type = Type.定长文本, description = "商品价格编号", canNull = true, size = 32, policy = "UUID")
	private String goodsPriceNo;

	/** 商品编号 */
	@Column(name = "GOODS_NO", type = Type.定长文本, description = "商品编号", canNull = true, size = 32)
	private String goodsNo;

	/** 属性名称 */
	@Column(name = "PROPERTITY_NAME1", type = Type.变长文本, description = "属性名称", canNull = true, size = 50)
	private String prppertityName1;

	/** 属性值 */
	@Column(name = "PROPERTITY_VALUE1", type = Type.变长文本, description = "属性值", canNull = true)
	private String propertityValue1;

	/** 属性名称 */
	@Column(name = "PROPERTITY_NAME2", type = Type.变长文本, description = "属性名称", canNull = true, size = 50)
	private String prppertityName2;

	/** 属性值 */
	@Column(name = "PROPERTITY_VALUE2", type = Type.变长文本, description = "属性值", canNull = true)
	private String propertityValue2;

	/** 属性名称 */
	@Column(name = "PROPERTITY_NAME3", type = Type.变长文本, description = "属性名称", canNull = true, size = 50)
	private String prppertityName3;

	/** 属性值 */
	@Column(name = "PROPERTITY_VALUE3", type = Type.变长文本, description = "属性值", canNull = true)
	private String propertityValue3;

	/** 属性名称 */
	@Column(name = "PROPERTITY_NAME4", type = Type.变长文本, description = "属性名称", canNull = true, size = 50)
	private String prppertityName4;

	/** 属性值 */
	@Column(name = "PROPERTITY_VALUE4", type = Type.变长文本, description = "属性值", canNull = true)
	private String propertityValue4;

	/** 价格 */
	@Column(name = "PRICE", type = Type.数字整型, description = "价格", canNull = true)
	private double price;

	/** 排序 */
	@Column(name = "SORT_ORDER", type = Type.数字整型, description = "排序", canNull = true)
	private int sortOrder;

	/** 供货总量 */
	@Column(name = "TOTAL_COUNT", type = Type.数字整型, description = "供货总量", canNull = true)
	private int totalCount;

	/** 累计销量 */
	@Column(name = "SALSE_COUNT", type = Type.数字整型, description = "累计销量", canNull = true)
	private int salseCount;

	/** 商品图片 */
	@Column(name = "IMG", type = Type.变长文本, description = "商品图片", canNull = true, size = 255)
	private String img;


	/**
	 * @description 获取商品编号
	 * @author system
	 * @since 2017-03-24 17:04:33
	 */
	public String getGoodsNo() {
		return goodsNo;
	}

	/**
	 * @description 获取属性名称
	 * @author system
	 * @since 2017-03-24 17:04:33
	 */
	public String getPrppertityName1() {
		return prppertityName1;
	}

	/**
	 * @description 获取属性值
	 * @author system
	 * @since 2017-03-24 17:04:33
	 */
	public String getPropertityValue1() {
		return propertityValue1;
	}

	/**
	 * @description 获取属性名称
	 * @author system
	 * @since 2017-03-24 17:04:33
	 */
	public String getPrppertityName2() {
		return prppertityName2;
	}

	/**
	 * @description 获取属性值
	 * @author system
	 * @since 2017-03-24 17:04:33
	 */
	public String getPropertityValue2() {
		return propertityValue2;
	}

	/**
	 * @description 获取属性名称
	 * @author system
	 * @since 2017-03-24 17:04:33
	 */
	public String getPrppertityName3() {
		return prppertityName3;
	}

	/**
	 * @description 获取属性值
	 * @author system
	 * @since 2017-03-24 17:04:33
	 */
	public String getPropertityValue3() {
		return propertityValue3;
	}

	/**
	 * @description 获取属性名称
	 * @author system
	 * @since 2017-03-24 17:04:33
	 */
	public String getPrppertityName4() {
		return prppertityName4;
	}

	/**
	 * @description 获取属性值
	 * @author system
	 * @since 2017-03-24 17:04:33
	 */
	public String getPropertityValue4() {
		return propertityValue4;
	}

	/**
	 * @description 获取价格
	 * @author system
	 * @since 2017-03-24 17:04:33
	 */
	public double getPrice() {
		return price;
	}

	/**
	 * @description 获取排序
	 * @author system
	 * @since 2017-03-24 17:04:33
	 */
	public int getSortOrder() {
		return sortOrder;
	}

	/**
	 * @description 获取供货总量
	 * @author system
	 * @since 2017-03-24 17:04:33
	 */
	public int getTotalCount() {
		return totalCount;
	}

	/**
	 * @description 获取累计销量
	 * @author system
	 * @since 2017-03-24 17:04:33
	 */
	public int getSalseCount() {
		return salseCount;
	}

	/**
	 * @description 获取商品图片
	 * @author system
	 * @since 2017-03-24 17:04:33
	 */
	public String getImg() {
		return img;
	}


	/**
	 * @description 设置商品编号
	 * @author system
	 * @since 2017-03-24 17:04:33
	 */
	public void setGoodsNo(String goodsNo) {
		this.goodsNo = goodsNo;
	}

	/**
	 * @description 设置属性名称
	 * @author system
	 * @since 2017-03-24 17:04:33
	 */
	public void setPrppertityName1(String prppertityName1) {
		this.prppertityName1 = prppertityName1;
	}

	/**
	 * @description 设置属性值
	 * @author system
	 * @since 2017-03-24 17:04:33
	 */
	public void setPropertityValue1(String propertityValue1) {
		this.propertityValue1 = propertityValue1;
	}

	/**
	 * @description 设置属性名称
	 * @author system
	 * @since 2017-03-24 17:04:33
	 */
	public void setPrppertityName2(String prppertityName2) {
		this.prppertityName2 = prppertityName2;
	}

	/**
	 * @description 设置属性值
	 * @author system
	 * @since 2017-03-24 17:04:33
	 */
	public void setPropertityValue2(String propertityValue2) {
		this.propertityValue2 = propertityValue2;
	}

	/**
	 * @description 设置属性名称
	 * @author system
	 * @since 2017-03-24 17:04:33
	 */
	public void setPrppertityName3(String prppertityName3) {
		this.prppertityName3 = prppertityName3;
	}

	/**
	 * @description 设置属性值
	 * @author system
	 * @since 2017-03-24 17:04:33
	 */
	public void setPropertityValue3(String propertityValue3) {
		this.propertityValue3 = propertityValue3;
	}

	/**
	 * @description 设置属性名称
	 * @author system
	 * @since 2017-03-24 17:04:33
	 */
	public void setPrppertityName4(String prppertityName4) {
		this.prppertityName4 = prppertityName4;
	}

	/**
	 * @description 设置属性值
	 * @author system
	 * @since 2017-03-24 17:04:33
	 */
	public void setPropertityValue4(String propertityValue4) {
		this.propertityValue4 = propertityValue4;
	}

	/**
	 * @description 设置价格
	 * @author system
	 * @since 2017-03-24 17:04:33
	 */
	public void setPrice(double price) {
		this.price = price;
	}

	/**
	 * @description 设置排序
	 * @author system
	 * @since 2017-03-24 17:04:33
	 */
	public void setSortOrder(int sortOrder) {
		this.sortOrder = sortOrder;
	}

	/**
	 * @description 设置供货总量
	 * @author system
	 * @since 2017-03-24 17:04:33
	 */
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}

	/**
	 * @description 设置累计销量
	 * @author system
	 * @since 2017-03-24 17:04:33
	 */
	public void setSalseCount(int salseCount) {
		this.salseCount = salseCount;
	}

	/**
	 * @description 设置商品图片
	 * @author system
	 * @since 2017-03-24 17:04:33
	 */
	public void setImg(String img) {
		this.img = img;
	}

    public String getGoodsPriceNo() {
        return goodsPriceNo;
    }

    public void setGoodsPriceNo(String goodsPriceNo) {
        this.goodsPriceNo = goodsPriceNo;
    }
}