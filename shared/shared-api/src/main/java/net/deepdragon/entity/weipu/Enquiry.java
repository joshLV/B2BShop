package net.deepdragon.entity.weipu;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.ibatis.type.Alias;

//Generated from PowerDesigner file ,Written by 张莹.

/**
 * 表名称：询价表
 * 表代码：b2b_enquiry
*/
@Alias(net.deepdragon.constant.weipu.Weipu.SIGN+"Enquiry")
public class Enquiry extends BaseEntity {

	private static final long serialVersionUID = 1134712170300846813L;
	
	/**
	*租户ID
	*/
	private String tenantId;
	
	/**
	*标题
	*/
	private String title;
	
	/**
	*是否现货
	*/
	private Integer isSpot;
	
	/**
	*报价截止时间
	*/
	private Date offerEndDateTime;
	
	/**
	*期望收货日期
	*/
	private Date expectReceivDate;
	
	/**
	*报价要求
	*/
	private Integer isContainTax;
	
	/**
	*收货地区域ID
	*/
	private String recAreaId;
	
	/**
	*收货地区域PATH
	*/
	private String recAreaPath;
	
	/**
	*收货地区域地址
	*/
	private String recAddress;
	
	/**
	*交易方式
	*/
	private Integer tradeExchange;
	
	/**
	*交易方式其它
	*/
	private String otherTrade;
	
	/**
	*发票要求
	*/
	private Integer invoiceRequire;
	
	/**
	*经营地区域
	*/
	private String manageArea;

	
	/**
	*注册资金
	*/
	private Double registeredCapital;
	
	/**
	*证照要求
	*/
	private String certification;
	
	/**
	*保密协议
	*/
	private Integer isSecrecyAgreement;
	
	/**
	*补充说明
	*/
	private String replenishExplain;
	
	/**
	*附件
	*/
	private String accessory;
	
	/**
	*询价方式
	*/
	private Integer enquiryMode;
	
	/**
	*采购门户
	*/
	private Integer purchasePortal;
	
	/**
	*联系方式
	*/
	private Integer contactMode;
	
	/**
	*联系人
	*/
	private String linkman;
	
	/**
	*电话
	*/
	private String phone;
	
	/**
	*状态
	*/
	private Integer enquiryState;
	
	/**
	*发布人
	*/
	private String buyerId;
	
	/**
	*发布时间
	*/
	private Date releaseDateTime;
	
	/**
	*浏览次数
	*/
	private Integer viewCount;
	
	/**
	*删除标识
	*/
	private Integer isDelete;

	/**
	 * 所有商品
	 */
	private List<EnquiryGoods> goods = new ArrayList<EnquiryGoods>(0);


	/**
	 * 报价数量
	 */
	private Long quotationCount;

	/**
	 * 供应商ID集合
	 */
	private String merchantIds;

	/**
	 *供应商名称集合
	 */
	private String merchantNames;

	/**
	 * 撤销原因
	 */
	private String cxContent;

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
	* 字段名称 :标题
	* 数据类型 :varchar(64)
	* 是否必填 :false
	*/
	public String getTitle() {
		return this.title;
	}

	/**
	* 字段名称 :标题
	* 数据类型 :varchar(64)
	* 是否必填 :false
	*/
	public void setTitle(String title) {
		 this.title = title;
    }
    
	/**
	* 字段名称 :是否现货
	* 数据类型 :int
	* 是否必填 :false
	*/
	public Integer getIsSpot() {
		return this.isSpot;
	}

	/**
	* 字段名称 :是否现货
	* 数据类型 :int
	* 是否必填 :false
	*/
	public void setIsSpot(Integer isSpot) {
		 this.isSpot = isSpot;
    }
    
	/**
	* 字段名称 :报价截止时间
	* 数据类型 :datetime
	* 是否必填 :false
	*/
	public Date getOfferEndDateTime() {
		return this.offerEndDateTime;
	}

	/**
	* 字段名称 :报价截止时间
	* 数据类型 :datetime
	* 是否必填 :false
	*/
	public void setOfferEndDateTime(Date offerEndDateTime) {
		 this.offerEndDateTime = offerEndDateTime;
    }
    
	/**
	* 字段名称 :期望收货日期
	* 数据类型 :date
	* 是否必填 :false
	*/
	public Date getExpectReceivDate() {
		return this.expectReceivDate;
	}

