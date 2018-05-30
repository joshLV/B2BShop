package net.deepdragon.entity.weipu;

import java.util.Date;
import org.apache.ibatis.type.Alias;

//Generated from PowerDesigner file ,Written by 张莹.

/**
 * 表名称：企业基本资格证书
 * 表代码：b2b_enterprise_base_qc
*/
@Alias(net.deepdragon.constant.weipu.Weipu.SIGN+"EnterpriseBaseQc")
public class EnterpriseBaseQc extends BaseEntity {

	private static final long serialVersionUID = 1993173348068298499L;
	
	/**
	*租户ID
	*/
	private String tenantId;
	
	/**
	*类别
	*/
	private String type;
	
	/**
	*名称
	*/
	private String name;
	
	/**
	*排序
	*/
	private Integer orderNo;
	
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
	* 字段名称 :类别
	* 数据类型 :varchar(50)
	* 是否必填 :false
	*/
	public String getType() {
		return this.type;
	}

	/**
	* 字段名称 :类别
	* 数据类型 :varchar(50)
	* 是否必填 :false
	*/
	public void setType(String type) {
		 this.type = type;
    }
    
	/**
	* 字段名称 :名称
	* 数据类型 :varchar(100)
	* 是否必填 :false
	*/
	public String getName() {
		return this.name;
	}

	/**
	* 字段名称 :名称
	* 数据类型 :varchar(100)
	* 是否必填 :false
	*/
	public void setName(String name) {
		 this.name = name;
    }
    
	/**
	* 字段名称 :排序
	* 数据类型 :int(11)
	* 是否必填 :false
	*/
	public Integer getOrderNo() {
		return this.orderNo;
	}

	/**
	* 字段名称 :排序
	* 数据类型 :int(11)
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