package com.icbc.rtreq;

import com.thoughtworks.xstream.annotations.XStreamAlias;

@XStreamAlias("B2CReq")
public class TranData {

	//必输：1，选输：2
    // 1接口版本号
    private String interfaceName = "ICBC_PERBANK_B2C";
    // 1交易日期时间
    private String interfaceVersion = "1.0.0.11";

	private OrderInfo orderInfo = new OrderInfo();

	private Custom custom = new Custom();

	private Message message = new Message();

	private Extend extend = new Extend();

	public Custom getCustom() {
		return custom;
	}

	public Extend getExtend() {
		return extend;
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

	public Message getMessage() {
		return message;
	}

	public void setMessage(Message message) {
		this.message = message;
	}

	public OrderInfo getOrderInfo() {
		return orderInfo;
	}

}