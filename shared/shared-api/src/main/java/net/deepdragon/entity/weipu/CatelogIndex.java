package net.deepdragon.entity.weipu;

import net.deepdragon.constant.weipu.Weipu;
import org.apache.ibatis.type.Alias;

//Generated from PowerDesigner file ,Written by 张莹.

/**
 * 表名称：首页商品类目
 * 表代码：wp_catelog_index
*/
@Alias(Weipu.SIGN+"CatelogIndex")
public class CatelogIndex extends BaseEntity {

	private static final long serialVersionUID = 1840171251130958769L;
	
	/**
	*租户ID
	*/
	private String tenantId;
	
	/**
	*行号
	*/
	private Integer rowno;
	
	/**
	*商品分类ID
	*/
	private String catelogId;

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
	* 字段名称 :行号
	* 数据类型 :int
	* 是否必填 :true
	*/
	public Integer getRowno() {
		return this.rowno;
	}

	/**
	* 字段名称 :行号
	* 数据类型 :int
	* 是否必填 :true
	*/
	public void setRowno(Integer rowno) {
		 this.rowno = rowno;
    }
    
	/**
	* 字段名称 :商品分类ID
	* 数据类型 :bigint
	* 是否必填 :false
	*/
	public String getCatelogId() {
		return this.catelogId;
	}

	/**
	* 字段名称 :商品分类ID
	* 数据类型 :bigint
	* 是否必填 :false
	*/
	public void setCatelogId(String catelogId) {
		 this.catelogId = catelogId;
    }
    
}