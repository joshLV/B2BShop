package net.deepdragon.entity.weipu;

import org.apache.ibatis.type.Alias;

import java.util.Date;

//Generated from PowerDesigner file ,Written by 张莹.

/**
 * 表名称：b2b_order_offlinepay_voucher
 * 表代码：b2b_order_offlinepay_voucher
*/
@Alias(net.deepdragon.constant.weipu.Weipu.SIGN+"OrderOfflinepayVoucher")
public class OrderOfflinepayVoucher extends BaseEntity {

	private static final long serialVersionUID = 1126769819839417578L;

	public enum VoucherType{
		/*凭证类型：定金_deposit ， 订单支付_order*/
		deposit,order
	}

	/**
	*租户ID
	*/
	private String tenantId;
	
	/**
	*订单号
	*/
	private String orderSn;

	private VoucherType voucherType;
	/**
	*支付凭证1
	*/
	private String voucherPic1;
	
	/**
	*支付凭证2
	*/
	private String voucherPic2;
	
	/**
	*支付凭证3
	*/
	private String voucherPic3;
	
	/**
	*支付流水号
	*/
	private String paySerial;
	
	/**
	*支付账号所属银行
	*/
	private String bank;
	
	/**
	*支付账号
	*/
	private String payAccount;
	
	/**
	*支付金额
	*/
	private Double payAmount;
	
	/**
	*支付时间
	*/
	private Date payTime;
	
	
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
	* 字段名称 :订单号
	* 数据类型 :varchar(32)
	* 是否必填 :false
	*/
	public String getOrderSn() {
		return this.orderSn;
	}

	/**
	* 字段名称 :订单号
	* 数据类型 :varchar(32)
	* 是否必填 :false
	*/
	public void setOrderSn(String orderSn) {
		 this.orderSn = orderSn;
    }
    
	/**
	* 字段名称 :支付凭证1
	* 数据类型 :varchar(500)
	* 是否必填 :false
	*/
	public String getVoucherPic1() {
		return this.voucherPic1;
	}

	/**
	* 字段名称 :支付凭证1
	* 数据类型 :varchar(500)
	* 是否必填 :false
	*/
	public void setVoucherPic1(String voucherPic1) {
		 this.voucherPic1 = voucherPic1;
    }
    
	/**
	* 字段名称 :支付凭证2
	* 数据类型 :varchar(500)
	* 是否必填 :false
	*/
	public String getVoucherPic2() {
		return this.voucherPic2;
	}

	/**
	* 字段名称 :支付凭证2
	* 数据类型 :varchar(500)
	* 是否必填 :false
	*/
	public void setVoucherPic2(String voucherPic2) {
		 this.voucherPic2 = voucherPic2;
    }
    
	/**
	* 字段名称 :支付凭证3
	* 数据类型 :varchar(500)
	* 是否必填 :false
	*/
	public String getVoucherPic3() {
		return this.voucherPic3;
	}

	/**
	* 字段名称 :支付凭证3
	* 数据类型 :varchar(500)
	* 是否必填 :false
	*/
	public void setVoucherPic3(String voucherPic3) {
		 this.voucherPic3 = voucherPic3;
    }
    
	/**
	* 字段名称 :支付流水号
	* 数据类型 :varchar(64)
	* 是否必填 :false
	*/
	public String getPaySerial() {
		return this.paySerial;
	}

	/**
	* 字段名称 :支付流水号
	* 数据类型 :varchar(64)
	* 是否必填 :false
	*/
	public void setPaySerial(String paySerial) {
		 this.paySerial = paySerial;
    }
    
	/**
	* 字段名称 :支付账号所属银行
	* 数据类型 :varchar(200)
	* 是否必填 :false
	*/
	public String getBank() {
		return this.bank;
	}

	/**
	* 字段名称 :支付账号所属银行
	* 数据类型 :varchar(200)
	* 是否必填 :false
	*/
	public void setBank(String bank) {
		 this.bank = bank;
    }
    
	/**
	* 字段名称 :支付账号
	* 数据类型 :varchar(30)
	* 是否必填 :false
	*/
	public String getPayAccount() {
		return this.payAccount;
	}

	/**
	* 字段名称 :支付账号
	* 数据类型 :varchar(30)
	* 是否必填 :false
	*/
	public void setPayAccount(String payAccount) {
		 this.payAccount = payAccount;
    }
    
	/**
	* 字段名称 :支付金额
	* 数据类型 :decimal(24,4)
	* 是否必填 :false
	*/
	public Double getPayAmount() {
		return this.payAmount;
	}

	/**
	* 字段名称 :支付金额
	* 数据类型 :decimal(24,4)
	* 是否必填 :false
	*/
	public void setPayAmount(Double payAmount) {
		 this.payAmount = payAmount;
    }
    
	/**
	* 字段名称 :支付时间
	* 数据类型 :datetime
	* 是否必填 :false
	*/
	public Date getPayTime() {
		return this.payTime;
	}

	/**
	* 字段名称 :支付时间
	* 数据类型 :datetime
	* 是否必填 :false
	*/
	public void setPayTime(Date payTime) {
		 this.payTime = payTime;
    }

	public VoucherType getVoucherType() {
		return voucherType;
	}

	public void setVoucherType(VoucherType voucherType) {
		this.voucherType = voucherType;
	}
}