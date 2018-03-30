package com.business.system.bean;

import net.sf.rose.jdbc.bean.annotation.Column;
import net.sf.rose.jdbc.bean.annotation.Table;
import net.sf.rose.jdbc.bean.annotation.Type;

/**
 * @description 商品信息信息表
 * @author system
 * @since 2017-02-24 20:24:16
 */
@Table(name = "GOODS_FILE", description = "商品图片表")
public class GoodsFileBean {

	/** 图片编号 */
	@Column(pk = true, name = "FILE_ID", type = Type.定长文本, description = "图片编号", canNull = false, size = 32, policy = "UUID")
	private String fileID;

	/** 商品编号 */
	@Column(name = "GOODS_NO", type = Type.定长文本, description = "商品编号", canNull = false, size = 32)
	private String goodsNo;

	/** 图片地址 */
	@Column(name = "FILE_URL", type = Type.变长文本, description = "图片地址", canNull = false, size = 255 )
	private String fileUrl;

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
	 * @description 获取图片编号
	 * @author system
	 * @since 2017-02-24 20:24:16
	 */
	public String getFileID() {
		return fileID;
	}

	/**
	 * @description 设置图片编号
	 * @author system
	 * @since 2017-02-24 20:24:16
	 */
	public void setFileID(String fileID) {
		this.fileID = fileID;
	}

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
	 * @description 获取图片地址
	 * @author system
	 * @since 2017-02-24 20:24:16
	 */
	public String getFileUrl() {
		return fileUrl;
	}

	/**
	 * @description 设置图片地址
	 * @author system
	 * @since 2017-02-24 20:24:16
	 */
	public void setFileUrl(String fileUrl) {
		this.fileUrl = fileUrl;
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