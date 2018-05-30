package com.chinaums.pay.api.impl;

import com.chinaums.pay.api.SecurityService;
import com.chinaums.pay.util.ByteUtils;
import java.math.BigInteger;
import java.security.KeyFactory;
import java.security.PrivateKey;
import java.security.PublicKey;
import java.security.Signature;
import java.security.spec.RSAPrivateKeySpec;
import java.security.spec.RSAPublicKeySpec;

public class DefaultSecurityService implements SecurityService {
	private String signKeyModHex;
	private String signKeyExpHex;
	private String verifyKeyModHex;
	private String verifyKeyExpHex;
	private Signature signature;
	private Signature verifier;

	public String sign(String data) {
		try {
			initSignKey();
			this.signature.update(data.getBytes("UTF-8"));
			byte[] sign = this.signature.sign();
			return ByteUtils.byteArray2HexString(sign);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "";
	}

	public boolean verify(String data, String sign) {
		try {
			initVerifyKey();
			byte[] dataBytes = data.getBytes("UTF-8");
			this.verifier.update(dataBytes);
			return this.verifier.verify(ByteUtils.hexString2ByteArray(sign));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

	private void initSignKey() throws Exception {
		if (this.signature == null) {
			BigInteger mod = new BigInteger(this.signKeyModHex, 16);
			BigInteger exp = new BigInteger(this.signKeyExpHex, 16);
			RSAPrivateKeySpec spec = new RSAPrivateKeySpec(mod, exp);
			KeyFactory keyFactory = KeyFactory.getInstance("RSA");
			PrivateKey signKey = keyFactory.generatePrivate(spec);
			this.signature = Signature.getInstance("SHA1withRSA");
			this.signature.initSign(signKey);
		}
	}

	private void initVerifyKey() throws Exception {
		if (this.verifier == null) {
			RSAPublicKeySpec spec = new RSAPublicKeySpec(new BigInteger(this.verifyKeyModHex, 16), new BigInteger(this.verifyKeyExpHex, 16));
			KeyFactory keyFactory = KeyFactory.getInstance("RSA");
			PublicKey verifyKey = keyFactory.generatePublic(spec);
			this.verifier = Signature.getInstance("SHA1withRSA");
			this.verifier.initVerify(verifyKey);
		}
	}

	public String getSignKeyModHex() {
		return this.signKeyModHex;
	}

	public void setSignKeyModHex(String signKeyMod) {
		this.signKeyModHex = signKeyMod;
	}

	public String getSignKeyExpHex() {
		return this.signKeyExpHex;
	}

	public void setSignKeyExpHex(String signKeyExp) {
		this.signKeyExpHex = signKeyExp;
	}

	public String getVerifyKeyModHex() {
		return this.verifyKeyModHex;
	}

	public void setVerifyKeyModHex(String verifyKeyModHex) {
		this.verifyKeyModHex = verifyKeyModHex;
	}

	public String getVerifyKeyExpHex() {
		return this.verifyKeyExpHex;
	}

	public void setVerifyKeyExpHex(String verifyKeyExpHex) {
		this.verifyKeyExpHex = verifyKeyExpHex;
	}
	
}