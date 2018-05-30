package net.deepdragon.entity.weipu;

import net.deepdragon.constant.weipu.Weipu;
import org.apache.ibatis.type.Alias;

//Generated from PowerDesigner file ,Written by 张莹.

/**
 * 表名称：导航管理
 * 表代码：wp_navigation
*/
@Alias(Weipu.SIGN+"Navigation")
public class Navigation extends BaseEntity {

	private static final long serialVersionUID = 1738236498868799684L;
	
	// 导航位置:顶部、中间、底部
	public enum Position {
		top, middle, bottom
	}
		
	/**
	*租户ID
	*/
	private String tenantId;
	
	/**
	*名称
	*/
	private String name;
	
	/**
	*位置
	*/
	private Position position;
	
	/**
	*链接地址
	*/
	private String url;
	
	/**
	*是否显示
	*/
	private Integer isVisible;
	
	/**
	*是否在新窗口中打开
	*/
	private Integer isBlankTarget;
	
	/**
	*显示序号
	*/
	private Integer orderNo;

	/**
	 *所属平台
	 */
	private String platform;

	/**
	 * URL类型：1_内部地址,2_外网地址
	 */
	private Integer urlType;
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
	* 字段名称 :名称
	* 数据类型 :varchar(16)
	* 是否必填 :true
	*/
	public String getName() {
		return this.name;
	}

	/**
	* 字段名称 :名称
	* 数据类型 :varchar(16)
	* 是否必填 :true
	*/
	public void setName(String name) {
		 this.name = name;
    }
    
	/**
	* 字段名称 :位置
	* 数据类型 :varchar(32)
	* 是否必填 :true
	*/
	public Position getPosition() {
		return this.position;
	}

	/**
	* 字段名称 :位置
	* 数据类型 :varchar(32)
	* 是否必填 :true
	*/
	public void setPosition(Position position) {
		 this.position = position;
    }
    
	/**
	* 字段名称 :链接地址
	* 数据类型 :varchar(256)
	* 是否必填 :true
	*/
	public String getUrl() {
		return this.url;
	}

	/**
	* 字段名称 :链接地址
	* 数据类型 :varchar(256)
	* 是否必填 :true
	*/
	public void setUrl(String url) {
		 this.url = url;
    }
    
	/**
	* 字段名称 :是否显示
	* 数据类型 :int
	* 是否必填 :false
	*/
	public Integer getIsVisible() {
		return this.isVisible;
	}

	/**
	* 字段名称 :是否显示
	* 数据类型 :int
	* 是否必填 :false
	*/
	public void setIsVisible(Integer isVisible) {
		 this.isVisible = isVisible;
    }
    
	/**
	* 字段名称 :是否在新窗口中打开
	* 数据类型 :int
	* 是否必填 :false
	*/
	public Integer getIsBlankTarget() {
		return this.isBlankTarget;
	}

	/**
	* 字段名称 :是否在新窗口中打开
	* 数据类型 :int
	* 是否必填 :false
	*/
	public void setIsBlankTarget(Integer isBlankTarget) {
		 this.isBlankTarget = isBlankTarget;
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

	public Integer getUrlType() {
		return urlType;
	}

	public void setUrlType(Integer urlType) {
		this.urlType = urlType;
	}
}