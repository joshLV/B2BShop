package net.deepdragon.entity;

import net.deepdragon.constant.Shared;
import org.apache.ibatis.type.Alias;

//Generated from PowerDesigner file ,Written by 张莹.

/**
 * 表名称：送货日期
 * 表代码：shared_delivery_time
*/
@Alias(Shared.SIGN+"DeliveryTime")
public class DeliveryTime extends BaseEntity {

	private static final long serialVersionUID = 1174790433250023605L;
	
	/**
	*介绍
	*/
	private String introduce;
	
	/**
	*显示序号
	*/
	private Integer orderNo;

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
	* 字段名称 :介绍
	* 数据类型 :varchar(64)
	* 是否必填 :true
	*/
	public String getIntroduce() {
		return this.introduce;
	}

	/**
	* 字段名称 :介绍
	* 数据类型 :varchar(64)
	* 是否必填 :true
	*/
	public void setIntroduce(String introduce) {
		 this.introduce = introduce;
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
    
}