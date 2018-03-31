package com.business.system.bean;

import net.sf.rose.jdbc.bean.annotation.Column;
import net.sf.rose.jdbc.bean.annotation.Table;
import net.sf.rose.jdbc.bean.annotation.Type;

/** 
* @Description:
* @author  zpc 
* @date 创建时间：2018年3月31日 上午11:35:04 
* @version 1.0 
*/
@Table(name = "SELLER_FILE", description = "商户图片表" ,orderBy = "fileOrder")
public class SellerFileBean {
	/** 图片编号 */
	@Column(pk = true, name = "FILE_ID", type = Type.定长文本, description = "图片编号", canNull = true, size = 32, policy = "UUID")
	private String fileId;

	/** 商品编号 */
	@Column(name = "SELLER_NO", type = Type.定长文本, description = "商品编号", canNull = true, size = 32)
	private String sellerNo;

	/** 图片地址 */
	@Column(name = "FILE_URL", type = Type.变长文本, description = "图片地址", canNull = true, size = 255 )
	private String fileUrl;
	
	/** 排序 */
	@Column(name = "FILE_ORDER", type = Type.数字整型, description = "排序", canNull = true )
	private int fileOrder;
	
	/** 图片类型
	 * 1:轮播图片
	 *  */
	@Column(name = "FILE_TYPE", type = Type.变长文本, description = "图片类型", canNull = true, size = 1 )
	private String fileType;

	/** 创建人 */
	@Column(name = "CREATE_USER", type = Type.变长文本, description = "创建人", canNull = true, size = 50)
	private String createUser;

	/** 创建时间 */
	@Column(name = "CREATE_TIME", type = Type.日期时间, description = "创建时间", canNull = true)
	private java.sql.Timestamp createTime;

	/** 修改人 */
	@Column(name = "UPDATE_USER", type = Type.变长文本, description = "修改人", canNull = true, size = 50)
	private String updateUser;

	/** 修改时间 */
	@Column(name = "UPDATE_TIME", type = Type.日期时间, description = "修改时间", canNull = true)
	private java.sql.Timestamp updateTime;

	
	public String getFileId() {
		return fileId;
	}

	public void setFileId(String fileId) {
		this.fileId = fileId;
	}

	public String getSellerNo() {
		return sellerNo;
	}

	public void setSellerNo(String sellerNo) {
		this.sellerNo = sellerNo;
	}

	public String getFileUrl() {
		return fileUrl;
	}

	public void setFileUrl(String fileUrl) {
		this.fileUrl = fileUrl;
	}

	public int getFileOrder() {
		return fileOrder;
	}

	public void setFileOrder(int fileOrder) {
		this.fileOrder = fileOrder;
	}

	public String getFileType() {
		return fileType;
	}

	public void setFileType(String fileType) {
		this.fileType = fileType;
	}

	public String getCreateUser() {
		return createUser;
	}

	public void setCreateUser(String createUser) {
		this.createUser = createUser;
	}

	public java.sql.Timestamp getCreateTime() {
		return createTime;
	}

	public void setCreateTime(java.sql.Timestamp createTime) {
		this.createTime = createTime;
	}

	public String getUpdateUser() {
		return updateUser;
	}

	public void setUpdateUser(String updateUser) {
		this.updateUser = updateUser;
	}

	public java.sql.Timestamp getUpdateTime() {
		return updateTime;
	}

	public void setUpdateTime(java.sql.Timestamp updateTime) {
		this.updateTime = updateTime;
	}
	
	
}
