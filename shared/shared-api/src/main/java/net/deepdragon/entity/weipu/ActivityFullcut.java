package net.deepdragon.entity.weipu;

import java.util.Date;
import org.apache.ibatis.type.Alias;

//Generated from PowerDesigner file ,Written by 张莹.

/**
 * 表名称：促销满减活动主表
 * 表代码：cx_activity_fullcut
*/
@Alias(net.deepdragon.constant.weipu.Weipu.SIGN+"ActivityFullcut")
public class ActivityFullcut extends BaseEntity {

	private static final long serialVersionUID = 1311068159184066123L;
	
	/**
	*租户ID
	*/
	private String tenantId;
	
	/**
	*供应商ID,wp_merchant表的主键字段
	*/
	private String merchantId;
	
	/**
	*满减活动名称
	*/
	private String mjName;
	
	/**
	*满减活动描述
	*/
	private String description;
	
	/**
	*（预留字段）活动范围：all表示全部参与； section表示部分商品参与。
	*/
	private String participateRange;
	
	/**
	*活动开始时间
	*/
	private Date startTime;
	
	/**
	*活动结束时间
	*/
	private Date endTime;
	
	/**
	*是否删除,1-未删除，0-已删除
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
	* 字段名称 :供应商ID,wp_merchant表的主键字段
	* 数据类型 :bigint(20)
	* 是否必填 :false
	*/
	public String getMerchantId() {
		return this.merchantId;
	}

	/**
	* 字段名称 :供应商ID,wp_merchant表的主键字段
	* 数据类型 :bigint(20)
	* 是否必填 :false
	*/
	public void setMerchantId(String merchantId) {
		 this.merchantId = merchantId;
    }
    
	/**
	* 字段名称 :满减活动名称
	* 数据类型 :varchar(100)
	* 是否必填 :false
	*/
	public String getMjName() {
		return this.mjName;
	}

	/**
	* 字段名称 :满减活动名称
	* 数据类型 :varchar(100)
	* 是否必填 :false
	*/
	public void setMjName(String mjName) {
		 this.mjName = mjName;
    }
    
	/**
	* 字段名称 :满减活动描述
	* 数据类型 :text
	* 是否必填 :false
	*/
	public String getDescription() {
		return this.description;
	}

	/**
	* 字段名称 :满减活动描述
	* 数据类型 :text
	* 是否必填 :false
	*/
	public void setDescription(String description) {
		 this.description = description;
    }
    
	/**
	* 字段名称 :（预留字段）活动范围：all表示全部参与； section表示部分商品参与。
	* 数据类型 :varchar(20)
	* 是否必填 :false
	*/
	public String getParticipateRange() {
		return this.participateRange;
	}

	/**
	* 字段名称 :（预留字段）活动范围：all表示全部参与； section表示部分商品参与。
	* 数据类型 :varchar(20)
	* 是否必填 :false
	*/
	public void setParticipateRange(String participateRange) {
		 this.participateRange = participateRange;
    }
    
	/**
	* 字段名称 :活动开始时间
	* 数据类型 :datetime
	* 是否必填 :false
	*/
	public Date getStartTime() {
		return this.startTime;
	}

	/**
	* 字段名称 :活动开始时间
	* 数据类型 :datetime
	* 是否必填 :false
	*/
	public void setStartTime(Date startTime) {
		 this.startTime = startTime;
    }
    
	/**
	* 字段名称 :活动结束时间
	* 数据类型 :datetime
	* 是否必填 :false
	*/
	public Date getEndTime() {
		return this.endTime;
	}

	/**
	* 字段名称 :活动结束时间
	* 数据类型 :datetime
	* 是否必填 :false
	*/
	public void setEndTime(Date endTime) {
		 this.endTime = endTime;
    }
    
	/**
	* 字段名称 :是否删除,1-未删除，0-已删除
	* 数据类型 :int(10)
	* 是否必填 :false
	*/
	public Integer getIsDelete() {
		return this.isDelete;
	}

	/**
	* 字段名称 :是否删除,1-未删除，0-已删除
	* 数据类型 :int(10)
	* 是否必填 :false
	*/
	public void setIsDelete(Integer isDelete) {
		 this.isDelete = isDelete;
    }
    
}