package net.deepdragon.entity.weipu;

import java.util.Date;
import org.apache.ibatis.type.Alias;

//Generated from PowerDesigner file ,Written by 张莹.

/**
 * 表名称：采购单明细表
 * 表代码：ghj_purchase_order_ detail
*/
@Alias(net.deepdragon.constant.weipu.Weipu.SIGN+"PurchaseOrderDetail")
public class PurchaseOrderDetail extends BaseEntity {

	private static final long serialVersionUID = 1248076688989357152L;
	
	/**
	*租户ID
	*/
	private String tenantId;
	
	/**
	*采购单ID
	*/
	private String purchaseOrderId;
	
	/**
	*商品所属供应商ID
	*/
	private String merchantId;
	
	/**
	*商品ID
	*/
	private String goodsId;
	
	/**
	*商品条码
	*/
	private String goodsBarcode;
	
	/**
	*商品外包装条码
	*/
	private String goodsPackageBarcode;
	
	/**
	*商品名称
	*/
	private String goodsName;
	
	/**
	*商品规格
	*/
	private String specification;
	
	/**
	*购买数量
	*/
	private Integer quantity;

	/**
	 * 输入价格
	 */
	private Double inputPrice;
	
	/**
	*是否删除
	*/
	private Integer isDelete;
	
	
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
	* 字段名称 :采购单ID
	* 数据类型 :bigint(20)
	* 是否必填 :false
	*/
	public String getPurchaseOrderId() {
		return this.purchaseOrderId;
	}

	/**
	* 字段名称 :采购单ID
	* 数据类型 :bigint(20)
	* 是否必填 :false
	*/
	public void setPurchaseOrderId(String purchaseOrderId) {
		 this.purchaseOrderId = purchaseOrderId;
    }
    
	/**
	* 字段名称 :商品所属供应商ID
	* 数据类型 :bigint(20)
	* 是否必填 :false
	*/
	public String getMerchantId() {
		return this.merchantId;
	}

	/**
	* 字段名称 :商品所属供应商ID
	* 数据类型 :bigint(20)
	* 是否必填 :false
	*/
	public void setMerchantId(String merchantId) {
		 this.merchantId = merchantId;
    }
    
	/**
	* 字段名称 :商品ID
	* 数据类型 :bigint(20)
	* 是否必填 :false
	*/
	public String getGoodsId() {
		return this.goodsId;
	}

	/**
	* 字段名称 :商品ID
	* 数据类型 :bigint(20)
	* 是否必填 :false
	*/
	public void setGoodsId(String goodsId) {
		 this.goodsId = goodsId;
    }
    
	/**
	* 字段名称 :商品条码
	* 数据类型 :varchar(32)
	* 是否必填 :false
	*/
	public String getGoodsBarcode() {
		return this.goodsBarcode;
	}

	/**
	* 字段名称 :商品条码
	* 数据类型 :varchar(32)
	* 是否必填 :false
	*/
	public void setGoodsBarcode(String goodsBarcode) {
		 this.goodsBarcode = goodsBarcode;
    }
    
	/**
	* 字段名称 :商品外包装条码
	* 数据类型 :varchar(32)
	* 是否必填 :false
	*/
	public String getGoodsPackageBarcode() {
		return this.goodsPackageBarcode;
	}

	/**
	* 字段名称 :商品外包装条码
	* 数据类型 :varchar(32)
	* 是否必填 :false
	*/
	public void setGoodsPackageBarcode(String goodsPackageBarcode) {
		 this.goodsPackageBarcode = goodsPackageBarcode;
    }
    
	/**
	* 字段名称 :商品名称
	* 数据类型 :varchar(256)
	* 是否必填 :false
	*/
	public String getGoodsName() {
		return this.goodsName;
	}

	/**
	* 字段名称 :商品名称
	* 数据类型 :varchar(256)
	* 是否必填 :false
	*/
	public void setGoodsName(String goodsName) {
		 this.goodsName = goodsName;
    }
    
	/**
	* 字段名称 :商品规格
	* 数据类型 :varchar(300)
	* 是否必填 :false
	*/
	public String getSpecification() {
		return this.specification;
	}

	/**
	* 字段名称 :商品规格
	* 数据类型 :varchar(300)
	* 是否必填 :false
	*/
	public void setSpecification(String specification) {
		 this.specification = specification;
    }
    
	/**
	* 字段名称 :购买数量
	* 数据类型 :int(11)
	* 是否必填 :false
	*/
	public Integer getQuantity() {
		return this.quantity;
	}

	/**
	* 字段名称 :购买数量
	* 数据类型 :int(11)
	* 是否必填 :false
	*/
	public void setQuantity(Integer quantity) {
		 this.quantity = quantity;
    }
    
	/**
	* 字段名称 :是否删除
	* 数据类型 :int(11)
	* 是否必填 :false
	*/
	public Integer getIsDelete() {
		return this.isDelete;
	}

	/**
	* 字段名称 :是否删除
	* 数据类型 :int(11)
	* 是否必填 :false
	*/
	public void setIsDelete(Integer isDelete) {
		 this.isDelete = isDelete;
    }

	public Double getInputPrice() {
		return inputPrice;
	}

	public void setInputPrice(Double inputPrice) {
		this.inputPrice = inputPrice;
	}
}