package net.deepdragon.entity.weipu;

import net.deepdragon.constant.weipu.Weipu;
import org.apache.commons.lang3.builder.EqualsBuilder;
import org.apache.commons.lang3.builder.HashCodeBuilder;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import org.apache.ibatis.type.Alias;

import java.io.Serializable;
import java.util.Date;

@Alias(Weipu.SIGN+"BaseEntity")
public class BaseEntity implements Serializable {

	private static final long serialVersionUID = -7923554360430322734L;

	/*系统主键*/
	private String id;
	/*创建人*/
	private String createUser;
	/*创建日期*/
	private Date createDate;
	/*修改人*/
	private String modifyUser;
	/*修改日期*/
	private Date modifyDate;
	
	/**
	* 字段名称 :系统主键
	* 数据类型 :bigint
	* 是否主键 :true
	* 是否必填 :true
	*/
	public String getId() {
		return id;
	}

	/**
	* 字段名称 :系统主键
	* 数据类型 :bigint
	* 是否主键 :true
	* 是否必填 :true
	*/
	public void setId(String id) {
		this.id = id;
	}

	/**
	* 字段名称 :创建人
	* 数据类型 :varchar(32)
	* 是否主键 :false
	* 是否必填 :true
	*/
	public String getCreateUser() {
		return createUser;
	}

	/**
	* 字段名称 :创建人
	* 数据类型 :varchar(32)
	* 是否主键 :false
	* 是否必填 :true
	*/
	public void setCreateUser(String createUser) {
		this.createUser = createUser;
	}

	/**
	* 字段名称 :创建日期
	* 数据类型 :timestamp
	* 是否主键 :false
	* 是否必填 :true
	*/
	public Date getCreateDate() {
		return createDate;
	}

	/**
	* 字段名称 :创建日期
	* 数据类型 :timestamp
	* 是否主键 :false
	* 是否必填 :true
	*/
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	/**
	* 字段名称 :最后一次修改人
	* 数据类型 :varchar(32)
	* 是否主键 :false
	* 是否必填 :true
	*/
	public String getModifyUser() {
		return modifyUser;
	}

	/**
	* 字段名称 :最后一次修改人
	* 数据类型 :varchar(32)
	* 是否主键 :false
	* 是否必填 :true
	*/
	public void setModifyUser(String modifyUser) {
		this.modifyUser = modifyUser;
	}

	/**
	* 字段名称 :最后一次修改日期
	* 数据类型 :datetime
	* 是否主键 :false
	* 是否必填 :true
	*/
	public Date getModifyDate() {
		return modifyDate;
	}

	/**
	* 字段名称 :最后一次修改日期
	* 数据类型 :datetime
	* 是否主键 :false
	* 是否必填 :true
	*/
	public void setModifyDate(Date modifyDate) {
		this.modifyDate = modifyDate;
	}
		
	public boolean equals(Object obj) {
        return EqualsBuilder.reflectionEquals(
                this, obj);
    }

    public int hashCode() {
        return HashCodeBuilder
                .reflectionHashCode(this);
    }

    public String toString() {
        return ToStringBuilder.reflectionToString(
                this, ToStringStyle.MULTI_LINE_STYLE);
    }
}