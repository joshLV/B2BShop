package net.deepdragon.entity.weipu;

import net.deepdragon.constant.weipu.Weipu;
import org.apache.ibatis.type.Alias;

import java.util.Date;

//Generated from PowerDesigner file ,Written by 张莹.

/**
 * 表名称：店铺操作员 表代码：wp_merchant_user
 */
@Alias(Weipu.SIGN + "MerchantUser")
public class MerchantUser extends BaseEntity {

	private static final long serialVersionUID = 1829767244007909371L;

	// 内置角色:管理员，普通员工
	public enum Roles {
		Admin("Admin", "系统管理员"), Order("Order", "订单管理员"), Common("Common", "普通员工");

		private String sign;
		private String name;

		private Roles(String sign, String name) {
			this.sign = sign;
			this.name = name;
		}

		public String getSign() {
			return sign;
		}

		public String getName() {
			return name;
		}
		
	}

	/**
	 * 租户ID
	 */
	private String tenantId;

	/**
	 * 店铺ID
	 */
	private String merchantId;
    /**
     * 店铺NAME
     */
    private String merchantName;

	/**
	 * 用户名
	 */
	private String userName;

	/**
	 * 登录密码
	 */
	private String passwd;

	/**
	 * 电子信箱
	 */
	private String email;

	/**
	 * 会员昵称
	 */
	private String nickName;

	/**
	 * 性别
	 */
	private Integer sex;

	/**
	 * 手机号码
	 */
	private String mobile;

	/**
	 * 出生日期
	 */
	private Date birthday;

	/**
	 * 用户状态
	 */
	private Integer status;

	/**
	 * 用户角色
	 */
	private String roles;

	/**
	 * 字段名称 :租户ID 数据类型 :bigint 是否必填 :true
	 */
	public String getTenantId() {
		return this.tenantId;
	}

	/**
	 * 字段名称 :租户ID 数据类型 :bigint 是否必填 :true
	 */
	public void setTenantId(String tenantId) {
		this.tenantId = tenantId;
	}

	/**
	 * 字段名称 :店铺ID 数据类型 :bigint 是否必填 :true
	 */
	public String getMerchantId() {
		return this.merchantId;
	}

	/**
	 * 字段名称 :店铺ID 数据类型 :bigint 是否必填 :true
	 */
	public void setMerchantId(String merchantId) {
		this.merchantId = merchantId;
	}

	/**
	 * 字段名称 :用户名 数据类型 :varchar(32) 是否必填 :true
	 */
	public String getUserName() {
		return this.userName;
	}

	/**
	 * 字段名称 :用户名 数据类型 :varchar(32) 是否必填 :true
	 */
	public void setUserName(String userName) {
		this.userName = userName;
	}

	/**
	 * 字段名称 :登录密码 数据类型 :varchar(64) 是否必填 :true
	 */
	public String getPasswd() {
		return this.passwd;
	}

	/**
	 * 字段名称 :登录密码 数据类型 :varchar(64) 是否必填 :true
	 */
	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}

	/**
	 * 字段名称 :电子信箱 数据类型 :varchar(32) 是否必填 :false
	 */
	public String getEmail() {
		return this.email;
	}

	/**
	 * 字段名称 :电子信箱 数据类型 :varchar(32) 是否必填 :false
	 */
	public void setEmail(String email) {
		this.email = email;
	}

	/**
	 * 字段名称 :会员昵称 数据类型 :varchar(16) 是否必填 :false
	 */
	public String getNickName() {
		return this.nickName;
	}

	/**
	 * 字段名称 :会员昵称 数据类型 :varchar(16) 是否必填 :false
	 */
	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	/**
	 * 字段名称 :性别 数据类型 :int 是否必填 :false
	 */
	public Integer getSex() {
		return this.sex;
	}

	/**
	 * 字段名称 :性别 数据类型 :int 是否必填 :false
	 */
	public void setSex(Integer sex) {
		this.sex = sex;
	}

	/**
	 * 字段名称 :手机号码 数据类型 :varchar(16) 是否必填 :false
	 */
	public String getMobile() {
		return this.mobile;
	}

	/**
	 * 字段名称 :手机号码 数据类型 :varchar(16) 是否必填 :false
	 */
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	/**
	 * 字段名称 :出生日期 数据类型 :datetime 是否必填 :false
	 */
	public Date getBirthday() {
		return this.birthday;
	}

	/**
	 * 字段名称 :出生日期 数据类型 :datetime 是否必填 :false
	 */
	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}

	/**
	 * 字段名称 :用户状态 数据类型 :int 是否必填 :true
	 */
	public Integer getStatus() {
		return this.status;
	}

	/**
	 * 字段名称 :用户状态 数据类型 :int 是否必填 :true
	 */
	public void setStatus(Integer status) {
		this.status = status;
	}

	/**
	 * 字段名称 :用户角色 数据类型 :varchar(128) 是否必填 :false
	 */
	public String getRoles() {
		return this.roles;
	}

	/**
	 * 字段名称 :用户角色 数据类型 :varchar(128) 是否必填 :false
	 */
	public void setRoles(String roles) {
		this.roles = roles;
	}

    public String getMerchantName() {
        return merchantName;
    }

    public void setMerchantName(String merchantName) {
        this.merchantName = merchantName;
    }
}