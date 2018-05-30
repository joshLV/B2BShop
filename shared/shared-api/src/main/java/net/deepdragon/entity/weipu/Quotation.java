package net.deepdragon.entity.weipu;

import java.util.Date;
import org.apache.ibatis.type.Alias;

//Generated from PowerDesigner file ,Written by 张莹.

/**
 * 表名称：报价表
 * 表代码：b2b_quotation
*/
@Alias(net.deepdragon.constant.weipu.Weipu.SIGN+"Quotation")
public class Quotation extends BaseEntity {

	private static final long serialVersionUID = 1486751495801115057L;
	
	/**
	*租户ID
	*/
	private String tenantId;
	
	/**
	*询价表ID
	*/
	private String enquiryId;
	
	/**
	*费用总计
	*/
	private Double totalCost;
	
	/**
	*商品金额总计
	*/
	private Double goodsTotalCost;
	
	/**
	*运费金额总计
	*/
	private Double freightTotalCost;
	
	/**
	*报价有效期
	*/
	private Date quotationPeriod;
	
	/**
	*生产备货周期
	*/
	private Integer productStock;
	
	/**
	*补充说明
	*/
	private String replenishExplain;
	
	/**
	*附件
	*/
	private String accessory;
	
	/**
	*状态
	*/
	private Integer quotationState;
	
	/**
	*报价人
	*/
	private String buyerId;
	
	/**
	*报价时间
	*/
	private Date buyerDateTime;
	
	/**
	*采购商是否已读
	*/
	private Integer isBuyerRead;
	
	/**
	*证照要求
	*/
	private String certification;
	
	/**
	*是否下单
	*/
	private Integer isDownOrder;
	
	/**
	*重新报价
	*/
	private Integer anewOffer;
	
	/**
	*删除标识
	*/
	private Integer isDelete;

	/**
	 *商家ID
	 */
	private String merchantId;

	/**
	 * 税务发票类型(1 不提供发票，2 提供普通发票)
	 */
	private Integer invoiceType;


	/**
	 * 修改联系信息(联系人)
	 */
	private String linkMan;

	/**
	 * 修改联系信息(联系手机)
	 */
	private String linkMobel;

	/**
	 * 修改联系信息(联系电话)
	 */
	private String linkTel;
	/**
	 * 字段名称 :会员ID
	 * 数据类型 :bigint(20)
	 * 是否必填 :false
	 */
	public String getMerchantId() {
		return this.merchantId;
	}

	/**
	 * 字段名称 :会员ID
	 * 数据类型 :bigint(20)
	 * 是否必填 :false
	 */
	public void setMerchantId(String merchantId) {
		this.merchantId = merchantId;
	}
	
	
	/**
	* 字段名称 :租户ID
	* 数据类型 :bigint(20)
	* 是否必填 :false
	*/
	public String getTenantId() {
		return this.tenantId;
	}

	/**
	* 字段名称 :租户ID
	* 数据类型 :bigint(20)
	* 是否必填 :false
	*/
	public void setTenantId(String tenantId) {
		 this.tenantId = tenantId;
    }
    
	/**
	* 字段名称 :询价表ID
	* 数据类型 :bigint
	* 是否必填 :false
	*/
	public String getEnquiryId() {
		return this.enquiryId;
	}

	/**
	* 字段名称 :询价表ID
	* 数据类型 :bigint
	* 是否必填 :false
	*/
	public void setEnquiryId(String enquiryId) {
		 this.enquiryId = enquiryId;
    }
    
	/**
	* 字段名称 :费用总计
	* 数据类型 :decimal(24,2)
	* 是否必填 :false
	*/
	public Double getTotalCost() {
		return this.totalCost;
	}

	/**
	* 字段名称 :费用总计
	* 数据类型 :decimal(24,2)
	* 是否必填 :false
	*/
	public void setTotalCost(Double totalCost) {
		 this.totalCost = totalCost;
    }
    
	/**
	* 字段名称 :商品金额总计
	* 数据类型 :decimal(24,2)
	* 是否必填 :false
	*/
	public Double getGoodsTotalCost() {
		return this.goodsTotalCost;
	}

	/**
	* 字段名称 :商品金额总计
	* 数据类型 :decimal(24,2)
	* 是否必填 :false
	*/
	public void setGoodsTotalCost(Double goodsTotalCost) {
		 this.goodsTotalCost = goodsTotalCost;
    }
    
	/**
	* 字段名称 :运费金额总计
	* 数据类型 :decimal(24,2)
	* 是否必填 :false
	*/
	public Double getFreightTotalCost() {
		return this.freightTotalCost;
	}

	/**
	* 字段名称 :运费金额总计
	* 数据类型 :decimal(24,2)
	* 是否必填 :false
	*/
	public void setFreightTotalCost(Double freightTotalCost) {
		 this.freightTotalCost = freightTotalCost;
    }
    
	/**
	* 字段名称 :报价有效期
	* 数据类型 :date
	* 是否必填 :false
	*/
	public Date getQuotationPeriod() {
		return this.quotationPeriod;
	}

