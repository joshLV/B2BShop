package net.deepdragon.weipu.bean;

import java.io.Serializable;
import java.util.List;

import com.alibaba.fastjson.annotation.JSONField;

/**
 * 角色设置权限
 * 
 * @author 张莹
 * 
 */
public class LigerGridGrantTreeNode implements Serializable {

	private static final long serialVersionUID = -3193914188498597532L;

	private String id;

	private String name;

	private String sign;

	private String code;
	
	private List<Grant> grant;

	private List<LigerGridGrantTreeNode> children;

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

	@JSONField(name = "sign")
	public String getSign() {
		return sign;
	}

	public void setSign(String sign) {
		this.sign = sign;
	}

	@JSONField(name = "children")
	public List<LigerGridGrantTreeNode> getChildren() {
		return children;
	}

	public void setChildren(List<LigerGridGrantTreeNode> children) {
		this.children = children;
	}

	@JSONField(name = "grant")
	public List<Grant> getGrant() {
		return grant;
	}

	public void setGrant(List<Grant> grant) {
		this.grant = grant;
	}

	/**
	 * applicationId_moduleId
	 * @return
	 */
	@JSONField(name = "code")
	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}
	
}
