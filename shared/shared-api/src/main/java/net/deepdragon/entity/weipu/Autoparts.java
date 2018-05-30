package net.deepdragon.entity.weipu;

import net.deepdragon.constant.weipu.Weipu;
import org.apache.ibatis.type.Alias;

//Generated from PowerDesigner file ,Written by 张莹.

/**
 * 表名称：汽配城信息
 * 表代码：wp_autoparts
*/
@Alias(Weipu.SIGN+"Autoparts")
public class Autoparts extends BaseEntity {

	private static final long serialVersionUID = 1832399281258082307L;
	
	/**
	*租户ID
	*/
	private String tenantId;
	
	/**
	*名称
	*/
	private String name;
	
	/**
	*联系人
	*/
	private String linkman;
	
	/**
	*固定电话
	*/
	private String phone;
	
	/**
	*传真号
	*/
	private String fax;
	
	/**
	*网址
	*/
	private String website;
	
	/**
	*邮编
	*/
	private String zipcode;
	
	/**
	*邮箱
	*/
	private String email;
	
	/**
	*地区ID
	*/
	private String areaId;
	
	/**
	*地区路径
	*/
	private String areaPath;
	
	/**
	*详细地址
	*/
	private String address;
	
	/**
	*简介
	*/
	private String introduction;
	
	/**
	*企业图片
	*/
	private String logo;
	
	/**
	*组名
	*/
	private String groupName;
    /**
     *加载图片字段
     */
    private String pic;

    public String getPic() {
        return pic;
    }

    public void setPic(String pic) {
        this.pic = pic;
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
	* 字段名称 :联系人
	* 数据类型 :varchar(32)
	* 是否必填 :true
	*/
	public String getLinkman() {
		return this.linkman;
	}

	/**
	* 字段名称 :联系人
	* 数据类型 :varchar(32)
	* 是否必填 :true
	*/
	public void setLinkman(String linkman) {
		 this.linkman = linkman;
    }
    
	/**
	* 字段名称 :固定电话
	* 数据类型 :varchar(32)
	* 是否必填 :false
	*/
	public String getPhone() {
		return this.phone;
	}

	/**
	* 字段名称 :固定电话
	* 数据类型 :varchar(32)
	* 是否必填 :false
	*/
	public void setPhone(String phone) {
		 this.phone = phone;
    }
    
	/**
	* 字段名称 :传真号
	* 数据类型 :varchar(32)
	* 是否必填 :false
	*/
	public String getFax() {
		return this.fax;
	}

	/**
	* 字段名称 :传真号
	* 数据类型 :varchar(32)
	* 是否必填 :false
	*/
	public void setFax(String fax) {
		 this.fax = fax;
    }
    
	/**
	* 字段名称 :网址
	* 数据类型 :varchar(128)
	* 是否必填 :false
	*/
	public String getWebsite() {
		return this.website;
	}

	/**
	* 字段名称 :网址
	* 数据类型 :varchar(128)
	* 是否必填 :false
	*/
	public void setWebsite(String website) {
		 this.website = website;
    }
    
	/**
	* 字段名称 :邮编
	* 数据类型 :varchar(32)
	* 是否必填 :false
	*/
	public String getZipcode() {
		return this.zipcode;
	}

	/**
	* 字段名称 :邮编
	* 数据类型 :varchar(32)
	* 是否必填 :false
	*/
	public void setZipcode(String zipcode) {
		 this.zipcode = zipcode;
    }
    
	/**
	* 字段名称 :邮箱
	* 数据类型 :varchar(64)
	* 是否必填 :false
	*/
	public String getEmail() {
		return this.email;
	}

	/**
	* 字段名称 :邮箱
	* 数据类型 :varchar(64)
	* 是否必填 :false
	*/
	public void setEmail(String email) {
		 this.email = email;
    }
    
	/**
	* 字段名称 :地区ID
	* 数据类型 :varchar(128)
	* 是否必填 :false
	*/
	public String getAreaId() {
		return this.areaId;
	}

	/**
	* 字段名称 :地区ID
	* 数据类型 :varchar(128)
	* 是否必填 :false
	*/
	public void setAreaId(String areaId) {
		 this.areaId = areaId;
    }
    
	/**
	* 字段名称 :地区路径
	* 数据类型 :varchar(256)
	* 是否必填 :false
	*/
	public String getAreaPath() {
		return this.areaPath;
	}

	/**
	* 字段名称 :地区路径
	* 数据类型 :varchar(256)
	* 是否必填 :false
	*/
	public void setAreaPath(String areaPath) {
		 this.areaPath = areaPath;
    }
    
	/**
	* 字段名称 :详细地址
	* 数据类型 :varchar(128)
	* 是否必填 :false
	*/
	public String getAddress() {
		return this.address;
	}

	/**
	* 字段名称 :详细地址
	* 数据类型 :varchar(128)
	* 是否必填 :false
	*/
	public void setAddress(String address) {
		 this.address = address;
    }
    
	/**
	* 字段名称 :简介
	* 数据类型 :longtext
	* 是否必填 :false
	*/
	public String getIntroduction() {
		return this.introduction;
	}

	/**
	* 字段名称 :简介
	* 数据类型 :longtext
	* 是否必填 :false
	*/
	public void setIntroduction(String introduction) {
		 this.introduction = introduction;
    }
    
	/**
	* 字段名称 :企业图片
	* 数据类型 :varchar(256)
	* 是否必填 :false
	*/
	public String getLogo() {
		return this.logo;
	}

	/**
	* 字段名称 :企业图片
	* 数据类型 :varchar(256)
	* 是否必填 :false
	*/
	public void setLogo(String logo) {
		 this.logo = logo;
    }
    
	/**
	* 字段名称 :组名
	* 数据类型 :varchar(256)
	* 是否必填 :false
	*/
	public String getGroupName() {
		return this.groupName;
	}

	/**
	* 字段名称 :组名
	* 数据类型 :varchar(256)
	* 是否必填 :false
	*/
	public void setGroupName(String groupName) {
		 this.groupName = groupName;
    }
    
}