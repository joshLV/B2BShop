package com.chinaums.pay;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.chinaums.pay.api.entities.OrderEntity;
import com.chinaums.pay.api.impl.DefaultSecurityService;
import com.chinaums.pay.api.impl.UMSPayServiceImpl;

public class ChinaumsUtil {

	protected static Logger logger = LoggerFactory.getLogger(ChinaumsUtil.class);
	
	// 下单
	public static String createOrder(String orderSn,Double totalAmount,String orderDesc) {
		// 测试参数
		DefaultSecurityService ss = new DefaultSecurityService();
		// 设置签名的商户私钥，验签的银商公钥
		ss.setSignKeyModHex(Config.signKeyMod);// 签名私钥Mod
		ss.setSignKeyExpHex(Config.signKeyExp);// 签名私钥Exp
		ss.setVerifyKeyExpHex(Config.verifyKeyExp);
		ss.setVerifyKeyModHex(Config.verifyKeyMod);
		
		UMSPayServiceImpl service = new UMSPayServiceImpl();
		service.setSecurityService(ss);
		service.setOrderServiceURL(Config.creatOrderUrl);
		// 构建订单
		SimpleDateFormat sf = new SimpleDateFormat("yyyyMMddHHmmss", java.util.Locale.US);
		String curreTime = sf.format(new Date());
		OrderEntity order = new OrderEntity();
		order.setMerId(Config.merId);// 商户号
		order.setMerTermId(Config.merTermId);// 终端号
		order.setMerOrderId(orderSn);// 订单号，商户根据自己的规则生成，最长32位
		order.setOrderDate(curreTime.substring(0, 8));// 订单日期
		order.setOrderTime(curreTime.substring(8));// 订单时间
		
		logger.error("订单金额(单位分):" + (totalAmount * 100));
		
		order.setTransAmt("1");// 订单金额(单位分)
		order.setOrderDesc("订单描述");// 订单描述 //"某某商户订单描述"
		order.setNotifyUrl(Config.merNoticeUrl);// 通知商户地址， 保证外网能够访问
		order.setTransType("NoticePay");// 固定值
		order.setEffectiveTime("0");// 订单有效期期限（秒），值小于等于0表示订单长期有效
		order.setMerSign(ss.sign(order.buildSignString()));
		logger.error("下单请求数据:" + order);
		String content = null;
		try {
			OrderEntity respOrder = new OrderEntity();
			// 发送创建订单请求,该方法中已经封装了签名验签的操作，我们不需要关心，只需要设置好公私钥即可
			respOrder = service.createOrder(order);
			logger.error("下单返回数据：" + respOrder);
			// content作为商户app调用全民付收银台客户端的参数，由商户后台传给商户客户端
			content = ss.sign(respOrder.getTransId() + respOrder.getChrCode()) + "|" + respOrder.getChrCode() + "|" + respOrder.getTransId() + "|" + Config.merId;
			logger.error(content);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return content;
	}

	/**
	 * 测试客户端签名，服务端验签
	 */
	public static void merSignVerify() {
		String singKeyMod = "83beb97d3aa44b696b2e1633d6d6fe5ec2b86d2d8ba8437c5c4bcac0530b7d50f03af18dee28f7ebd8859d7063254f3751c1c3594a6146e430ea442489b8fb46dc38c34f42241b0783044b459ce8b377006bc7b1a3b58f41ad772ff65846f4946e9d68e1d78564f89b70b2c713c0e6efbb03100e317eb3214d9ed072fbee3a07";
		String singKeyExp = "1e4c5e9c4e403a97a3ee956c969c1b23efe43a379f46b33e867b67c59353b11e4c21422c41f96a0af360c7347198c2ff15ee59decf1c50116aae75bd716ef95a9dffd055bc872dc840a53f1d8fdbf08430efa394f8fe7ffc708ccbf4b9d46f6c833a415e57abd811d4b2b1aee64f59e1b87a74986fc7bd04514f924b5550a901";
		String verifyKeyMod = "83BEB97D3AA44B696B2E1633D6D6FE5EC2B86D2D8BA8437C5C4BCAC0530B7D50F03AF18DEE28F7EBD8859D7063254F3751C1C3594A6146E430EA442489B8FB46DC38C34F42241B0783044B459CE8B377006BC7B1A3B58F41AD772FF65846F4946E9D68E1D78564F89B70B2C713C0E6EFBB03100E317EB3214D9ED072FBEE3A07";
		String verifyKeyExp = "0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000010001";
		try {
			String data = "2013082116014120130821160141Z11brBfdT066201308212440612100000下单成功";
			// 测试参数
			DefaultSecurityService ss = new DefaultSecurityService();
			// 设置签名的商户私钥，验签的银商公钥
			ss.setSignKeyModHex(singKeyMod);// 签名私钥Mod
			ss.setSignKeyExpHex(singKeyExp);// 签名私钥Exp
			ss.setVerifyKeyExpHex(verifyKeyExp);// 验签公钥exp
			ss.setVerifyKeyModHex(verifyKeyMod);// 验签公钥mod
			// 签名
			String sign = ss.sign(data);
			logger.error("签名数据：" + sign);
			// 验签
			boolean verifyResult = ss.verify(data, sign);
			logger.error("验签结果:" + verifyResult);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
