package com.business.system.bean;

import net.sf.rose.jdbc.bean.annotation.Column;
import net.sf.rose.jdbc.bean.annotation.Table;
import net.sf.rose.jdbc.bean.annotation.Type;

/**
 * @description 商家评论记录信息表
 * @author system
 * @since 2017-02-24 20:24:17
 */
@Table(name = "SELLER_COMMENT_LOG", description = "商家评论记录信息表")
public class SellerCommentLogBean {

	/** 评论编号 */
	@Column(pk = true, name = "COMMENT_NO", type = Type.定长文本, description = "评论编号", canNull = false, size = 32, policy = "UUID")
	private String commentNo;

	/** 用户编号 */
	@Column(name = "USER_ID", type = Type.定长文本, description = "用户编号", canNull = false, size = 32)
	private String userID;

	/** 用户名称 */
	@Column(name = "USER_NAME", type = Type.变长文本, description = "用户名称", canNull = false, size = 50)
	private String userName;

	/** 创建时间 */
	@Column(name = "CREATE_TIME", type = Type.日期时间, description = "创建时间", canNull = false)
	private java.sql.Timestamp createTime;

	/** 标题 */
	@Column(name = "COMMENT_TITLE", type = Type.变长文本, description = "标题", canNull = false, size = 50)
	private String title;

	/** 内容 */
	@Column(name = "COMMENT_CONTENT", type = Type.变长文本, description = "内容", canNull = false, size = 500)
	private String content;

	/** 等级 */
	@Column(name = "COMMENT_GRADE", type = Type.数字整型, description = "等级", canNull = false)
	private int grade;

	/** 商家编号 */
	@Column(name = "SELLER_NO", type = Type.定长文本, description = "商家编号", canNull = false, size = 32)
	private String sellerNo;

	/**
	 * @description 获取评论编号
	 * @author system
	 * @since 2017-02-24 20:24:17
	 */
	public String getCommentNo() {
		return commentNo;
	}

	/**
	 * @description 设置评论编号
	 * @author system
	 * @since 2017-02-24 20:24:17
	 */
	public void setCommentNo(String commentNo) {
		this.commentNo = commentNo;
	}

	/**
	 * @description 获取用户编号
	 * @author system
	 * @since 2017-02-24 20:24:17
	 */
	public String getUserID() {
		return userID;
	}

	/**
	 * @description 设置用户编号
	 * @author system
	 * @since 2017-02-24 20:24:17
	 */
	public void setUserID(String userID) {
		this.userID = userID;
	}

	/**
	 * @description 获取用户名称
	 * @author system
	 * @since 2017-02-24 20:24:17
	 */
	public String getUserName() {
		return userName;
	}

	/**
	 * @description 设置用户名称
	 * @author system
	 * @since 2017-02-24 20:24:17
	 */
	public void setUserName(String userName) {
		this.userName = userName;
	}

	/**
	 * @description 获取创建时间
	 * @author system
	 * @since 2017-02-24 20:24:17
	 */
	public java.sql.Timestamp getCreateTime() {
		return createTime;
	}

	/**
	 * @description 设置创建时间
	 * @author system
	 * @since 2017-02-24 20:24:17
	 */
	public void setCreateTime(java.sql.Timestamp createTime) {
		this.createTime = createTime;
	}

	/**
	 * @description 获取标题
	 * @author system
	 * @since 2017-02-24 20:24:17
	 */
	public String getTitle() {
		return title;
	}

	/**
	 * @description 设置标题
	 * @author system
	 * @since 2017-02-24 20:24:17
	 */
	public void setTitle(String title) {
		this.title = title;
	}

	/**
	 * @description 获取内容
	 * @author system
	 * @since 2017-02-24 20:24:17
	 */
	public String getContent() {
		return content;
	}

	/**
	 * @description 设置内容
	 * @author system
	 * @since 2017-02-24 20:24:17
	 */
	public void setContent(String content) {
		this.content = content;
	}

	/**
	 * @description 获取等级
	 * @author system
	 * @since 2017-02-24 20:24:17
	 */
	public int getGrade() {
		return grade;
	}

	/**
	 * @description 设置等级
	 * @author system
	 * @since 2017-02-24 20:24:17
	 */
	public void setGrade(int grade) {
		this.grade = grade;
	}

	/**
	 * @description 获取商家编号
	 * @author system
	 * @since 2017-02-24 20:24:17
	 */
	public String getSellerNo() {
		return sellerNo;
	}

	/**
	 * @description 设置商家编号
	 * @author system
	 * @since 2017-02-24 20:24:17
	 */
	public void setSellerNo(String sellerNo) {
		this.sellerNo = sellerNo;
	}

}