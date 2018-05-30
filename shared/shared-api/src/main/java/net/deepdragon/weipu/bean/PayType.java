package net.deepdragon.weipu.bean;

import java.io.Serializable;

/**
 * 支付类型
 * 
 * @author zgt
 * 
 */
public class PayType implements Serializable {

	private static final long serialVersionUID = 3032486713812438330L;

	private String lyt;
	private String chinapay;
	private String pospay;
	private String refund;

	public String getLyt() {
		return lyt;
	}

	public void setLyt(String lyt) {
		this.lyt = lyt;
	}

	public String getChinapay() {
		return chinapay;
	}

	public void setChinapay(String chinapay) {
		this.chinapay = chinapay;
	}

	public String getPospay() {
		return pospay;
	}

	public void setPospay(String pospay) {
		this.pospay = pospay;
	}

	public String getRefund() {
		return refund;
	}

	public void setRefund(String refund) {
		this.refund = refund;
	}

}
