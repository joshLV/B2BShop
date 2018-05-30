package net.deepdragon.entity;

import java.util.Date;

import net.deepdragon.constant.Shared;
import org.apache.ibatis.type.Alias;

//Generated from PowerDesigner file ,Written by 张莹.

/**
 * 表名称：用户表
 * 表代码：shared_user
*/
@Alias(Shared.SIGN+"User")
public class User extends BaseEntity {

	private static final long serialVersionUID = 1429602025734004708L;
	
	/**
	*租户ID
	*/
	private String tenantId;
	
	/**
	*登录名称
	*/
	private String userName;
	
	/**
	*登录密码
	*/
	private String passwd;
	
	/**
	*电子信箱
	*/
	private String email;
	
	/**
	*用户昵称
	*/
	private String nickName;
	
	/**
	*用户姓名
	*/
	private String realName;
	
	/**
	*性别
	*/
	private Integer sex;
	
	/**
	*手机号码
	*/
	private String mobile;
	
	/**
	*出生日期
	*/
	private Date birthday;
	
	/**
	*用户状态
	*/
	private Integer status;
	
	/**
	*备注说明
	*/
	private String description;
	
	
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
	* 字段名称 :登录名称
	* 数据类型 :varchar(32)
	* 是否必填 :true
	*/
	public String getUserName() {
		return this.userName;
	}

	/**
	* 字段名称 :登录名称
	* 数据类型 :varchar(32)
	* 是否必填 :true
	*/
	public void setUserName(String userName) {
		 this.userName = userName;
    }
    
	/**
	* 字段名称 :登录密码
	* 数据类型 :varchar(64)
	* 是否必填 :true
	*/
	public String getPasswd() {
		return this.passwd;
	}

	/**
	* 字段名称 :登录密码
	* 数据类型 :varchar(64)
	* 是否必填 :true
	*/
	public void setPasswd(String passwd) {
		 this.passwd = passwd;
    }
    
	/**
	* 字段名称 :电子信箱
	* 数据类型 :varchar(32)
	* 是否必填 :false
	*/
	public String getEmail() {
		return this.email;
	}

	/**
	* 字段名称 :电子信箱
	* 数据类型 :varchar(32)
	* 是否必填 :false
	*/
	public void setEmail(String email) {
		 this.email = email;
    }
    
	/**
	* 字段名称 :用户昵称
	* 数据类型 :varchar(16)
	* 是否必填 :false
	*/
	public String getNickName() {
		return this.nickName;
	}

	/**
	* 字段名称 :用户昵称
	* 数据类型 :varchar(16)
	* 是否必填 :false
	*/
	public void setNickName(String nickName) {
		 this.nickName = nickName;
    }
    
	/**
	* 字段名称 :用户姓名
	* 数据类型 :varchar(16)
	* 是否必填 :false
	*/
	public String getRealName() {
		return this.realName;
	}

	/**
	* 字段名称 :用户姓名
	* 数据类型 :varchar(16)
	* 是否必填 :false
	*/
	public void setRealName(String realName) {
		 this.realName = realName;
    }
    
	/**
	* 字段名称 :性别
	* 数据类型 :int
	* 是否必填 :false
	*/
	public Integer getSex() {
		return this.sex;
	}

	/**
	* 字段名称 :性别
	* 数据类型 :int
	* 是否必填 :false
	*/
	public void setSex(Integer sex) {
		 this.sex = sex;
    }
    
	/**
	* 字段名称 :手机号码
	* 数据类型 :varchar(16)
	* 是否必填 :false
	*/
	public String getMobile() {
		return this.mobile;
	}

	/**
	* 字段名称 :手机号码
	* 数据类型 :varchar(16)
	* 是否必填 :false
	*/
	public void setMobile(String mobile) {
		 this.mobile = mobile;
    }
    
	/**
	* 字段名称 :出生日期
	* 数据类型 :datetime
	* 是否必填 :false
	*/
	public Date getBirthday() {
		return this.birthday;
	}

	/**
	* 字段名称 :出生日期
	* 数据类型 :datetime
	* 是否必填 :false
	*/
	public void setBirthday(Date birthday) {
		 this.birthday = birthday;
    }
    
	/**
	* 字段名称 :用户状态
	* 数据类型 :int
	* 是否必填 :true
	*/
	public Integer getStatus() {
		return this.status;
	}

	/**
	* 字段名称 :用户状态
	* 数据类型 :int
	* 是否必填 :true
	*/
	public void setStatus(Integer status) {
		 this.status = status;
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
    
}