package net.deepdragon.entity.weipu;

import java.util.Date;
import org.apache.ibatis.type.Alias;

//Generated from PowerDesigner file ,Written by 张莹.

/**
 * 表名称：ghj_redenvelop_actiondetail
 * 表代码：ghj_ghj_redenvelop_actiondetail
*/
@Alias(net.deepdragon.constant.weipu.Weipu.SIGN+"GhjRedenvelopActiondetail")
public class GhjRedenvelopActiondetail extends BaseEntity {

	private static final long serialVersionUID = 1014486009591595517L;
	
	/**
	*租户ID
	*/
	private String tenantId;
	
	/**
	*活动ID，参考ghj_redenvelop_action的ID字段
	*/
	private String actionId;
	
	/**
	*限额（订单商品总额满p_limitation可用p_amount）
	*/
	private Double pLimitation;
	
	/**
	*可用额度（订单商品总额满p_limitation可用p_amount）
	*/
	private Double pAmount;
	
	/**
	*该等级红包的个数
	*/
	private Integer count;
	
	/**
	*是否删除：Y-已删除，N-未删除
	*/
	private Boolean isDelete;
	
	
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
	* 字段名称 :活动ID，参考ghj_redenvelop_action的ID字段
	* 数据类型 :bigint(20)
	* 是否必填 :false
	*/
	public String getActionId() {
		return this.actionId;
	}

	/**
	* 字段名称 :活动ID，参考ghj_redenvelop_action的ID字段
	* 数据类型 :bigint(20)
	* 是否必填 :false
	*/
	public void setActionId(String actionId) {
		 this.actionId = actionId;
    }
    
	/**
	* 字段名称 :限额（订单商品总额满p_limitation可用p_amount）
	* 数据类型 :decimal(24,2)
	* 是否必填 :false
	*/
	public Double getPLimitation() {
		return this.pLimitation;
	}

	/**
	* 字段名称 :限额（订单商品总额满p_limitation可用p_amount）
	* 数据类型 :decimal(24,2)
	* 是否必填 :false
	*/
	public void setPLimitation(Double pLimitation) {
		 this.pLimitation = pLimitation;
    }
    
	/**
	* 字段名称 :可用额度（订单商品总额满p_limitation可用p_amount）
	* 数据类型 :decimal(24,2)
	* 是否必填 :false
	*/
	public Double getPAmount() {
		return this.pAmount;
	}

	/**
	* 字段名称 :可用额度（订单商品总额满p_limitation可用p_amount）
	* 数据类型 :decimal(24,2)
	* 是否必填 :false
	*/
	public void setPAmount(Double pAmount) {
		 this.pAmount = pAmount;
    }
    
	/**
	* 字段名称 :该等级红包的个数
	* 数据类型 :int(4)
	* 是否必填 :false
	*/
	public Integer getCount() {
		return this.count;
	}

	/**
	* 字段名称 :该等级红包的个数
	* 数据类型 :int(4)
	* 是否必填 :false
	*/
	public void setCount(Integer count) {
		 this.count = count;
    }
    
	/**
	* 字段名称 :是否删除：Y-已删除，N-未删除
	* 数据类型 :char(1)
	* 是否必填 :false
	*/
	public Boolean getIsDelete() {
		return this.isDelete;
	}

	/**
	* 字段名称 :是否删除：Y-已删除，N-未删除
	* 数据类型 :char(1)
	* 是否必填 :false
	*/
	public void setIsDelete(Boolean isDelete) {
		 this.isDelete = isDelete;
    }
    
}