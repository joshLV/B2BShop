package com.weixin.common;

import net.deepdragon.weipu.tools.PropertiesUtil;

/**
 * User: rizenguo
 * Date: 2014/10/29
 * Time: 14:40
 * 这里放置各种配置数据
 */
public class Configure {
	//这个就是自己要保管好的私有Key了（切记只能放在自己的后台代码里，不能放在任何可能被看到源代码的客户端程序中）
	// 每次自己Post数据给API的时候都要用这个key来对所有字段进行签名，生成的签名会放在Sign这个字段，API收到Post数据的时候也会用同样的签名算法对Post过来的数据进行签名和验证
	// 收到API的返回的时候也要用这个key来对返回的数据算下签名，跟API的Sign数据进行比较，如果值不一致，有可能数据被第三方给篡改

	private static String configureFile = "wxpay." + PropertiesUtil.getValue("project.properties", "project.name") + ".properties";
	private static String key = PropertiesUtil.getValue(configureFile, "key");

	//微信分配的公众号ID（开通公众号之后可以获取到）
	private static String appID = PropertiesUtil.getValue(configureFile, "appid");

	//微信支付分配的商户号ID（开通公众号的微信支付功能之后可以获取到）
	private static String mchID =  PropertiesUtil.getValue(configureFile, "mchid");

	public static String appsecret = PropertiesUtil.getValue(configureFile, "appsecret");

	//受理模式下给子商户分配的子商户号
	private static String subMchID = "";

	//HTTPS证书的本地路径
	private static String certLocalPath = PropertiesUtil.getValue(configureFile, "certpath");

	//HTTPS证书密码，默认密码等于商户号MCHID
	private static String certPassword = PropertiesUtil.getValue(configureFile, "certpasswd");


	private static String mchid_app = PropertiesUtil.getValue(configureFile, "mchid_app");
	private static String key_app = PropertiesUtil.getValue(configureFile, "key_app");
	private static String appid_app = PropertiesUtil.getValue(configureFile, "appid_app");
	private static String appsecret_app = PropertiesUtil.getValue(configureFile, "appsecret_app");

	//是否使用异步线程的方式来上报API测速，默认为异步模式
	private static boolean useThreadToDoReport = false;
	public enum WX_TRADE_TYPE { JSAPI, APP, NATIVE }
	public static String TRADE_TYPE = "trade_type";
	public static String ENCODING_CHARSET = "UTF-8";
	public static String TRADE_TYPE_JSAPI = "JSAPI";
	public static String TRADE_TYPE_NATIVE = "NATIVE";
	public static String TRADE_TYPE_APP = "APP";
	public static String FEE_TYPE_CNY = "CNY";

	//以下是几个API的路径：
	//1）被扫支付API
	public static String PAY_API = "https://api.mch.weixin.qq.com/pay/micropay";

	//2）被扫支付查询API
	public static String PAY_QUERY_API = "https://api.mch.weixin.qq.com/pay/orderquery";

	//3）退款API
	public static String REFUND_API = "https://api.mch.weixin.qq.com/secapi/pay/refund";

	//4）退款查询API
	public static String REFUND_QUERY_API = "https://api.mch.weixin.qq.com/pay/refundquery";

	//5）撤销API
	public static String REVERSE_API = "https://api.mch.weixin.qq.com/secapi/pay/reverse";

	//6）下载对账单API
	public static String DOWNLOAD_BILL_API = "https://api.mch.weixin.qq.com/pay/downloadbill";

	//7) 统计上报API
	public static String REPORT_API = "https://api.mch.weixin.qq.com/payitil/report";


	public static final String WXPAY_UNIFIEDORDER_URL = "https://api.mch.weixin.qq.com/pay/unifiedorder";


	public static final String WX_OAUTH2_ACCESS_TOKEN_URL = "https://api.weixin.qq.com/sns/oauth2/access_token?appid={APPID}&secret={SECRET}&code={CODE}&grant_type=authorization_code";;


	public static boolean isUseThreadToDoReport() {
		return useThreadToDoReport;
	}

	public static void setUseThreadToDoReport(boolean useThreadToDoReport) {
		Configure.useThreadToDoReport = useThreadToDoReport;
	}

	public static String HttpsRequestClassName = "com.tencent.common.HttpsRequest";

	public static void setKey(String key) {
		Configure.key = key;
	}

	public static void setAppID(String appID) {
		Configure.appID = appID;
	}

	public static void setMchID(String mchID) {
		Configure.mchID = mchID;
	}

	public static void setSubMchID(String subMchID) {
		Configure.subMchID = subMchID;
	}

	public static void setCertLocalPath(String certLocalPath) {
		Configure.certLocalPath = certLocalPath;
	}

	public static void setCertPassword(String certPassword) {
		Configure.certPassword = certPassword;
	}

	public static String getKey(){
		return key;
	}
	
	public static String getAppid(){
		return appID;
	}
	
	public static String getMchid(){
		return mchID;
	}

	public static String getSubMchid(){
		return subMchID;
	}
	
	public static String getCertLocalPath(){
		return certLocalPath;
	}
	
	public static String getCertPassword(){
		return certPassword;
	}

	public static String getAppID() {
		return appID;
	}

	public static String getMchID() {
		return mchID;
	}

	public static String getAppsecret() {
		return appsecret;
	}

	public static void setAppsecret(String appsecret) {
		Configure.appsecret = appsecret;
	}

	public static String getSubMchID() {
		return subMchID;
	}

	public static void setHttpsRequestClassName(String name){
		HttpsRequestClassName = name;
	}


	public static String getMchid_app() {
		return mchid_app;
	}

	public static String getKey_app() {
		return key_app;
	}

	public static String getAppid_app() {
		return appid_app;
	}

	public static String getAppsecret_app() {
		return appsecret_app;
	}
}
