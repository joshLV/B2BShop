package com.allinpay.ets.client;

import java.io.Serializable;

public class AccAttribute implements Serializable {
	private static final long serialVersionUID = -6500938030780863877L;
	private String accNo;
	private String amount;
	private String rate;

	public String getAccNo() {
		return this.accNo;
	}
	
	public void setAccNo(String accNo) {
		this.accNo = accNo;
	}

	public String getAmount() {
		return this.amount;
	}

	public void setAmount(String amount) {
		this.amount = amount;
	}

	public String getRate() {
		return this.rate;
	}

	public void setRate(String rate) {
		this.rate = rate;
	}
}