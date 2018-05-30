package net.deepdragon.powerdesign.parse.bean;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang3.RandomStringUtils;

/**
 * 表信息
 * 
 * @author 张莹
 */
public class Table {
	private String id;
	private String prjId; // 项目ID
	private String code; // 表代码
	private String name; // 表含义
	private String scode; // 简化后的表代码， 主要是去调前缀,比如BASE_USER-->USER

	private String basePackage;// 包名
	private String sign;//项目标识，影响包的命名规范(dao层规范：basePackage.sign.dao.impl,service层：basePackage.sign.service.impl)
	private String signPackage;// 区别服务标识，类似Shared.SIGN

	private List<Column> columns = new ArrayList<Column>(); // 列信息

	public Table() {
	}

	public Table(String prjId, String id, String code, String name) {
		this.prjId = prjId;
		this.id = id;
		this.code = code;
		this.name = name;
	}

	/**
	 * 取得指定id的字段信息
	 * 
	 * @param oid
	 * @return
	 */
	public Column getColumnInfo(String oid) {
		Column col = null;
		for (int i = 0; i < columns.size(); i++) {
			col = (Column) columns.get(i);
			if (col.getId().equalsIgnoreCase(oid))
				break;
		}
		return col;
	}

	/**
	 * 设置主键
	 * 
	 * @param oid
	 */
	public void setPK(String oid) {
		Column col = getColumnInfo(oid);
		if (col != null)
			col.setPkFlag(true);
	}

	@Override
	public String toString() {
		StringBuffer sb = new StringBuffer().append(id);
		sb.append("\t").append(name).append("(").append(code).append("--")
				.append(scode).append(")\r\n");

		if (columns.size() > 0) {
			for (Column column : columns) {
				sb.append("\t\t").append(column);
			}
		}
		return sb.append("\r\n").toString();
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPrjId() {
		return prjId;
	}

	public void setPrjId(String prjId) {
		this.prjId = prjId;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public List<Column> getColumns() {
		return columns;
	}

	public void setColumns(List<Column> columns) {
		this.columns = columns;
	}

	public String getScode() {
		return scode;
	}

	public void setScode(String scode) {
		this.scode = scode;
	}

	public String getBasePackage() {
		return basePackage;
	}

	public void setBasePackage(String basePackage) {
		this.basePackage = basePackage;
	}

	public String getSignPackage() {
		return signPackage;
	}

	public void setSignPackage(String signPackage) {
		this.signPackage = signPackage;
	}
	
	public String getSign() {
		return sign;
	}

	public void setSign(String sign) {
		this.sign = sign;
	}

	public String getSerialVersionUID() {
		return "1" + RandomStringUtils.randomNumeric(18);
	}
}