package net.deepdragon.entity.weipu;

import java.util.Date;
import org.apache.ibatis.type.Alias;

//Generated from PowerDesigner file ,Written by 张莹.

/**
 * 表名称：ghj_redenvelop_rangerebaterule
 * 表代码：ghj_ghj_redenvelop_rangerebaterule
*/
@Alias(net.deepdragon.constant.weipu.Weipu.SIGN+"GhjRedenvelopRangerebaterule")
public class GhjRedenvelopRangerebaterule extends BaseEntity {

	private static final long serialVersionUID = 1868905055381108815L;
	
	/**
	*租户ID
	*/
	private String tenantId;
	
	/**
	*红包ID，参考ghj_redenvelop_grandlog表的主键字段
	*/
	private String redEnvelopId;
	
	/**
	*区间开始
	*/
	private Double rStartRange;
	
	/**
	*区间结束
	*/
	private Double rEndRange;
	
	/**
	*区间排序
	*/
	private Integer rRangeOrder;
	
	/**
	*返还比例或返还金额
	*/
	private Double rAmount;
	
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
	* 字段名称 :红包ID，参考ghj_redenvelop_grandlog表的主键字段
	* 数据类型 :bigint(20)
	* 是否必填 :false
	*/
	public String getRedEnvelopId() {
		return this.redEnvelopId;
	}

	/**
	* 字段名称 :红包ID，参考ghj_redenvelop_grandlog表的主键字段
	* 数据类型 :bigint(20)
	* 是否必填 :false
	*/
	public void setRedEnvelopId(String redEnvelopId) {
		 this.redEnvelopId = redEnvelopId;
    }
    
	/**
	* 字段名称 :区间开始
	* 数据类型 :decimal(24,2)
	* 是否必填 :false
	*/
	public Double getRStartRange() {
		return this.rStartRange;
	}

	/**
	* 字段名称 :区间开始
	* 数据类型 :decimal(24,2)
	* 是否必填 :false
	*/
	public void setRStartRange(Double rStartRange) {
		 this.rStartRange = rStartRange;
    }
    
	/**
	* 字段名称 :区间结束
	* 数据类型 :decimal(24,2)
	* 是否必填 :false
	*/
	public Double getREndRange() {
		return this.rEndRange;
	}

	/**
	* 字段名称 :区间结束
	* 数据类型 :decimal(24,2)
	* 是否必填 :false
	*/
	public void setREndRange(Double rEndRange) {
		 this.rEndRange = rEndRange;
    }
    
	/**
	* 字段名称 :区间排序
	* 数据类型 :int(2)
	* 是否必填 :false
	*/
	public Integer getRRangeOrder() {
		return this.rRangeOrder;
	}

	/**
	* 字段名称 :区间排序
	* 数据类型 :int(2)
	* 是否必填 :false
	*/
	public void setRRangeOrder(Integer rRangeOrder) {
		 this.rRangeOrder = rRangeOrder;
    }
    
	/**
	* 字段名称 :返还比例或返还金额
	* 数据类型 :decimal(24,2)
	* 是否必填 :false
	*/
	public Double getRAmount() {
		return this.rAmount;
	}

	/**
	* 字段名称 :返还比例或返还金额
	* 数据类型 :decimal(24,2)
	* 是否必填 :false
	*/
	public void setRAmount(Double rAmount) {
		 this.rAmount = rAmount;
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