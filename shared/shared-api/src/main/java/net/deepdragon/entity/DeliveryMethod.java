package net.deepdragon.entity;

import net.deepdragon.constant.Shared;
import org.apache.ibatis.type.Alias;

//Generated from PowerDesigner file ,Written by 张莹.

/**
 * 表名称：配送方式 表代码：shared_delivery_method
 */
@Alias(Shared.SIGN + "DeliveryMethod")
public class DeliveryMethod extends BaseEntity {

	private static final long serialVersionUID = 1809197702850350316L;

	/**
	 * 名称
	 */
	private String name;

	/**
	 * 默认物流公司
	 */
	private String defaultLogisticsCorpId;

	/**
	 * 首重
	 */
	private Double firstWeight;

	/**
	 * 续重
	 */
	private Double continueWeight;

	/**
	 * 首重价格
	 */
	private Double firstPrice;

	/**
	 * 续重价格
	 */
	private Double continuePrice;

	/**
	 * 是否启用
	 */
	private Integer enabled;

	/**
	 * 显示序号
	 */
	private Integer orderNo;
	
	/**
	*标识
	*/
	private String sign;

	/**
	 * 描述
	 */
	private String description;

	/**
	 *所属平台
	 */
	private String platform;
	/**
	 *是否设置成默认(0:默认, 1:不设置为默认;整个表中只能有一个默认值)';
	 */
	private Integer isDefault;

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

	/**
	 * 字段名称 :名称 数据类型 :varchar(16) 是否必填 :true
	 */
	public String getName() {
		return this.name;
	}

	/**
	 * 字段名称 :名称 数据类型 :varchar(16) 是否必填 :true
	 */
	public void setName(String name) {
		this.name = name;
	}

	/**
	 * 字段名称 :默认物流公司 数据类型 :bigint 是否必填 :true
	 */
	public String getDefaultLogisticsCorpId() {
		return this.defaultLogisticsCorpId;
	}

	/**
	 * 字段名称 :默认物流公司 数据类型 :bigint 是否必填 :true
	 */
	public void setDefaultLogisticsCorpId(String defaultLogisticsCorpId) {
		this.defaultLogisticsCorpId = defaultLogisticsCorpId;
	}

	/**
	 * 字段名称 :首重 数据类型 :decimal(24,2) 是否必填 :false
	 */
	public Double getFirstWeight() {
		return this.firstWeight;
	}

	/**
	 * 字段名称 :首重 数据类型 :decimal(24,2) 是否必填 :false
	 */
	public void setFirstWeight(Double firstWeight) {
		this.firstWeight = firstWeight;
	}

	/**
	 * 字段名称 :续重 数据类型 :decimal(24,2) 是否必填 :false
	 */
	public Double getContinueWeight() {
		return this.continueWeight;
	}

	/**
	 * 字段名称 :续重 数据类型 :decimal(24,2) 是否必填 :false
	 */
	public void setContinueWeight(Double continueWeight) {
		this.continueWeight = continueWeight;
	}

	/**
	 * 字段名称 :首重价格 数据类型 :decimal(24,4) 是否必填 :false
	 */
	public Double getFirstPrice() {
		return this.firstPrice;
	}

	/**
	 * 字段名称 :首重价格 数据类型 :decimal(24,4) 是否必填 :false
	 */
	public void setFirstPrice(Double firstPrice) {
		this.firstPrice = firstPrice;
	}

	/**
	 * 字段名称 :续重价格 数据类型 :decimal(24,4) 是否必填 :false
	 */
	public Double getContinuePrice() {
		return this.continuePrice;
	}

	/**
	 * 字段名称 :续重价格 数据类型 :decimal(24,4) 是否必填 :false
	 */
	public void setContinuePrice(Double continuePrice) {
		this.continuePrice = continuePrice;
	}

	/**
	 * 字段名称 :是否启用 数据类型 :int 是否必填 :true
	 */
	public Integer getEnabled() {
		return this.enabled;
	}

	/**
	 * 字段名称 :是否启用 数据类型 :int 是否必填 :true
	 */
	public void setEnabled(Integer enabled) {
		this.enabled = enabled;
	}

	/**
	 * 字段名称 :显示序号 数据类型 :int 是否必填 :true
	 */
	public Integer getOrderNo() {
		return this.orderNo;
	}

	/**
	 * 字段名称 :显示序号 数据类型 :int 是否必填 :true
	 */
	public void setOrderNo(Integer orderNo) {
		this.orderNo = orderNo;
	}

	/**
	* 字段名称 :标识
	* 数据类型 :varchar(16)
	* 是否必填 :false
	*/
	public String getSign() {
		return this.sign;
	}

	/**
	* 字段名称 :标识
	* 数据类型 :varchar(16)
	* 是否必填 :false
	*/
	public void setSign(String sign) {
		 this.sign = sign;
    }
	
	/**
	 * 字段名称 :描述 数据类型 :varchar(128) 是否必填 :false
	 */
	public String getDescription() {
		return this.description;
	}

	/**
	 * 字段名称 :描述 数据类型 :varchar(128) 是否必填 :false
	 */
	public void setDescription(String description) {
		this.description = description;
	}

	public Integer getIsDefault() {
		return isDefault;
	}

	public void setIsDefault(Integer isDefault) {
		this.isDefault = isDefault;
	}
}