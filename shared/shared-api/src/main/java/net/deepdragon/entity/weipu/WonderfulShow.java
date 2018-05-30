package net.deepdragon.entity.weipu;

import net.deepdragon.constant.weipu.Weipu;
import org.apache.ibatis.type.Alias;

//Generated from PowerDesigner file ,Written by 张莹.

/**
 * 表名称：精彩展示
 * 表代码：wp_wonderful_show
*/
@Alias(Weipu.SIGN+"WonderfulShow")
public class WonderfulShow extends BaseEntity {

	private static final long serialVersionUID = 1289863273793107729L;
	
	/**
	*租户ID
	*/
	private String tenantId;
	
	/**
	*名称
	*/
	private String name;
	
	/**
	*简介
	*/
	private String introduction;
	/**
	*简介
	*/
	private String special;
	


	/**
	*特点
	*/
	private String point;
	
	/**
	*链接
	*/
	private String link;
	
	/**
	*图片组
	*/
	private String groupName;
	
	/**
	*图片
	*/
	private String image;
	
	private String pic;

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
	* 字段名称 :简介
	* 数据类型 :varchar(32)
	* 是否必填 :false
	*/
	public String getIntroduction() {
		return this.introduction;
	}

	/**
	* 字段名称 :简介
	* 数据类型 :varchar(32)
	* 是否必填 :false
	*/
	public void setIntroduction(String introduction) {
		 this.introduction = introduction;
    }
	public String getSpecial() {
		return special;
	}

	public void setSpecial(String special) {
		this.special = special;
	}
	/**
	* 字段名称 :特点
	* 数据类型 :varchar(16)
	* 是否必填 :false
	*/
	public String getPoint() {
		return this.point;
	}

	/**
	* 字段名称 :特点
	* 数据类型 :varchar(16)
	* 是否必填 :false
	*/
	public void setPoint(String point) {
		 this.point = point;
    }
    
	/**
	* 字段名称 :链接
	* 数据类型 :varchar(256)
	* 是否必填 :true
	*/
	public String getLink() {
		return this.link;
	}

	/**
	* 字段名称 :链接
	* 数据类型 :varchar(256)
	* 是否必填 :true
	*/
	public void setLink(String link) {
		 this.link = link;
    }
    
	/**
	* 字段名称 :图片组
	* 数据类型 :varchar(32)
	* 是否必填 :false
	*/
	public String getGroupName() {
		return this.groupName;
	}

	/**
	* 字段名称 :图片组
	* 数据类型 :varchar(32)
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

	public String getPic() {
		return pic;
	}

	public void setPic(String pic) {
		this.pic = pic;
	}
    
	
}