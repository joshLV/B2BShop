package net.deepdragon.entity.open;

import net.deepdragon.constant.weipu.Open;
import net.deepdragon.entity.weipu.BaseEntity;
import org.apache.ibatis.type.Alias;

/**
 * 表名称：开放平台模块 表代码：wop_module
 */
@Alias(Open.SIGN + "Wallet")
public class Wallet extends BaseEntity {

	private static final long serialVersionUID = 1656631825138935495L;

	/**
	 * 多租户
	 */
	private String tenantId;

	/**
	 * 会员名称
	 */
	private String memberName;

	/**
	 * 总金额
	 */
	private Double totalAmount;

	/**
	 * 冻结金额
	 */
	private Double freeze;

	/**
	 * 剩余金额
	 */
	private Double availableBalance;

	public static long getSerialVersionUID() {
		return serialVersionUID;
	}

	public String getTenantId() {
		return tenantId;
	}

	public void setTenantId(String tenantId) {
		this.tenantId = tenantId;
	}

	public String getMemberName() {
		return memberName;
	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}

	public Double getTotalAmount() {
		return totalAmount;
	}

	public void setTotalAmount(Double totalAmount) {
		this.totalAmount = totalAmount;
	}

	public Double getFreeze() {
		return freeze;
	}

	public void setFreeze(Double freeze) {
		this.freeze = freeze;
	}

	public Double getAvailableBalance() {
		return availableBalance;
	}

	public void setAvailableBalance(Double availableBalance) {
		this.availableBalance = availableBalance;
	}
}
