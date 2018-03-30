package com.business.system.bean;

import net.sf.rose.jdbc.bean.annotation.Column;
import net.sf.rose.jdbc.bean.annotation.Table;
import net.sf.rose.jdbc.bean.annotation.Type;

/**
 * @description 商品分类信息表
 * @author system
 * @since 2017-02-24 20:24:16
 */
@Table(name = "GOODS_SORT", description = "商品分类信息表")
public class GoodsSortBean {

	/** 商品分类编号 */
	@Column(pk = true, name = "SORT_NO", type = Type.定长文本, description = "商品分类编号", canNull = false, size = 32, policy = "UUID")
	private String sortNo;

	/** 分类代码 */
	@Column(name = "SORT_CODE", type = Type.变长文本, description = "分类代码", canNull = false, size = 50)
	private String sortCode;

	/** 分类名称 */
	@Column(name = "SORT_NAME", type = Type.变长文本, description = "分类名称", canNull = false, size = 50)
	private String sortName;

	/** 排序 */
	@Column(name = "SORT_ORDER", type = Type.数字整型, description = "排序", canNull = false)
	private int sortOrder;

	/** 启用 */
	@Column(name = "ON_USE", type = Type.数字整型, description = "启用", canNull = false)
	private int onUse;

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

	/**
	 * @description 获取商品分类编号
	 * @author system
	 * @since 2017-02-24 20:24:16
	 */
	public String getSortNo() {
		return sortNo;
	}

	/**
	 * @description 设置商品分类编号
	 * @author system
	 * @since 2017-02-24 20:24:16
	 */
	public void setSortNo(String sortNo) {
		this.sortNo = sortNo;
	}

	/**
	 * @description 获取分类代码
	 * @author system
	 * @since 2017-02-24 20:24:16
	 */
	public String getSortCode() {
		return sortCode;
	}

	/**
	 * @description 设置分类代码
	 * @author system
	 * @since 2017-02-24 20:24:16
	 */
	public void setSortCode(String sortCode) {
		this.sortCode = sortCode;
	}

	/**
	 * @description 获取分类名称
	 * @author system
	 * @since 2017-02-24 20:24:16
	 */
	public String getSortName() {
		return sortName;
	}

	/**
	 * @description 设置分类名称
	 * @author system
	 * @since 2017-02-24 20:24:16
	 */
	public void setSortName(String sortName) {
		this.sortName = sortName;
	}

	/**
	 * @description 获取排序
	 * @author system
	 * @since 2017-02-24 20:24:16
	 */
	public int getSortOrder() {
		return sortOrder;
	}

	/**
	 * @description 设置排序
	 * @author system
	 * @since 2017-02-24 20:24:16
	 */
	public void setSortOrder(int sortOrder) {
		this.sortOrder = sortOrder;
	}

	/**
	 * @description 获取启用
	 * @author system
	 * @since 2017-02-24 20:24:16
	 */
	public int getOnUse() {
		return onUse;
	}

	/**
	 * @description 设置启用
	 * @author system
	 * @since 2017-02-24 20:24:16
	 */
	public void setOnUse(int onUse) {
		this.onUse = onUse;
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

}