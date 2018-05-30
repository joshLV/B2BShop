package net.deepdragon.entity.weipu;

import org.apache.ibatis.type.Alias;

//Generated from PowerDesigner file ,Written by 张莹.

/**
 * 表名称：搜索热词
 * 表代码：wp_keywords_search
*/
@Alias(net.deepdragon.constant.weipu.Weipu.SIGN+"Keywords")
public class Keywords extends BaseEntity {

	private static final long serialVersionUID = 1861069741584972248L;
	
	/**
	*租户ID
	*/
	private String tenantId;
	
	/**
	*搜索关键字
	*/
	private String keywords;
	
	/**
	*备注
	*/
	private String remark;
	
	/**
	*排序
	*/
	private Integer orderNo;
	
	/**
	*平台类型
	*/
	private String platform;
	
	/**
	* 字段名称 :租户ID
	* 数据类型 :bigint
	* 是否必填 :false
	*/
	public String getTenantId() {
		return this.tenantId;
	}

	/**
	* 字段名称 :租户ID
	* 数据类型 :bigint
	* 是否必填 :false
	*/
	public void setTenantId(String tenantId) {
		 this.tenantId = tenantId;
    }
    
	/**
	* 字段名称 :搜索关键字
	* 数据类型 :varchar(50)
	* 是否必填 :true
	*/
	public String getKeywords() {
		return this.keywords;
	}

	/**
	* 字段名称 :搜索关键字
	* 数据类型 :varchar(50)
	* 是否必填 :true
	*/
	public void setKeywords(String keywords) {
		 this.keywords = keywords;
    }

	/**
	 * 字段名称 :备注
	 * 数据类型 :varchar(255)
	 * 是否必填 :true
	 */
	public String getRemark() {
		return this.remark;
	}

	/**
	 * 字段名称 :备注
	 * 数据类型 :varchar(255)
	 * 是否必填 :true
	 */
	public void setRemark(String remark) {
		this.remark = remark;
	}
	/**
	 * 字段名称 :排序
	 * 数据类型 :Integer
	 * 是否必填 :true
	 */
	public Integer getOrderNo() {
		return this.orderNo;
	}

	/**
	 * 字段名称 :排序
	 * 数据类型 :Integer
	 * 是否必填 :true
	 */
	public void setOrderNo(Integer orderNo) {
		this.orderNo = orderNo;
	}

	/**
	 * 字段名称 :所属平台
	 * 数据类型 :bigint
	 * 是否必填 :true
	 */
	public String getPlatform() {
		return this.platform;
	}

	/**
	 * 字段名称 :所属平台
	 * 数据类型 :bigint
	 * 是否必填 :true
	 */
	public void setPlatform(String platform) {
		this.platform = platform;
	}
    

    
}