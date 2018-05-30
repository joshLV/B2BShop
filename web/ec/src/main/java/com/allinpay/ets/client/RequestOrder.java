package com.allinpay.ets.client;

import com.allinpay.ets.client.web.MerchantClient;
import java.io.Serializable;

public class RequestOrder
  implements Serializable
{
  private static final long serialVersionUID = 1838905414L;
  private int inputCharset = -1;
  private String pickupUrl;
  private String receiveUrl;
  private String version;
  private int language = -1;
  private int signType;
  private String merchantId;
  private String payerName;
  private String payerEmail;
  private String payerTelephone;
  private String payerIDCard;
  private String pid;
  private String orderNo;
  private Long orderAmount = new Long(-1L);
  private String orderCurrency;
  private String orderDatetime;
  private String orderExpireDatetime;
  private String productName;
  private Long productPrice = new Long(-1L);

  private int productNum = -1;
  private String productId;
  private String productDesc;
  private String ext1;
  private String ext2;
  private int payType = -1;
  private String issuerId;
  private String signMsg;
  private String key;
  private String queryDateTime;
  private String userName;
  private String credentialsType;
  private String credentialsNo;
  private String txOrgId;
  private String pan;
  private String tradeNature;
  private Long refundAmount = new Long(-1L);
  private String extTL;

  public String getTradeNature()
  {
    return this.tradeNature;
  }

  public void setTradeNature(String tradeNature) {
    this.tradeNature = tradeNature;
  }

  public void setAccConfig(AccConfig accConfig)
  {
    if ((null != accConfig) && (!StringUtil.isEmpty(accConfig.toString())))
      setExtTLForTag(accConfig.toString());
  }

  private void setExtTLForTag(String str)
  {
    if (StringUtil.isEmpty(this.extTL))
      this.extTL = ("<TL>" + str + "</TL>");
    else if (this.extTL.indexOf("<TL>") == 0)
      this.extTL = (this.extTL.substring(0, 4) + str + this.extTL.substring(4));
  }

  public String getExtTL()
  {
    return this.extTL;
  }

  public void setExtTL(String extTL) {
    this.extTL = extTL;
  }

  public Long getRefundAmount() {
    return this.refundAmount;
  }

  public void setRefundAmount(Long refundAmount) {
    this.refundAmount = refundAmount;
  }

  public String getPan() {
    return this.pan;
  }

  public void setPan(String pan) {
    this.pan = pan;
  }

  public String getUserName() {
    return this.userName;
  }

  public void setUserName(String userName) {
    this.userName = userName;
  }

  public String getCredentialsType() {
    return this.credentialsType;
  }

  public void setCredentialsType(String credentialsType) {
    this.credentialsType = credentialsType;
  }

  public String getCredentialsNo() {
    return this.credentialsNo;
  }

  public void setCredentialsNo(String credentialsNo) {
    this.credentialsNo = credentialsNo;
  }

  public String getTxOrgId() {
    return this.txOrgId;
  }

  public void setTxOrgId(String txOrgId) {
    this.txOrgId = txOrgId;
  }

  public int getInputCharset()
  {
    return this.inputCharset;
  }

  public void setInputCharset(int inputCharset) {
    this.inputCharset = inputCharset;
  }

  public String getPickupUrl() {
    return this.pickupUrl;
  }

  public void setPickupUrl(String pickupUrl) {
    this.pickupUrl = pickupUrl;
  }

  public String getReceiveUrl() {
    return this.receiveUrl;
  }

  public void setReceiveUrl(String receiveUrl) {
    this.receiveUrl = receiveUrl;
  }

  public String getVersion() {
    return this.version;
  }

  public void setVersion(String version) {
    this.version = version;
  }

  public int getLanguage() {
    return this.language;
  }

  public void setLanguage(int language) {
    this.language = language;
  }

  public int getSignType() {
    return this.signType;
  }

  public void setSignType(int signType) {
    this.signType = signType;
  }

  public String getMerchantId() {
    return this.merchantId;
  }

  public void setMerchantId(String merchantId) {
    this.merchantId = merchantId;
  }

  public String getPayerName() {
    return this.payerName;
  }

  public void setPayerName(String payerName) {
    this.payerName = payerName;
  }

  public String getPayerEmail() {
    return this.payerEmail;
  }

  public void setPayerEmail(String payerEmail) {
    this.payerEmail = payerEmail;
  }

  public String getPayerTelephone() {
    return this.payerTelephone;
  }

  public void setPayerTelephone(String payerTelephone) {
    this.payerTelephone = payerTelephone;
  }

  public String getPayerIDCard() {
    return this.payerIDCard;
  }

  public void setPayerIDCard(String payerIDCard) {
    this.payerIDCard = payerIDCard;
  }

  public String getPid() {
    return this.pid;
  }

  public void setPid(String pid) {
    this.pid = pid;
  }

  public String getOrderNo() {
    return this.orderNo;
  }

  public void setOrderNo(String orderNo) {
    this.orderNo = orderNo;
  }

  public Long getOrderAmount() {
    return this.orderAmount;
  }

  public void setOrderAmount(Long orderAmount) {
    this.orderAmount = orderAmount;
  }

  public String getOrderCurrency() {
    return this.orderCurrency;
  }

  public void setOrderCurrency(String orderCurrency) {
    this.orderCurrency = orderCurrency;
  }

  public String getOrderDatetime() {
    return this.orderDatetime;
  }

  public void setOrderDatetime(String orderDatetime) {
    this.orderDatetime = orderDatetime;
  }

  public String getOrderExpireDatetime() {
    return this.orderExpireDatetime;
  }

  public void setOrderExpireDatetime(String orderExpireDatetime) {
    this.orderExpireDatetime = orderExpireDatetime;
  }

  public String getProductName() {
    return this.productName;
  }

  public void setProductName(String productName) {
    this.productName = productName;
  }

  public Long getProductPrice() {
    return this.productPrice;
  }

  public void setProductPrice(Long productPrice) {
    this.productPrice = productPrice;
  }

  public int getProductNum() {
    return this.productNum;
  }

  public void setProductNum(int productNum) {
    this.productNum = productNum;
  }

  public String getProductId() {
    return this.productId;
  }

  public void setProductId(String productId) {
    this.productId = productId;
  }

  public String getProductDesc() {
    return this.productDesc;
  }

  public String getProductDescription() {
    return this.productDesc;
  }

  public void setProductDesc(String productDesc) {
    this.productDesc = productDesc;
  }

  public void setProductDescription(String productDesc) {
    this.productDesc = productDesc;
  }

  public String getExt1() {
    return this.ext1;
  }

  public void setExt1(String ext1) {
    this.ext1 = ext1;
  }

  public String getExt2() {
    return this.ext2;
  }

  public void setExt2(String ext2) {
    this.ext2 = ext2;
  }

  public int getPayType() {
    return this.payType;
  }

  public void setPayType(int payType) {
    this.payType = payType;
  }

  public String getIssuerId() {
    return this.issuerId;
  }

  public void setIssuerId(String issuerId) {
    this.issuerId = issuerId;
  }

  public String getSignMsg() {
    return this.signMsg;
  }

  public void setSignMsg(String signMsg) {
    this.signMsg = signMsg;
  }

  public String getKey() {
    return this.key;
  }

  public void setKey(String key) {
    this.key = key;
  }

  public String getSrc() {
    MerchantClient mc = new MerchantClient();
    String signSrc = mc.generateSignSrc(this);

    return signSrc;
  }

  public String doSign()
  {
    String SignStr = null;
    try {
      MerchantClient mc = new MerchantClient();
      SignStr = mc.sign(this);
    } catch (TrxException e) {
      return "there is Exception:" + e.getCode() + " " + e.getMessage();
    } catch (Exception e) {
      return "there is Exception:" + e.getMessage();
    }
    return SignStr;
  }

  public String getQueryDateTime() {
    return this.queryDateTime;
  }

  public void setQueryDateTime(String queryDateTime) {
    this.queryDateTime = queryDateTime;
  }
}