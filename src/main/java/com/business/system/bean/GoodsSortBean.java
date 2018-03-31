package com.business.system.bean;

import net.sf.rose.jdbc.bean.annotation.Column;
import net.sf.rose.jdbc.bean.annotation.Table;
import net.sf.rose.jdbc.bean.annotation.Type;

/**
 * @description 商品分类信息表
 * @author system
 * @since 2017-03-24 17:04:33
 */
@Table(name = "GOODS_SORT", description = "商品分类信息表")
public class GoodsSortBean{

	/** 商品分类编号 */
	@Column(pk = true, name = "SORT_NO", type = Type.定长文本, description = "商品分类编号", canNull = true, size = 32, policy = "UUID")
	private String sortNo;

	/** 分类代码 */
	@Column(name = "SORT_CODE", type = Type.变长文本, description = "分类代码", canNull = true, size = 50)
	private String sortCode;

	/** 淘宝代码 */
	@Column(name = "TB_CODE", type = Type.变长文本, description = "淘宝代码", canNull = true, size = 50)
	private String tbCode;

	/** 京东代码 */
	@Column(name = "JD_CODE", type = Type.变长文本, description = "京东代码", canNull = true, size = 50)
	private String jdCode;

	/** 分类名称 */
	@Column(name = "SORT_NAME", type = Type.变长文本, description = "分类名称", canNull = true, size = 50)
	private String sortName;

	/** 排序 */
	@Column(name = "SORT_ORDER", type = Type.数字整型, description = "排序", canNull = true)
	private int sortOrder;

	/** 启用 */
	@Column(name = "ON_USE", type = Type.数字整型, description = "启用", canNull = true)
	private int onUse;

	/** 父级分类 */
	@Column(name = "PARENT_NO", type = Type.定长文本, description = "父级分类", canNull = true, size = 32)
	private String parentNO;

    /** 是否显示在首页*/
    @Column(name = "SHOW_INDEX", type = Type.数字整型, description = "是否显示在首页", canNull = true)
	private int showIndex;

	/**
	 * @description 获取商品分类编号
	 * @author system
	 * @since 2017-03-24 17:04:33
	 */
	public String getSortNo() {
		return sortNo;
	}

	/**
	 * @description 获取分类代码
	 * @author system
	 * @since 2017-03-24 17:04:33
	 */
	public String getSortCode() {
		return sortCode;
	}

	/**
	 * @description 获取淘宝代码
	 * @author system
	 * @since 2017-03-28 20:02:49
	 */
	public String getTbCode() {
		return tbCode;
	}

	/**
	 * @description 获取京东代码
	 * @author system
	 * @since 2017-03-28 20:02:49
	 */
	public String getJdCode() {
		return jdCode;
	}

	/**
	 * @description 获取分类名称
	 * @author system
	 * @since 2017-03-24 17:04:33
	 */
	public String getSortName() {
		return sortName;
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
	 * @description 获取启用
	 * @author system
	 * @since 2017-03-24 17:04:33
	 */
	public int getOnUse() {
		return onUse;
	}

	/**
	 * @description 获取父级分类
	 * @author system
	 * @since 2017-03-24 17:04:33
	 */
	public String getParentNO() {
		return parentNO;
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
	 * @description 设置分类代码
	 * @author system
	 * @since 2017-03-24 17:04:33
	 */
	public void setSortCode(String sortCode) {
		this.sortCode = sortCode;
	}

	/**
	 * @description 设置淘宝代码
	 * @author system
	 * @since 2017-03-28 20:02:49
	 */
	public void setTbCode(String tbCode) {
		this.tbCode = tbCode;
	}

	/**
	 * @description 设置京东代码
	 * @author system
	 * @since 2017-03-28 20:02:49
	 */
	public void setJdCode(String jdCode) {
		this.jdCode = jdCode;
	}

	/**
	 * @description 设置分类名称
	 * @author system
	 * @since 2017-03-24 17:04:33
	 */
	public void setSortName(String sortName) {
		this.sortName = sortName;
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
	 * @description 设置启用
	 * @author system
	 * @since 2017-03-24 17:04:33
	 */
	public void setOnUse(int onUse) {
		this.onUse = onUse;
	}

	/**
	 * @description 设置父级分类
	 * @author system
	 * @since 2017-03-24 17:04:33
	 */
	public void setParentNO(String parentNO) {
		this.parentNO = parentNO;
	}

    public int getShowIndex() {
        return showIndex;
    }

    public void setShowIndex(int showIndex) {
        this.showIndex = showIndex;
    }
}