package net.deepdragon.entity.weipu;

import java.util.Date;
import org.apache.ibatis.type.Alias;

//Generated from PowerDesigner file ,Written by 张莹.

/**
 * 表名称：采购商积分规则表
 * 表代码：b2b_buyer_score_set
*/
@Alias(net.deepdragon.constant.weipu.Weipu.SIGN+"BuyerScoreSet")
public class BuyerScoreSet extends BaseEntity {

	private static final long serialVersionUID = 1648675635792066587L;
	
	/**
	*租户ID
	*/
	private String tenantId;
	
	/**
	*最低累计消费
	*/
	private Long startTotal;
	
	/**
	*单位消费金额
	*/
	private Long unitTotal;
	
	/**
	*积分规则名称
	*/
	private String unitScoreName;
	
	/**
	*积分规则值
	*/
	private Integer unitScoreValue;
	
	/**
	*是否启用
	*/
	private Integer isvalid;
	
	/**
	*备注
	*/
	private String remark;
	
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
	* 字段名称 :最低累计消费
	* 数据类型 :decimal(24,0)
	* 是否必填 :false
	*/
	public Long getStartTotal() {
		return this.startTotal;
	}

	/**
	* 字段名称 :最低累计消费
	* 数据类型 :decimal(24,0)
	* 是否必填 :false
	*/
	public void setStartTotal(Long startTotal) {
		 this.startTotal = startTotal;
    }
    
	/**
	* 字段名称 :单位消费金额
	* 数据类型 :decimal(24,0)
	* 是否必填 :false
	*/
	public Long getUnitTotal() {
		return this.unitTotal;
	}

	/**
	* 字段名称 :单位消费金额
	* 数据类型 :decimal(24,0)
	* 是否必填 :false
	*/
	public void setUnitTotal(Long unitTotal) {
		 this.unitTotal = unitTotal;
    }
    
	/**
	* 字段名称 :积分规则名称
	* 数据类型 :varchar(32)
	* 是否必填 :false
	*/
	public String getUnitScoreName() {
		return this.unitScoreName;
	}

	/**
	* 字段名称 :积分规则名称
	* 数据类型 :varchar(32)
	* 是否必填 :false
	*/
	public void setUnitScoreName(String unitScoreName) {
		 this.unitScoreName = unitScoreName;
    }
    
	/**
	* 字段名称 :积分规则值
	* 数据类型 :int(11)
	* 是否必填 :false
	*/
	public Integer getUnitScoreValue() {
		return this.unitScoreValue;
	}

	/**
	* 字段名称 :积分规则值
	* 数据类型 :int(11)
	* 是否必填 :false
	*/
	public void setUnitScoreValue(Integer unitScoreValue) {
		 this.unitScoreValue = unitScoreValue;
    }
    
	/**
	* 字段名称 :是否启用
	* 数据类型 :int(11)
	* 是否必填 :false
	*/
	public Integer getIsvalid() {
		return this.isvalid;
	}

	/**
	* 字段名称 :是否启用
	* 数据类型 :int(11)
	* 是否必填 :false
	*/
	public void setIsvalid(Integer isvalid) {
		 this.isvalid = isvalid;
    }
    
	/**
	* 字段名称 :备注
	* 数据类型 :varchar(255)
	* 是否必填 :false
	*/
	public String getRemark() {
		return this.remark;
	}

	/**
	* 字段名称 :备注
	* 数据类型 :varchar(255)
	* 是否必填 :false
	*/
	public void setRemark(String remark) {
		 this.remark = remark;
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