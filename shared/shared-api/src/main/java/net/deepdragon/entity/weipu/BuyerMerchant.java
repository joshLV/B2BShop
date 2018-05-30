package net.deepdragon.entity.weipu;

import java.util.Date;
import org.apache.ibatis.type.Alias;

//Generated from PowerDesigner file ,Written by 张莹.

/**
 * 表名称：我的供应商
 * 表代码：b2b_buyer_merchant
*/
@Alias(net.deepdragon.constant.weipu.Weipu.SIGN+"BuyerMerchant")
public class BuyerMerchant extends BaseEntity {

	private static final long serialVersionUID = 1629197733176088960L;
	
	/**
	*租户ID
	*/
	private String tenantId;
	
	/**
	*采购商id
	*/
	private String buyerId;
	
	/**
	*供应商ID
	*/
	private String merchantId;
	
	/**
	*类型
	*/
	private Integer type;
	
	/**
	*评分
	*/
	private Integer score;
	
	/**
	*删除标识
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
	* 字段名称 :采购商id
	* 数据类型 :bigint(20)
	* 是否必填 :false
	*/
	public String getBuyerId() {
		return this.buyerId;
	}

	/**
	* 字段名称 :采购商id
	* 数据类型 :bigint(20)
	* 是否必填 :false
	*/
	public void setBuyerId(String buyerId) {
		 this.buyerId = buyerId;
    }
    
	/**
	* 字段名称 :供应商ID
	* 数据类型 :bigint(20)
	* 是否必填 :false
	*/
	public String getMerchantId() {
		return this.merchantId;
	}

	/**
	* 字段名称 :供应商ID
	* 数据类型 :bigint(20)
	* 是否必填 :false
	*/
	public void setMerchantId(String merchantId) {
		 this.merchantId = merchantId;
    }
    
	/**
	* 字段名称 :类型
	* 数据类型 :tinyint(1)
	* 是否必填 :false
	*/
	public Integer getType() {
		return this.type;
	}

	/**
	* 字段名称 :类型
	* 数据类型 :tinyint(1)
	* 是否必填 :false
	*/
	public void setType(Integer type) {
		 this.type = type;
    }
    
	/**
	* 字段名称 :评分
	* 数据类型 :int(10)
	* 是否必填 :false
	*/
	public Integer getScore() {
		return this.score;
	}

	/**
	* 字段名称 :评分
	* 数据类型 :int(10)
	* 是否必填 :false
	*/
	public void setScore(Integer score) {
		 this.score = score;
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