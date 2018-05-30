package net.deepdragon.entity.weipu;

import net.deepdragon.constant.weipu.Weipu;
import org.apache.ibatis.type.Alias;

import java.util.Date;

//Generated from PowerDesigner file ,Written by 张莹.

/**
 * 表名称：配送员信息
 * 表代码：wp_delivery_man
*/
@Alias(Weipu.SIGN+"DeliveryMan")
public class DeliveryMan extends BaseEntity {

	private static final long serialVersionUID = 1854401138734806622L;
	
	/**
	*租户ID
	*/
	private String tenantId;
	
	/**
	*姓名
	*/
	private String name;
	
	/**
	*昵称
	*/
	private String nickName;
	
	/**
	*性别
	*/
	private Integer sex;
	
	/**
	*手机号码
	*/
	private String mobile;
	
	/**
	*联系电话
	*/
	private String phone;
	
	/**
	*出生日期
	*/
	private Date birthday;
	
	/**
	*状态
	*/
	private Integer status;
	
	/**
	 * 用户名
	 */
	private String userName;
	/**
	 * 密码
	 */
	private String passwd;
	/**
	 * 设备ID
	 */
	private String deviceId;
	
	
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
	* 字段名称 :姓名
	* 数据类型 :varchar(32)
	* 是否必填 :true
	*/
	public String getName() {
		return this.name;
	}

	/**
	* 字段名称 :姓名
	* 数据类型 :varchar(32)
	* 是否必填 :true
	*/
	public void setName(String name) {
		 this.name = name;
    }
    
	/**
	* 字段名称 :昵称
	* 数据类型 :varchar(16)
	* 是否必填 :false
	*/
	public String getNickName() {
		return this.nickName;
	}

	/**
	* 字段名称 :昵称
	* 数据类型 :varchar(16)
	* 是否必填 :false
	*/
	public void setNickName(String nickName) {
		 this.nickName = nickName;
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
	* 字段名称 :联系电话
	* 数据类型 :varchar(16)
	* 是否必填 :false
	*/
	public String getPhone() {
		return this.phone;
	}

	/**
	* 字段名称 :联系电话
	* 数据类型 :varchar(16)
	* 是否必填 :false
	*/
	public void setPhone(String phone) {
		 this.phone = phone;
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

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getPasswd() {
		return passwd;
	}

	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}

	public String getDeviceId() {
		return deviceId;
	}

	public void setDeviceId(String deviceId) {
		this.deviceId = deviceId;
	}
	
}