	/**
	* 字段名称 :期望收货日期
	* 数据类型 :date
	* 是否必填 :false
	*/
	public void setExpectReceivDate(Date expectReceivDate) {
		 this.expectReceivDate = expectReceivDate;
    }
    
	/**
	* 字段名称 :报价要求
	* 数据类型 :int
	* 是否必填 :false
	*/
	public Integer getIsContainTax() {
		return this.isContainTax;
	}

	/**
	* 字段名称 :报价要求
	* 数据类型 :int
	* 是否必填 :false
	*/
	public void setIsContainTax(Integer isContainTax) {
		 this.isContainTax = isContainTax;
    }
    
	/**
	* 字段名称 :收货地区域ID
	* 数据类型 :varchar(128)
	* 是否必填 :false
	*/
	public String getRecAreaId() {
		return this.recAreaId;
	}

	/**
	* 字段名称 :收货地区域ID
	* 数据类型 :varchar(128)
	* 是否必填 :false
	*/
	public void setRecAreaId(String recAreaId) {
		 this.recAreaId = recAreaId;
    }
    
	/**
	* 字段名称 :收货地区域PATH
	* 数据类型 :varchar(256)
	* 是否必填 :false
	*/
	public String getRecAreaPath() {
		return this.recAreaPath;
	}

	/**
	* 字段名称 :收货地区域PATH
	* 数据类型 :varchar(256)
	* 是否必填 :false
	*/
	public void setRecAreaPath(String recAreaPath) {
		 this.recAreaPath = recAreaPath;
    }
    
	/**
	* 字段名称 :收货地区域地址
	* 数据类型 :varchar(128)
	* 是否必填 :false
	*/
	public String getRecAddress() {
		return this.recAddress;
	}

	/**
	* 字段名称 :收货地区域地址
	* 数据类型 :varchar(128)
	* 是否必填 :false
	*/
	public void setRecAddress(String recAddress) {
		 this.recAddress = recAddress;
    }
    
	/**
	* 字段名称 :交易方式
	* 数据类型 :int
	* 是否必填 :false
	*/
	public Integer getTradeExchange() {
		return this.tradeExchange;
	}

	/**
	* 字段名称 :交易方式
	* 数据类型 :int
	* 是否必填 :false
	*/
	public void setTradeExchange(Integer tradeExchange) {
		 this.tradeExchange = tradeExchange;
    }
    
	/**
	* 字段名称 :交易方式其它
	* 数据类型 :varchar(32)
	* 是否必填 :false
	*/
	public String getOtherTrade() {
		return this.otherTrade;
	}

	/**
	* 字段名称 :交易方式其它
	* 数据类型 :varchar(32)
	* 是否必填 :false
	*/
	public void setOtherTrade(String otherTrade) {
		 this.otherTrade = otherTrade;
    }
    
	/**
	* 字段名称 :发票要求
	* 数据类型 :int
	* 是否必填 :false
	*/
	public Integer getInvoiceRequire() {
		return this.invoiceRequire;
	}

	/**
	* 字段名称 :发票要求
	* 数据类型 :int
	* 是否必填 :false
	*/
	public void setInvoiceRequire(Integer invoiceRequire) {
		 this.invoiceRequire = invoiceRequire;
    }
    
	/**
	* 字段名称 :经营地区域ID
	* 数据类型 :varchar(128)
	* 是否必填 :false
	*/
	public String getManageArea() {
		return this.manageArea;
	}

	/**
	* 字段名称 :经营地区域ID
	* 数据类型 :varchar(128)
	* 是否必填 :false
	*/
	public void setManageArea(String manageArea) {
		 this.manageArea = manageArea;
    }
    

	/**
	* 字段名称 :注册资金
	* 数据类型 :decimal(24,2)
	* 是否必填 :false
	*/
	public Double getRegisteredCapital() {
		return this.registeredCapital;
	}

