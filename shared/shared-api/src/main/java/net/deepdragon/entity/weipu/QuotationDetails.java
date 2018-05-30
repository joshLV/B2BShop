package net.deepdragon.entity.weipu;

import java.util.Date;
import org.apache.ibatis.type.Alias;

//Generated from PowerDesigner file ,Written by 张莹.

/**
 * 表名称：报价详情表
 * 表代码：b2b_quotation_details
*/
@Alias(net.deepdragon.constant.weipu.Weipu.SIGN+"QuotationDetails")
public class QuotationDetails extends BaseEntity {

	private static final long serialVersionUID = 1490246191976200597L;
	
	/**
	*租户ID
	*/
	private String tenantId;
	
	/**
	*报价表ID
	*/
	private String quotationId;
	
	/**
	*商品ID
	*/
	private String goodsId;
	
	/**
	*商品名称
	*/
	private String goodsName;
	
	/**
	*数量(单位)
	*/
	private Integer purchaseNum;
	
	/**
	*商品单位
	*/
	private String units;
	
	/**
	*报价
	*/
	private Double quotationPrice;
	
	/**
	*含税
	*/
	private Integer containTax;
	
	/**
	*运费
	*/
	private Double freight;
	
	/**
	*小计
	*/
	private Double productCount;
	
	/**
	*删除标识
	*/
	private Integer isDelete;

	private String name;// 商品名称
	private String sn;// 商品编码
	private String pic;// 展示图片

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getSn() {
		return sn;
	}

	public void setSn(String sn) {
		this.sn = sn;
	}

	public String getPic() {
		return pic;
	}

	public void setPic(String pic) {
		this.pic = pic;
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
	* 字段名称 :报价表ID
	* 数据类型 :bigint
	* 是否必填 :false
	*/
	public String getQuotationId() {
		return this.quotationId;
	}

	/**
	* 字段名称 :报价表ID
	* 数据类型 :bigint
	* 是否必填 :false
	*/
	public void setQuotationId(String quotationId) {
		 this.quotationId = quotationId;
    }
    
	/**
	* 字段名称 :商品ID
	* 数据类型 :bigint
	* 是否必填 :false
	*/
	public String getGoodsId() {
		return this.goodsId;
	}

	/**
	* 字段名称 :商品ID
	* 数据类型 :bigint
	* 是否必填 :false
	*/
	public void setGoodsId(String goodsId) {
		 this.goodsId = goodsId;
    }
    
	/**
	* 字段名称 :商品名称
	* 数据类型 :varchar(64)
	* 是否必填 :false
	*/
	public String getGoodsName() {
		return this.goodsName;
	}

	/**
	* 字段名称 :商品名称
	* 数据类型 :varchar(64)
	* 是否必填 :false
	*/
	public void setGoodsName(String goodsName) {
		 this.goodsName = goodsName;
    }
    
	/**
	* 字段名称 :数量(单位)
	* 数据类型 :int
	* 是否必填 :false
	*/
	public Integer getPurchaseNum() {
		return this.purchaseNum;
	}

	/**
	* 字段名称 :数量(单位)
	* 数据类型 :int
	* 是否必填 :false
	*/
	public void setPurchaseNum(Integer purchaseNum) {
		 this.purchaseNum = purchaseNum;
    }
    
	/**
	* 字段名称 :商品单位
	* 数据类型 :varchar(20)
	* 是否必填 :false
	*/
	public String getUnits() {
		return this.units;
	}

	/**
	* 字段名称 :商品单位
	* 数据类型 :varchar(20)
	* 是否必填 :false
	*/
	public void setUnits(String units) {
		 this.units = units;
    }
    
	/**
	* 字段名称 :报价
	* 数据类型 :decimal(24,2)
	* 是否必填 :false
	*/
	public Double getQuotationPrice() {
		return this.quotationPrice;
	}

	/**
	* 字段名称 :报价
	* 数据类型 :decimal(24,2)
	* 是否必填 :false
	*/
	public void setQuotationPrice(Double quotationPrice) {
		 this.quotationPrice = quotationPrice;
    }
    
	/**
	* 字段名称 :含税
	* 数据类型 :int
	* 是否必填 :false
	*/
	public Integer getContainTax() {
		return this.containTax;
	}

	/**
	* 字段名称 :含税
	* 数据类型 :int
	* 是否必填 :false
	*/
	public void setContainTax(Integer containTax) {
		 this.containTax = containTax;
    }
    
	/**
	* 字段名称 :运费
	* 数据类型 :decimal(24,2)
	* 是否必填 :false
	*/
	public Double getFreight() {
		return this.freight;
	}

	/**
	* 字段名称 :运费
	* 数据类型 :decimal(24,2)
	* 是否必填 :false
	*/
	public void setFreight(Double freight) {
		 this.freight = freight;
    }
    
	/**
	* 字段名称 :小计
	* 数据类型 :decimal(24,2)
	* 是否必填 :false
	*/
	public Double getProductCount() {
		return this.productCount;
	}

	/**
	* 字段名称 :小计
	* 数据类型 :decimal(24,2)
	* 是否必填 :false
	*/
	public void setProductCount(Double productCount) {
		 this.productCount = productCount;
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
    
}