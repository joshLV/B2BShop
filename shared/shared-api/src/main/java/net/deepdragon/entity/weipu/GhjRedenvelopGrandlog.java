package net.deepdragon.entity.weipu;

import java.util.Date;
import org.apache.ibatis.type.Alias;

//Generated from PowerDesigner file ,Written by 张莹.

/**
 * 表名称：ghj_ghj_redenvelop_grandlog
 * 表代码：ghj_ghj_redenvelop_grandlog
*/
@Alias(net.deepdragon.constant.weipu.Weipu.SIGN+"GhjRedenvelopGrandlog")
public class GhjRedenvelopGrandlog extends BaseEntity {

	private static final long serialVersionUID = 1583713842002990525L;
	
	/**
	*tenantId
	*/
	private String tenantId;

	/**
	* 供应商ID，参考wp_merchant表的主键字段
	*/
	private String merchantId;
	
	/**
	*type 红包类型：0_按比例返还，1_按定额定额返还
	*/
	private Integer type;
	
	/**
	* 0：定向（指定只能在本供应商店铺使用。）；
	* 1：非定向（平台通用，可在平台范围内任意供应商店铺使用。）
	*/
	private Integer pIsAssigned;
	
	/**
	*限额阈值，为0时表示不限定（使用该红包支付时，需要判定订单金额是否满足该限额）
	*/
	private Double pLimitation;
	
	/**
	*单笔交易中可使用的最大金额
	*/
	private Double pSingleMaximum;
	
	/**
	*红包有效期（单位天）；为0时表示永远有效
	*/
	private Integer pValidityPeriod;
	
	/**
	*startTime
	*/
	private Date rStartTime;
	
	/**
	*endTime
	*/
	private Date rEndTime;
	

	
	/**
	*isDelete
	*/
	private String isDelete;


	public String getTenantId() {
		return tenantId;
	}

	public void setTenantId(String tenantId) {
		this.tenantId = tenantId;
	}

	public String getMerchantId() {
		return merchantId;
	}

	public void setMerchantId(String merchantId) {
		this.merchantId = merchantId;
	}

	public Integer getType() {
		return type;
	}

	public void setType(Integer type) {
		this.type = type;
	}

	public Integer getpIsAssigned() {
		return pIsAssigned;
	}

	public void setpIsAssigned(Integer pIsAssigned) {
		this.pIsAssigned = pIsAssigned;
	}

	public Double getpLimitation() {
		return pLimitation;
	}

	public void setpLimitation(Double pLimitation) {
		this.pLimitation = pLimitation;
	}

	public Double getpSingleMaximum() {
		return pSingleMaximum;
	}

	public void setpSingleMaximum(Double pSingleMaximum) {
		this.pSingleMaximum = pSingleMaximum;
	}

	public Integer getpValidityPeriod() {
		return pValidityPeriod;
	}

	public void setpValidityPeriod(Integer pValidityPeriod) {
		this.pValidityPeriod = pValidityPeriod;
	}

	public Date getrStartTime() {
		return rStartTime;
	}

	public void setrStartTime(Date rStartTime) {
		this.rStartTime = rStartTime;
	}

	public Date getrEndTime() {
		return rEndTime;
	}

	public void setrEndTime(Date rEndTime) {
		this.rEndTime = rEndTime;
	}

	public String getIsDelete() {
		return isDelete;
	}

	public void setIsDelete(String isDelete) {
		this.isDelete = isDelete;
	}
}