	/**
	* 字段名称 :注册资金
	* 数据类型 :decimal(24,2)
	* 是否必填 :false
	*/
	public void setRegisteredCapital(Double registeredCapital) {
		 this.registeredCapital = registeredCapital;
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
	* 字段名称 :保密协议
	* 数据类型 :int
	* 是否必填 :false
	*/
	public Integer getIsSecrecyAgreement() {
		return this.isSecrecyAgreement;
	}

	/**
	* 字段名称 :保密协议
	* 数据类型 :int
	* 是否必填 :false
	*/
	public void setIsSecrecyAgreement(Integer isSecrecyAgreement) {
		 this.isSecrecyAgreement = isSecrecyAgreement;
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
	* 字段名称 :询价方式
	* 数据类型 :int
	* 是否必填 :false
	*/
	public Integer getEnquiryMode() {
		return this.enquiryMode;
	}

	/**
	* 字段名称 :询价方式
	* 数据类型 :int
	* 是否必填 :false
	*/
	public void setEnquiryMode(Integer enquiryMode) {
		 this.enquiryMode = enquiryMode;
    }
    
	/**
	* 字段名称 :采购门户
	* 数据类型 :int
	* 是否必填 :false
	*/
	public Integer getPurchasePortal() {
		return this.purchasePortal;
	}

	/**
	* 字段名称 :采购门户
	* 数据类型 :int
	* 是否必填 :false
	*/
	public void setPurchasePortal(Integer purchasePortal) {
		 this.purchasePortal = purchasePortal;
    }
    
	/**
	* 字段名称 :联系方式
	* 数据类型 :int
	* 是否必填 :false
	*/
	public Integer getContactMode() {
		return this.contactMode;
	}

	/**
	* 字段名称 :联系方式
	* 数据类型 :int
	* 是否必填 :false
	*/
	public void setContactMode(Integer contactMode) {
		 this.contactMode = contactMode;
    }
    
	/**
	* 字段名称 :联系人
	* 数据类型 :varchar(64)
	* 是否必填 :false
	*/
	public String getLinkman() {
		return this.linkman;
	}

	/**
	* 字段名称 :联系人
	* 数据类型 :varchar(64)
	* 是否必填 :false
	*/
	public void setLinkman(String linkman) {
		 this.linkman = linkman;
    }
    
	/**
	* 字段名称 :电话
	* 数据类型 :varchar(15)
	* 是否必填 :false
	*/
	public String getPhone() {
		return this.phone;
	}

	/**
	* 字段名称 :电话
	* 数据类型 :varchar(15)
	* 是否必填 :false
	*/
	public void setPhone(String phone) {
		 this.phone = phone;
    }
    
	/**
	* 字段名称 :状态
	* 数据类型 :int
	* 是否必填 :false
	*/
	public Integer getEnquiryState() {
		return this.enquiryState;
	}

	/**
	* 字段名称 :状态
	* 数据类型 :int
	* 是否必填 :false
	*/
	public void setEnquiryState(Integer enquiryState) {
		 this.enquiryState = enquiryState;
    }
    
	/**
	* 字段名称 :发布人
	* 数据类型 :bigint
	* 是否必填 :false
	*/
	public String getBuyerId() {
		return this.buyerId;
	}

	/**
	* 字段名称 :发布人
	* 数据类型 :bigint
	* 是否必填 :false
	*/
	public void setBuyerId(String buyerId) {
		 this.buyerId = buyerId;
    }
    
	/**
	* 字段名称 :发布时间
	* 数据类型 :datetime
	* 是否必填 :false
	*/
	public Date getReleaseDateTime() {
		return this.releaseDateTime;
	}

	/**
	* 字段名称 :发布时间
	* 数据类型 :datetime
	* 是否必填 :false
	*/
	public void setReleaseDateTime(Date releaseDateTime) {
		 this.releaseDateTime = releaseDateTime;
    }
    
	/**
	* 字段名称 :浏览次数
	* 数据类型 :int
	* 是否必填 :false
	*/
	public Integer getViewCount() {
		return this.viewCount;
	}

	/**
	* 字段名称 :浏览次数
	* 数据类型 :int
	* 是否必填 :false
	*/
	public void setViewCount(Integer viewCount) {
		 this.viewCount = viewCount;
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

	public List<EnquiryGoods> getGoods() {
		return goods;
	}

	public void setGoods(List<EnquiryGoods> goods) {
		this.goods = goods;
	}

	public Long getQuotationCount() {
		return quotationCount;
	}

	public void setQuotationCount(Long quotationCount) {
		this.quotationCount = quotationCount;
	}

	public String getMerchantIds() {
		return merchantIds;
	}

	public void setMerchantIds(String merchantIds) {
		this.merchantIds = merchantIds;
	}

	public String getMerchantNames() {
		return merchantNames;
	}

	public void setMerchantNames(String merchantNames) {
		this.merchantNames = merchantNames;
	}

	public String getCxContent() {
		return cxContent;
	}

	public void setCxContent(String cxContent) {
		this.cxContent = cxContent;
	}
}