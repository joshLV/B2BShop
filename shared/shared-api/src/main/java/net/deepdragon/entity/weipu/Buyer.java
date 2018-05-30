package net.deepdragon.entity.weipu;

import java.util.Date;
import org.apache.ibatis.type.Alias;

//Generated from PowerDesigner file ,Written by 张莹.

/**
 * 表名称：采购商
 * 表代码：b2b_buyer
*/
@Alias(net.deepdragon.constant.weipu.Weipu.SIGN+"Buyer")
public class Buyer extends BaseEntity {

	private static final long serialVersionUID = 1861069741584972248L;
	
	/**
	*租户ID
	*/
	private String tenantId;
	
	/**
	*采购等级
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
	*真实姓名
	*/
	private String realName;
	
	/**
	*手机号码
	*/
	private String mobile;
	
	/**
	*公司名称
	*/
	private String companyName;
	
	/**
	*联系地址-地区Id
	*/
	private String areaId;
	
	/**
	*联系地址-地区Path
	*/
	private String areaPath;
	
	/**
	*联系地址-详细地址
	*/
	private String address;
	
	/**
	*联系人
	*/
	private String linkMan;
	
	/**
	*联系人电话
	*/
	private String likeManMobile;
	
	/**
	*联系人邮箱
	*/
	private String linkManEmail;
	
	/**
	*状态
	*/
	private Integer status;
	
	/**
	*当前积分
	*/
	private Integer scoreTotal;
	
	/**
	*累计积分
	*/
	private Integer vipScoreTotal;
	
	/**
	*采购商类型
	*/
	private Integer buyerType;
	
	/**
	*删除标识
	*/
	private Integer isDelete;

	/**
	 *邀请码自己
	 */
	private String sign;

	/**
	 *邀请码
	 */
	private String invitationCode;
	/**
	 * openId用于微信授权登录
	 * */
	private String openId;

	public String getOpenId() {
		return openId;
	}

	public void setOpenId(String openId) {
		this.openId = openId;
	}

	/**
	* 字段名称 :租户ID
	* 数据类型 :bigint
	* 是否必填 :false
	*/
	public String getTenantId() {
		return this.tenantId;
	}

	/**
	* 字段名称 :租户ID
	* 数据类型 :bigint
	* 是否必填 :false
	*/
	public void setTenantId(String tenantId) {
		 this.tenantId = tenantId;
    }
    
	/**
	* 字段名称 :采购等级
	* 数据类型 :bigint
	* 是否必填 :false
	*/
	public String getRankId() {
		return this.rankId;
	}

	/**
	* 字段名称 :采购等级
	* 数据类型 :bigint
	* 是否必填 :false
	*/
	public void setRankId(String rankId) {
		 this.rankId = rankId;
    }
    
	/**
	* 字段名称 :用户名
	* 数据类型 :varchar(32)
	* 是否必填 :false
	*/
	public String getUserName() {
		return this.userName;
	}

	/**
	* 字段名称 :用户名
	* 数据类型 :varchar(32)
	* 是否必填 :false
	*/
	public void setUserName(String userName) {
		 this.userName = userName;
    }
    
	/**
	* 字段名称 :登录密码
	* 数据类型 :varchar(64)
	* 是否必填 :false
	*/
	public String getPasswd() {
		return this.passwd;
	}

	/**
	* 字段名称 :登录密码
	* 数据类型 :varchar(64)
	* 是否必填 :false
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
	* 字段名称 :真实姓名
	* 数据类型 :varchar(50)
	* 是否必填 :false
	*/
	public String getRealName() {
		return this.realName;
	}

