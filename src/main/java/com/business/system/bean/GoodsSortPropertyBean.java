package com.business.system.bean;

import net.sf.rose.jdbc.bean.annotation.Column;
import net.sf.rose.jdbc.bean.annotation.Table;
import net.sf.rose.jdbc.bean.annotation.Type;

/**
 * @description 商品分类信息表
 * @author system
 * @since 2017-03-24 17:04:33
 */
@Table(name = "GOODS_SORT_PROPERTY", description = "商品分类信息表")
public class GoodsSortPropertyBean {

	/** 商品分类属性编号 */
	@Column(pk = true, name = "SORT_PRO_NO", type = Type.定长文本, description = "商品分类属性编号", canNull = true, size = 32, policy = "UUID")
	private String sortPropertyNo;

	/** 商品分类编号 */
	@Column(name = "SORT_NO", type = Type.定长文本, description = "商品分类编号", canNull = true, size = 32)
	private String sortNo;

	/** 分类属性名称 */
	@Column(name = "SORT_PRO_NAME", type = Type.变长文本, description = "分类属性名称", canNull = true, size = 50)
	private String sortPropertyName;

	/** 分类属性值 */
	@Column(name = "SORT_PRO_VALUE", type = Type.变长文本, description = "分类属性值", canNull = true, size = 50)
	private String sortPropertyValue;

	/** 排序 */
	@Column(name = "SORT_ORDER", type = Type.数字整型, description = "排序", canNull = true)
	private int sortOrder;

	/** 商品图片 */
	@Column(name = "IMG", type = Type.变长文本, description = "商品图片", canNull = true, size = 255)
	private String img;

	/**
	 * @description 获取商品分类属性编号
	 * @author system
	 * @since 2017-03-24 17:04:33
	 */
	public String getSortPropertyNo() {
		return sortPropertyNo;
	}

	/**
	 * @description 获取商品分类编号
	 * @author system
	 * @since 2017-03-24 17:04:33
	 */
	public String getSortNo() {
		return sortNo;
	}

	/**
	 * @description 获取分类属性名称
	 * @author system
	 * @since 2017-03-24 17:04:33
	 */
	public String getSortPropertyName() {
		return sortPropertyName;
	}

	/**
	 * @description 获取分类属性值
	 * @author system
	 * @since 2017-03-24 17:21:52
	 */
	public String getSortPropertyValue() {
		return sortPropertyValue;
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
	 * @description 获取商品图片
	 * @author system
	 * @since 2017-03-24 17:04:33
	 */
	public String getImg() {
		return img;
	}

	/**
	 * @description 设置商品分类属性编号
	 * @author system
	 * @since 2017-03-24 17:04:33
	 */
	public void setSortPropertyNo(String sortPropertyNo) {
		this.sortPropertyNo = sortPropertyNo;
	}

	/**
	 * @description 设置商品分类编号
	 * @author system
	 * @since 2017-03-24 17:04:33
	 */
	public void setSortNo(String sortNo) {
		this.sortNo = sortNo;
	}

	/**
	 * @description 设置分类属性名称
	 * @author system
	 * @since 2017-03-24 17:04:33
	 */
	public void setSortPropertyName(String sortPropertyName) {
		this.sortPropertyName = sortPropertyName;
	}

	/**
	 * @description 设置分类属性值
	 * @author system
	 * @since 2017-03-24 17:21:52
	 */
	public void setSortPropertyValue(String sortPropertyValue) {
		this.sortPropertyValue = sortPropertyValue;
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
	 * @description 设置商品图片
	 * @author system
	 * @since 2017-03-24 17:04:33
	 */
	public void setImg(String img) {
		this.img = img;
	}

}