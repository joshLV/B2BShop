package com.chinaums.pay.api;

public abstract interface SecurityService {
	
	public abstract String sign(String paramString);

	public abstract boolean verify(String paramString1, String paramString2);
	
}