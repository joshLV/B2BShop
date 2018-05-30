package com.allinpay.ets.client;

import java.io.ByteArrayInputStream;
import java.io.FileInputStream;
import java.io.InputStream;
import java.io.PrintStream;
import java.security.Key;
import java.security.KeyStore;
import java.security.MessageDigest;
import java.security.PrivateKey;
import java.security.Security;
import java.security.Signature;
import java.security.cert.Certificate;
import java.security.cert.CertificateFactory;
import java.util.Enumeration;
import java.util.Random;
import javax.crypto.Cipher;
import javax.crypto.KeyGenerator;
import javax.crypto.SecretKey;
import javax.crypto.SecretKeyFactory;
import javax.crypto.spec.PBEKeySpec;
import javax.crypto.spec.PBEParameterSpec;
import javax.crypto.spec.SecretKeySpec;
import org.bouncycastle.jce.provider.BouncyCastleProvider;
import org.bouncycastle.util.encoders.Base64;
import sun.misc.BASE64Decoder;
import sun.misc.BASE64Encoder;

public class SecurityUtil
{
  public static String MD5Encode(String aData)
    throws SecurityException
  {
    String resultString = null;
    try {
      MessageDigest md = MessageDigest.getInstance("MD5");
      resultString = bytes2HexString(md.digest(aData.getBytes("UTF-8")));
    } catch (Exception e) {
      e.printStackTrace();
      throw new SecurityException("MD5运算失败");
    }
    return resultString;
  }

  public static String bytes2HexString(byte[] b) {
    String ret = "";
    for (int i = 0; i < b.length; i++) {
      String hex = Integer.toHexString(b[i] & 0xFF);
      if (hex.length() == 1) {
        hex = '0' + hex;
      }
      ret = ret + hex.toUpperCase();
    }
    return ret;
  }

  public static String encrypt(String answer1) throws Exception {
    Security.addProvider(new BouncyCastleProvider());

    byte[] tEncData = encryptByPassword("PBEWithMD5AndDES", "allinpay-ets".toCharArray(), answer1.getBytes());

    return base64Encode(tEncData);
  }

  public static String decrypt(String strEncrypt)
  {
    Security.addProvider(new BouncyCastleProvider());

    byte[] answer2 = base64Decode(strEncrypt);
    byte[] answer3 = decryptByPassword("PBEWithMD5AndDES", "allinpay-ets".toCharArray(), answer2);

    return new String(answer3);
  }

  public static String base64Encode(byte[] aSourceData) {
    return new BASE64Encoder().encode(aSourceData);
  }

  public static byte[] base64Decode(String aSourceData) {
    try {
      byte[] tResult = new BASE64Decoder().decodeBuffer(aSourceData);
      return tResult;
    } catch (Exception e) {
      e.printStackTrace();
    }
    return null;
  }

  public static byte[] encryptByPassword(String aMethod, char[] aPassword, byte[] aSourceData)
  {
    try {
      Random tRandom = new Random();

      byte[] tSalt = new byte[8];
      tRandom.nextBytes(tSalt);

      PBEKeySpec tPBEKeySpec = new PBEKeySpec(aPassword);
      SecretKeyFactory tKeyFactory = SecretKeyFactory.getInstance(aMethod);

      SecretKey tKey = tKeyFactory.generateSecret(tPBEKeySpec);

      PBEParameterSpec tParamSpec = new PBEParameterSpec(tSalt, 100);
      Cipher tCipher = Cipher.getInstance(aMethod);
      tCipher.init(1, tKey, tParamSpec);

      byte[] tCipherText = tCipher.doFinal(aSourceData);

      byte[] tResult = new byte[tSalt.length + tCipherText.length];
      for (int i = 0; i < tSalt.length; i++) {
        tResult[i] = tSalt[i];
      }
      for (int i = 0; i < tCipherText.length; i++) {
        tResult[(i + tSalt.length)] = tCipherText[i];
      }

      return tResult;
    } catch (Exception e) {
      e.printStackTrace();
    }
    return null;
  }

  public static byte[] decryptByPassword(String aMethod, char[] aPassword, byte[] aSourceData)
  {
    try {
      byte[] tSalt = new byte[8];
      byte[] tCipherText = new byte[aSourceData.length - 8];

      for (int i = 0; i < tSalt.length; i++) {
        tSalt[i] = aSourceData[i];
      }
      for (int i = 0; i < tCipherText.length; i++) {
        tCipherText[i] = aSourceData[(i + tSalt.length)];
      }

      PBEKeySpec tPBEKeySpec = new PBEKeySpec(aPassword);
      SecretKeyFactory tKeyFactory = SecretKeyFactory.getInstance(aMethod);

      SecretKey tKey = tKeyFactory.generateSecret(tPBEKeySpec);

      PBEParameterSpec tParamSpec = new PBEParameterSpec(tSalt, 100);
      Cipher tCipher = Cipher.getInstance(aMethod);
      tCipher.init(2, tKey, tParamSpec);

      byte[] tResult = tCipher.doFinal(tCipherText);

      return tResult;
    } catch (Exception e) {
      e.printStackTrace();
    }
    return null;
  }

