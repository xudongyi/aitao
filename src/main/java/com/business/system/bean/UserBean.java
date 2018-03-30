package com.business.system.bean;

import net.sf.rose.jdbc.bean.annotation.Column;
import net.sf.rose.jdbc.bean.annotation.Table;
import net.sf.rose.jdbc.bean.annotation.Type;

/**
 * @description 用户信息信息表
 * @author system
 * @since 2017-03-24 17:04:34
 */
@Table(name = "USER", description = "用户信息信息表")
public class UserBean {

	/** 用户编号 */
	@Column(pk = true, name = "USER_ID", type = Type.定长文本, description = "用户编号", canNull = true, size = 32,policy = "UUID")
	private String userID;

	/** 用户名称 */
	@Column(name = "USER_NAME", type = Type.变长文本, description = "用户名称",  size = 50)
	private String userName;

	/** 登录名 */
	@Column(name = "LOGIN_NAME", type = Type.变长文本, description = "登录名",  size = 50)
	private String loginName;

	/** 呢称 */
	@Column(name = "NICK_NAME", type = Type.变长文本, description = "呢称",  size = 50)
	private String nickName;

	/** 邮件 */
	@Column(name = "EMAIL", type = Type.变长文本, description = "邮件",  size = 50)
	private String email;

	/** 手机 */
	@Column(name = "TEL", type = Type.变长文本, description = "手机",  size = 50)
	private String tel;

	/** 验证手机 */
	@Column(name = "TEL_CHECKED", type = Type.数字整型, description = "验证手机", canNull = true)
	private int telChecked;

	/** 密码 */
	@Column(name = "PASSWORD", type = Type.变长文本, description = "密码",  size = 50)
	private String password;

	/** 用户等级 */
	@Column(name = "USER_GRADE", type = Type.变长文本, description = "用户等级",  size = 20)
	private String grade;

	/** 性别 */
	@Column(name = "SEX", type = Type.数字整型, description = "性别", canNull = true)
	private int sex;

	/** 年龄 */
	@Column(name = "AGE", type = Type.数字整型, description = "年龄", canNull = true)
	private int age;

	/** 出生日期 */
	@Column(name = "BIRTHDAY", type = Type.日期时间, description = "出生日期", canNull = true)
	private java.util.Date birthday;

	/** 身份证号 */
	@Column(name = "ID_CARD", type = Type.变长文本, description = "身份证号",  size = 20)
	private String idCard;

	/** 所在区域 */
	@Column(name = "USER_AREA", type = Type.变长文本, description = "所在区域",  size = 50)
	private String area;

	/** 详细地址 */
	@Column(name = "USER_ADDRESS", type = Type.变长文本, description = "详细地址",  size = 255)
	private String address;

	/** 状态 */
	@Column(name = "USER_STATUS", type = Type.数字整型, description = "状态", canNull = true)
	private int status;

	/** 商家编号 */
	@Column(name = "SELLER_NO", type = Type.定长文本, description = "商家编号",  size = 32)
	private String sellerNo;

	/** 创建人 */
	@Column(name = "CREATE_USER", type = Type.变长文本, description = "创建人",  size = 50)
	private String createUser;

	/** 创建时间 */
	@Column(name = "CREATE_TIME", type = Type.日期时间, description = "创建时间", canNull = true)
	private java.util.Date createTime;

	/** 修改人 */
	@Column(name = "UPDATE_USER", type = Type.变长文本, description = "修改人",  size = 50)
	private String updateUser;

	/** 修改时间 */
	@Column(name = "UPDATE_TIME", type = Type.日期时间, description = "修改时间", canNull = true)
	private java.util.Date updateTime;

	/** 登录次数 */
	@Column(name = "LOGIN_COUNT", type = Type.数字整型, description = "登录次数", canNull = true)
	private int loginCount;

	/** 最近登录时间 */
	@Column(name = "LAST_LOGIN_TIME", type = Type.日期时间, description = "最近登录时间", canNull = true)
	private java.util.Date lastLoginTime;

	/** 用户角色 */
	@Column(name = "USER_ROLER", type = Type.数字整型, description = "用户角色", canNull = true)
	private int roler;

	/**
	 * @description 获取用户编号
	 * @author system
	 * @since 2017-03-24 17:04:34
	 */
	public String getUserID() {
		return userID;
	}

	/**
	 * @description 获取用户名称
	 * @author system
	 * @since 2017-03-24 17:04:34
	 */
	public String getUserName() {
		return userName;
	}

	/**
	 * @description 获取登录名
	 * @author system
	 * @since 2017-03-24 17:04:34
	 */
	public String getLoginName() {
		return loginName;
	}

	/**
	 * @description 获取呢称
	 * @author system
	 * @since 2017-03-24 17:04:34
	 */
	public String getNickName() {
		return nickName;
	}

	/**
	 * @description 获取邮件
	 * @author system
	 * @since 2017-03-24 17:04:34
	 */
	public String getEmail() {
		return email;
	}

	/**
	 * @description 获取手机
	 * @author system
	 * @since 2017-03-24 17:04:34
	 */
	public String getTel() {
		return tel;
	}

	/**
	 * @description 获取验证手机
	 * @author system
	 * @since 2017-03-24 17:04:34
	 */
	public int getTelChecked() {
		return telChecked;
	}

	/**
	 * @description 获取密码
	 * @author system
	 * @since 2017-03-24 17:04:34
	 */
	public String getPassword() {
		return password;
	}

