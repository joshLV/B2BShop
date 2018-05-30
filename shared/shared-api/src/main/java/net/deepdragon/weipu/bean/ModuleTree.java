package net.deepdragon.weipu.bean;

import java.io.Serializable;
import java.util.List;

/**
 * 模块树，生成JSON数据
 * 
 * @author 张莹
 *
 */
public class ModuleTree implements Serializable{

	private static final long serialVersionUID = -5593886024010202913L;

	private String id;
	
	private String pid;
	
	private String text;
	
	private String sign;
	
	private String url;
	
	private Integer level;
	
	private String icon;
	
	private List<ModuleTree> children;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPid() {
		return pid;
	}

	public void setPid(String pid) {
		this.pid = pid;
	}

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}

	public String getSign() {
		return sign;
	}

	public void setSign(String sign) {
		this.sign = sign;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public Integer getLevel() {
		return level;
	}

	public void setLevel(Integer level) {
		this.level = level;
	}

	public String getIcon() {
		return icon;
	}

	public void setIcon(String icon) {
		this.icon = icon;
	}

	public List<ModuleTree> getChildren() {
		return children;
	}

	public void setChildren(List<ModuleTree> children) {
		this.children = children;
	}

}
