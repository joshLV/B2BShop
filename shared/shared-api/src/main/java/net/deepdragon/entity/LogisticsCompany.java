package net.deepdragon.entity;

import net.deepdragon.constant.Shared;
import org.apache.ibatis.type.Alias;

//Generated from PowerDesigner file ,Written by 张莹.

/**
 * 表名称：物流公司
 * 表代码：shared_logistics_company
*/
@Alias(Shared.SIGN+"LogisticsCompany")
public class LogisticsCompany extends BaseEntity {

	private static final long serialVersionUID = 1816703890322872222L;
	
	/**
	*公司名称
	*/
	private String name;
	
	/**
	*公司标识
	*/
	private String sign;
	
	/**
	*公司网址
	*/
	private String url;
	
	/**
	*显示序号
	*/
	private Integer orderNo;
	
	/**
	*描述
	*/
	private String description;

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
	* 字段名称 :公司名称
	* 数据类型 :varchar(16)
	* 是否必填 :true
	*/
	public String getName() {
		return this.name;
	}

	/**
	* 字段名称 :公司名称
	* 数据类型 :varchar(16)
	* 是否必填 :true
	*/
	public void setName(String name) {
		 this.name = name;
    }
    
	/**
	* 字段名称 :公司标识
	* 数据类型 :varchar(32)
	* 是否必填 :true
	*/
	public String getSign() {
		return this.sign;
	}

	/**
	* 字段名称 :公司标识
	* 数据类型 :varchar(32)
	* 是否必填 :true
	*/
	public void setSign(String sign) {
		 this.sign = sign;
    }
    
	/**
	* 字段名称 :公司网址
	* 数据类型 :varchar(256)
	* 是否必填 :true
	*/
	public String getUrl() {
		return this.url;
	}

	/**
	* 字段名称 :公司网址
	* 数据类型 :varchar(256)
	* 是否必填 :true
	*/
	public void setUrl(String url) {
		 this.url = url;
    }
    
	/**
	* 字段名称 :显示序号
	* 数据类型 :int
	* 是否必填 :true
	*/
	public Integer getOrderNo() {
		return this.orderNo;
	}

	/**
	* 字段名称 :显示序号
	* 数据类型 :int
	* 是否必填 :true
	*/
	public void setOrderNo(Integer orderNo) {
		 this.orderNo = orderNo;
    }
    
	/**
	* 字段名称 :描述
	* 数据类型 :varchar(128)
	* 是否必填 :false
	*/
	public String getDescription() {
		return this.description;
	}

	/**
	* 字段名称 :描述
	* 数据类型 :varchar(128)
	* 是否必填 :false
	*/
	public void setDescription(String description) {
		 this.description = description;
    }
    
}