package net.deepdragon.entity.weipu;

import java.util.*;

import net.deepdragon.util.StringUtil;
import org.apache.ibatis.type.Alias;

//Generated from PowerDesigner file ,Written by 张莹.

/**
 * 表名称：广货街操作员表
 * 表代码：ghj_buyer_operator
*/
@Alias(net.deepdragon.constant.weipu.Weipu.SIGN+"BuyerOperator")
public class BuyerOperator extends BaseEntity {

	private static final long serialVersionUID = 1740022907451965598L;
	
	/**
	*租户ID
	*/
	private String tenantId;
	
	/**
	*采购商ID
	*/
	private String buyerId;
	
	/**
	*用户名
	*/
	private String userName;
	
	/**
	*密码
	*/
	private String passwd;
	
	/**
	*电子邮箱
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
	 *z转为字符串的上传时间
	 */
	private String changeTime;
	
	/**
	*所属角色值
	*/
	//采购员:buyer 财会:payment 收货员:receipt 验货员:inspection
	public enum  RoleValue{
		buyer,/*采购员*/
		payment,/*财会*/
		receipt,/*收货员*/
		inspection/*验货员*/
	}

	/**
	 * 角色功能
	 */
	public enum RoleAuth{
		addCarts,/*加入购物车*/
		addAttention,/*关注*/
		goOrder,/*下订单*/
		cancleOrder,/*取消订单*/
		pay,/*支付*/
		confirmArrival,/*确认到货*/
		confirmInspection,/*确认验货*/
		appeal,/*申诉*/
		review/*评价*/
	}

	/**
	 * 权限定义
	 */
    public static final Map<RoleValue,List<RoleAuth>> authMap;
	static{
			authMap = new HashMap<RoleValue,List<RoleAuth>>();
			/*采购员*/
			List<RoleAuth> buyerAuth = new ArrayList<RoleAuth>();
			buyerAuth.add( RoleAuth.addCarts );
			buyerAuth.add( RoleAuth.addAttention );
			buyerAuth.add( RoleAuth.goOrder );
			buyerAuth.add( RoleAuth.cancleOrder );
			buyerAuth.add( RoleAuth.review );
			authMap.put( RoleValue.buyer, buyerAuth );

			/*财会*/
			List<RoleAuth> paymentAuth = new ArrayList<RoleAuth>();
			paymentAuth.add(RoleAuth.pay );
			authMap.put( RoleValue.payment, paymentAuth );

			/*收货员*/
			List<RoleAuth> receiptAuth = new ArrayList<RoleAuth>();
			receiptAuth.add( RoleAuth.confirmArrival );
			authMap.put( RoleValue.receipt, receiptAuth );

			/*验货员*/
			List<RoleAuth> inspectionAuth = new ArrayList<RoleAuth>();
			inspectionAuth.add( RoleAuth.confirmInspection );
			inspectionAuth.add( RoleAuth.appeal );
			authMap.put( RoleValue.inspection, inspectionAuth );
	}
	/**
	 * 角色英文名称
	 */
	private String roleValue;
	private List<RoleValue> roleValueList;
	/**
	 * 角色中文名称
	 */
	private String roleNameChn;

	/**
	*是否启用
	*/
	private Integer isvalid;
	
	/**
	*是否删除
	*/
	private Integer isDelete;
	
	
	/**
	* 字段名称 :租户ID
	* 数据类型 :bigint(20)
	* 是否必填 :false
	*/
	public String getTenantId() {
		return this.tenantId;
	}

	/**
	* 字段名称 :租户ID
	* 数据类型 :bigint(20)
	* 是否必填 :false
	*/
	public void setTenantId(String tenantId) {
		 this.tenantId = tenantId;
    }
    
	/**
	* 字段名称 :采购商ID
	* 数据类型 :bigint(20)
	* 是否必填 :false
	*/
	public String getBuyerId() {
		return this.buyerId;
	}

