package com.chinaums.pay.api.entities;

import java.util.HashMap;
import java.util.Map;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;

public class OrderEntityAuthToken extends BaseEntity {
	public static final String[] signParams = { "MerOrderId", "TransType", "MerId", "MerTermId", "TransId", "MerPlatTime", "MerOrderState", "Reserve", "AuthToken", "MerUserCode" };

	public static final String[] verifyParams = { "OrderTime", "OrderDate", "MerOrderId", "TransType", "TransAmt", "MerId", "MerTermId", "TransId", "TransState", "RefId", "Account", "TransDesc", "Reserve", "AuthToken", "MerUserCode" };

	private String TransCode = "201202";
	private String OrderTime;
	private String EffectiveTime;
	private String OrderDate;
	private String MerOrderId;
	private String TransType;
	private String TransAmt;
	private String MerId;
	private String MerTermId;
	private String NotifyUrl;
	private String Reserve;
	private String OrderDesc;
	private String MerSign;
	private String ChrCode;
	private String TransId;
	private String RespCode;
	private String RespMsg;
	private String Signature;
	private String AuthToken;
	private String MerUserCode;

	public String getAuthToken() {
		return this.AuthToken;
	}

	public void setAuthToken(String authToken) {
		this.AuthToken = authToken;
	}

	public String getMerUserCode() {
		return this.MerUserCode;
	}

	public void setMerUserCode(String merUserCode) {
		this.MerUserCode = merUserCode;
	}

	public static String[] getVerifyparams() {
		return verifyParams!=null?verifyParams.clone():null;
	}

	public void setTransCode(String transCode) {
		this.TransCode = transCode;
	}

	public String getTransCode() {
		return this.TransCode;
	}

	public String getOrderTime() {
		return this.OrderTime;
	}

	public void setOrderTime(String orderTime) {
		this.OrderTime = orderTime;
	}

	public String getEffectiveTime() {
		return this.EffectiveTime;
	}

	public void setEffectiveTime(String effectiveTime) {
		this.EffectiveTime = effectiveTime;
	}

	public String getOrderDate() {
		return this.OrderDate;
	}

	public void setOrderDate(String orderDate) {
		this.OrderDate = orderDate;
	}

	public String getMerOrderId() {
		return this.MerOrderId;
	}

	public void setMerOrderId(String merOrderId) {
		this.MerOrderId = merOrderId;
	}

	public String getTransType() {
		return this.TransType;
	}

	public void setTransType(String transType) {
		this.TransType = transType;
	}

	public String getTransAmt() {
		return this.TransAmt;
	}

	public void setTransAmt(String transAmt) {
		this.TransAmt = transAmt;
	}

	public String getMerId() {
		return this.MerId;
	}

	public void setMerId(String merId) {
		this.MerId = merId;
	}

	public String getMerTermId() {
		return this.MerTermId;
	}

	public void setMerTermId(String merTermId) {
		this.MerTermId = merTermId;
	}

	public String getNotifyUrl() {
		return this.NotifyUrl;
	}

	public void setNotifyUrl(String notifyUrl) {
		this.NotifyUrl = notifyUrl;
	}

	public String getReserve() {
		return this.Reserve;
	}

	public void setReserve(String reserve) {
		this.Reserve = reserve;
	}

	public String getOrderDesc() {
		return this.OrderDesc;
	}

	public void setOrderDesc(String orderDesc) {
		this.OrderDesc = orderDesc;
	}

	public String getMerSign() {
		return this.MerSign;
	}

	public void setMerSign(String merSign) {
		this.MerSign = merSign;
	}

	public String getChrCode() {
		return this.ChrCode;
	}

	public void setChrCode(String chrCode) {
		this.ChrCode = chrCode;
	}

	public String getTransId() {
		return this.TransId;
	}

	public void setTransId(String transId) {
		this.TransId = transId;
	}

	public String getRespCode() {
		return this.RespCode;
	}

	public void setRespCode(String respCode) {
		this.RespCode = respCode;
	}

	public String getRespMsg() {
		return this.RespMsg;
	}

	public void setRespMsg(String respMsg) {
		this.RespMsg = respMsg;
	}

	public String getSignature() {
		return this.Signature;
	}

	public void setSignature(String signature) {
		this.Signature = signature;
	}

	public static String[] getSignparams() {
		return signParams!=null?signParams.clone():null;
	}

	public String convertToJsonString() {
		Map<String, String> data = new HashMap<String, String>();

		data.put("TransCode", this.TransCode);
		data.put("OrderTime", this.OrderTime);
		data.put("EffectiveTime", this.EffectiveTime);
		data.put("OrderDate", this.OrderDate);
		data.put("MerOrderId", this.MerOrderId);
		data.put("TransType", this.TransType);
		data.put("TransAmt", this.TransAmt);
		data.put("MerId", this.MerId);
		data.put("MerTermId", this.MerTermId);
		data.put("NotifyUrl", this.NotifyUrl);
		data.put("Reserve", this.Reserve);
		data.put("OrderDesc", this.OrderDesc);

		data.put("MerSign", this.MerSign);
		data.put("AuthToken", this.AuthToken);
		data.put("MerUserCode", this.MerUserCode);

		String jsonString = JSON.toJSONString(data);
		return jsonString;
	}

	public void parseFromJsonString(String json) {
		JSONObject jsonObject = JSON.parseObject(json);

		this.MerOrderId = ((String) jsonObject.get("MerOrderId"));
		this.ChrCode = ((String) jsonObject.get("ChrCode"));
		this.TransId = ((String) jsonObject.get("TransId"));
		this.Reserve = ((String) jsonObject.get("Reserve"));
		this.RespCode = ((String) jsonObject.get("RespCode"));
		this.RespMsg = ((String) jsonObject.get("RespMsg"));
		this.Signature = ((String) jsonObject.get("Signature"));
		this.AuthToken = ((String) jsonObject.get("AuthToken"));
		this.MerUserCode = ((String) jsonObject.get("MerUserCode"));
	}

	public String buildVerifyString() {
		return buildStringFromFields(verifyParams);
	}

	public String buildSignString() {
		return buildStringFromFields(signParams);
	}
}