	/**
	* 字段名称 :真实姓名
	* 数据类型 :varchar(50)
	* 是否必填 :false
	*/
	public void setRealName(String realName) {
		 this.realName = realName;
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
	* 字段名称 :公司名称
	* 数据类型 :varchar(100)
	* 是否必填 :false
	*/
	public String getCompanyName() {
		return this.companyName;
	}

	/**
	* 字段名称 :公司名称
	* 数据类型 :varchar(100)
	* 是否必填 :false
	*/
	public void setCompanyName(String companyName) {
		 this.companyName = companyName;
    }
    
	/**
	* 字段名称 :联系地址-地区Id
	* 数据类型 :varchar(128)
	* 是否必填 :false
	*/
	public String getAreaId() {
		return this.areaId;
	}

	/**
	* 字段名称 :联系地址-地区Id
	* 数据类型 :varchar(128)
	* 是否必填 :false
	*/
	public void setAreaId(String areaId) {
		 this.areaId = areaId;
    }
    
	/**
	* 字段名称 :联系地址-地区Path
	* 数据类型 :varchar(256)
	* 是否必填 :false
	*/
	public String getAreaPath() {
		return this.areaPath;
	}

	/**
	* 字段名称 :联系地址-地区Path
	* 数据类型 :varchar(256)
	* 是否必填 :false
	*/
	public void setAreaPath(String areaPath) {
		 this.areaPath = areaPath;
    }
    
	/**
	* 字段名称 :联系地址-详细地址
	* 数据类型 :varchar(256)
	* 是否必填 :false
	*/
	public String getAddress() {
		return this.address;
	}

	/**
	* 字段名称 :联系地址-详细地址
	* 数据类型 :varchar(256)
	* 是否必填 :false
	*/
	public void setAddress(String address) {
		 this.address = address;
    }
    
	/**
	* 字段名称 :联系人
	* 数据类型 :varchar(50)
	* 是否必填 :false
	*/
	public String getLinkMan() {
		return this.linkMan;
	}

	/**
	* 字段名称 :联系人
	* 数据类型 :varchar(50)
	* 是否必填 :false
	*/
	public void setLinkMan(String linkMan) {
		 this.linkMan = linkMan;
    }
    
	/**
	* 字段名称 :联系人电话
	* 数据类型 :varchar(16)
	* 是否必填 :false
	*/
	public String getLikeManMobile() {
		return this.likeManMobile;
	}

	/**
	* 字段名称 :联系人电话
	* 数据类型 :varchar(16)
	* 是否必填 :false
	*/
	public void setLikeManMobile(String likeManMobile) {
		 this.likeManMobile = likeManMobile;
    }
    
	/**
	* 字段名称 :联系人邮箱
	* 数据类型 :varchar(32)
	* 是否必填 :false
	*/
	public String getLinkManEmail() {
		return this.linkManEmail;
	}

	/**
	* 字段名称 :联系人邮箱
	* 数据类型 :varchar(32)
	* 是否必填 :false
	*/
	public void setLinkManEmail(String linkManEmail) {
		 this.linkManEmail = linkManEmail;
    }
    
	/**
	* 字段名称 :状态
	* 数据类型 :tinyint(1)
	* 是否必填 :false
	*/
	public Integer getStatus() {
		return this.status;
	}

	/**
	* 字段名称 :状态
	* 数据类型 :tinyint(1)
	* 是否必填 :false
	*/
	public void setStatus(Integer status) {
		 this.status = status;
    }
    
	/**
	* 字段名称 :当前积分
	* 数据类型 :int(10)
	* 是否必填 :false
	*/
	public Integer getScoreTotal() {
		return this.scoreTotal;
	}

	/**
	* 字段名称 :当前积分
	* 数据类型 :int(10)
	* 是否必填 :false
	*/
	public void setScoreTotal(Integer scoreTotal) {
		 this.scoreTotal = scoreTotal;
    }
    
	/**
	* 字段名称 :累计积分
	* 数据类型 :int(11)
	* 是否必填 :false
	*/
	public Integer getVipScoreTotal() {
		return this.vipScoreTotal;
	}

	/**
	* 字段名称 :累计积分
	* 数据类型 :int(11)
	* 是否必填 :false
	*/
	public void setVipScoreTotal(Integer vipScoreTotal) {
		 this.vipScoreTotal = vipScoreTotal;
    }
    
	/**
	* 字段名称 :采购商类型
	* 数据类型 :int
	* 是否必填 :false
	*/
	public Integer getBuyerType() {
		return this.buyerType;
	}

	/**
	* 字段名称 :采购商类型
	* 数据类型 :int
	* 是否必填 :false
	*/
	public void setBuyerType(Integer buyerType) {
		 this.buyerType = buyerType;
    }
    
	/**
	* 字段名称 :删除标识
	* 数据类型 :int(11)
	* 是否必填 :false
	*/
	public Integer getIsDelete() {
		return this.isDelete;
	}

	/**
	* 字段名称 :删除标识
	* 数据类型 :int(11)
	* 是否必填 :false
	*/
	public void setIsDelete(Integer isDelete) {
		 this.isDelete = isDelete;
    }

	/**
	 * 字段名称 :邀请码自己
	 * 数据类型 :varchar(12)
	 * 是否必填 :false
	 */
	public String getSign() {
		return this.sign;
	}

	/**
	 * 字段名称 :邀请码自己
	 * 数据类型 :varchar(12)
	 * 是否必填 :false
	 */
	public void setSign(String sign) {
		this.sign = sign;
	}

	/**
	 * 字段名称 :邀请码
	 * 数据类型 :varchar(12)
	 * 是否必填 :false
	 */
	public String getInvitationCode() {
		return this.invitationCode;
	}

	/**
	 * 字段名称 :邀请码
	 * 数据类型 :varchar(12)
	 * 是否必填 :false
	 */
	public void setInvitationCode(String invitationCode) {
		this.invitationCode = invitationCode;
	}
    
}