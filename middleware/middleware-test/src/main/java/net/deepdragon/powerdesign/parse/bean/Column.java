package net.deepdragon.powerdesign.parse.bean;

/**
 * 表字段信息
 * 
 * @author 张莹
 */
public class Column {
	private String id;
	private String code; // 字段代码
	private String scode; // 简化后的表代码， 主要是去调前缀,比如BASE_USER-->USER
	private String name; // 字段含义
	private String type; // 原始类型及长度
	private int length;
	private int precision;
	private String domainId; // 定义的数据域ID
	private boolean pkFlag; // 是否为主键
	private boolean nullFlag; // 是否可以为空
	private boolean uniqueFlag; // 是否唯一
	private Table ref;// 关联表
	private String refId; // 关联表字段ID
	private String comment; // 注释

	private Domain domain;

	private static final String[] STRING = { "varchar", "text", "tinytext", "longtext" , "bigint" };
	private static final String[] DATE = { "date", "datetime", "time",
			"timestamp" };
	private static final String[] INT = { "int"};
	private static final String[] LONG = {"decimal"};
	private static final String[] DOUBLE = {"decimal" };

	public Column() {
	}

	public Column(String id, String code, String name, String type, int length,
			int precision) {
		this.id = id;
		this.code = code;
		this.name = name;
		this.type = type;
		this.length = length;
		this.precision = precision;
	}

	@Override
	public String toString() {
		StringBuffer sb = new StringBuffer().append(id);
		sb.append("\t").append(name).append("(").append(code).append("--")
				.append(scode).append(")");
		sb.append("\t").append(type);
		if (nullFlag)
			sb.append("\tNot Null");
		if (pkFlag)
			sb.append("\tPrimary Key");
		if (uniqueFlag)
			sb.append("\tUnique");
		if (ref != null) {
			sb.append("\t-->").append(ref.getId()).append("(")
					.append(ref.getCode()).append(").").append(refId)
					.append("(").append(ref.getColumnInfo(refId).getCode())
					.append(")");
		}
		if (domain != null)
			sb.append("\tdomainId:").append(domainId);
		if (comment != null)
			sb.append("\t//").append(comment);
		return sb.append("\r\n").toString();
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
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

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getDomainId() {
		return domainId;
	}

	public void setDomainId(String domainId) {
		this.domainId = domainId;
	}

	public boolean isPkFlag() {
		return pkFlag;
	}

	public void setPkFlag(boolean pkFlag) {
		this.pkFlag = pkFlag;
	}

	public boolean isNullFlag() {
		return nullFlag;
	}

	public void setNullFlag(boolean nullFlag) {
		this.nullFlag = nullFlag;
	}

	public boolean isUniqueFlag() {
		return uniqueFlag;
	}

	public void setUniqueFlag(boolean uniqueFlag) {
		this.uniqueFlag = uniqueFlag;
	}

	public String getRefId() {
		return refId;
	}

	public void setRefId(String refId) {
		this.refId = refId;
	}

	public Table getRef() {
		return ref;
	}

	public void setRef(Table ref) {
		this.ref = ref;
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	public Domain getDomain() {
		return domain;
	}

	public void setDomain(Domain domain) {
		this.domain = domain;
	}

	public int getLength() {
		return length;
	}

	public void setLength(int length) {
		this.length = length;
	}

	public int getPrecision() {
		return precision;
	}

	public void setPrecision(int precision) {
		this.precision = precision;
	}

	public String getScode() {
		return scode;
	}

	public void setScode(String scode) {
		this.scode = scode;
	}
	
	public String getJavaType() {
		
		String dataType = this.type;
		int pos = this.type.indexOf("(");
		if (pos != -1){
			dataType = this.type.substring(0, pos);
		}
		
		if ("char".equalsIgnoreCase(dataType) && length == 1)
			return "Boolean";
		for (String type : STRING) {
			if (type.equalsIgnoreCase(dataType))
				return "String";
		}
		for (String type : DATE) {
			if (type.equalsIgnoreCase(dataType))
				return "Date";
		}

		for (String type : INT) {
			if (type.equalsIgnoreCase(dataType))
				return "Integer";
		}
		for (String type : LONG) {
			if (type.equalsIgnoreCase(dataType)) {
				if (precision != 0) {
					return "Double";
				} else
					return "Long";
			}

		}
		
		for (String type : DOUBLE) {
			dataType = dataType.toLowerCase();
			if (dataType.startsWith(type)) {
				return "Double";
			}
		}
		System.out.println("未知的数据类型:" + dataType);
		return "Serializable";
	}
}
