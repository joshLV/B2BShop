package com.allinpay.ets.client.util;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.InputStream;
import java.io.PrintStream;
import java.security.KeyStore;
import java.security.PrivateKey;
import java.security.PublicKey;
import java.security.Security;
import java.security.Signature;
import java.security.cert.CertificateException;
import java.security.cert.CertificateFactory;
import java.security.cert.X509Certificate;
import java.util.Enumeration;
import javax.crypto.Cipher;
import org.bouncycastle.jce.provider.BouncyCastleProvider;

public class Rsa {
	public static PublicKey loadPublicKey(String publicKeyCer) throws FileNotFoundException, CertificateException {
		InputStream inStream = new FileInputStream(publicKeyCer);
		CertificateFactory cf = CertificateFactory.getInstance("X.509");
		X509Certificate cert = (X509Certificate) cf.generateCertificate(inStream);
		PublicKey publicKey = cert.getPublicKey();
		return publicKey;
	}

	public static PrivateKey loadPrivateKey(String privateKeyPfx, String password) throws Exception {
		KeyStore keyStore = KeyStore.getInstance("PKCS12", "BC");

		char[] nPassword = (char[]) null;
		if ((password == null) || (password.trim().equals("")))
			nPassword = (char[]) null;
		else {
			nPassword = password.toCharArray();
		}

		keyStore.load(new FileInputStream(privateKeyPfx), nPassword);
		String aliaesName = "";
		Enumeration enumer = keyStore.aliases();
		while (enumer.hasMoreElements()) {
			aliaesName = (String) enumer.nextElement();
			if (keyStore.isKeyEntry(aliaesName)) {
				return (PrivateKey) (PrivateKey) keyStore.getKey(aliaesName, nPassword);
			}
		}
		throw new Exception("没有找到匹配私钥:" + privateKeyPfx);
	}

	public static byte[] encrypt(byte[] input, PublicKey publicKey) throws Exception {
		Cipher cipher = null;
		cipher = Cipher.getInstance("RSA");
		cipher.init(1, publicKey);
		return cipher.doFinal(input);
	}

	public static byte[] decrypt(byte[] input, PrivateKey privateKey) throws Exception {
		Cipher cipher = null;
		cipher = Cipher.getInstance("RSA");
		cipher.init(2, privateKey);
		return cipher.doFinal(input);
	}

	public static byte[] signSha1WithRsa(byte[] plainText, PrivateKey privateKey) throws Exception {
		return sign(plainText, SignatureMethod.SHA1WithRSA.getMethod(), privateKey);
	}

	public static boolean verfySha1WithRsa(byte[] signature, byte[] plainText, PublicKey publicKey) throws Exception {
		return verfy(signature, plainText, SignatureMethod.SHA1WithRSA.getMethod(), publicKey);
	}

	public static byte[] signMd5WithRsa(byte[] plainText, PrivateKey privateKey) throws Exception {
		return sign(plainText, SignatureMethod.MD5WithRSA.getMethod(), privateKey);
	}

	public static boolean verfyMd5WithRsa(byte[] signature, byte[] plainText, PublicKey publicKey) throws Exception {
		return verfy(signature, plainText, SignatureMethod.MD5WithRSA.getMethod(), publicKey);
	}

	public static byte[] sign(byte[] plainText, String signatureMethod, PrivateKey privateKey) throws Exception {
		Signature sig = Signature.getInstance(signatureMethod);
		sig.initSign(privateKey);
		sig.update(plainText);
		return sig.sign();
	}

	public static boolean verfy(byte[] signature, byte[] plainText, String signatureMethod, PublicKey publicKey) throws Exception {
		Signature sig = Signature.getInstance(signatureMethod);
		sig.initVerify(publicKey);
		sig.update(plainText);
		return sig.verify(signature);
	}

	public static void main(String[] args) {
		try {
			Rsa rsa = new Rsa();
			String pfx = "C:\\Users\\DELL\\Desktop\\xml\\100020091218001-cfca1234.pfx";
			String cer = "C:\\Users\\DELL\\Desktop\\xml\\100020091218001.cer";

			String signSrc = "1111123";
			PrivateKey privateKey = loadPrivateKey(pfx, "cfca1234");
			String signMac = new String(Base64.encode(signSha1WithRsa(signSrc.getBytes(), privateKey)));
			System.out.println(signMac);
			PublicKey publickey = loadPublicKey(cer);
			boolean result = verfySha1WithRsa(Base64.decode(signMac), signSrc.getBytes(), publickey);
			System.out.println(result);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	static {
		Security.addProvider(new BouncyCastleProvider());
	}

	public static enum SignatureMethod {
		MD5WithRSA("MD5WithRSA"), SHA1WithRSA("SHA1WithRSA");

		private String method;

		private SignatureMethod(String method) {
			this.method = method;
		}

		public String getMethod() {
			return this.method;
		}
	}
}