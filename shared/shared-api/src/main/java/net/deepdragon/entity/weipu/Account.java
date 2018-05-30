package net.deepdragon.entity.weipu;

import com.alibaba.fastjson.JSON;
import net.deepdragon.entity.SystemSet;
import org.apache.ibatis.type.Alias;

import java.util.HashMap;
import java.util.Map;


/**
 * 表名称：用户账户
 * 表代码：wp_account
*/
@Alias(net.deepdragon.constant.weipu.Weipu.SIGN+"Account")
public class Account extends BaseEntity {

	private static final long serialVersionUID = 1861069741584972248L;
	
	/**
	*租户ID
	*/
	private String tenantId;
	
	/**
	*用户ID
	*/
	private String userId;
	
	/**
	*用户名
	*/
	private String userName;
	
	/**
	*账户金额
	* 更新时 只需要传入 变更的数字  增加传正值， 减少传负值
	*/
	private Double accountTotal;

	/**
	*冻结资金
	* 更新时 只需要传入 变更的数字  增加传正值， 减少传负值
	*/
	private Double accountBlock;

	/**
	 *可用资金
	 */
	private Double amountAvailable;

	/**
	 *本次使用资金
	 */
	private Double thisUsedAmount;

	/**
	*所属平台((1.B2B、2.B2C))
	*/
	private Integer platform;

	public Account() {
	}

//	public Account(String id,Double amountAvailable, Double thisUsedAmount) {
//		setId( id );
//		this.amountAvailable = amountAvailable;
//		this.thisUsedAmount = thisUsedAmount;
//	}

	public String getTenantId() {
		return tenantId;
	}

	public void setTenantId(String tenantId) {
		this.tenantId = tenantId;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public Double getAccountTotal() {
		return accountTotal;
	}

	public void setAccountTotal(Double accountTotal) {
		if( accountTotal != null && this.accountBlock != null ){
			setAmountAvailable( accountTotal - this.accountBlock );
		}
		this.accountTotal = accountTotal;
	}

	public Double getAccountBlock() {
		return accountBlock;
	}

	public void setAccountBlock(Double accountBlock) {
		if( this.accountTotal != null && accountBlock != null ){
			setAmountAvailable( this.accountTotal - accountBlock );
		}

		this.accountBlock = accountBlock;
	}

	public Integer getPlatform() {
		return platform;
	}

	public void setPlatform(Integer platform) {
		this.platform = platform;
	}

	public Double getAmountAvailable() {
		return amountAvailable;
	}

	public void setAmountAvailable(Double amountAvailable) {
		this.amountAvailable = amountAvailable;
	}

	public Double getThisUsedAmount() {
		return thisUsedAmount;
	}

	public void setThisUsedAmount(Double thisUsedAmount) {
		this.thisUsedAmount = thisUsedAmount;
	}
}