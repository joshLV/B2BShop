package net.deepdragon.entity.weipu;

import net.deepdragon.constant.weipu.Weipu;
import org.apache.ibatis.type.Alias;

//Generated from PowerDesigner file ,Written by 张莹.

/**
 * 表名称：会员参与活动记录
 * 表代码：wp_activity_member
*/
@Alias(Weipu.SIGN+"ActivityMember")
public class ActivityMember extends BaseEntity {

	private static final long serialVersionUID = 1324148708944365871L;
	
	/**
	*租户ID
	*/
	private String tenantId;
	
	/**
	*会员ID
	*/
	private String memberId;
	
	/**
	*活动产品ID
	*/
	private String activityId;
	
	
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
	* 字段名称 :会员ID
	* 数据类型 :bigint
	* 是否必填 :true
	*/
	public String getMemberId() {
		return this.memberId;
	}

	/**
	* 字段名称 :会员ID
	* 数据类型 :bigint
	* 是否必填 :true
	*/
	public void setMemberId(String memberId) {
		 this.memberId = memberId;
    }
    
	/**
	* 字段名称 :活动产品ID
	* 数据类型 :bigint
	* 是否必填 :true
	*/
	public String getActivityId() {
		return this.activityId;
	}

	/**
	* 字段名称 :活动产品ID
	* 数据类型 :bigint
	* 是否必填 :true
	*/
	public void setActivityId(String activityId) {
		 this.activityId = activityId;
    }
    
}