package com.allinpay.ets.client;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

public class AccConfig implements Serializable {
	
	private static final long serialVersionUID = -6500938030780863877L;
	private final String RULE_NAME = "A00001";

	private final String SEPARATOR = "|";

	private final String CONNECTOR = ",";
	public static final String TYPE_RATE = "1";
	public static final String TYPE_AMOUNT = "2";
	private String type;
	private List accAttributes = new ArrayList();

	public String getType() {
		return this.type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public List getAccAttributes() {
		return this.accAttributes;
	}

	public void addAccAttribute(AccAttribute accAttribute) {
		this.accAttributes.add(accAttribute);
	}

	public String toString() {
		StringBuffer sb = new StringBuffer();
		if (!StringUtil.isEmpty(this.type)) {
			sb.append("<").append("A00001").append(">").append(this.type);

			for (int i = 0; i < this.accAttributes.size(); i++) {
				AccAttribute att = (AccAttribute) this.accAttributes.get(i);
				if (!StringUtil.isEmpty(att.getAccNo())) {
					sb.append("|").append(att.getAccNo()).append(",");
					if (this.type.equals("1"))
						sb.append(att.getRate());
					else if (this.type.endsWith("2")) {
						sb.append(att.getAmount());
					}
				}
			}
			sb.append("</").append("A00001").append(">");
		}
		return sb.toString();
	}
}