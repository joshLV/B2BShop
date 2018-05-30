package net.deepdragon.entity.weipu;

import java.util.Date;
import org.apache.ibatis.type.Alias;

//Generated from PowerDesigner file ,Written by 张莹.

/**
 * 表名称：采购单表
 * 表代码：ghj_purchase_order
*/
@Alias(net.deepdragon.constant.weipu.Weipu.SIGN+"PurchaseOrder")
public class PurchaseOrder extends BaseEntity {

	private static final long serialVersionUID = 1209778872053432486L;
	
	/**
	*租户ID
	*/
	private String tenantId;
	
	/**
	*采购商或操作员ID
	*/
	private String buyerId;
	
	/**
	*采购商ID
	*/
	private String parentBuyerId;
	
	/**
	*上传时间
	*/
	private Date uploadTime;

	/**
	 *z转为字符串的上传时间
	 */
	private String changeTime;
	
	/**
	*类型
	*/
	private String title;

	/**
	*类型
	*/
	private Integer type;
	
	/**
	*状态
	*/
	private Integer status;
	
	/**
	*是否删除
	*/
	private Integer isDelete;

	private Double preferentialRatio;
	
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
	* 字段名称 :采购商或操作员ID
	* 数据类型 :bigint(20)
	* 是否必填 :false
	*/
	public String getBuyerId() {
		return this.buyerId;
	}

	/**
	* 字段名称 :采购商或操作员ID
	* 数据类型 :bigint(20)
	* 是否必填 :false
	*/
	public void setBuyerId(String buyerId) {
		 this.buyerId = buyerId;
    }
    
	/**
	* 字段名称 :采购商ID
	* 数据类型 :bigint(20)
	* 是否必填 :false
	*/
	public String getParentBuyerId() {
		return this.parentBuyerId;
	}

	/**
	* 字段名称 :采购商ID
	* 数据类型 :bigint(20)
	* 是否必填 :false
	*/
	public void setParentBuyerId(String parentBuyerId) {
		 this.parentBuyerId = parentBuyerId;
    }
    
	/**
	* 字段名称 :上传时间
	* 数据类型 :datatime
	* 是否必填 :false
	*/
	public Date getUploadTime() {
		return this.uploadTime;
	}

	/**
	* 字段名称 :上传时间
	* 数据类型 :datatime
	* 是否必填 :false
	*/
	public void setUploadTime(Date uploadTime) {
		 this.uploadTime = uploadTime;
    }
    
	/**
	* 字段名称 :类型
	* 数据类型 :int(1)
	* 是否必填 :false
	*/
	public Integer getType() {
		return this.type;
	}

	/**
	* 字段名称 :类型
	* 数据类型 :int(1)
	* 是否必填 :false
	*/
	public void setType(Integer type) {
		 this.type = type;
    }
    
	/**
	* 字段名称 :状态
	* 数据类型 :int(1)
	* 是否必填 :false
	*/
	public Integer getStatus() {
		return this.status;
	}

	/**
	* 字段名称 :状态
	* 数据类型 :int(1)
	* 是否必填 :false
	*/
	public void setStatus(Integer status) {
		 this.status = status;
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

	public String getChangeTime() {
		return changeTime;
	}

	public void setChangeTime(String changeTime) {
		this.changeTime = changeTime;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public Double getPreferentialRatio() {
		return preferentialRatio;
	}

	public void setPreferentialRatio(Double preferentialRatio) {
		this.preferentialRatio = preferentialRatio;
	}
}