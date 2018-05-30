package net.deepdragon.entity.weipu;

import net.deepdragon.constant.weipu.Weipu;
import org.apache.ibatis.type.Alias;

//Generated from PowerDesigner file ,Written by 张莹.

/**
 * 表名称：轮播广告
 * 表代码：wp_carousel_advertising
*/
@Alias(Weipu.SIGN+"CarouselAdvertising")
public class CarouselAdvertising extends BaseEntity {

	private static final long serialVersionUID = 1245363162475861281L;
	
	/**
	*租户ID
	*/
	private String tenantId;
	
	/**
	*组名
	*/
	private String groupName;
	
	/**
	*图片
	*/
	private String image;
	
	/**
	*图片宽
	*/
	private Integer imageWidth;
	
	/**
	*图片高
	*/
	private Integer imageHight;
	
	/**
	*是否启用
	*/
	private Integer enabled;
	
	/**
	*链接地址
	*/
	private String url;
	
	/**
	*显示序号
	*/
	private Integer orderNo;
	
	/**
	*备注说明
	*/
	private String description;
	private String pic;
	private String mobilepic;//手机端首页轮播图片地址

	/**
	 *所属平台
	 */
	private String platform;
	/**
	 *APP端用链接地址
	 */
	private String appUrl;

	private String hybridType;

	private String hybridUrl;


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
	* 字段名称 :图片
	* 数据类型 :varchar(128)
	* 是否必填 :false
	*/
	public String getImage() {
		return this.image;
	}

	/**
	* 字段名称 :图片
	* 数据类型 :varchar(128)
	* 是否必填 :false
	*/
	public void setImage(String image) {
		 this.image = image;
    }
    
	/**
	* 字段名称 :图片宽
	* 数据类型 :int
	* 是否必填 :false
	*/
	public Integer getImageWidth() {
		return this.imageWidth;
	}

	/**
	* 字段名称 :图片宽
	* 数据类型 :int
	* 是否必填 :false
	*/
	public void setImageWidth(Integer imageWidth) {
		 this.imageWidth = imageWidth;
    }
    
	/**
	* 字段名称 :图片高
	* 数据类型 :int
	* 是否必填 :false
	*/
	public Integer getImageHight() {
		return this.imageHight;
	}

	/**
	* 字段名称 :图片高
	* 数据类型 :int
	* 是否必填 :false
	*/
	public void setImageHight(Integer imageHight) {
		 this.imageHight = imageHight;
    }
	
	/**
	* 字段名称 :是否启用
	* 数据类型 :int
	* 是否必填 :true
	*/
	public Integer getEnabled() {
		return this.enabled;
	}

	/**
	* 字段名称 :是否启用
	* 数据类型 :int
	* 是否必填 :true
	*/
	public void setEnabled(Integer enabled) {
		 this.enabled = enabled;
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
	* 字段名称 :备注说明
	* 数据类型 :varchar(128)
	* 是否必填 :false
	*/
	public String getDescription() {
		return this.description;
	}

	/**
	* 字段名称 :备注说明
	* 数据类型 :varchar(128)
	* 是否必填 :false
	*/
	public void setDescription(String description) {
		 this.description = description;
    }

	public String getPic() {
		return pic;
	}

	public void setPic(String pic) {
		this.pic = pic;
	}

	public String getAppUrl() {
		return appUrl;
	}

	public void setAppUrl(String appUrl) {
		this.appUrl = appUrl;
	}

	public String getMobilepic() {
		return mobilepic;
	}

	public void setMobilepic(String mobilepic) {
		this.mobilepic = mobilepic;
	}

	public String getHybridType() {
		return hybridType;
	}

	public void setHybridType(String hybridType) {
		this.hybridType = hybridType;
	}

	public String getHybridUrl() {
		return hybridUrl;
	}

	public void setHybridUrl(String hybridUrl) {
		this.hybridUrl = hybridUrl;
	}
}