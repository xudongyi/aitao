package com.business.system.bean;

import net.sf.rose.jdbc.bean.annotation.Column;
import net.sf.rose.jdbc.bean.annotation.Table;
import net.sf.rose.jdbc.bean.annotation.Type;

/**
 * @description 商家信息信息表
 * @author system
 * @since 2017-03-24 17:04:32
 */
@Table(name = "SELLER", description = "商家信息信息表")
public class SellerBean {

	/** 商家编号 */
	@Column(pk = true, name = "SELLER_NO", type = Type.定长文本, description = "商家编号", canNull = true, size = 32,policy = "UUID")
	private String sellerNo;

	/** 商家名称 */
	@Column(name = "SELLER_NAME", type = Type.变长文本, description = "商家名称",  size = 50)
	private String sellerName;

    @Column(name = "SELLER_IMG", type = Type.变长文本, description = "商家图片",  size = 50)
    private String sellerImg;

	/** 商家等级 */
	@Column(name = "SELLER_GRADE", type = Type.数字整型, description = "商家等级", canNull = true)
	private int grade;

	/** 商家状态 */
	@Column(name = "SELLER_STATUS", type = Type.数字整型, description = "商家状态", canNull = true)
	private int status;

	/** 商家分类 */
	@Column(name = "SELLER_SORT", type = Type.变长文本, description = "商家分类",  size = 50)
	private String sort;

	/** 备注 */
	@Column(name = "SELLER_CONTENT", type = Type.变长文本, description = "备注",  size = 500)
	private String content;

	/** 区域 */
	@Column(name = "SELLER_AREA", type = Type.变长文本, description = "区域",  size = 50)
	private String area;

	/** 地址 */
	@Column(name = "SELLER_ADDRESS", type = Type.变长文本, description = "地址",  size = 255)
	private String address;

	/** 法人代表 */
	@Column(name = "REPRESENTATIVE", type = Type.变长文本, description = "法人代表",  size = 50)
	private String representative;

	/** 联系电话 */
	@Column(name = "TEL", type = Type.变长文本, description = "联系电话",  size = 20)
	private String tel;

	/** 电子邮件 */
	@Column(name = "EMAIL", type = Type.变长文本, description = "电子邮件",  size = 50)
	private String email;

	/** 身份证号 */
	@Column(name = "ID_CARD", type = Type.变长文本, description = "身份证号",  size = 50)
	private String idCard;

	/** 审核状态 */
	@Column(name = "CHECKED", type = Type.数字整型, description = "审核状态", canNull = true)
	private int checked;

	/** 商家关注量 */
	@Column(name = "ATTENTION_COUNT", type = Type.数字整型, description = "商家关注量", canNull = true)
	private int attionCount;

	/** 商家好评量 */
	@Column(name = "GOOD_COUNT", type = Type.数字整型, description = "商家好评量", canNull = true)
	private int goodCount;

	/** 商家差评量 */
	@Column(name = "BAD_COUNT", type = Type.数字整型, description = "商家差评量", canNull = true)
	private int badCount;
	
	/** 实力商家 */
	@Column(name = "STR_SELLER", type = Type.数字整型, description = "实力商家", canNull = true)
	private int strSeller;

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

	/** 排序 */
	@Column(name = "SELLER_ORDER", type = Type.数字整型, description = "排序", canNull = true)
	private int sellerOrder;

	/** 模板编号 */
	@Column(name = "TEMPLET_NO", type = Type.变长文本, description = "模板编号",  size = 255)
	private String templetNo;

	/** 主页地址 */
	@Column(name = "MAIN_PAGE_URL", type = Type.变长文本, description = "主页地址",  size = 255)
	private String mainPageUrl;

	/** qq账号 */
	@Column(name = "qq1", type = Type.变长文本, description = "qq账号",  size = 20)
	private String qq1;

	/** qq账号 */
	@Column(name = "qq2", type = Type.变长文本, description = "qq账号",  size = 20)
	private String qq2;

	/** qq账号 */
	@Column(name = "qq3", type = Type.变长文本, description = "qq账号",  size = 20)
	private String qq3;


	/**
	 * @description 获取商家编号
	 * @author system
	 * @since 2017-03-24 17:04:32
	 */
	public String getSellerNo() {
		return sellerNo;
	}

	/**
	 * @description 获取商家名称
	 * @author system
	 * @since 2017-03-24 17:04:32
	 */
	public String getSellerName() {
		return sellerName;
	}