	/**
	* 字段名称 :报价有效期
	* 数据类型 :date
	* 是否必填 :false
	*/
	public void setQuotationPeriod(Date quotationPeriod) {
		 this.quotationPeriod = quotationPeriod;
    }
    
	/**
	* 字段名称 :生产备货周期
	* 数据类型 :int
	* 是否必填 :false
	*/
	public Integer getProductStock() {
		return this.productStock;
	}

	/**
	* 字段名称 :生产备货周期
	* 数据类型 :int
	* 是否必填 :false
	*/
	public void setProductStock(Integer productStock) {
		 this.productStock = productStock;
    }
    
	/**
	* 字段名称 :补充说明
	* 数据类型 :TEXT
	* 是否必填 :false
	*/
	public String getReplenishExplain() {
		return this.replenishExplain;
	}

	/**
	* 字段名称 :补充说明
	* 数据类型 :TEXT
	* 是否必填 :false
	*/
	public void setReplenishExplain(String replenishExplain) {
		 this.replenishExplain = replenishExplain;
    }
    
	/**
	* 字段名称 :附件
	* 数据类型 :TEXT
	* 是否必填 :false
	*/
	public String getAccessory() {
		return this.accessory;
	}

	/**
	* 字段名称 :附件
	* 数据类型 :TEXT
	* 是否必填 :false
	*/
	public void setAccessory(String accessory) {
		 this.accessory = accessory;
    }
    
	/**
	* 字段名称 :状态
	* 数据类型 :int
	* 是否必填 :false
	*/
	public Integer getQuotationState() {
		return this.quotationState;
	}

	/**
	* 字段名称 :状态
	* 数据类型 :int
	* 是否必填 :false
	*/
	public void setQuotationState(Integer quotationState) {
		 this.quotationState = quotationState;
    }
    
	/**
	* 字段名称 :报价人
	* 数据类型 :bigint
	* 是否必填 :false
	*/
	public String getBuyerId() {
		return this.buyerId;
	}

	/**
	* 字段名称 :报价人
	* 数据类型 :bigint
	* 是否必填 :false
	*/
	public void setBuyerId(String buyerId) {
		 this.buyerId = buyerId;
    }
    
	/**
	* 字段名称 :报价时间
	* 数据类型 :datetime
	* 是否必填 :false
	*/
	public Date getBuyerDateTime() {
		return this.buyerDateTime;
	}

	/**
	* 字段名称 :报价时间
	* 数据类型 :datetime
	* 是否必填 :false
	*/
	public void setBuyerDateTime(Date buyerDateTime) {
		 this.buyerDateTime = buyerDateTime;
    }
    
	/**
	* 字段名称 :采购商是否已读
	* 数据类型 :int
	* 是否必填 :false
	*/
	public Integer getIsBuyerRead() {
		return this.isBuyerRead;
	}

	/**
	* 字段名称 :采购商是否已读
	* 数据类型 :int
	* 是否必填 :false
	*/
	public void setIsBuyerRead(Integer isBuyerRead) {
		 this.isBuyerRead = isBuyerRead;
    }
    
	/**
	* 字段名称 :证照要求
	* 数据类型 :varchar(500)
	* 是否必填 :false
	*/
	public String getCertification() {
		return this.certification;
	}

	/**
	* 字段名称 :证照要求
	* 数据类型 :varchar(500)
	* 是否必填 :false
	*/
	public void setCertification(String certification) {
		 this.certification = certification;
    }
    
	/**
	* 字段名称 :是否下单
	* 数据类型 :int
	* 是否必填 :false
	*/
	public Integer getIsDownOrder() {
		return this.isDownOrder;
	}

	/**
	* 字段名称 :是否下单
	* 数据类型 :int
	* 是否必填 :false
	*/
	public void setIsDownOrder(Integer isDownOrder) {
		 this.isDownOrder = isDownOrder;
    }
    
	/**
	* 字段名称 :重新报价
	* 数据类型 :int
	* 是否必填 :false
	*/
	public Integer getAnewOffer() {
		return this.anewOffer;
	}

	/**
	* 字段名称 :重新报价
	* 数据类型 :int
	* 是否必填 :false
	*/
	public void setAnewOffer(Integer anewOffer) {
		 this.anewOffer = anewOffer;
    }
    
	/**
	* 字段名称 :删除标识
	* 数据类型 :int(11)
	* 是否必填 :false
	*/
	public Integer getIsDelete() {
		return this.isDelete;
	}

	/**
	* 字段名称 :删除标识
	* 数据类型 :int(11)
	* 是否必填 :false
	*/
	public void setIsDelete(Integer isDelete) {
		 this.isDelete = isDelete;
    }

	public Integer getInvoiceType() {
		return invoiceType;
	}

	public void setInvoiceType(Integer invoiceType) {
		this.invoiceType = invoiceType;
	}

	public String getLinkMan() {
		return linkMan;
	}

	public void setLinkMan(String linkMan) {
		this.linkMan = linkMan;
	}

	public String getLinkMobel() {
		return linkMobel;
	}

	public void setLinkMobel(String linkMobel) {
		this.linkMobel = linkMobel;
	}

	public String getLinkTel() {
		return linkTel;
	}

	public void setLinkTel(String linkTel) {
		this.linkTel = linkTel;
	}
}