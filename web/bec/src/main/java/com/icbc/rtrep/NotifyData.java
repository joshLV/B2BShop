package com.icbc.rtrep;

import com.icbc.CBCPayOnline;
import com.icbc.rtreq.Message;
import com.icbc.rtreq.OrderInfo;
import com.icbc.rtreq.SubOrderInfo;
import com.icbc.rtreq.TranData;
import com.thoughtworks.xstream.XStream;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

public class NotifyData {

	//必输：1，选输：2
    // 1接口版本号
    private String interfaceName = "ICBC_PERBANK_B2C";
    // 1交易日期时间
    private String interfaceVersion = "1.0.0.11";

	private OrderInfo orderInfo = new OrderInfo();

	private Custom custom = new Custom();

	private Extend extend = new Extend();

	private Bank bank = new Bank();

	public Bank getBank() {
		return bank;
	}

	public void setBank(Bank bank) {
		this.bank = bank;
	}

	public Custom getCustom() {
		return custom;
	}

	public void setCustom(Custom custom) {
		this.custom = custom;
	}

	public Extend getExtend() {
		return extend;
	}

	public void setExtend(Extend extend) {
		this.extend = extend;
	}

	public String getInterfaceName() {
		return interfaceName;
	}

	public void setInterfaceName(String interfaceName) {
		this.interfaceName = interfaceName;
	}

	public String getInterfaceVersion() {
		return interfaceVersion;
	}

	public void setInterfaceVersion(String interfaceVersion) {
		this.interfaceVersion = interfaceVersion;
	}

	public OrderInfo getOrderInfo() {
		return orderInfo;
	}

	public void setOrderInfo(OrderInfo orderInfo) {
		this.orderInfo = orderInfo;
	}


	public static void main(String[] args) {
		String xml = "<?xml version=\"1.0\" encoding=\"GBK\" standalone=\"no\"?>\n" +
				"<B2CRes>\n" +
				"<interfaceName></interfaceName>\n" +
				"<interfaceVersion></interfaceVersion>\n" +
				"<orderInfo>\n" +
				"<orderDate></orderDate>\n" +
				"<curType></curType>\n" +
				"<merID></merID>\n" +
				"<subOrderInfoList>\n" +
				"<subOrderInfo>\n" +
				"<orderid></orderid>\n" +
				"<amount></amount>\n" +
				"<installmentTimes>1</installmentTimes>\n" +
				"<merAcct></merAcct>\n" +
				"<tranSerialNo></tranSerialNo>\n" +
				"</subOrderInfo>\n" +
				"</subOrderInfoList>\n" +
				"</orderInfo>\n" +
				"<custom>\n" +
				"<verifyJoinFlag></verifyJoinFlag>\n" +
				"<JoinFlag></JoinFlag>\n" +
				"<UserNum></UserNum>\n" +
				"</custom>\n" +
				"<bank>\n" +
				"<TranBatchNo></TranBatchNo>\n" +
				"<notifyDate></notifyDate>\n" +
				"<tranStat></tranStat>\n" +
				"<comment></comment>\n" +
				"</bank>\n" +
				"<extend>\n" +
				"<epayRegResult></epayRegResult>\n" +
				"</extend>\n" +
				"</B2CRes>\n";
		XStream xs = new XStream();
		xs.autodetectAnnotations(true);
		xs.alias("B2CRes", NotifyData.class);
		xs.alias("orderInfo", OrderInfo.class);
		//xs.addImplicitArray(OrderInfo.class, "subOrderInfoList", List.class);
		xs.alias("subOrderInfo", SubOrderInfo.class);
		xs.alias("custom", Custom.class);
		xs.alias("bank", Bank.class);
		xs.alias("extend", Extend.class);
		Object o = xs.fromXML(xml);

	}
}