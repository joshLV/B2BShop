package com.allinpay.ets.client;

public class TrxException extends Exception {
	private static final long serialVersionUID = 1838905414L;
	public static final String ERROR_CODE_1001 = "TX10001";
	public static final String ERROR_CODE_1002 = "TX10002";
	public static final String ERROR_CODE_1003 = "TX10003";
	public static final String ERROR_CODE_1004 = "TX10004";
	public static final String ERROR_CODE_1005 = "TX10005";
	public static final String ERROR_CODE_1006 = "TX10006";
	public static final String ERROR_CODE_1007 = "TX10007";
	public static final String ERROR_CODE_1008 = "TX10008";
	public static final String ERROR_CODE_1009 = "TX10009";
	public static final String ERROR_CODE_1010 = "TX10010";
	public static final String ERROR_CODE_1011 = "TX10011";
	public static final String ERROR_CODE_1012 = "TX10012";
	public static final String ERROR_CODE_1013 = "TX10013";
	public static final String ERROR_CODE_1014 = "TX10014";
	public static final String ERROR_CODE_1015 = "TX10015";
	public static final String ERROR_CODE_1016 = "TX10016";
	public static final String ERROR_CODE_1017 = "TX10017";
	public static final String ERROR_CODE_1018 = "TX10018";
	public static final String ERROR_CODE_1019 = "TX10019";
	public static final String ERROR_CODE_1020 = "TX10020";
	public static final String ERROR_CODE_1021 = "TX10021";
	public static final String ERROR_CODE_1022 = "TX10022";
	public static final String ERROR_CODE_1023 = "TX10023";
	public static final String ERROR_CODE_1024 = "TX10024";
	public static final String ERROR_CODE_1025 = "TX10025";
	public static final String ERROR_CODE_1026 = "TX10026";
	public static final String ERROR_CODE_1027 = "TX10027";
	public static final String ERROR_CODE_1028 = "TX10028";
	public static final String ERROR_CODE_1029 = "TX10029";
	public static final String ERROR_CODE_1030 = "TX10030";
	public static final String ERROR_CODE_1031 = "TX10031";
	public static final String ERROR_CODE_2001 = "TX20001";
	public static final String ERROR_MSG_1001 = "不支持的字符编码格式";
	public static final String ERROR_MSG_1002 = "取货地址和通知地址不能同时为空";
	public static final String ERROR_MSG_1003 = "取货地址不合法";
	public static final String ERROR_MSG_1004 = "通知地址不合法";
	public static final String ERROR_MSG_1005 = "版本号不合法";
	public static final String ERROR_MSG_1006 = "商户号不合法";
	public static final String ERROR_MSG_1007 = "付款人名称不合法";
	public static final String ERROR_MSG_1008 = "付款人的email地址不合法";
	public static final String ERROR_MSG_1009 = "订单号不合法";
	public static final String ERROR_MSG_1010 = "订单金额不合法";
	public static final String ERROR_MSG_1011 = "订单时间不能为空";
	public static final String ERROR_MSG_1012 = "订单时间不合法";
	public static final String ERROR_MSG_1013 = "产品名称不合法";
	public static final String ERROR_MSG_1014 = "产品代码不合法";
	public static final String ERROR_MSG_1015 = "产品描述信息不合法";
	public static final String ERROR_MSG_1016 = "扩展参数1不合法";
	public static final String ERROR_MSG_1017 = "扩展参数2不合法";
	public static final String ERROR_MSG_1018 = "支付方式不合法";
	public static final String ERROR_MSG_1019 = "签名类型不合法";
	public static final String ERROR_MSG_1020 = "实名交易-用户真实姓名不合法";
	public static final String ERROR_MSG_1021 = "实名交易-证件类型不合法";
	public static final String ERROR_MSG_1022 = "实名交易-证件号码不合法";
	public static final String ERROR_MSG_1023 = "实名交易-指定交易机构号不合法";
	public static final String ERROR_MSG_1024 = "实名交易-卡号不合法";
	public static final String ERROR_MSG_1025 = "未指定支付方式";
	public static final String ERROR_MSG_1026 = "付款人证件号不合法";
	public static final String ERROR_MSG_1027 = "付款人支付卡号不合法";
	public static final String ERROR_MSG_1028 = "上送贸易类型字段有误，贸易类型字段值必须是GOODS或SERVICES";
	public static final String ERROR_MSG_1029 = "币种非人民币时，贸易类型不能为空";
	public static final String ERROR_MSG_1030 = "查询时间不合法";
	public static final String ERROR_MSG_1031 = "查询时间不能为空";
	public static final String ERROR_MSG_2001 = "签名异常";
	public String iCode = "";

	public String iDetailMessage = "";

	public TrxException(String aCode, String aMessage) {
		super(aMessage);
		this.iCode = aCode.trim();
	}

	public TrxException(String aCode, String aMessage, String aDetailMessage) {
		super(aMessage.trim());
		this.iCode = aCode.trim();
		this.iDetailMessage = aDetailMessage.trim();
	}

	public String getCode() {
		return this.iCode;
	}

	public String getMessage() {
		return super.getMessage();
	}

	public String getDetailMessage() {
		return this.iDetailMessage;
	}
}