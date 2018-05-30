package net.deepdragon.entity.weipu;

import java.util.Date;
import org.apache.ibatis.type.Alias;

//Generated from PowerDesigner file ,Written by 张莹.

/**
 * 表名称：ghj_tool_hks
 * 表代码：ghj_tool_hks
*/
@Alias(net.deepdragon.constant.weipu.Weipu.SIGN+"ToolHks")
public class ToolHks extends BaseEntity {

	private static final long serialVersionUID = 1246076894419833314L;
	
	/**
	*租户ID
	*/
	private String tenantId;
	
	/**
	*序号
	*/
	private String sn;
	
	/**
	*商品名称
	*/
	private String name;
	
	/**
	*条码
	*/
	private String barcode;
	
	/**
	*品类
	*/
	private String category;
	
	/**
	*进价
	*/
	private Double Inprice;
	
	/**
	*售价
	*/
	private Double saleprice;
	
	/**
	*销售数量
	*/
	private Integer salenum;
	
	/**
	*区域
	*/
	private String areas;
	
	/**
	*供应商
	*/
	private String supplier;
	
	/**
	*isDelete
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
	* 字段名称 :序号
	* 数据类型 :varchar(32)
	* 是否必填 :false
	*/
	public String getSn() {
		return this.sn;
	}

	/**
	* 字段名称 :序号
	* 数据类型 :varchar(32)
	* 是否必填 :false
	*/
	public void setSn(String sn) {
		 this.sn = sn;
    }
    
	/**
	* 字段名称 :商品名称
	* 数据类型 :varchar(128)
	* 是否必填 :false
	*/
	public String getName() {
		return this.name;
	}

	/**
	* 字段名称 :商品名称
	* 数据类型 :varchar(128)
	* 是否必填 :false
	*/
	public void setName(String name) {
		 this.name = name;
    }
    
	/**
	* 字段名称 :条码
	* 数据类型 :varchar(32)
	* 是否必填 :false
	*/
	public String getBarcode() {
		return this.barcode;
	}

	/**
	* 字段名称 :条码
	* 数据类型 :varchar(32)
	* 是否必填 :false
	*/
	public void setBarcode(String barcode) {
		 this.barcode = barcode;
    }
    
	/**
	* 字段名称 :品类
	* 数据类型 :varchar(128)
	* 是否必填 :false
	*/
	public String getCategory() {
		return this.category;
	}

	/**
	* 字段名称 :品类
	* 数据类型 :varchar(128)
	* 是否必填 :false
	*/
	public void setCategory(String category) {
		 this.category = category;
    }
    
	/**
	* 字段名称 :进价
	* 数据类型 :float(24,2)
	* 是否必填 :false
	*/
	public Double getInprice() {
		return this.Inprice;
	}

	/**
	* 字段名称 :进价
	* 数据类型 :float(24,2)
	* 是否必填 :false
	*/
	public void setInprice(Double Inprice) {
		 this.Inprice = Inprice;
    }
    
	/**
	* 字段名称 :售价
	* 数据类型 :float(24,2)
	* 是否必填 :false
	*/
	public Double getSaleprice() {
		return this.saleprice;
	}

	/**
	* 字段名称 :售价
	* 数据类型 :float(24,2)
	* 是否必填 :false
	*/
	public void setSaleprice(Double saleprice) {
		 this.saleprice = saleprice;
    }
    
	/**
	* 字段名称 :销售数量
	* 数据类型 :int(11)
	* 是否必填 :false
	*/
	public Integer getSalenum() {
		return this.salenum;
	}

	/**
	* 字段名称 :销售数量
	* 数据类型 :int(11)
	* 是否必填 :false
	*/
	public void setSalenum(Integer salenum) {
		 this.salenum = salenum;
    }
    
	/**
	* 字段名称 :区域
	* 数据类型 :varchar(255)
	* 是否必填 :false
	*/
	public String getAreas() {
		return this.areas;
	}

	/**
	* 字段名称 :区域
	* 数据类型 :varchar(255)
	* 是否必填 :false
	*/
	public void setAreas(String areas) {
		 this.areas = areas;
    }
    
	/**
	* 字段名称 :供应商
	* 数据类型 :varchar(255)
	* 是否必填 :false
	*/
	public String getSupplier() {
		return this.supplier;
	}

	/**
	* 字段名称 :供应商
	* 数据类型 :varchar(255)
	* 是否必填 :false
	*/
	public void setSupplier(String supplier) {
		 this.supplier = supplier;
    }
    
	/**
	* 字段名称 :isDelete
	* 数据类型 :int(11)
	* 是否必填 :false
	*/
	public Integer getIsDelete() {
		return this.isDelete;
	}

	/**
	* 字段名称 :isDelete
	* 数据类型 :int(11)
	* 是否必填 :false
	*/
	public void setIsDelete(Integer isDelete) {
		 this.isDelete = isDelete;
    }
    
}