  public static byte[] sign(String aMethod, byte[] aCertificate, char[] aPassword, byte[] aSourceData)
  {
    try {
      String tAlias = new String();

      KeyStore tKeystore = KeyStore.getInstance("PKCS12");
      tKeystore.load(new ByteArrayInputStream(aCertificate), aPassword);

      Enumeration e = tKeystore.aliases();
      if (e.hasMoreElements()) {
        tAlias = (String)e.nextElement();
      }
      PrivateKey tPrivateKey = (PrivateKey)tKeystore.getKey(tAlias, aPassword);

      Signature tSign = Signature.getInstance(aMethod);
      tSign.initSign(tPrivateKey);

      tSign.update(aSourceData);
      byte[] tSignedText = tSign.sign();

      return tSignedText;
    } catch (Exception e) {
      e.printStackTrace();
    }
    return null;
  }

  public static boolean verify(String aMethod, byte[] aCertificate, byte[] aPlainData, byte[] aSignature)
  {
    boolean tResult = false;
    try {
      CertificateFactory tCertFactory = CertificateFactory.getInstance("X.509");

      Certificate tCertificate = tCertFactory.generateCertificate(new ByteArrayInputStream(aCertificate));

      Signature tSign = Signature.getInstance(aMethod);
      tSign.initVerify(tCertificate);

      tSign.update(aPlainData);
      tResult = tSign.verify(aSignature);

      return tResult;
    } catch (Exception e) {
      e.printStackTrace();
    }
    return false;
  }

  public static boolean verifyByRSA(String certPath, byte[] aPlainData, byte[] aSignature)
  {
    boolean tResult = false;
    try {
      InputStream inStream = new FileInputStream(certPath);
      CertificateFactory tCertFactory = CertificateFactory.getInstance("X.509");

      Certificate tCertificate = tCertFactory.generateCertificate(inStream);

      Signature tSign = Signature.getInstance("SHA1withRSA", "BC");
      tSign.initVerify(tCertificate);

      tSign.update(aPlainData);
      tResult = tSign.verify(aSignature);
    }
    catch (Exception e) {
      e.printStackTrace();
    }
    return tResult;
  }

  public static byte[] getSymmetricKey(String aMethod, char[] aPassword) {
    try {
      KeyGenerator tKeyGen = KeyGenerator.getInstance(aMethod);
      if (aMethod.equalsIgnoreCase("DESede"))
        tKeyGen.init(192);
      else {
        tKeyGen.init(56);
      }
      Key tKey = tKeyGen.generateKey();

      byte[] tKeyBytes = tKey.getEncoded();
      byte[] tEncKeyBytes = encryptByPassword("PBEWithSHAAndTwofish-CBC", aPassword, tKeyBytes);

      return tEncKeyBytes;
    } catch (Exception e) {
      e.printStackTrace();
    }
    return null;
  }

  public static byte[] encryptByKey(String aMethod, byte[] aKey, char[] aPassword, byte[] aSourceData)
  {
    try {
      byte[] tKeyBytes = decryptByPassword("PBEWithSHAAndTwofish-CBC", aPassword, aKey);

      SecretKeySpec tKeySpec = new SecretKeySpec(tKeyBytes, aMethod);

      Cipher tCipher = Cipher.getInstance(aMethod);
      tCipher.init(1, tKeySpec);

      return tCipher.doFinal(aSourceData);
    } catch (Exception e) {
      e.printStackTrace();
    }
    return null;
  }

  public static byte[] decryptByKey(String aMethod, byte[] aKey, char[] aPassword, byte[] aSourceData)
  {
    try {
      byte[] tKeyBytes = decryptByPassword("PBEWithSHAAndTwofish-CBC", aPassword, aKey);

      SecretKeySpec tKeySpec = new SecretKeySpec(tKeyBytes, aMethod);

      Cipher tCipher = Cipher.getInstance(aMethod);
      tCipher.init(2, tKeySpec);

      return tCipher.doFinal(aSourceData);
    } catch (Exception e) {
      e.printStackTrace();
    }
    return null;
  }

  public static String encryptByPublicKey(String certPath, String plainText)
    throws SecurityException
  {
    try
    {
      InputStream inStream = new FileInputStream(certPath);
      CertificateFactory tCertFactory = CertificateFactory.getInstance("X.509");

      Certificate tCertificate = tCertFactory.generateCertificate(inStream);

      Cipher cipher = Cipher.getInstance("RSA/ECB/PKCS1Padding");

      cipher.init(1, tCertificate.getPublicKey());

      byte[] cipherText = cipher.doFinal(plainText.getBytes());

      return new String(Base64.encode(cipherText));
    } catch (Exception e) {
    	 throw new SecurityException("使用公钥加密失败：" + e.getMessage());
    }
   
  }

  public static void main(String[] args)
  {
    try {
      String src = "merchantId=100020091218002&version=v1.0&language=1&signType=1&paymentOrderId=20100127025940009&orderNo=NO20100127140930&orderDatetime=20100127140930&orderAmount=100&payDatetime=20100127025940&payAmount=100&ext1=附加参数1&ext2=附加参数2&payResult=1&returnDatetime=20100127025941";
      String mac = "L2cKYmgs2Au4i1QPLy/pvd/C8txvU83h2XdE4MM/PUsA1K+d+3Q9KPSWFT/i03xqIJQJqLy+4ZUH6rb6C0Y0QbgY+CKpxWPa8uEKFdFgluMWLviILKweDkSsUq99wqKSbs169RFTjLAGqB8lIIeghk+79WKQZR6l+xDgLvXohM0=";

      System.out.println(verifyByRSA("c:/cert/TLCert.cer", src.getBytes("utf-8"), Base64.decode(mac)));
    }
    catch (Exception e) {
      e.printStackTrace();
    }
  }

  static
  {
    Security.addProvider(new BouncyCastleProvider());
  }
}