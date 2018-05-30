package net.deepdragon.entity.weipu;

import net.deepdragon.constant.weipu.Weipu;
import org.apache.ibatis.type.Alias;

//Generated from PowerDesigner file ,Written by 张莹.

/**
 * 表名称：退款凭证表
 * 表代码：wp_order_refund_images
*/
@Alias(Weipu.SIGN+"OrderRefundImages")
public class OrderRefundImages extends BaseEntity {

	private static final long serialVersionUID = 1739809406469834892L;
	
	/**
	*租户ID
	*/
	private String tenantId;
	
	/**
	*退款单ID
	*/
	private String refundId;
	
	/**
	*类型
	*/
	private Integer type;
	
	/**
	*组名
	*/
	private String groupName;
	
	/**
	*图片路径
	*/
	private String url;

	/**
	 *所属平台
	 */
	private String platform;

	/**
	 * 字段名称 :所属平台
	 * 数据类型 :bigint
	 * 是否必填 :true
	 */
	public String getPlatform() {
		return this.platform;
	}

	/**
	 * 字段名称 :所属平台
	 * 数据类型 :bigint
	 * 是否必填 :true
	 */
	public void setPlatform(String platform) {
		this.platform = platform;
	}
	
	
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
	* 字段名称 :退款单ID
	* 数据类型 :bigint
	* 是否必填 :true
	*/
	public String getRefundId() {
		return this.refundId;
	}

	/**
	* 字段名称 :退款单ID
	* 数据类型 :bigint
	* 是否必填 :true
	*/
	public void setRefundId(String refundId) {
		 this.refundId = refundId;
    }
    
	/**
	* 字段名称 :类型
	* 数据类型 :int
	* 是否必填 :false
	*/
	public Integer getType() {
		return this.type;
	}

	/**
	* 字段名称 :类型
	* 数据类型 :int
	* 是否必填 :false
	*/
	public void setType(Integer type) {
		 this.type = type;
    }
    
	/**
	* 字段名称 :组名
	* 数据类型 :varchar(64)
	* 是否必填 :false
	*/
	public String getGroupName() {
		return this.groupName;
	}

	/**
	* 字段名称 :组名
	* 数据类型 :varchar(64)
	* 是否必填 :false
	*/
	public void setGroupName(String groupName) {
		 this.groupName = groupName;
    }
    
	/**
	* 字段名称 :图片路径
	* 数据类型 :varchar(256)
	* 是否必填 :false
	*/
	public String getUrl() {
		return this.url;
	}

	/**
	* 字段名称 :图片路径
	* 数据类型 :varchar(256)
	* 是否必填 :false
	*/
	public void setUrl(String url) {
		 this.url = url;
    }
    
}