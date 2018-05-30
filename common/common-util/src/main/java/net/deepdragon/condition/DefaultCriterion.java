package net.deepdragon.condition;


public class DefaultCriterion implements Criterion {

	private static final long serialVersionUID = 2039282758924709493L;

	private String sql;

	private boolean limit = false;

	private boolean order = false;

	private boolean group = false;

	
	/**
	 * @return the sql
	 */
	public String getSql() {
		return sql;
	}

	/**
	 * @param sql
	 *            the sql to set
	 */
	public void setSql(String sql) {
		this.sql = sql;
		if (sql.toUpperCase().contains("LIMIT ")){
			this.limit = true;
		}else if (sql.toUpperCase().contains("ORDER ")){
			this.order = true;
		}else if (sql.toUpperCase().contains("GROUP BY ")){
			this.group = true;
		}
	}

	protected DefaultCriterion(){}
	
	public DefaultCriterion(String sql) {
		this.sql = sql;
		if (sql.toUpperCase().contains("LIMIT "))
			this.limit = true;
		else if (sql.toUpperCase().contains("ORDER "))
			this.order = true;
		else if (sql.toUpperCase().contains("GROUP BY "))
			this.group = true;
	}

	public DefaultCriterion(String name, String relation, String value,
			boolean limit, boolean order) {
		this.sql = name + " " + relation + " " + value;
		this.limit = limit;
		this.order = order;
	}
	
	public DefaultCriterion(String name, String relation, String value) {
		this(name, relation, value, false, false);
	}

	public DefaultCriterion(Criterion c1,Criterion c2) {
		this(" ( "+c1.toSqlString()+" or "+c2.toSqlString()+" ) ");
	}
	
	@Override
	public String toSqlString() {
		if (isLimit()) {
			return sql.replaceFirst("(limit)|(LIMIT)\\s", " ");
		} else if (isOrder()) {
			return sql.replaceFirst("(order)|(ORDER)\\s", " ")
					.replaceFirst("(by)|(BY)\\s", " ");
		} else if (isGroup()) {
			return sql.replaceFirst("(group)|(GROUP)\\s", " ")
					.replaceFirst("(by)|(BY)\\s", " ");
		}
		return sql;
	}

	@Override
	public boolean isLimit() {
		return limit;
	}

	@Override
	public boolean isOrder() {
		return order;
	}

	@Override
	public boolean isGroup() {
		return group;
	}

}