	/**
	* 字段名称 :采购商ID
	* 数据类型 :bigint(20)
	* 是否必填 :false
	*/
	public void setBuyerId(String buyerId) {
		 this.buyerId = buyerId;
    }
    
	/**
	* 字段名称 :用户名
	* 数据类型 :VARCHAR(32)
	* 是否必填 :false
	*/
	public String getUserName() {
		return this.userName;
	}

	/**
	* 字段名称 :用户名
	* 数据类型 :VARCHAR(32)
	* 是否必填 :false
	*/
	public void setUserName(String userName) {
		 this.userName = userName;
    }
    
	/**
	* 字段名称 :密码
	* 数据类型 :VARCHAR(64)
	* 是否必填 :false
	*/
	public String getPasswd() {
		return this.passwd;
	}

	/**
	* 字段名称 :密码
	* 数据类型 :VARCHAR(64)
	* 是否必填 :false
	*/
	public void setPasswd(String passwd) {
		 this.passwd = passwd;
    }
    
	/**
	* 字段名称 :电子邮箱
	* 数据类型 :VARCHAR(32)
	* 是否必填 :false
	*/
	public String getEmail() {
		return this.email;
	}

	/**
	* 字段名称 :电子邮箱
	* 数据类型 :VARCHAR(32)
	* 是否必填 :false
	*/
	public void setEmail(String email) {
		 this.email = email;
    }
    
	/**
	* 字段名称 :真实姓名
	* 数据类型 :VARCHAR(50)
	* 是否必填 :false
	*/
	public String getRealName() {
		return this.realName;
	}

	/**
	* 字段名称 :真实姓名
	* 数据类型 :VARCHAR(50)
	* 是否必填 :false
	*/
	public void setRealName(String realName) {
		 this.realName = realName;
    }
    
	/**
	* 字段名称 :手机号码
	* 数据类型 :VARCHAR(16)
	* 是否必填 :false
	*/
	public String getMobile() {
		return this.mobile;
	}

	/**
	* 字段名称 :手机号码
	* 数据类型 :VARCHAR(16)
	* 是否必填 :false
	*/
	public void setMobile(String mobile) {
		 this.mobile = mobile;
    }
    

    
	/**
	* 字段名称 :是否启用
	* 数据类型 : int(11)
	* 是否必填 :false
	*/
	public Integer getIsvalid() {
		return this.isvalid;
	}

	/**
	* 字段名称 :是否启用
	* 数据类型 : int(11)
	* 是否必填 :false
	*/
	public void setIsvalid(Integer isvalid) {
		 this.isvalid = isvalid;
    }
    
	/**
	* 字段名称 :是否删除
	* 数据类型 :int(11)
	* 是否必填 :false
	*/
	public Integer getIsDelete() {
		return this.isDelete;
	}

	/**
	* 字段名称 :是否删除
	* 数据类型 :int(11)
	* 是否必填 :false
	*/
	public void setIsDelete(Integer isDelete) {
		 this.isDelete = isDelete;
    }

	public String getRoleValue() {
		return roleValue;
	}

	public void setRoleValue(String roleValue) {
		if(StringUtil.isNotEmpty(roleValue)){
			String[] arrayRole = roleValue.split(",");
			this.roleValueList = new ArrayList<RoleValue>();
			for(String s : arrayRole){
				this.roleValueList.add(RoleValue.valueOf(s));
			}
		}
		this.roleValue = roleValue;
	}

	public List<RoleValue> getRoleValueList() {
		return roleValueList;
	}

	public void setRoleValueList(List<RoleValue> roleValueList) {
		this.roleValueList = roleValueList;
	}

	public String getRoleNameChn() {
		return roleNameChn;
	}

	public void setRoleNameChn(String roleNameChn) {
		this.roleNameChn = roleNameChn;
	}

	public String getChangeTime() {
		return changeTime;
	}

	public void setChangeTime(String changeTime) {
		this.changeTime = changeTime;
	}
}