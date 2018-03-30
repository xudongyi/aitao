package com.business.system.bean;

import net.sf.rose.jdbc.bean.annotation.Column;
import net.sf.rose.jdbc.bean.annotation.Table;
import net.sf.rose.jdbc.bean.annotation.Type;

/**
 * @description 商家关注记录信息表
 * @author system
 * @since 2017-03-24 17:04:35
 */
@Table(name = "SELLER_ATTENTION_LOG", description = "商家关注记录信息表")
public class SellerAttentionLogBean {

	/** 评论编号 */
	@Column(pk = true, name = "ATTENTION_NO", type = Type.定长文本, description = "评论编号", canNull = true, size = 32,policy = "UUID")
	private String commentNo;

	/** 用户编号 */
	@Column(name = "USER_ID", type = Type.定长文本, description = "用户编号", canNull = true, size = 32)
	private String userID;

	/** 用户名称 */
	@Column(name = "USER_NAME", type = Type.变长文本, description = "用户名称", canNull = true, size = 50)
	private String userName;

	/** 创建时间 */
	@Column(name = "CREATE_TIME", type = Type.日期时间, description = "创建时间", canNull = true)
	private java.util.Date createTime;

	/** 等级 */
	@Column(name = "ATTENTION_STATUS", type = Type.数字整型, description = "等级", canNull = true)
	private int grade;

	/** 商家编号 */
	@Column(name = "SELLER_NO", type = Type.定长文本, description = "商家编号", canNull = true, size = 32)
	private String sellerNo;

	/**
	 * @description 获取评论编号
	 * @author system
	 * @since 2017-03-24 17:04:35
	 */
	public String getCommentNo() {
		return commentNo;
	}

	/**
	 * @description 获取用户编号
	 * @author system
	 * @since 2017-03-24 17:04:35
	 */
	public String getUserID() {
		return userID;
	}

	/**
	 * @description 获取用户名称
	 * @author system
	 * @since 2017-03-24 17:04:35
	 */
	public String getUserName() {
		return userName;
	}

	/**
	 * @description 获取创建时间
	 * @author system
	 * @since 2017-03-24 17:04:35
	 */
	public java.util.Date getCreateTime() {
		return createTime;
	}

	/**
	 * @description 获取等级
	 * @author system
	 * @since 2017-03-24 17:04:35
	 */
	public int getGrade() {
		return grade;
	}

	/**
	 * @description 获取商家编号
	 * @author system
	 * @since 2017-03-24 17:04:35
	 */
	public String getSellerNo() {
		return sellerNo;
	}

	/**
	 * @description 设置评论编号
	 * @author system
	 * @since 2017-03-24 17:04:35
	 */
	public void setCommentNo(String commentNo) {
		this.commentNo = commentNo;
	}

	/**
	 * @description 设置用户编号
	 * @author system
	 * @since 2017-03-24 17:04:35
	 */
	public void setUserID(String userID) {
		this.userID = userID;
	}

	/**
	 * @description 设置用户名称
	 * @author system
	 * @since 2017-03-24 17:04:35
	 */
	public void setUserName(String userName) {
		this.userName = userName;
	}

	/**
	 * @description 设置创建时间
	 * @author system
	 * @since 2017-03-24 17:04:35
	 */
	public void setCreateTime(java.util.Date createTime) {
		this.createTime = createTime;
	}

	/**
	 * @description 设置等级
	 * @author system
	 * @since 2017-03-24 17:04:35
	 */
	public void setGrade(int grade) {
		this.grade = grade;
	}

	/**
	 * @description 设置商家编号
	 * @author system
	 * @since 2017-03-24 17:04:35
	 */
	public void setSellerNo(String sellerNo) {
		this.sellerNo = sellerNo;
	}

}