	/**
	 * @description 获取商家等级
	 * @author system
	 * @since 2017-03-24 17:04:32
	 */
	public int getGrade() {
		return grade;
	}

	/**
	 * @description 获取商家状态
	 * @author system
	 * @since 2017-03-24 17:04:32
	 */
	public int getStatus() {
		return status;
	}

	/**
	 * @description 获取商家分类
	 * @author system
	 * @since 2017-03-24 17:04:32
	 */
	public String getSort() {
		return sort;
	}

	/**
	 * @description 获取备注
	 * @author system
	 * @since 2017-03-24 17:04:32
	 */
	public String getContent() {
		return content;
	}

	/**
	 * @description 获取区域
	 * @author system
	 * @since 2017-03-24 17:04:32
	 */
	public String getArea() {
		return area;
	}

	/**
	 * @description 获取地址
	 * @author system
	 * @since 2017-03-24 17:04:32
	 */
	public String getAddress() {
		return address;
	}

	/**
	 * @description 获取法人代表
	 * @author system
	 * @since 2017-03-24 17:04:32
	 */
	public String getRepresentative() {
		return representative;
	}

	/**
	 * @description 获取联系电话
	 * @author system
	 * @since 2017-03-24 17:04:32
	 */
	public String getTel() {
		return tel;
	}

	/**
	 * @description 获取电子邮件
	 * @author system
	 * @since 2017-03-24 17:04:32
	 */
	public String getEmail() {
		return email;
	}

	/**
	 * @description 获取身份证号
	 * @author system
	 * @since 2017-03-24 17:04:32
	 */
	public String getIdCard() {
		return idCard;
	}

	/**
	 * @description 获取审核状态
	 * @author system
	 * @since 2017-03-24 17:04:32
	 */
	public int getChecked() {
		return checked;
	}

	/**
	 * @description 获取商家关注量
	 * @author system
	 * @since 2017-03-24 17:04:32
	 */
	public int getAttionCount() {
		return attionCount;
	}

	/**
	 * @description 获取商家好评量
	 * @author system
	 * @since 2017-03-24 17:04:32
	 */
	public int getGoodCount() {
		return goodCount;
	}

	/**
	 * @description 获取商家差评量
	 * @author system
	 * @since 2017-03-24 17:04:32
	 */
	public int getBadCount() {
		return badCount;
	}

	/**
	 * @description 获取创建人
	 * @author system
	 * @since 2017-03-24 17:04:32
	 */
	public String getCreateUser() {
		return createUser;
	}

	/**
	 * @description 获取创建时间
	 * @author system
	 * @since 2017-03-24 17:04:32
	 */
	public java.util.Date getCreateTime() {
		return createTime;
	}

	/**
	 * @description 获取修改人
	 * @author system
	 * @since 2017-03-24 17:04:32
	 */
	public String getUpdateUser() {
		return updateUser;
	}

	/**
	 * @description 获取修改时间
	 * @author system
	 * @since 2017-03-24 17:04:32
	 */
	public java.util.Date getUpdateTime() {
		return updateTime;
	}

	/**
	 * @description 获取排序
	 * @author system
	 * @since 2017-03-24 17:04:32
	 */
	public int getSellerOrder() {
		return sellerOrder;
	}

	/**
	 * @description 获取模板编号
	 * @author system
	 * @since 2017-03-28 20:02:48
	 */
	public String getTempletNo() {
		return templetNo;
	}

	/**
	 * @description 获取主页地址
	 * @author system
	 * @since 2017-03-28 20:02:48
	 */
	public String getMainPageUrl() {
		return mainPageUrl;
	}

	/**
	 * @description 设置商家编号
	 * @author system
	 * @since 2017-03-24 17:04:32
	 */
	public void setSellerNo(String sellerNo) {
		this.sellerNo = sellerNo;
	}

	/**
	 * @description 设置商家名称
	 * @author system
	 * @since 2017-03-24 17:04:32
	 */
	public void setSellerName(String sellerName) {
		this.sellerName = sellerName;
	}

	/**
	 * @description 设置商家等级
	 * @author system
	 * @since 2017-03-24 17:04:32
	 */
	public void setGrade(int grade) {
		this.grade = grade;
	}

	/**
	 * @description 设置商家状态
	 * @author system
	 * @since 2017-03-24 17:04:32
	 */
	public void setStatus(int status) {
		this.status = status;
	}

