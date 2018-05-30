package com.chinaums.pay.api.entities;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;

public class QueryEntity extends BaseEntity {
	public static final String[] signParams = { "ReqTime", "OrderDate", "MerOrderId", "TransId", "MerId", "MerTermId", "Reserve" };

	public static final String[] verifyParams = { "OrderTime", "OrderDate", "MerOrderId", "TransType", "TransAmt", "MerId", "MerTermId", "TransId", "TransState", "RefId", "Reserve", "RespCode", "RespMsg" };

	private String TransCode = "201203";
	private String ReqTime;
	private String OrderDate;
	private String MerOrderId;
	private String TransId;
	private String MerId;
	private String MerTermId;
	private String Reserve;
	private String MerSign;
	private String Signature;
	private String OrderTime;
	private String TransType;
	private String TransAmt;
	private String TransState;
	private String RefId;
	private String LiqDate;
	private String RespCode;
	private String RespMsg;

	public String getTransCode() {
		return this.TransCode;
	}

	public String getReqTime() {
		return this.ReqTime;
	}

	public void setReqTime(String reqTime) {
		this.ReqTime = reqTime;
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

	public String getTransId() {
		return this.TransId;
	}

	public void setTransId(String transId) {
		this.TransId = transId;
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

	public String getReserve() {
		return this.Reserve;
	}

	public void setReserve(String reserve) {
		this.Reserve = reserve;
	}

	public String getMerSign() {
		return this.MerSign;
	}

	public void setMerSign(String merSign) {
		this.MerSign = merSign;
	}

	public String getSignature() {
		return this.Signature;
	}

	public void setSignature(String signature) {
		this.Signature = signature;
	}

	public String getOrderTime() {
		return this.OrderTime;
	}

	public void setOrderTime(String orderTime) {
		this.OrderTime = orderTime;
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

	public String getTransState() {
		return this.TransState;
	}

	public void setTransState(String transState) {
		this.TransState = transState;
	}

	public String getRefId() {
		return this.RefId;
	}

	public void setRefId(String refId) {
		this.RefId = refId;
	}

	public String getLiqDate() {
		return this.LiqDate;
	}

	public void setLiqDate(String liqDate) {
		this.LiqDate = liqDate;
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

	public static String[] getSignparams() {
		return signParams!=null?signParams.clone():null;
	}

	public static String[] getVerifyparams() {
		return verifyParams!=null?verifyParams.clone():null;
	}

	public String convertToJsonString() {
		JSONObject json = new JSONObject();

		json.put("TransCode", this.TransCode);
		json.put("ReqTime", this.ReqTime);
		json.put("OrderDate", this.OrderDate);
		json.put("MerOrderId", this.MerOrderId);
		json.put("TransId", this.TransId);
		json.put("MerId", this.MerId);
		json.put("MerTermId", this.MerTermId);
		json.put("Reserve", this.Reserve);
		json.put("MerSign", this.MerSign);

		String jsonString = json.toString();
		return jsonString;
	}

	public void parseFromJsonString(String json) {
		JSONObject jsonObject = JSON.parseObject(json);

		this.OrderTime = ((String) jsonObject.get("OrderTime"));
		this.OrderDate = ((String) jsonObject.get("OrderDate"));
		this.MerOrderId = ((String) jsonObject.get("MerOrderId"));
		this.TransType = ((String) jsonObject.get("TransType"));
		this.TransAmt = ((String) jsonObject.get("TransAmt"));
		this.MerId = ((String) jsonObject.get("MerId"));
		this.MerTermId = ((String) jsonObject.get("MerTermId"));
		this.TransId = ((String) jsonObject.get("TransId"));
		this.TransState = ((String) jsonObject.get("TransState"));
		this.RefId = ((String) jsonObject.get("RefId"));
		this.LiqDate = ((String) jsonObject.get("LiqDate"));
		this.Reserve = ((String) jsonObject.get("Reserve"));
		this.RespCode = ((String) jsonObject.get("RespCode"));
		this.RespMsg = ((String) jsonObject.get("RespMsg"));
		this.Signature = ((String) jsonObject.get("Signature"));
	}

	public String buildVerifyString() {
		return buildStringFromFields(verifyParams);
	}

	public String buildSignString() {
		return buildStringFromFields(signParams);
	}
}