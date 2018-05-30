package net.deepdragon.entity.weipu;

import net.deepdragon.constant.weipu.Weipu;
import org.apache.ibatis.type.Alias;

import java.util.Date;

//Generated from PowerDesigner file ,Written by 张莹.

/**
 * 表名称：会员信息
 * 表代码：wp_member
*/
@Alias(Weipu.SIGN+"Member")
public class Member extends BaseEntity {

	private static final long serialVersionUID = 1485031503680881128L;
	
	/**
	*租户ID
	*/
	private String tenantId;
	
	/**
	*会员等级
	*/
	private String rankId;
	
	/**
	*用户名
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
	*会员昵称
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
	*出生日期
	*/
	private Date birthday;
	
	/**
	*会员状态
	*/
	private Integer status;
    /**
     *会员等级名称
     */
    private String rankName;
	/**
	 * 会员累计积分
	 * */
	private String vipScoreTotal;
	/**
	 * 会员当前积分
	 * */
	private String scoreTotal;
	/**
	 * 会员身份证号
	 * */
	private String iDCode;
	/**
	 * ERP会员主键
	 * */
	private String ERPVipCode;
	/**
	 *是否已同步到ERP(0-无,1-已同步)
	 */
	private Integer isSynch;
	/**
	 * openId用于微信授权登录
	 * */
	private String openId;
	/**
	 * 字段名称 :会员状态
	 * 数据类型 :int
	 * 是否必填 :true
	 */
	public Integer getIsSynch() {
		return this.isSynch;
	}

	/**
	 * 字段名称 :会员状态
	 * 数据类型 :int
	 * 是否必填 :true
	 */
	public void setIsSynch(Integer isSynch) {
		this.isSynch = isSynch;
	}

	/**
	 * 字段名称 :ERP会员主键
	 * 数据类型 :varchar(32)
	 * 是否必填 :true
	 */
	public String getERPVipCode() {
		return this.ERPVipCode;
	}

	/**
	 * 字段名称 :ERP会员主键
	 * 数据类型 :varchar(32)
	 * 是否必填 :true
	 */
	public void setERPVipCode(String ERPVipCode) {
		this.ERPVipCode = ERPVipCode;
	}

	/**
	 * 字段名称 :会员身份证号
	 * 数据类型 :varchar(32)
	 * 是否必填 :true
	 */
	public String getIDCode() {
		return this.iDCode;
	}

	/**
	 * 字段名称 :会员身份证号
	 * 数据类型 :varchar(32)
	 * 是否必填 :true
	 */
	public void setIDCode(String iDCode) {
		this.iDCode = iDCode;
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
	* 字段名称 :会员等级
	* 数据类型 :bigint
	* 是否必填 :true
	*/
	public String getRankId() {
		return this.rankId;
	}

	/**
	* 字段名称 :会员等级
	* 数据类型 :bigint
	* 是否必填 :true
	*/
	public void setRankId(String rankId) {
		 this.rankId = rankId;
    }
    
	/**
	* 字段名称 :用户名
	* 数据类型 :varchar(32)
	* 是否必填 :true
	*/
	public String getUserName() {
		return this.userName;
	}

	/**
	* 字段名称 :用户名
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
	* 字段名称 :会员昵称
	* 数据类型 :varchar(16)
	* 是否必填 :false
	*/
	public String getNickName() {
		return this.nickName;
	}

	/**
	* 字段名称 :会员昵称
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
	* 字段名称 :会员状态
	* 数据类型 :int
	* 是否必填 :true
	*/
	public Integer getStatus() {
		return this.status;
	}

	/**
	* 字段名称 :会员状态
	* 数据类型 :int
	* 是否必填 :true
	*/
	public void setStatus(Integer status) {
		 this.status = status;
    }
    /**
     * 字段名称 :会员等级名称
     * 数据类型 :String
     *
     */
    public String getRankName() {
        return rankName;
    }
    /**
     * 字段名称 :会员等级名称
     * 数据类型 :String
     *
     */
    public void setRankName(String rankName) {
        this.rankName = rankName;
    }

	public String getVipScoreTotal() {
		return vipScoreTotal;
	}

	public void setVipScoreTotal(String vipScoreTotal) {
		this.vipScoreTotal = vipScoreTotal;
	}

	public String getScoreTotal() {
		return scoreTotal;
	}

	public void setScoreTotal(String scoreTotal) {
		this.scoreTotal = scoreTotal;
	}

	public String getOpenId() {
		return openId;
	}

	public void setOpenId(String openId) {
		this.openId = openId;
	}
}