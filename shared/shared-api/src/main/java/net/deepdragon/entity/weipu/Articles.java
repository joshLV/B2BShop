package net.deepdragon.entity.weipu;

import net.deepdragon.constant.weipu.Weipu;
import org.apache.ibatis.type.Alias;

//Generated from PowerDesigner file ,Written by 张莹.

/**
 * 表名称：文章管理
 * 表代码：wp_articles
*/
@Alias(Weipu.SIGN+"Articles")
public class Articles extends BaseEntity {

	private static final long serialVersionUID = 1759962924727790169L;
	
	/**
	*租户ID
	*/
	private String tenantId;
	
	/**
	*文章分类
	*/
	private String categoryId;
	
	/**
	*标题
	*/
	private String title;
	
	/**
	*作者
	*/
	private String author;
	
	/**
	*内容
	*/
	private String content;
	
	/**
	*是否发布
	*/
	private Integer isPublication;
	
	/**
	*是否置顶
	*/
	private Integer isTop;
	
	/**
	*页面标题
	*/
	private String seoTitle;
	
	/**
	*页面关键词
	*/
	private String seoKeywords;
	
	/**
	*页面描述
	*/
	private String seoDescription;
	
	/**
	*显示序号
	*/
	private Integer orderNo;
    /**
     *分类
     */
    private String categoryName;

	/**
	 *所属平台
	 */
	private String platform;

	/**
	 *手机端内容
	 */
	private String phoneContent;

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
	* 字段名称 :文章分类
	* 数据类型 :bigint
	* 是否必填 :false
	*/
	public String getCategoryId() {
		return this.categoryId;
	}

	/**
	* 字段名称 :文章分类
	* 数据类型 :bigint
	* 是否必填 :false
	*/
	public void setCategoryId(String categoryId) {
		 this.categoryId = categoryId;
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
	* 字段名称 :作者
	* 数据类型 :varchar(32)
	* 是否必填 :false
	*/
	public String getAuthor() {
		return this.author;
	}

	/**
	* 字段名称 :作者
	* 数据类型 :varchar(32)
	* 是否必填 :false
	*/
	public void setAuthor(String author) {
		 this.author = author;
    }
    
	/**
	* 字段名称 :内容
	* 数据类型 :longtext
	* 是否必填 :true
	*/
	public String getContent() {
		return this.content;
	}

	/**
	* 字段名称 :内容
	* 数据类型 :longtext
	* 是否必填 :true
	*/
	public void setContent(String content) {
		 this.content = content;
    }
    
	/**
	* 字段名称 :是否发布
	* 数据类型 :int
	* 是否必填 :false
	*/
	public Integer getIsPublication() {
		return this.isPublication;
	}

	/**
	* 字段名称 :是否发布
	* 数据类型 :int
	* 是否必填 :false
	*/
	public void setIsPublication(Integer isPublication) {
		 this.isPublication = isPublication;
    }
    
	/**
	* 字段名称 :是否置顶
	* 数据类型 :int
	* 是否必填 :false
	*/
	public Integer getIsTop() {
		return this.isTop;
	}

	/**
	* 字段名称 :是否置顶
	* 数据类型 :int
	* 是否必填 :false
	*/
	public void setIsTop(Integer isTop) {
		 this.isTop = isTop;
    }
    
	/**
	* 字段名称 :页面标题
	* 数据类型 :varchar(32)
	* 是否必填 :false
	*/
	public String getSeoTitle() {
		return this.seoTitle;
	}

	/**
	* 字段名称 :页面标题
	* 数据类型 :varchar(32)
	* 是否必填 :false
	*/
	public void setSeoTitle(String seoTitle) {
		 this.seoTitle = seoTitle;
    }
    
	/**
	* 字段名称 :页面关键词
	* 数据类型 :varchar(64)
	* 是否必填 :false
	*/
	public String getSeoKeywords() {
		return this.seoKeywords;
	}

	/**
	* 字段名称 :页面关键词
	* 数据类型 :varchar(64)
	* 是否必填 :false
	*/
	public void setSeoKeywords(String seoKeywords) {
		 this.seoKeywords = seoKeywords;
    }
    
	/**
	* 字段名称 :页面描述
	* 数据类型 :varchar(128)
	* 是否必填 :false
	*/
	public String getSeoDescription() {
		return this.seoDescription;
	}

	/**
	* 字段名称 :页面描述
	* 数据类型 :varchar(128)
	* 是否必填 :false
	*/
	public void setSeoDescription(String seoDescription) {
		 this.seoDescription = seoDescription;
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

    public String getCategoryName() {
        return categoryName;
    }

    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName;
    }

	public String getPhoneContent() {
		return phoneContent;
	}

	public void setPhoneContent(String phoneContent) {
		this.phoneContent = phoneContent;
	}
}