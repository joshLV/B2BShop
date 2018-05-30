package net.deepdragon.weipu.bean;

import com.alibaba.fastjson.annotation.JSONField;

public class Grant {

	private String id;
	
	private String name;
	
	private String checked;

	private String sign;
	
	@JSONField(name = "id")
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	@JSONField(name = "name")
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@JSONField(name = "checked")
	public String getChecked() {
		return checked;
	}

	public void setChecked(String checked) {
		this.checked = checked;
	}

	@JSONField(name = "sign")
	public String getSign() {
		return sign;
	}

	public void setSign(String sign) {
		this.sign = sign;
	}
	
}
