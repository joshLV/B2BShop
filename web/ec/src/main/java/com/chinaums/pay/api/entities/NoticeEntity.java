package com.chinaums.pay.api.entities;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.alibaba.fastjson.JSON;

public class NoticeEntity extends BaseEntity {
	
	public static final String[] signParams = { "MerOrderId", "TransType", "MerId", "MerTermId", "TransId", "MerPlatTime", "MerOrderState", "Reserve" };

	public static final String[] verifyParams = { "OrderTime", "OrderDate", "MerOrderId", "TransType", "TransAmt", "MerId", "MerTermId", "TransId", "TransState", "RefId", "Account", "TransDesc", "Reserve" };

	private String TransCode = "201202";
	private String OrderTime;
	private String OrderDate;
	private String MerOrderId;
	private String TransType;
	private String TransAmt;
	private String MerId;
	private String MerTermId;
	private String MerSign;
	private String TransId;
	private String TransState;
	private String RefId;
	private String Account;
	private String Reserve;
	private String TransDesc;
	private String Signature;
	private String MerPlatTime;
	private String MerOrderState;
	private String LiqDate;

	public String getTransCode() {
		return this.TransCode;
	}

	public String getOrderTime() {
		return this.OrderTime;
	}

	public void setOrderTime(String orderTime) {
		this.OrderTime = orderTime;
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

	public String getMerSign() {
		return this.MerSign;
	}

	public void setMerSign(String merSign) {
		this.MerSign = merSign;
	}

	public String getMerTermId() {
		return this.MerTermId;
	}

	public void setMerTermId(String merTermId) {
		this.MerTermId = merTermId;
	}

	public String getTransId() {
		return this.TransId;
	}

	public void setTransId(String transId) {
		this.TransId = transId;
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

	public String getAccount() {
		return this.Account;
	}

	public void setAccount(String account) {
		this.Account = account;
	}

	public String getReserve() {
		return this.Reserve;
	}

	public void setReserve(String reserve) {
		this.Reserve = reserve;
	}

	public String getTransDesc() {
		return this.TransDesc;
	}

	public void setTransDesc(String transDesc) {
		this.TransDesc = transDesc;
	}

	public String getSignature() {
		return this.Signature;
	}

	public void setSignature(String signature) {
		this.Signature = signature;
	}

	public String getMerPlatTime() {
		return this.MerPlatTime;
	}

	public void setMerPlatTime(String merPlatTime) {
		this.MerPlatTime = merPlatTime;
	}

	public String getMerOrderState() {
		return this.MerOrderState;
	}

	public void setMerOrderState(String merOrderState) {
		this.MerOrderState = merOrderState;
	}

	public String getLiqDate() {
		return this.LiqDate;
	}

	public void setLiqDate(String liqDate) {
		this.LiqDate = liqDate;
	}

	public static String[] getSignparams() {
		return signParams.clone();
	}

	public static String[] getVerifyparams() {
		return verifyParams.clone();
	}

	public String convertToJsonString() {
		Map<String, String> data = new HashMap<String, String>();
		data.put("TransCode", this.TransCode);
		data.put("MerOrderId", this.MerOrderId);
		data.put("TransType", this.TransType);
		data.put("MerId", this.MerId);
		data.put("MerTermId", this.MerTermId);

		data.put("TransId", this.TransId);
		data.put("MerPlatTime", this.MerPlatTime);
		data.put("MerOrderState", this.MerOrderState);
		data.put("Reserve", this.Reserve);

		data.put("MerSign", this.MerSign);

		String jsonString = JSON.toJSONString(data);
		return jsonString;
	}

	public void parseFromHttpServletRequest(HttpServletRequest request) {
		this.OrderTime = request.getParameter("OrderTime");
		this.OrderDate = request.getParameter("OrderDate");
		this.MerOrderId = request.getParameter("MerOrderId");
		this.TransType = request.getParameter("TransType");
		this.TransAmt = request.getParameter("TransAmt");
		this.MerId = request.getParameter("MerId");
		this.MerTermId = request.getParameter("MerTermId");
		this.TransId = request.getParameter("TransId");
		this.TransState = request.getParameter("TransState");
		this.RefId = request.getParameter("RefId");
		this.Account = request.getParameter("Account");
		this.TransDesc = request.getParameter("TransDesc");
		this.Reserve = request.getParameter("Reserve");
		this.LiqDate = request.getParameter("LiqDate");
		this.Signature = request.getParameter("Signature");
	}

	public String buildVerifyString() {
		return buildStringFromFields(verifyParams);
	}

	public String buildSignString() {
		return buildStringFromFields(signParams);
	}

}