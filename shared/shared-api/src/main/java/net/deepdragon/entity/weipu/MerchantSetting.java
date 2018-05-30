package net.deepdragon.entity.weipu;

import net.deepdragon.constant.weipu.Weipu;
import org.apache.ibatis.type.Alias;

//Generated from PowerDesigner file ,Written by 张莹.

/**
 * 表名称：店铺设置
 * 表代码：wp_merchant_setting
*/
@Alias(Weipu.SIGN+"MerchantSetting")
public class MerchantSetting extends BaseEntity {

	private static final long serialVersionUID = 1610547377784526381L;
	
	/**
	*租户ID
	*/
	private String tenantId;
	
	/**
	*店铺ID
	*/
	private String shopId;
	
	/**
	*键名
	*/
	private String setvalue;
	
	/**
	*键值
	*/
	private String setkey;
	
	
	/**
	* 字段名称 :租户ID
	* 数据类型 :bigint
	* 是否必填 :true
	*/
	public String getTenantId() {
		return this.tenantId;
	}

	/**
	* 字段名称 :租户ID
	* 数据类型 :bigint
	* 是否必填 :true
	*/
	public void setTenantId(String tenantId) {
		 this.tenantId = tenantId;
    }
    
	/**
	* 字段名称 :店铺ID
	* 数据类型 :bigint
	* 是否必填 :true
	*/
	public String getShopId() {
		return this.shopId;
	}

	/**
	* 字段名称 :店铺ID
	* 数据类型 :bigint
	* 是否必填 :true
	*/
	public void setShopId(String shopId) {
		 this.shopId = shopId;
    }
    
	/**
	* 字段名称 :键名
	* 数据类型 :varchar(256)
	* 是否必填 :true
	*/
	public String getSetvalue() {
		return this.setvalue;
	}

	/**
	* 字段名称 :键名
	* 数据类型 :varchar(256)
	* 是否必填 :true
	*/
	public void setSetvalue(String setvalue) {
		 this.setvalue = setvalue;
    }
    
	/**
	* 字段名称 :键值
	* 数据类型 :varchar(64)
	* 是否必填 :false
	*/
	public String getSetkey() {
		return this.setkey;
	}

	/**
	* 字段名称 :键值
	* 数据类型 :varchar(64)
	* 是否必填 :false
	*/
	public void setSetkey(String setkey) {
		 this.setkey = setkey;
    }
    
}