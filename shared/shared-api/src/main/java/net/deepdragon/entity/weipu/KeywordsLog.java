package net.deepdragon.entity.weipu;

import org.apache.ibatis.type.Alias;

//Generated from PowerDesigner file ,Written by 张莹.

/**
 * 表名称：搜索热词
 * 表代码：wp_keywords_search
*/
@Alias(net.deepdragon.constant.weipu.Weipu.SIGN+"KeywordsLog")
public class KeywordsLog extends BaseEntity {


	private static final long serialVersionUID = -2945588801313203661L;
	/**
	*租户ID
	*/
	private String tenantId;
	
	/**
	*平台类型(1.B2B、2.B2C)
	*/
	private Integer platform;
	/**
	*搜索关键字
	*/
	private String keywords;

	/**
	*搜索次数
	*/
	private Integer searchCount;
	/**
	*备注
	*/
	private String remark;
	/**
	*预留字段1
	*/
	private String r1;
	/**
	*预留字段2
	*/
	private String r2;



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
	 * 字段名称 :所属平台
	 * 数据类型 :bigint
	 * 是否必填 :true
	 */
	public Integer getPlatform() {
		return this.platform;
	}

	/**
	 * 字段名称 :所属平台
	 * 数据类型 :bigint
	 * 是否必填 :true
	 */
	public void setPlatform(Integer platform) {
		this.platform = platform;
	}


	public Integer getSearchCount() {
		return searchCount;
	}

	public void setSearchCount(Integer searchCount) {
		this.searchCount = searchCount;
	}

	public String getR1() {
		return r1;
	}

	public void setR1(String r1) {
		this.r1 = r1;
	}

	public String getR2() {
		return r2;
	}

	public void setR2(String r2) {
		this.r2 = r2;
	}
}