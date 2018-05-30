package com.chinaums.pay.api;

public class PayException extends Exception {

	private static final long serialVersionUID = -5314788783462277539L;
	
	private String code;

	public PayException(String code, String reason) {
		super(reason);
		this.code = code;
	}

	public PayException(String code, String reason, Throwable t) {
		super(reason, t);
		this.code = code;
	}

	public String getCode() {
		return this.code;
	}
	
}