	/**
	 * @description 设置商家分类
	 * @author system
	 * @since 2017-03-24 17:04:32
	 */
	public void setSort(String sort) {
		this.sort = sort;
	}

	/**
	 * @description 设置备注
	 * @author system
	 * @since 2017-03-24 17:04:32
	 */
	public void setContent(String content) {
		this.content = content;
	}

	/**
	 * @description 设置区域
	 * @author system
	 * @since 2017-03-24 17:04:32
	 */
	public void setArea(String area) {
		this.area = area;
	}

	/**
	 * @description 设置地址
	 * @author system
	 * @since 2017-03-24 17:04:32
	 */
	public void setAddress(String address) {
		this.address = address;
	}

	/**
	 * @description 设置法人代表
	 * @author system
	 * @since 2017-03-24 17:04:32
	 */
	public void setRepresentative(String representative) {
		this.representative = representative;
	}

	/**
	 * @description 设置联系电话
	 * @author system
	 * @since 2017-03-24 17:04:32
	 */
	public void setTel(String tel) {
		this.tel = tel;
	}

	/**
	 * @description 设置电子邮件
	 * @author system
	 * @since 2017-03-24 17:04:32
	 */
	public void setEmail(String email) {
		this.email = email;
	}

	/**
	 * @description 设置身份证号
	 * @author system
	 * @since 2017-03-24 17:04:32
	 */
	public void setIdCard(String idCard) {
		this.idCard = idCard;
	}

	/**
	 * @description 设置审核状态
	 * @author system
	 * @since 2017-03-24 17:04:32
	 */
	public void setChecked(int checked) {
		this.checked = checked;
	}

	/**
	 * @description 设置商家关注量
	 * @author system
	 * @since 2017-03-24 17:04:32
	 */
	public void setAttionCount(int attionCount) {
		this.attionCount = attionCount;
	}

	/**
	 * @description 设置商家好评量
	 * @author system
	 * @since 2017-03-24 17:04:32
	 */
	public void setGoodCount(int goodCount) {
		this.goodCount = goodCount;
	}

	/**
	 * @description 设置商家差评量
	 * @author system
	 * @since 2017-03-24 17:04:32
	 */
	public void setBadCount(int badCount) {
		this.badCount = badCount;
	}

	/**
	 * @description 设置创建人
	 * @author system
	 * @since 2017-03-24 17:04:32
	 */
	public void setCreateUser(String createUser) {
		this.createUser = createUser;
	}

	/**
	 * @description 设置创建时间
	 * @author system
	 * @since 2017-03-24 17:04:32
	 */
	public void setCreateTime(java.util.Date createTime) {
		this.createTime = createTime;
	}

	/**
	 * @description 设置修改人
	 * @author system
	 * @since 2017-03-24 17:04:32
	 */
	public void setUpdateUser(String updateUser) {
		this.updateUser = updateUser;
	}

	/**
	 * @description 设置修改时间
	 * @author system
	 * @since 2017-03-24 17:04:32
	 */
	public void setUpdateTime(java.util.Date updateTime) {
		this.updateTime = updateTime;
	}

	/**
	 * @description 设置排序
	 * @author system
	 * @since 2017-03-24 17:04:32
	 */
	public void setSellerOrder(int sellerOrder) {
		this.sellerOrder = sellerOrder;
	}

	/**
	 * @description 设置模板编号
	 * @author system
	 * @since 2017-03-28 20:02:48
	 */
	public void setTempletNo(String templetNo) {
		this.templetNo = templetNo;
	}

	/**
	 * @description 设置主页地址
	 * @author system
	 * @since 2017-03-28 20:02:48
	 */
	public void setMainPageUrl(String mainPageUrl) {
		this.mainPageUrl = mainPageUrl;
	}

    public String getSellerImg() {
        return sellerImg;
    }

    public void setSellerImg(String sellerImg) {
        this.sellerImg = sellerImg;
    }

	public int getStrSeller() {
		return strSeller;
	}

	public void setStrSeller(int strSeller) {
		this.strSeller = strSeller;
	}

    public String getQq1() {
        return qq1;
    }

    public void setQq1(String qq1) {
        this.qq1 = qq1;
    }

    public String getQq2() {
        return qq2;
    }

    public void setQq2(String qq2) {
        this.qq2 = qq2;
    }

    public String getQq3() {
        return qq3;
    }

    public void setQq3(String qq3) {
        this.qq3 = qq3;
    }
}