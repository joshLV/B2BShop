package com.chinaums.pay;

public class Config {

	// 这2个地址是银商的测试地址
	public static String creatOrderUrl = "https://116.228.21.162:8603/merFrontMgr/orderBusinessServlet";
	public static String queryOrderUrl = "https://116.228.21.162:8603/merFrontMgr/orderQueryServlet";
	// 测试环境银商验签公钥
	public static String verifyKeyMod = "cff6f75dfb7b3f32aca8c81442d142512684ad55372bf965512e337d47f785fb0e247f11d91f0c2517ebf3a4d456693c6a994eb39b3456102889818fd26f3732e3595e4f22ba3f4e0e77969d25a793d0eb00d011e7982d57f663a81463a0efce5ccdf8dc4534e70bdbfe2e961ab9edfcb373c72b6343400c838ecb4347c88911";
	public static String verifyKeyExp = "0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000010001";
	// 下面是商户的一些参数，需要根据实际修改
	public static String merId = "898000093990001";// 商户号
	public static String merTermId = "99999999";// 终端号
	// 测试环境商户签名私钥
	public static String signKeyMod = "83beb97d3aa44b696b2e1633d6d6fe5ec2b86d2d8ba8437c5c4bcac0530b7d50f03af18dee28f7ebd8859d7063254f3751c1c3594a6146e430ea442489b8fb46dc38c34f42241b0783044b459ce8b377006bc7b1a3b58f41ad772ff65846f4946e9d68e1d78564f89b70b2c713c0e6efbb03100e317eb3214d9ed072fbee3a07";
	public static String signKeyExp = "1e4c5e9c4e403a97a3ee956c969c1b23efe43a379f46b33e867b67c59353b11e4c21422c41f96a0af360c7347198c2ff15ee59decf1c50116aae75bd716ef95a9dffd055bc872dc840a53f1d8fdbf08430efa394f8fe7ffc708ccbf4b9d46f6c833a415e57abd811d4b2b1aee64f59e1b87a74986fc7bd04514f924b5550a901";
	public static String merNoticeUrl = ""; // 换成商户的url,保证外网可以访问
	
}