	/**
	 * @description 获取用户等级
	 * @author system
	 * @since 2017-03-24 17:04:34
	 */
	public String getGrade() {
		return grade;
	}

	/**
	 * @description 获取性别
	 * @author system
	 * @since 2017-03-24 17:04:34
	 */
	public int getSex() {
		return sex;
	}

	/**
	 * @description 获取年龄
	 * @author system
	 * @since 2017-03-24 17:04:34
	 */
	public int getAge() {
		return age;
	}

	/**
	 * @description 获取出生日期
	 * @author system
	 * @since 2017-03-24 17:04:34
	 */
	public java.util.Date getBirthday() {
		return birthday;
	}

	/**
	 * @description 获取身份证号
	 * @author system
	 * @since 2017-03-24 17:04:34
	 */
	public String getIdCard() {
		return idCard;
	}

	/**
	 * @description 获取所在区域
	 * @author system
	 * @since 2017-03-24 17:04:34
	 */
	public String getArea() {
		return area;
	}

	/**
	 * @description 获取详细地址
	 * @author system
	 * @since 2017-03-24 17:04:34
	 */
	public String getAddress() {
		return address;
	}

	/**
	 * @description 获取状态
	 * @author system
	 * @since 2017-03-24 17:04:34
	 */
	public int getStatus() {
		return status;
	}

	/**
	 * @description 获取商家编号
	 * @author system
	 * @since 2017-03-24 17:04:34
	 */
	public String getSellerNo() {
		return sellerNo;
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
	 * @description 获取登录次数
	 * @author system
	 * @since 2017-03-24 17:04:34
	 */
	public int getLoginCount() {
		return loginCount;
	}

	/**
	 * @description 获取最近登录时间
	 * @author system
	 * @since 2017-03-24 17:04:34
	 */
	public java.util.Date getLastLoginTime() {
		return lastLoginTime;
	}

	/**
	 * @description 获取用户角色
	 * @author system
	 * @since 2017-03-24 17:04:34
	 */
	public int getRoler() {
		return roler;
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
	 * @description 设置用户名称
	 * @author system
	 * @since 2017-03-24 17:04:34
	 */
	public void setUserName(String userName) {
		this.userName = userName;
	}

	/**
	 * @description 设置登录名
	 * @author system
	 * @since 2017-03-24 17:04:34
	 */
	public void setLoginName(String loginName) {
		this.loginName = loginName;
	}

	/**
	 * @description 设置呢称
	 * @author system
	 * @since 2017-03-24 17:04:34
	 */
	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	/**
	 * @description 设置邮件
	 * @author system
	 * @since 2017-03-24 17:04:34
	 */
	public void setEmail(String email) {
		this.email = email;
	}

	/**
	 * @description 设置手机
	 * @author system
	 * @since 2017-03-24 17:04:34
	 */
	public void setTel(String tel) {
		this.tel = tel;
	}

	/**
	 * @description 设置验证手机
	 * @author system
	 * @since 2017-03-24 17:04:34
	 */
	public void setTelChecked(int telChecked) {
		this.telChecked = telChecked;
	}

	/**
	 * @description 设置密码
	 * @author system
	 * @since 2017-03-24 17:04:34
	 */
	public void setPassword(String password) {
		this.password = password;
	}

	/**
	 * @description 设置用户等级
	 * @author system
	 * @since 2017-03-24 17:04:34
	 */
	public void setGrade(String grade) {
		this.grade = grade;
	}

	/**
	 * @description 设置性别
	 * @author system
	 * @since 2017-03-24 17:04:34
	 */
	public void setSex(int sex) {
		this.sex = sex;
	}

	/**
	 * @description 设置年龄
	 * @author system
	 * @since 2017-03-24 17:04:34
	 */
	public void setAge(int age) {
		this.age = age;
	}

	/**
	 * @description 设置出生日期
	 * @author system
	 * @since 2017-03-24 17:04:34
	 */
	public void setBirthday(java.util.Date birthday) {
		this.birthday = birthday;
	}

	/**
	 * @description 设置身份证号
	 * @author system
	 * @since 2017-03-24 17:04:34
	 */
	public void setIdCard(String idCard) {
		this.idCard = idCard;
	}

	/**
	 * @description 设置所在区域
	 * @author system
	 * @since 2017-03-24 17:04:34
	 */
	public void setArea(String area) {
		this.area = area;
	}

	/**
	 * @description 设置详细地址
	 * @author system
	 * @since 2017-03-24 17:04:34
	 */
	public void setAddress(String address) {
		this.address = address;
	}

	/**
	 * @description 设置状态
	 * @author system
	 * @since 2017-03-24 17:04:34
	 */
	public void setStatus(int status) {
		this.status = status;
	}

	/**
	 * @description 设置商家编号
	 * @author system
	 * @since 2017-03-24 17:04:34
	 */
	public void setSellerNo(String sellerNo) {
		this.sellerNo = sellerNo;
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

	/**
	 * @description 设置登录次数
	 * @author system
	 * @since 2017-03-24 17:04:34
	 */
	public void setLoginCount(int loginCount) {
		this.loginCount = loginCount;
	}

	/**
	 * @description 设置最近登录时间
	 * @author system
	 * @since 2017-03-24 17:04:34
	 */
	public void setLastLoginTime(java.util.Date lastLoginTime) {
		this.lastLoginTime = lastLoginTime;
	}

	/**
	 * @description 设置用户角色
	 * @author system
	 * @since 2017-03-24 17:04:34
	 */
	public void setRoler(int roler) {
		this.roler = roler;
	}

}