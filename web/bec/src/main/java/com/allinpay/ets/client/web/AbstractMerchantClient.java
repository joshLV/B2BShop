package com.allinpay.ets.client.web;

import com.allinpay.ets.client.PaymentResult;
import com.allinpay.ets.client.RequestOrder;
import com.allinpay.ets.client.SecurityUtil;
import com.allinpay.ets.client.StringUtil;
import com.allinpay.ets.client.TrxException;
import com.allinpay.ets.client.util.Rsa;
import java.io.PrintStream;
import java.io.UnsupportedEncodingException;
import java.security.PrivateKey;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import org.bouncycastle.util.encoders.Base64;

public abstract class AbstractMerchantClient {
	public static final int SIGNTYPE_MD5 = 0;
	public static final int SIGNTYPE_CERT = 1;
	public static final int SIGNTYPE_SHA_1 = 2;
	public static final int INPUTCHARSET_UTF8 = 1;
	public static final int INPUTCHARSET_GBK = 2;
	public static final int INPUTCHARSET_GB2312 = 3;
	public static final String VERSION_PAYMENT_V1 = "v1.0";
	public static final String VERSION_PAYMENT_V2 = "v2.0";
	public static final String VERSION_REFUND_V13 = "v1.3";
	public static final String VERSION_QUERY_V15 = "v1.5";
	public static final String VERSION_BATCHQUERY_V17 = "v1.7";
	public static final String VERSION_REALNAME_VERIFY_V5 = "v5.0";
	public static final String VERSION_REALNAME_PAYMENT_V51 = "v5.1";
	public static final String VERSION_REALNAME_VANDPAYMENT_V55 = "v5.5";
	public static final int PAYTYPE_ALL = 0;
	public static final int PAYTYPE_EBankPay = 1;
	public static final int PAYTYPE_PrepaidCardPay = 2;
	public static final int PAYTYPE_TelephonePay = 3;
	public static final int PAYTYPE_EBankB2BPay = 4;
	public static final int PAYTYPE_RealNamePay = 5;
	private static Pattern orderAmountPattern = Pattern.compile("\\d{1,16}");
	private static Pattern orderIdPattern = Pattern.compile("[\\w,_,-]{1,50}");

	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	String currentDate = this.sdf.format(new Date());

	public abstract String sign(RequestOrder paramRequestOrder) throws TrxException;

	public abstract boolean verify(PaymentResult paramPaymentResult) throws TrxException;

	protected String generateSignMsg(RequestOrder requestOrder) throws TrxException {
		StringBuffer st = new StringBuffer();
		String signMsg = "";
		try {
			st.append("=== Signature start, env: java jdk1.5, date:" + this.currentDate + " ===\n");
			checkSignParams(requestOrder);

			String signSrc = generateSignSrc(requestOrder);
			st.append("[signSrc]").append(signSrc).append(" \n");

			switch (requestOrder.getSignType()) {
			case 0:
				signMsg = generateSignMsgOfMD5(signSrc);
				break;
			case 1:
				signMsg = generateSignMsgOfCert(signSrc);
				break;
			case 2:
			}

			st.append("[signMsg]").append(signMsg).append(" \n");
			st.append("=== Signature end, env: java jdk1.5, date:" + this.currentDate + " ===\n");
		} finally {
			System.out.println(st.toString());
		}

		return signMsg;
	}

	public String generateSignSrc(RequestOrder requestOrder) {
		String versionNum = requestOrder.getVersion().substring(1, requestOrder.getVersion().indexOf("."));

		int inte = Integer.parseInt(versionNum);

		String signSrc = null;

		if (inte == 1) {
			if ("v1.0".equals(requestOrder.getVersion()))
				signSrc = generatePaymentSignSrc(requestOrder);
			else if ("v1.3".equals(requestOrder.getVersion())) {
				signSrc = generateRefundSignSrc(requestOrder);
			} else if ("v1.5".equals(requestOrder.getVersion())) {
				signSrc = generateQuerySignSrc(requestOrder);
			}

		} else if (inte == 2) {
			if ("v2.0".equals(requestOrder.getVersion())) {
				signSrc = generatePaymentSignSrc(requestOrder);
			}

		} else if (inte == 5) {
			if ("v5.0".equals(requestOrder.getVersion())) {
				signSrc = generateRNVerifySignSrc(requestOrder);
			} else if ("v5.1".equals(requestOrder.getVersion())) {
				signSrc = generateRNPaymentSignSrc(requestOrder);
			} else if ("v5.5".equals(requestOrder.getVersion())) {
				signSrc = generateRNPaymentSignSrc(requestOrder);
			}
		} else
			return null;

		return signSrc;
	}

	protected boolean verifySignMsg(PaymentResult paymentResult) throws TrxException {
		StringBuffer st = new StringBuffer();
		boolean returnValue = false;
		try {
			st.append("=== Verify start, env: java jdk1.5, date:" + this.currentDate + " ===\n");

			String signSrc = generateVerifySrc(paymentResult);
			st.append("[signSrc]").append(signSrc).append(" \n");

			String signMsg = paymentResult.getSignMsg();
			st.append("[signMsg]").append(signMsg).append(" \n");

			String strMD5 = "";
			switch (Integer.parseInt(paymentResult.getSignType())) {
			case 0:
				strMD5 = generateSignMsgOfMD5(signSrc);
				if (!strMD5.equals(signMsg))
					break;
				returnValue = true;
				break;
			case 1:
				returnValue = SecurityUtil.verifyByRSA(paymentResult.getCertPath(), signSrc.getBytes("UTF-8"), Base64.decode(signMsg));

				break;
			case 2:
			}

			st.append("[verifyResult]").append(returnValue).append(" \n");
			st.append("=== Verify end, env: java jdk1.5, date:" + this.currentDate + " ===\n");
			return returnValue;
		} catch (UnsupportedEncodingException e) {
			throw new TrxException("TX10001", "不支持的字符编码格式");
		} finally {
			System.out.println(st.toString());
		}
	}

