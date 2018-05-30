package net.deepdragon.condition;

import java.io.Serializable;

public interface Criterion extends Serializable{

	String toSqlString();

	void setSql(String sql);

	boolean isLimit();

	boolean isOrder();

	boolean isGroup();
}