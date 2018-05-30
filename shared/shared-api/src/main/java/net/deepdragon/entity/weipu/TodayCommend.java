package net.deepdragon.entity.weipu;

import org.apache.ibatis.type.Alias;

//Generated from PowerDesigner file ,Written by 张莹.

/**
 * 表名称：今日爆款
 * 表代码：wp_today_commend
*/
@Alias(net.deepdragon.constant.weipu.Weipu.SIGN+"TodayCommend")
public class TodayCommend extends BaseEntity {

	private static final long serialVersionUID = 1645048937878796427L;
	
	/**
	*租户ID
	*/
	private String tenantId;
	
	/**
	*标题
	*/
	private String title;
	
	/**
	*关联商品
	*/
	private String goodsId;
	
	/**
	*状态
	*/
	private Integer status;

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
	* 字段名称 :标题
	* 数据类型 :varchar(32)
	* 是否必填 :true
	*/
	public String getTitle() {
		return this.title;
	}

	/**
	* 字段名称 :标题
	* 数据类型 :varchar(32)
	* 是否必填 :true
	*/
	public void setTitle(String title) {
		 this.title = title;
    }
    
	/**
	* 字段名称 :关联商品
	* 数据类型 :bigint
	* 是否必填 :false
	*/
	public String getGoodsId() {
		return this.goodsId;
	}

	/**
	* 字段名称 :关联商品
	* 数据类型 :bigint
	* 是否必填 :false
	*/
	public void setGoodsId(String goodsId) {
		 this.goodsId = goodsId;
    }
    
	/**
	* 字段名称 :状态
	* 数据类型 :int
	* 是否必填 :true
	*/
	public Integer getStatus() {
		return this.status;
	}

	/**
	* 字段名称 :状态
	* 数据类型 :int
	* 是否必填 :true
	*/
	public void setStatus(Integer status) {
		 this.status = status;
    }
    
}