	public String generateSignMsgOfMD5(String signSrc) {
		return SecurityUtil.MD5Encode(signSrc);
	}

	public String generateSignMsgOfCert(String signSrc) {
		return SecurityUtil.MD5Encode(signSrc);
	}

	public String generateSignMsgOfCert(String signSrc, String priavteCertPath, String password) throws TrxException {
		String signMsg = "";
		try {
			Rsa sa = new Rsa();
			PrivateKey privateKey = Rsa.loadPrivateKey(priavteCertPath, password);
			signMsg = new String(Base64.encode(Rsa.signSha1WithRsa(signSrc.getBytes(), privateKey)));
			return signMsg;
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		throw new TrxException("TX20001", "签名异常");
	}

	private String generatePaymentSignSrc(RequestOrder requestOrder) {
		StringBuffer bufSignSrc = new StringBuffer();
		StringUtil.appendSignPara(bufSignSrc, "inputCharset", requestOrder.getInputCharset() < 0 ? "" : String.valueOf(requestOrder.getInputCharset()));

		StringUtil.appendSignPara(bufSignSrc, "pickupUrl", requestOrder.getPickupUrl());

		StringUtil.appendSignPara(bufSignSrc, "receiveUrl", requestOrder.getReceiveUrl());

		StringUtil.appendSignPara(bufSignSrc, "version", requestOrder.getVersion());

		StringUtil.appendSignPara(bufSignSrc, "language", requestOrder.getLanguage() < 0 ? "" : String.valueOf(requestOrder.getLanguage()));

		StringUtil.appendSignPara(bufSignSrc, "signType", String.valueOf(requestOrder.getSignType()));

		StringUtil.appendSignPara(bufSignSrc, "merchantId", requestOrder.getMerchantId());

		StringUtil.appendSignPara(bufSignSrc, "payerName", requestOrder.getPayerName());

		StringUtil.appendSignPara(bufSignSrc, "payerEmail", requestOrder.getPayerEmail());

		StringUtil.appendSignPara(bufSignSrc, "payerTelephone", requestOrder.getPayerTelephone());

		StringUtil.appendSignPara(bufSignSrc, "payerIDCard", requestOrder.getPayerIDCard());

		StringUtil.appendSignPara(bufSignSrc, "pid", requestOrder.getPid());
		StringUtil.appendSignPara(bufSignSrc, "orderNo", requestOrder.getOrderNo());

		StringUtil.appendSignPara(bufSignSrc, "orderAmount", String.valueOf(requestOrder.getOrderAmount()));

		StringUtil.appendSignPara(bufSignSrc, "orderCurrency", requestOrder.getOrderCurrency());

		StringUtil.appendSignPara(bufSignSrc, "orderDatetime", requestOrder.getOrderDatetime());

		StringUtil.appendSignPara(bufSignSrc, "orderExpireDatetime", requestOrder.getOrderExpireDatetime());

		StringUtil.appendSignPara(bufSignSrc, "productName", requestOrder.getProductName());

		StringUtil.appendSignPara(bufSignSrc, "productPrice", requestOrder.getProductPrice().longValue() < 0L ? "" : String.valueOf(requestOrder.getProductPrice()));

		StringUtil.appendSignPara(bufSignSrc, "productNum", requestOrder.getProductNum() < 0 ? "" : String.valueOf(requestOrder.getProductNum()));

		StringUtil.appendSignPara(bufSignSrc, "productId", requestOrder.getProductId());

		StringUtil.appendSignPara(bufSignSrc, "productDesc", requestOrder.getProductDesc());

		StringUtil.appendSignPara(bufSignSrc, "ext1", requestOrder.getExt1());
		StringUtil.appendSignPara(bufSignSrc, "ext2", requestOrder.getExt2());
		StringUtil.appendSignPara(bufSignSrc, "extTL", requestOrder.getExtTL());

		if (requestOrder.getVersion().startsWith("v1")) {
			StringUtil.appendSignPara(bufSignSrc, "payType", requestOrder.getPayType() < 0 ? "" : String.valueOf(requestOrder.getPayType()));

			StringUtil.appendSignPara(bufSignSrc, "issuerId", requestOrder.getIssuerId());
		}

		StringUtil.appendSignPara(bufSignSrc, "pan", requestOrder.getPan());

		StringUtil.appendSignPara(bufSignSrc, "tradeNature", requestOrder.getTradeNature());

		StringUtil.appendLastSignPara(bufSignSrc, "key", requestOrder.getKey());
		return bufSignSrc.toString();
	}

	private String generateRefundSignSrc(RequestOrder requestOrder) {
		StringBuffer bufSignSrc = new StringBuffer();
		StringUtil.appendSignPara(bufSignSrc, "version", requestOrder.getVersion());

		StringUtil.appendSignPara(bufSignSrc, "signType", String.valueOf(requestOrder.getSignType()));

		StringUtil.appendSignPara(bufSignSrc, "merchantId", requestOrder.getMerchantId());

		StringUtil.appendSignPara(bufSignSrc, "orderNo", requestOrder.getOrderNo());

		StringUtil.appendSignPara(bufSignSrc, "refundAmount", String.valueOf(requestOrder.getRefundAmount()));

		StringUtil.appendSignPara(bufSignSrc, "orderDatetime", String.valueOf(requestOrder.getOrderDatetime()));

		StringUtil.appendLastSignPara(bufSignSrc, "key", requestOrder.getKey());
		return bufSignSrc.toString();
	}

	private String generateQuerySignSrc(RequestOrder requestOrder) {
		StringBuffer bufSignSrc = new StringBuffer();
		StringUtil.appendSignPara(bufSignSrc, "merchantId", requestOrder.getMerchantId());

		StringUtil.appendSignPara(bufSignSrc, "version", requestOrder.getVersion());

		StringUtil.appendSignPara(bufSignSrc, "signType", String.valueOf(requestOrder.getSignType()));

		StringUtil.appendSignPara(bufSignSrc, "orderNo", requestOrder.getOrderNo());

		StringUtil.appendSignPara(bufSignSrc, "orderDatetime", requestOrder.getOrderDatetime());

		StringUtil.appendSignPara(bufSignSrc, "queryDatetime", requestOrder.getQueryDateTime());

		StringUtil.appendLastSignPara(bufSignSrc, "key", requestOrder.getKey());
		return bufSignSrc.toString();
	}

	private String generateRNPaymentSignSrc(RequestOrder requestOrder) {
		StringBuffer bufSignSrc = new StringBuffer();
		StringUtil.appendSignPara(bufSignSrc, "inputCharset", requestOrder.getInputCharset() < 0 ? "" : String.valueOf(requestOrder.getInputCharset()));

		StringUtil.appendSignPara(bufSignSrc, "pickupUrl", requestOrder.getPickupUrl());

		StringUtil.appendSignPara(bufSignSrc, "receiveUrl", requestOrder.getReceiveUrl());

		StringUtil.appendSignPara(bufSignSrc, "version", requestOrder.getVersion());

		StringUtil.appendSignPara(bufSignSrc, "language", requestOrder.getLanguage() < 0 ? "" : String.valueOf(requestOrder.getLanguage()));

		StringUtil.appendSignPara(bufSignSrc, "signType", String.valueOf(requestOrder.getSignType()));

		StringUtil.appendSignPara(bufSignSrc, "merchantId", requestOrder.getMerchantId());

		StringUtil.appendSignPara(bufSignSrc, "payerName", requestOrder.getPayerName());

		StringUtil.appendSignPara(bufSignSrc, "payerEmail", requestOrder.getPayerEmail());

		StringUtil.appendSignPara(bufSignSrc, "payerTelephone", requestOrder.getPayerTelephone());

		StringUtil.appendSignPara(bufSignSrc, "pid", requestOrder.getPid());
		StringUtil.appendSignPara(bufSignSrc, "orderNo", requestOrder.getOrderNo());

		StringUtil.appendSignPara(bufSignSrc, "orderAmount", String.valueOf(requestOrder.getOrderAmount()));

		StringUtil.appendSignPara(bufSignSrc, "orderCurrency", requestOrder.getOrderCurrency());

		StringUtil.appendSignPara(bufSignSrc, "orderDatetime", requestOrder.getOrderDatetime());

		StringUtil.appendSignPara(bufSignSrc, "orderExpireDatetime", requestOrder.getOrderExpireDatetime());

		StringUtil.appendSignPara(bufSignSrc, "productName", requestOrder.getProductName());

		StringUtil.appendSignPara(bufSignSrc, "productPrice", requestOrder.getProductPrice().longValue() < 0L ? "" : String.valueOf(requestOrder.getProductPrice()));

		StringUtil.appendSignPara(bufSignSrc, "productNum", requestOrder.getProductNum() < 0 ? "" : String.valueOf(requestOrder.getProductNum()));

		StringUtil.appendSignPara(bufSignSrc, "productId", requestOrder.getProductId());

		StringUtil.appendSignPara(bufSignSrc, "productDesc", requestOrder.getProductDesc());

		StringUtil.appendSignPara(bufSignSrc, "ext1", requestOrder.getExt1());
		StringUtil.appendSignPara(bufSignSrc, "ext2", requestOrder.getExt2());
		StringUtil.appendSignPara(bufSignSrc, "payType", requestOrder.getPayType() < 0 ? "" : String.valueOf(requestOrder.getPayType()));

		StringUtil.appendSignPara(bufSignSrc, "issuerId", requestOrder.getIssuerId());

		StringUtil.appendSignPara(bufSignSrc, "userName", requestOrder.getUserName());

		StringUtil.appendSignPara(bufSignSrc, "credentialsType", requestOrder.getCredentialsType());

		StringUtil.appendSignPara(bufSignSrc, "credentialsNo", requestOrder.getCredentialsNo());

		StringUtil.appendSignPara(bufSignSrc, "txOrgId", requestOrder.getTxOrgId());

		StringUtil.appendSignPara(bufSignSrc, "pan", requestOrder.getPan());
		StringUtil.appendLastSignPara(bufSignSrc, "key", requestOrder.getKey());
		return bufSignSrc.toString();
	}

	private String generateRNVerifySignSrc(RequestOrder requestOrder) {
		StringBuffer bufSignSrc = new StringBuffer();
		StringUtil.appendSignPara(bufSignSrc, "inputCharset", requestOrder.getInputCharset() < 0 ? "" : String.valueOf(requestOrder.getInputCharset()));

		StringUtil.appendSignPara(bufSignSrc, "pickupUrl", requestOrder.getPickupUrl());

		StringUtil.appendSignPara(bufSignSrc, "receiveUrl", requestOrder.getReceiveUrl());

		StringUtil.appendSignPara(bufSignSrc, "version", requestOrder.getVersion());

		StringUtil.appendSignPara(bufSignSrc, "language", requestOrder.getLanguage() < 0 ? "" : String.valueOf(requestOrder.getLanguage()));

		StringUtil.appendSignPara(bufSignSrc, "signType", String.valueOf(requestOrder.getSignType()));

		StringUtil.appendSignPara(bufSignSrc, "merchantId", requestOrder.getMerchantId());

		StringUtil.appendSignPara(bufSignSrc, "orderNo", String.valueOf(requestOrder.getOrderNo()));

		StringUtil.appendSignPara(bufSignSrc, "orderDatetime", String.valueOf(requestOrder.getOrderDatetime()));

		StringUtil.appendSignPara(bufSignSrc, "payType", requestOrder.getPayType() < 0 ? "" : String.valueOf(requestOrder.getPayType()));

		StringUtil.appendSignPara(bufSignSrc, "userName", requestOrder.getUserName());

		StringUtil.appendSignPara(bufSignSrc, "credentialsType", requestOrder.getCredentialsType());

		StringUtil.appendSignPara(bufSignSrc, "credentialsNo", requestOrder.getCredentialsNo());

		StringUtil.appendSignPara(bufSignSrc, "txOrgId", requestOrder.getTxOrgId());

		StringUtil.appendSignPara(bufSignSrc, "pan", requestOrder.getPan());

		StringUtil.appendLastSignPara(bufSignSrc, "key", requestOrder.getKey());
		return bufSignSrc.toString();
	}

	public String generateRNVAndPaymentSignSrc(RequestOrder requestOrder) {
		return generateRNPaymentSignSrc(requestOrder);
	}

	private String generateRNVAndPaymentVerifySrc(PaymentResult paymentResult) {
		return generateRNPaymentVerifySrc(paymentResult);
	}

	protected String generateVerifySrc(PaymentResult paymentResult) {
		String versionNum = paymentResult.getVersion().substring(1, paymentResult.getVersion().indexOf("."));

		int inte = Integer.parseInt(versionNum);

		String verifySrc = null;

		if (inte == 1) {
			if ("v1.0".equals(paymentResult.getVersion()))
				verifySrc = generatePaymentVerifySrc(paymentResult);
			else if ("v1.3".equals(paymentResult.getVersion())) {
				verifySrc = generateRefundVerifySrc(paymentResult);
			} else if ("v1.5".equals(paymentResult.getVersion())) {
				verifySrc = generateQueryVerifySrc(paymentResult);
			}

		} else if (inte == 2) {
			if ("v2.0".equals(paymentResult.getVersion()))
				verifySrc = generatePaymentVerifySrc(paymentResult);
			else if ("v1.3".equals(paymentResult.getVersion())) {
				verifySrc = generateRefundVerifySrc(paymentResult);
			} else if ("v1.5".equals(paymentResult.getVersion())) {
				verifySrc = generateQueryVerifySrc(paymentResult);
			}

		} else if (inte == 5) {
			if ("v5.0".equals(paymentResult.getVersion())) {
				verifySrc = generateRNVerifyVerifySrc(paymentResult);
			} else if ("v5.1".equals(paymentResult.getVersion())) {
				verifySrc = generateRNPaymentVerifySrc(paymentResult);
			} else if ("v5.5".equals(paymentResult.getVersion())) {
				verifySrc = generateRNVAndPaymentVerifySrc(paymentResult);
			}
		}
		return verifySrc;
	}

	private String generateRNPaymentVerifySrc(PaymentResult paymentResult) {
		StringBuffer bufSignSrc = new StringBuffer();
		StringUtil.appendSignPara(bufSignSrc, "merchantId", paymentResult.getMerchantId());

		StringUtil.appendSignPara(bufSignSrc, "version", paymentResult.getVersion());

		StringUtil.appendSignPara(bufSignSrc, "language", paymentResult.getLanguage());

		StringUtil.appendSignPara(bufSignSrc, "signType", paymentResult.getSignType());

		StringUtil.appendSignPara(bufSignSrc, "payType", paymentResult.getPayType());

		StringUtil.appendSignPara(bufSignSrc, "issuerId", paymentResult.getIssuerId());

		StringUtil.appendSignPara(bufSignSrc, "paymentOrderId", paymentResult.getPaymentOrderId());

		StringUtil.appendSignPara(bufSignSrc, "orderNo", paymentResult.getOrderNo());

		StringUtil.appendSignPara(bufSignSrc, "orderDatetime", paymentResult.getOrderDatetime());

		StringUtil.appendSignPara(bufSignSrc, "orderAmount", paymentResult.getOrderAmount());

		StringUtil.appendSignPara(bufSignSrc, "payDatetime", paymentResult.getPayDatetime());

		StringUtil.appendSignPara(bufSignSrc, "payAmount", paymentResult.getPayAmount());

		StringUtil.appendSignPara(bufSignSrc, "ext1", paymentResult.getExt1());
		StringUtil.appendSignPara(bufSignSrc, "ext2", paymentResult.getExt2());
		StringUtil.appendSignPara(bufSignSrc, "payResult", paymentResult.getPayResult());

		StringUtil.appendSignPara(bufSignSrc, "errorCode", paymentResult.getErrorCode());

		StringUtil.appendSignPara(bufSignSrc, "userName", paymentResult.getUserName());

		StringUtil.appendSignPara(bufSignSrc, "credentialsType", paymentResult.getCredentialsType());

		StringUtil.appendSignPara(bufSignSrc, "credentialsNo", paymentResult.getCredentialsNo());

		StringUtil.appendSignPara(bufSignSrc, "txOrgId", paymentResult.getTxOrgId());

		StringUtil.appendSignPara(bufSignSrc, "pan", paymentResult.getPan());

		switch (Integer.parseInt(paymentResult.getSignType())) {
		case 0:
			StringUtil.appendSignPara(bufSignSrc, "returnDatetime", paymentResult.getReturnDatetime());

			StringUtil.appendLastSignPara(bufSignSrc, "key", paymentResult.getKey());

			break;
		case 1:
			StringUtil.appendLastSignPara(bufSignSrc, "returnDatetime", paymentResult.getReturnDatetime());

			break;
		case 2:
		}

		return bufSignSrc.toString();
	}

	private String generateRNVerifyVerifySrc(PaymentResult paymentResult) {
		StringBuffer bufSignSrc = new StringBuffer();
		StringUtil.appendSignPara(bufSignSrc, "merchantId", paymentResult.getMerchantId());

		StringUtil.appendSignPara(bufSignSrc, "version", paymentResult.getVersion());

		StringUtil.appendSignPara(bufSignSrc, "language", paymentResult.getLanguage());

		StringUtil.appendSignPara(bufSignSrc, "signType", paymentResult.getSignType());

		StringUtil.appendSignPara(bufSignSrc, "payType", paymentResult.getPayType());

		StringUtil.appendSignPara(bufSignSrc, "paymentOrderId", paymentResult.getPaymentOrderId());

		StringUtil.appendSignPara(bufSignSrc, "orderNo", paymentResult.getOrderNo());

		StringUtil.appendSignPara(bufSignSrc, "orderDatetime", paymentResult.getOrderDatetime());

		StringUtil.appendSignPara(bufSignSrc, "payDatetime", paymentResult.getPayDatetime());

		StringUtil.appendSignPara(bufSignSrc, "payResult", paymentResult.getPayResult());

		StringUtil.appendSignPara(bufSignSrc, "errorCode", paymentResult.getErrorCode());

		StringUtil.appendSignPara(bufSignSrc, "userName", paymentResult.getUserName());

		StringUtil.appendSignPara(bufSignSrc, "credentialsType", paymentResult.getCredentialsType());

		StringUtil.appendSignPara(bufSignSrc, "credentialsNo", paymentResult.getCredentialsNo());

		StringUtil.appendSignPara(bufSignSrc, "txOrgId", paymentResult.getTxOrgId());

		StringUtil.appendSignPara(bufSignSrc, "pan", paymentResult.getPan());

		switch (Integer.parseInt(paymentResult.getSignType())) {
		case 0:
			StringUtil.appendSignPara(bufSignSrc, "returnDatetime", paymentResult.getReturnDatetime());

			StringUtil.appendLastSignPara(bufSignSrc, "key", paymentResult.getKey());

			break;
		case 1:
			StringUtil.appendLastSignPara(bufSignSrc, "returnDatetime", paymentResult.getReturnDatetime());

			break;
		case 2:
		}

		return bufSignSrc.toString();
	}

	private String generatePaymentVerifySrc(PaymentResult paymentResult) {
		StringBuffer bufSignSrc = new StringBuffer();
		StringUtil.appendSignPara(bufSignSrc, "merchantId", paymentResult.getMerchantId());

		StringUtil.appendSignPara(bufSignSrc, "version", paymentResult.getVersion());

		StringUtil.appendSignPara(bufSignSrc, "language", paymentResult.getLanguage());

		StringUtil.appendSignPara(bufSignSrc, "signType", paymentResult.getSignType());

		StringUtil.appendSignPara(bufSignSrc, "payType", paymentResult.getPayType());

		StringUtil.appendSignPara(bufSignSrc, "issuerId", paymentResult.getIssuerId());

		StringUtil.appendSignPara(bufSignSrc, "paymentOrderId", paymentResult.getPaymentOrderId());

		StringUtil.appendSignPara(bufSignSrc, "orderNo", paymentResult.getOrderNo());

		StringUtil.appendSignPara(bufSignSrc, "orderDatetime", paymentResult.getOrderDatetime());

		StringUtil.appendSignPara(bufSignSrc, "orderAmount", String.valueOf(paymentResult.getOrderAmount()));

		StringUtil.appendSignPara(bufSignSrc, "payDatetime", paymentResult.getPayDatetime());

		StringUtil.appendSignPara(bufSignSrc, "payAmount", String.valueOf(paymentResult.getPayAmount()));

		StringUtil.appendSignPara(bufSignSrc, "ext1", paymentResult.getExt1());
		StringUtil.appendSignPara(bufSignSrc, "ext2", paymentResult.getExt2());
		StringUtil.appendSignPara(bufSignSrc, "payResult", paymentResult.getPayResult());

		StringUtil.appendSignPara(bufSignSrc, "errorCode", paymentResult.getErrorCode());

		switch (Integer.parseInt(paymentResult.getSignType())) {
		case 0:
			StringUtil.appendSignPara(bufSignSrc, "returnDatetime", paymentResult.getReturnDatetime());

			StringUtil.appendLastSignPara(bufSignSrc, "key", paymentResult.getKey());

			break;
		case 1:
			StringUtil.appendLastSignPara(bufSignSrc, "returnDatetime", paymentResult.getReturnDatetime());

			break;
		case 2:
		}

		return bufSignSrc.toString();
	}

	private String generateRefundVerifySrc(PaymentResult paymentResult) {
		StringBuffer bufSignSrc = new StringBuffer();
		StringUtil.appendSignPara(bufSignSrc, "merchantId", paymentResult.getMerchantId());

		StringUtil.appendSignPara(bufSignSrc, "version", paymentResult.getVersion());

		StringUtil.appendSignPara(bufSignSrc, "signType", paymentResult.getSignType());

		StringUtil.appendSignPara(bufSignSrc, "orderNo", paymentResult.getOrderNo());

		StringUtil.appendSignPara(bufSignSrc, "orderAmount", paymentResult.getOrderAmount());

		StringUtil.appendSignPara(bufSignSrc, "orderDatetime", paymentResult.getOrderDatetime());

		StringUtil.appendSignPara(bufSignSrc, "refundAmount", paymentResult.getRefundAmount());

		StringUtil.appendSignPara(bufSignSrc, "refundDatetime", paymentResult.getRefundDatetime());

		StringUtil.appendSignPara(bufSignSrc, "refundResult", paymentResult.getRefundResult());

		StringUtil.appendSignPara(bufSignSrc, "errorCode", paymentResult.getErrorCode());

		StringUtil.appendSignPara(bufSignSrc, "returnDatetime", paymentResult.getReturnDatetime());

		StringUtil.appendLastSignPara(bufSignSrc, "key", paymentResult.getKey());

		return bufSignSrc.toString();
	}

	private String generateQueryVerifySrc(PaymentResult paymentResult) {
		return generatePaymentVerifySrc(paymentResult);
	}

	protected void checkSignParams(RequestOrder requestOrder) throws TrxException {
		String versionNum = requestOrder.getVersion().substring(1, requestOrder.getVersion().indexOf("."));

		int inte = Integer.parseInt(versionNum);
		String verifySrc = null;

		if (inte == 1) {
			if ("v1.0".equals(requestOrder.getVersion()))
				checkPaymentSignParams(requestOrder);
			else if ("v1.3".equals(requestOrder.getVersion())) {
				checkRefundSignParams(requestOrder);
			} else if ("v1.5".equals(requestOrder.getVersion())) {
				checkQuerySignParams(requestOrder);
			}
		} else if (inte == 2) {
			if ("v2.0".equals(requestOrder.getVersion()))
				checkPaymentSignParams(requestOrder);
			else if ("v1.3".equals(requestOrder.getVersion())) {
				checkRefundSignParams(requestOrder);
			} else if ("v1.5".equals(requestOrder.getVersion())) {
				checkQuerySignParams(requestOrder);
			}

		} else if (inte == 5)
			if ("v5.0".equals(requestOrder.getVersion())) {
				checkRNVerifySignParams(requestOrder);
			} else if ("v5.1".equals(requestOrder.getVersion())) {
				checkRNPaymentSignParams(requestOrder);
			} else if ("v5.5".equals(requestOrder.getVersion())) {
				checkRNVAndPaymentSignParams(requestOrder);
			}
	}

	private void checkRNVAndPaymentSignParams(RequestOrder requestOrder) throws TrxException {
		checkRNPaymentSignParams(requestOrder);
	}

	private void checkRNVerifySignParams(RequestOrder requestOrder) throws TrxException {
		int charset = requestOrder.getInputCharset();
		if ((charset >= 0) && (charset != 1) && (charset != 2) && (charset != 3)) {
			throw new TrxException("TX10001", "不支持的字符编码格式");
		}

		String pickupUrl = requestOrder.getPickupUrl();
		String receiveUrl = requestOrder.getReceiveUrl();
		if ((StringUtil.isEmpty(pickupUrl)) && (StringUtil.isEmpty(receiveUrl))) {
			throw new TrxException("TX10002", "取货地址和通知地址不能同时为空");
		}

		if ((!StringUtil.isEmpty(pickupUrl)) && (!pickupUrl.startsWith("http"))) {
			throw new TrxException("TX10003", "取货地址不合法");
		}

		if ((!StringUtil.isEmpty(receiveUrl)) && (!receiveUrl.startsWith("http"))) {
			throw new TrxException("TX10004", "通知地址不合法");
		}

		if (!"v5.0".equals(requestOrder.getVersion())) {
			throw new TrxException("TX10005", "版本号不合法");
		}

		if (StringUtil.isEmpty(requestOrder.getMerchantId())) {
			throw new TrxException("TX10006", "商户号不合法");
		}

		String orderId = requestOrder.getOrderNo();
		if ((StringUtil.isEmpty(orderId)) || (orderId.length() > 50) || (!isPatternMatcher(orderIdPattern, orderId))) {
			throw new TrxException("TX10009", "订单号不合法");
		}

		if (StringUtil.isEmpty(requestOrder.getOrderDatetime())) {
			throw new TrxException("TX10011", "订单时间不能为空");
		}
		try {
			SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");

			formatter.parse(requestOrder.getOrderDatetime());
		} catch (ParseException e) {
			throw new TrxException("TX10012", "订单时间不合法");
		}

		int payType = requestOrder.getPayType();
		if (payType != 5) {
			throw new TrxException("TX10018", "支付方式不合法");
		}

		int signType = requestOrder.getSignType();
		if ((signType != 0) && (signType != 1)) {
			throw new TrxException("TX10019", "签名类型不合法");
		}

		String userName = requestOrder.getUserName();
		if ((StringUtil.isEmpty(userName)) || (userName.length() > 20)) {
			throw new TrxException("TX10020", "实名交易-用户真实姓名不合法");
		}

		String credentialsType = requestOrder.getCredentialsType();
		if ((StringUtil.isEmpty(credentialsType)) || ((!"01".equals(credentialsType)) && (!"02".equals(credentialsType)) && (!"03".equals(credentialsType)) && (!"04".equals(credentialsType)) && (!"05".equals(credentialsType)) && (!"06".equals(credentialsType)) && (!"07".equals(credentialsType)) && (!"99".equals(credentialsType)))) {
			throw new TrxException("TX10021", "实名交易-证件类型不合法");
		}

		if ((StringUtil.isEmpty(requestOrder.getCredentialsNo())) || (requestOrder.getCredentialsNo().length() > 20)) {
			throw new TrxException("TX10022", "实名交易-证件号码不合法");
		}

		if ((StringUtil.isEmpty(requestOrder.getTxOrgId())) || (requestOrder.getTxOrgId().length() > 11)) {
			throw new TrxException("TX10023", "实名交易-指定交易机构号不合法");
		}

		if ((StringUtil.isEmpty(requestOrder.getPan())) || (requestOrder.getPan().length() > 19)) {
			throw new TrxException("TX10024", "实名交易-卡号不合法");
		}
	}

	private void checkRNPaymentSignParams(RequestOrder requestOrder) throws TrxException {
		int charset = requestOrder.getInputCharset();
		if ((charset >= 0) && (charset != 1) && (charset != 2) && (charset != 3)) {
			throw new TrxException("TX10001", "不支持的字符编码格式");
		}

		String pickupUrl = requestOrder.getPickupUrl();
		String receiveUrl = requestOrder.getReceiveUrl();
		if ((StringUtil.isEmpty(pickupUrl)) && (StringUtil.isEmpty(receiveUrl))) {
			throw new TrxException("TX10002", "取货地址和通知地址不能同时为空");
		}

		if ((!StringUtil.isEmpty(pickupUrl)) && (!pickupUrl.startsWith("http"))) {
			throw new TrxException("TX10003", "取货地址不合法");
		}

		if ((!StringUtil.isEmpty(receiveUrl)) && (!receiveUrl.startsWith("http"))) {
			throw new TrxException("TX10004", "通知地址不合法");
		}

		if ((!"v5.1".equals(requestOrder.getVersion())) && (!"v5.5".equals(requestOrder.getVersion()))) {
			throw new TrxException("TX10005", "版本号不合法");
		}

		if (StringUtil.isEmpty(requestOrder.getMerchantId())) {
			throw new TrxException("TX10006", "商户号不合法");
		}

		if ((!StringUtil.isEmpty(requestOrder.getPayerName())) && (requestOrder.getPayerName().length() > 32)) {
			throw new TrxException("TX10007", "付款人名称不合法");
		}

		if ((!StringUtil.isEmpty(requestOrder.getPayerEmail())) && (requestOrder.getPayerEmail().length() > 50)) {
			throw new TrxException("TX10008", "付款人的email地址不合法");
		}

		String orderId = requestOrder.getOrderNo();
		if ((StringUtil.isEmpty(orderId)) || (orderId.length() > 50) || (!isPatternMatcher(orderIdPattern, orderId))) {
			throw new TrxException("TX10009", "订单号不合法");
		}

		Long amount = requestOrder.getOrderAmount();
		if ((null == amount) || (amount.longValue() <= 0L) || (!isPatternMatcher(orderAmountPattern, amount.toString()))) {
			throw new TrxException("TX10010", "订单金额不合法");
		}

		if (StringUtil.isEmpty(requestOrder.getOrderDatetime())) {
			throw new TrxException("TX10011", "订单时间不能为空");
		}
		try {
			SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");

			formatter.parse(requestOrder.getOrderDatetime());
		} catch (ParseException e) {
			throw new TrxException("TX10012", "订单时间不合法");
		}

		if ((!StringUtil.isEmpty(requestOrder.getProductName())) && (requestOrder.getProductName().length() > 256)) {
			throw new TrxException("TX10013", "产品名称不合法");
		}

		if ((!StringUtil.isEmpty(requestOrder.getProductId())) && (requestOrder.getProductId().length() > 20)) {
			throw new TrxException("TX10014", "产品代码不合法");
		}

		if ((!StringUtil.isEmpty(requestOrder.getProductDesc())) && (requestOrder.getProductDesc().length() > 400)) {
			throw new TrxException("TX10015", "产品描述信息不合法");
		}

		if ((!StringUtil.isEmpty(requestOrder.getExt1())) && (requestOrder.getExt1().length() > 128)) {
			throw new TrxException("TX10016", "扩展参数1不合法");
		}

		if ((!StringUtil.isEmpty(requestOrder.getExt2())) && (requestOrder.getExt2().length() > 128)) {
			throw new TrxException("TX10017", "扩展参数2不合法");
		}

		int payType = requestOrder.getPayType();
		if (payType != 5) {
			throw new TrxException("TX10018", "支付方式不合法");
		}

		int signType = requestOrder.getSignType();
		if ((signType != 0) && (signType != 1)) {
			throw new TrxException("TX10019", "签名类型不合法");
		}

		String userName = requestOrder.getUserName();
		if ((StringUtil.isEmpty(userName)) || (userName.length() > 20)) {
			throw new TrxException("TX10020", "实名交易-用户真实姓名不合法");
		}

		String credentialsType = requestOrder.getCredentialsType();
		if ((StringUtil.isEmpty(credentialsType)) || ((!"01".equals(credentialsType)) && (!"02".equals(credentialsType)) && (!"03".equals(credentialsType)) && (!"04".equals(credentialsType)) && (!"05".equals(credentialsType)) && (!"06".equals(credentialsType)) && (!"07".equals(credentialsType)) && (!"99".equals(credentialsType)))) {
			throw new TrxException("TX10021", "实名交易-证件类型不合法");
		}

		if ((StringUtil.isEmpty(requestOrder.getCredentialsNo())) || (requestOrder.getCredentialsNo().length() > 20)) {
			throw new TrxException("TX10022", "实名交易-证件号码不合法");
		}

		if ((StringUtil.isEmpty(requestOrder.getTxOrgId())) || (requestOrder.getTxOrgId().length() > 11)) {
			throw new TrxException("TX10023", "实名交易-指定交易机构号不合法");
		}

		if ((StringUtil.isEmpty(requestOrder.getPan())) || (requestOrder.getPan().length() > 19)) {
			throw new TrxException("TX10024", "实名交易-卡号不合法");
		}
	}

	private void checkRefundSignParams(RequestOrder requestOrder) throws TrxException {
		if (StringUtil.isEmpty(requestOrder.getMerchantId())) {
			throw new TrxException("TX10006", "商户号不合法");
		}

		if (!"v1.3".equals(requestOrder.getVersion())) {
			throw new TrxException("TX10005", "版本号不合法");
		}

		int signType = requestOrder.getSignType();
		if ((signType != 0) && (signType != 1)) {
			throw new TrxException("TX10019", "签名类型不合法");
		}

		String orderId = requestOrder.getOrderNo();
		if ((StringUtil.isEmpty(orderId)) || (orderId.length() > 50) || (!isPatternMatcher(orderIdPattern, orderId))) {
			throw new TrxException("TX10009", "订单号不合法");
		}

		Long amount = requestOrder.getRefundAmount();
		if ((null == amount) || (amount.longValue() <= 0L) || (!isPatternMatcher(orderAmountPattern, amount.toString()))) {
			throw new TrxException("TX10010", "订单金额不合法");
		}

		if (StringUtil.isEmpty(requestOrder.getOrderDatetime())) {
			throw new TrxException("TX10011", "订单时间不能为空");
		}
		try {
			SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");

			formatter.parse(requestOrder.getOrderDatetime());
		} catch (ParseException e) {
			throw new TrxException("TX10012", "订单时间不合法");
		}
	}

	private void checkQuerySignParams(RequestOrder requestOrder) throws TrxException {
		if (StringUtil.isEmpty(requestOrder.getMerchantId())) {
			throw new TrxException("TX10006", "商户号不合法");
		}

		if (!"v1.5".equals(requestOrder.getVersion())) {
			throw new TrxException("TX10005", "版本号不合法");
		}

		int signType = requestOrder.getSignType();
		if ((signType != 0) && (signType != 1)) {
			throw new TrxException("TX10019", "签名类型不合法");
		}

		String orderId = requestOrder.getOrderNo();
		if ((StringUtil.isEmpty(orderId)) || (orderId.length() > 50) || (!isPatternMatcher(orderIdPattern, orderId))) {
			throw new TrxException("TX10009", "订单号不合法");
		}

		if (StringUtil.isEmpty(requestOrder.getOrderDatetime())) {
			throw new TrxException("TX10011", "订单时间不能为空");
		}
		try {
			SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");

			formatter.parse(requestOrder.getOrderDatetime());
		} catch (ParseException e) {
			throw new TrxException("TX10012", "订单时间不合法");
		}

		if (StringUtil.isEmpty(requestOrder.getQueryDateTime())) {
			throw new TrxException("TX10030", "查询时间不合法");
		}
		try {
			SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");

			formatter.parse(requestOrder.getQueryDateTime());
		} catch (ParseException e) {
			throw new TrxException("TX10031", "查询时间不能为空");
		}
	}

	private void checkPaymentSignParams(RequestOrder requestOrder) throws TrxException {
		int charset = requestOrder.getInputCharset();
		if ((charset >= 0) && (charset != 1) && (charset != 2) && (charset != 3)) {
			throw new TrxException("TX10001", "不支持的字符编码格式");
		}

		String pickupUrl = requestOrder.getPickupUrl();
		String receiveUrl = requestOrder.getReceiveUrl();
		if ((StringUtil.isEmpty(pickupUrl)) && (StringUtil.isEmpty(receiveUrl))) {
			throw new TrxException("TX10002", "取货地址和通知地址不能同时为空");
		}

		if ((!StringUtil.isEmpty(pickupUrl)) && (!pickupUrl.startsWith("http"))) {
			throw new TrxException("TX10003", "取货地址不合法");
		}

		if ((!StringUtil.isEmpty(receiveUrl)) && (!receiveUrl.startsWith("http"))) {
			throw new TrxException("TX10004", "通知地址不合法");
		}

		if (!"v1.0".equals(requestOrder.getVersion())) {
			throw new TrxException("TX10005", "版本号不合法");
		}

		if (StringUtil.isEmpty(requestOrder.getMerchantId())) {
			throw new TrxException("TX10006", "商户号不合法");
		}

		if ((!StringUtil.isEmpty(requestOrder.getPayerName())) && (requestOrder.getPayerName().length() > 32)) {
			throw new TrxException("TX10007", "付款人名称不合法");
		}

		if ((!StringUtil.isEmpty(requestOrder.getPayerEmail())) && (requestOrder.getPayerEmail().length() > 50)) {
			throw new TrxException("TX10008", "付款人的email地址不合法");
		}

		String orderId = requestOrder.getOrderNo();
		if ((StringUtil.isEmpty(orderId)) || (orderId.length() > 50) || (!isPatternMatcher(orderIdPattern, orderId))) {
			throw new TrxException("TX10009", "订单号不合法");
		}

		Long amount = requestOrder.getOrderAmount();
		if ((null == amount) || (amount.longValue() <= 0L) || (!isPatternMatcher(orderAmountPattern, amount.toString()))) {
			throw new TrxException("TX10010", "订单金额不合法");
		}

		if (StringUtil.isEmpty(requestOrder.getOrderDatetime())) {
			throw new TrxException("TX10011", "订单时间不能为空");
		}
		try {
			SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");

			formatter.parse(requestOrder.getOrderDatetime());
		} catch (ParseException e) {
			throw new TrxException("TX10012", "订单时间不合法");
		}

		if ((!StringUtil.isEmpty(requestOrder.getProductName())) && (requestOrder.getProductName().length() > 256)) {
			throw new TrxException("TX10013", "产品名称不合法");
		}

		if ((!StringUtil.isEmpty(requestOrder.getProductId())) && (requestOrder.getProductId().length() > 20)) {
			throw new TrxException("TX10014", "产品代码不合法");
		}

		if ((!StringUtil.isEmpty(requestOrder.getProductDesc())) && (requestOrder.getProductDesc().length() > 400)) {
			throw new TrxException("TX10015", "产品描述信息不合法");
		}

		if ((!StringUtil.isEmpty(requestOrder.getExt1())) && (requestOrder.getExt1().length() > 128)) {
			throw new TrxException("TX10016", "扩展参数1不合法");
		}

		if ((!StringUtil.isEmpty(requestOrder.getExt2())) && (requestOrder.getExt2().length() > 128)) {
			throw new TrxException("TX10017", "扩展参数2不合法");
		}

		int payType = requestOrder.getPayType();
		if (payType < 0) {
			throw new TrxException("TX10018", "支付方式不合法");
		}

		if ((!StringUtil.isEmpty(requestOrder.getIssuerId())) && (payType <= 0)) {
			throw new TrxException("TX10025", "未指定支付方式");
		}

		int signType = requestOrder.getSignType();
		if ((signType != 0) && (signType != 1)) {
			throw new TrxException("TX10019", "签名类型不合法");
		}

		String tradeNature = requestOrder.getTradeNature();
		String orderCurrency = requestOrder.getOrderCurrency();
		if (StringUtil.isEmpty(tradeNature)) {
			if ((!StringUtil.isEmpty(orderCurrency)) && (!"0".equals(orderCurrency)) && (!"156".equals(orderCurrency))) {
				throw new TrxException("TX10029", "币种非人民币时，贸易类型不能为空");
			}

		} else if ((!"GOODS".equals(tradeNature)) && (!"SERVICES".equals(tradeNature)))
			throw new TrxException("TX10028", "上送贸易类型字段有误，贸易类型字段值必须是GOODS或SERVICES");
	}

	protected boolean isPatternMatcher(Pattern p, String matherStr) {
		Matcher m = p.matcher(matherStr);
		return m.matches();
	}

}