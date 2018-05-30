package net.deepdragon.entity.weipu;

import net.deepdragon.constant.weipu.Weipu;
import org.apache.ibatis.type.Alias;

//Generated from PowerDesigner file ,Written by 张莹.

/**
 * 表名称：文章分类
 * 表代码：wp_articles_category
*/
@Alias(Weipu.SIGN+"ArticlesCategory")
public class ArticlesCategory extends BaseEntity {

	private static final long serialVersionUID = 1527287293590058303L;
	
	/**
	*租户ID
	*/
	private String tenantId;
	
	/**
	*父分类
	*/
	private String parentId;
	
	/**
	*名称
	*/
	private String name;
	
	/**
	*分类标识
	*/
	private String sign;
	
	/**
	*页面标题
	*/
	private String pagetitle;
	
	/**
	*页面关键词
	*/
	private String pagekey;
	
	/**
	*显示序号
	*/
	private Integer orderNo;
	
	/**
	*分类描述
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
	* 字段名称 :父分类
	* 数据类型 :bigint
	* 是否必填 :false
	*/
	public String getParentId() {
		return this.parentId;
	}

	/**
	* 字段名称 :父分类
	* 数据类型 :bigint
	* 是否必填 :false
	*/
	public void setParentId(String parentId) {
		 this.parentId = parentId;
    }
    
	/**
	* 字段名称 :名称
	* 数据类型 :varchar(32)
	* 是否必填 :true
	*/
	public String getName() {
		return this.name;
	}

	/**
	* 字段名称 :名称
	* 数据类型 :varchar(32)
	* 是否必填 :true
	*/
	public void setName(String name) {
		 this.name = name;
    }
    
	/**
	* 字段名称 :分类标识
	* 数据类型 :varchar(32)
	* 是否必填 :true
	*/
	public String getSign() {
		return this.sign;
	}

	/**
	* 字段名称 :分类标识
	* 数据类型 :varchar(32)
	* 是否必填 :true
	*/
	public void setSign(String sign) {
		 this.sign = sign;
    }
    
	/**
	* 字段名称 :页面标题
	* 数据类型 :varchar(32)
	* 是否必填 :false
	*/
	public String getPagetitle() {
		return this.pagetitle;
	}

	/**
	* 字段名称 :页面标题
	* 数据类型 :varchar(32)
	* 是否必填 :false
	*/
	public void setPagetitle(String pagetitle) {
		 this.pagetitle = pagetitle;
    }
    
	/**
	* 字段名称 :页面关键词
	* 数据类型 :varchar(64)
	* 是否必填 :false
	*/
	public String getPagekey() {
		return this.pagekey;
	}

	/**
	* 字段名称 :页面关键词
	* 数据类型 :varchar(64)
	* 是否必填 :false
	*/
	public void setPagekey(String pagekey) {
		 this.pagekey = pagekey;
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
	* 字段名称 :分类描述
	* 数据类型 :varchar(128)
	* 是否必填 :false
	*/
	public String getDescription() {
		return this.description;
	}

	/**
	* 字段名称 :分类描述
	* 数据类型 :varchar(128)
	* 是否必填 :false
	*/
	public void setDescription(String description) {
		 this.description = description;
    }
    
}