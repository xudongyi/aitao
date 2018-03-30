package com.business.system.bean;

import net.sf.rose.jdbc.bean.annotation.Column;
import net.sf.rose.jdbc.bean.annotation.Table;
import net.sf.rose.jdbc.bean.annotation.Type;

/**
 * @description 收货地址信息表
 * @author system
 * @since 2017-03-24 17:04:34
 */
@Table(name = "RECEIVE_ADDRESS", description = "收货地址信息表")
public class ReceiveAddressBean {

	/** 收货地址编号 */
	@Column(pk = true, name = "ADDRESS_NO", type = Type.定长文本, description = "收货地址编号", canNull = true, size = 32, policy = "UUID")
	private String addressNo;

	/** 收货地址名称 */
	@Column(name = "ADDRESS_NAME", type = Type.变长文本, description = "收货地址名称", canNull = true, size = 50)
	private String addressName;

	/** 收货地址 */
	@Column(name = "ADDRESS_CONTENT", type = Type.变长文本, description = "收货地址", canNull = true, size = 250)
	private String content;

	/** 排序 */
	@Column(name = "ADDRESS_ORDER", type = Type.数字整型, description = "排序", canNull = true)
	private int order;

	/** 收货人 */
	@Column(name = "RECEIVER", type = Type.变长文本, description = "收货人", canNull = true, size = 50)
	private String receiver;

	/** 联系电话 */
	@Column(name = "TEL", type = Type.变长文本, description = "联系电话", canNull = true, size = 20)
	private String tel;

	/** 备注 */
	@Column(name = "REMARK", type = Type.变长文本, description = "备注", canNull = true, size = 250)
	private String remark;

	/** 用户编号 */
	@Column(name = "USER_ID", type = Type.定长文本, description = "用户编号", canNull = true, size = 32)
	private String userID;

	/** 创建人 */
	@Column(name = "CREATE_USER", type = Type.变长文本, description = "创建人", canNull = true, size = 50)
	private String createUser;

	/** 创建时间 */
	@Column(name = "CREATE_TIME", type = Type.日期时间, description = "创建时间", canNull = true)
	private java.util.Date createTime;

	/** 修改人 */
	@Column(name = "UPDATE_USER", type = Type.变长文本, description = "修改人", canNull = true, size = 50)
	private String updateUser;

	/** 修改时间 */
	@Column(name = "UPDATE_TIME", type = Type.日期时间, description = "修改时间", canNull = true)
	private java.util.Date updateTime;

	/**
	 * @description 获取收货地址编号
	 * @author system
	 * @since 2017-03-24 17:04:34
	 */
	public String getAddressNo() {
		return addressNo;
	}

	/**
	 * @description 获取收货地址名称
	 * @author system
	 * @since 2017-03-24 17:04:34
	 */
	public String getAddressName() {
		return addressName;
	}

	/**
	 * @description 获取收货地址
	 * @author system
	 * @since 2017-03-24 17:04:34
	 */
	public String getContent() {
		return content;
	}

	/**
	 * @description 获取排序
	 * @author system
	 * @since 2017-03-24 17:04:34
	 */
	public int getOrder() {
		return order;
	}

	/**
	 * @description 获取收货人
	 * @author system
	 * @since 2017-03-24 17:04:34
	 */
	public String getReceiver() {
		return receiver;
	}

	/**
	 * @description 获取联系电话
	 * @author system
	 * @since 2017-03-24 17:04:34
	 */
	public String getTel() {
		return tel;
	}

	/**
	 * @description 获取备注
	 * @author system
	 * @since 2017-03-24 17:04:34
	 */
	public String getRemark() {
		return remark;
	}

	/**
	 * @description 获取用户编号
	 * @author system
	 * @since 2017-03-24 17:04:34
	 */
	public String getUserID() {
		return userID;
	}

	/**
	 * @description 获取创建人
	 * @author system
	 * @since 2017-03-24 17:04:34
	 */
	public String getCreateUser() {
		return createUser;
	}

	/**
	 * @description 获取创建时间
	 * @author system
	 * @since 2017-03-24 17:04:34
	 */
	public java.util.Date getCreateTime() {
		return createTime;
	}

	/**
	 * @description 获取修改人
	 * @author system
	 * @since 2017-03-24 17:04:34
	 */
	public String getUpdateUser() {
		return updateUser;
	}

	/**
	 * @description 获取修改时间
	 * @author system
	 * @since 2017-03-24 17:04:34
	 */
	public java.util.Date getUpdateTime() {
		return updateTime;
	}

	/**
	 * @description 设置收货地址编号
	 * @author system
	 * @since 2017-03-24 17:04:34
	 */
	public void setAddressNo(String addressNo) {
		this.addressNo = addressNo;
	}

	/**
	 * @description 设置收货地址名称
	 * @author system
	 * @since 2017-03-24 17:04:34
	 */
	public void setAddressName(String addressName) {
		this.addressName = addressName;
	}

	/**
	 * @description 设置收货地址
	 * @author system
	 * @since 2017-03-24 17:04:34
	 */
	public void setContent(String content) {
		this.content = content;
	}

	/**
	 * @description 设置排序
	 * @author system
	 * @since 2017-03-24 17:04:34
	 */
	public void setOrder(int order) {
		this.order = order;
	}

	/**
	 * @description 设置收货人
	 * @author system
	 * @since 2017-03-24 17:04:34
	 */
	public void setReceiver(String receiver) {
		this.receiver = receiver;
	}

	/**
	 * @description 设置联系电话
	 * @author system
	 * @since 2017-03-24 17:04:34
	 */
	public void setTel(String tel) {
		this.tel = tel;
	}

	/**
	 * @description 设置备注
	 * @author system
	 * @since 2017-03-24 17:04:34
	 */
	public void setRemark(String remark) {
		this.remark = remark;
	}

	/**
	 * @description 设置用户编号
	 * @author system
	 * @since 2017-03-24 17:04:34
	 */
	public void setUserID(String userID) {
		this.userID = userID;
	}

	/**
	 * @description 设置创建人
	 * @author system
	 * @since 2017-03-24 17:04:34
	 */
	public void setCreateUser(String createUser) {
		this.createUser = createUser;
	}

	/**
	 * @description 设置创建时间
	 * @author system
	 * @since 2017-03-24 17:04:34
	 */
	public void setCreateTime(java.util.Date createTime) {
		this.createTime = createTime;
	}

	/**
	 * @description 设置修改人
	 * @author system
	 * @since 2017-03-24 17:04:34
	 */
	public void setUpdateUser(String updateUser) {
		this.updateUser = updateUser;
	}

	/**
	 * @description 设置修改时间
	 * @author system
	 * @since 2017-03-24 17:04:34
	 */
	public void setUpdateTime(java.util.Date updateTime) {
		this.updateTime = updateTime;
	}

}