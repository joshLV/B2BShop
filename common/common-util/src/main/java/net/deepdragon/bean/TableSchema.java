package net.deepdragon.bean;

import java.io.Serializable;

/**
 * 获取数据表模型
 * @author 张莹
 *
 */
public class TableSchema implements Serializable {

	private static final long serialVersionUID = -1258282486852764827L;

	private String columnName;

	private String isNullable;

	private String dataType;

	private String columnComment;

	public String getColumnName() {
		return columnName;
	}

	public void setColumnName(String columnName) {
		this.columnName = columnName;
	}

	public String getIsNullable() {
		return isNullable;
	}

	public void setIsNullable(String isNullable) {
		this.isNullable = isNullable;
	}

	public String getDataType() {
		return dataType;
	}

	public void setDataType(String dataType) {
		this.dataType = dataType;
	}

	public String getColumnComment() {
		return columnComment;
	}

	public void setColumnComment(String columnComment) {
		this.columnComment = columnComment;
	}

}
