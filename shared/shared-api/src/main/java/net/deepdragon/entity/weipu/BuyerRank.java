package net.deepdragon.entity.weipu;

import java.util.Date;
import org.apache.ibatis.type.Alias;

//Generated from PowerDesigner file ,Written by 张莹.

/**
 * 表名称：采购商等级
 * 表代码：b2b_buyer_rank
*/
@Alias(net.deepdragon.constant.weipu.Weipu.SIGN+"BuyerRank")
public class BuyerRank extends BaseEntity {

	private static final long serialVersionUID = 1424889578133096349L;
	
	/**
	*租户ID
	*/
	private String tenantId;
	
	/**
	*等级名称
	*/
	private String name;
	
	/**
	*等级标识
	*/
	private String sign;
	
	/**
	*优惠比例
	*/
	private Double scale;
	
	/**
	*消费金额
	*/
	private Double amount;
	
	/**
	*采购商积分规则Id
	*/
	private String socreSetId;
	
	/**
	*升级所需积分数
	*/
	private Integer needScoreTotal;
	
	/**
	*是否默认
	*/
	private Integer isDefault;
	
	/**
	*显示序号
	*/
	private Integer orderNo;
	
	/**
	*删除标识
	*/
	private Integer isDelete;
	
	
	/**
	* 字段名称 :租户ID
	* 数据类型 :bigint
	* 是否必填 :false
	*/
	public String getTenantId() {
		return this.tenantId;
	}

	/**
	* 字段名称 :租户ID
	* 数据类型 :bigint
	* 是否必填 :false
	*/
	public void setTenantId(String tenantId) {
		 this.tenantId = tenantId;
    }
    
	/**
	* 字段名称 :等级名称
	* 数据类型 :varchar(32)
	* 是否必填 :false
	*/
	public String getName() {
		return this.name;
	}

	/**
	* 字段名称 :等级名称
	* 数据类型 :varchar(32)
	* 是否必填 :false
	*/
	public void setName(String name) {
		 this.name = name;
    }
    
	/**
	* 字段名称 :等级标识
	* 数据类型 :varchar(32)
	* 是否必填 :false
	*/
	public String getSign() {
		return this.sign;
	}

	/**
	* 字段名称 :等级标识
	* 数据类型 :varchar(32)
	* 是否必填 :false
	*/
	public void setSign(String sign) {
		 this.sign = sign;
    }
    
	/**
	* 字段名称 :优惠比例
	* 数据类型 :decimal(24,2)
	* 是否必填 :false
	*/
	public Double getScale() {
		return this.scale;
	}

	/**
	* 字段名称 :优惠比例
	* 数据类型 :decimal(24,2)
	* 是否必填 :false
	*/
	public void setScale(Double scale) {
		 this.scale = scale;
    }
    
	/**
	* 字段名称 :消费金额
	* 数据类型 :decimal(24,2)
	* 是否必填 :false
	*/
	public Double getAmount() {
		return this.amount;
	}

	/**
	* 字段名称 :消费金额
	* 数据类型 :decimal(24,2)
	* 是否必填 :false
	*/
	public void setAmount(Double amount) {
		 this.amount = amount;
    }
    
	/**
	* 字段名称 :采购商积分规则Id
	* 数据类型 :bigint(20)
	* 是否必填 :false
	*/
	public String getSocreSetId() {
		return this.socreSetId;
	}

	/**
	* 字段名称 :采购商积分规则Id
	* 数据类型 :bigint(20)
	* 是否必填 :false
	*/
	public void setSocreSetId(String socreSetId) {
		 this.socreSetId = socreSetId;
    }
    
	/**
	* 字段名称 :升级所需积分数
	* 数据类型 :int(11)
	* 是否必填 :false
	*/
	public Integer getNeedScoreTotal() {
		return this.needScoreTotal;
	}

	/**
	* 字段名称 :升级所需积分数
	* 数据类型 :int(11)
	* 是否必填 :false
	*/
	public void setNeedScoreTotal(Integer needScoreTotal) {
		 this.needScoreTotal = needScoreTotal;
    }
    
	/**
	* 字段名称 :是否默认
	* 数据类型 :int
	* 是否必填 :false
	*/
	public Integer getIsDefault() {
		return this.isDefault;
	}

	/**
	* 字段名称 :是否默认
	* 数据类型 :int
	* 是否必填 :false
	*/
	public void setIsDefault(Integer isDefault) {
		 this.isDefault = isDefault;
    }
    
	/**
	* 字段名称 :显示序号
	* 数据类型 :int
	* 是否必填 :false
	*/
	public Integer getOrderNo() {
		return this.orderNo;
	}

	/**
	* 字段名称 :显示序号
	* 数据类型 :int
	* 是否必填 :false
	*/
	public void setOrderNo(Integer orderNo) {
		 this.orderNo = orderNo;
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