package net.deepdragon.condition;

import java.io.Serializable;
import java.util.Collection;

public class Restrictions implements Serializable{

	private static final long serialVersionUID = 6457602540814502404L;

	/**
	 * SQL语句中或(OR)条件
	 * @param c1 Criterion对象
	 * @param c2 Criterion对象
	 * @return
	 */
	public static Criterion or(Criterion c1,Criterion c2){
		return new DefaultCriterion(c1, c2);
	}
	
	private static String generateValue(Object value) {
		return "'" + value + "'";
	}

	private static String generateValue2(Object value) {
		return value.toString();
	}

	/**
	 * SQL语句中等于(=)条件
	 * @param name 列名
	 * @param value 值
	 * @return
	 */
	public static Criterion eq(String name, Object value) {
		return eq(name,value,false);
	}

	/**
	 * SQL语句中等于(=)条件
	 * @param name 列名
	 * @param value 值
	 * @param noWrap 值是否添加''
	 * @return
	 */
	public static Criterion eq(String name, Object value, boolean noWrap) {
		if (noWrap){
			return new DefaultCriterion(name, "=", value.toString());
		}else{
			return new DefaultCriterion(name, "=", generateValue(value));
		}
	}

	/**
	 * SQL语句中大于(>)条件
	 * @param name 列名
	 * @param value 值
	 * @return
	 */
	public static Criterion gt(String name, Object value) {
		return gt(name,value,false);
	}

	/**
	 * SQL语句中大于(>)条件
	 * @param name 列名
	 * @param value 值
	 * @param noWrap 值是否添加''
	 * @return
	 */
	public static Criterion gt(String name, Object value, boolean noWrap) {
		if (noWrap){
			return new DefaultCriterion(name, ">", value.toString());
		}else{
			return new DefaultCriterion(name, ">", generateValue(value));
		}
	}
	
	/**
	 * SQL语句中大于等于(>=)条件
	 * @param name 列名
	 * @param value 值
	 * @return
	 */
	public static Criterion ge(String name, Object value) {
		return ge(name,value,false);
	}

	/**
	 * SQL语句中大于等于(>=)条件
	 * @param name 列名
	 * @param value 值
	 * @param noWrap 值是否添加''
	 * @return
	 */
	public static Criterion ge(String name, Object value, boolean noWrap) {
		if (noWrap){
			return new DefaultCriterion(name, ">=", value.toString());
		}else{
			return new DefaultCriterion(name, ">=", generateValue(value));
		}
	}
	
	/**
	 * SQL语句中小于(<)条件
	 * @param name 列名
	 * @param value 值
	 * @return
	 */
	public static Criterion lt(String name, Object value) {
		return lt(name,value,false);
	}

	/**
	 * SQL语句中小于(<)条件
	 * @param name 列名
	 * @param value 值
	 * @param noWrap 值是否添加''
	 * @return
	 */
	public static Criterion lt(String name, Object value, boolean noWrap) {
		if (noWrap){
			return new DefaultCriterion(name, "<", value.toString());
		}else{
			return new DefaultCriterion(name, "<", generateValue(value));
		}
	}
	
	/**
	 * SQL语句中小于等于(<=)条件
	 * @param name 列名
	 * @param value 值
	 * @return
	 */
	public static Criterion le(String name, Object value) {
		return le(name,value,false);
	}
	
	/**
	 * SQL语句中小于等于(<=)条件
	 * @param name 列名
	 * @param value 值
	 * @param noWrap 值是否添加''
	 * @return
	 */
	public static Criterion le(String name, Object value, boolean noWrap) {
		if (noWrap){
			return new DefaultCriterion(name, "<=", value.toString());
		}else{
			return new DefaultCriterion(name, "<=", generateValue(value));
		}
	}

	/**
	 * SQL语句中不等于(<>)条件
	 * @param name 列名
	 * @param value 值
	 * @return
	 */
	public static Criterion notEq(String name, Object value) {
		return notEq(name, value,false);
	}

	/**
	 * SQL语句中不等于(<>)条件
	 * @param name 列名
	 * @param value 值
	 * @return
	 */
	public static Criterion notEq(String name, Object value, boolean noWrap) {
		if (noWrap){
			return new DefaultCriterion(name, "<>", value.toString());
		}else{
			return new DefaultCriterion(name, "<>", generateValue(value));
		}
	}
	
	/**
	 * SQL语句中GROUP条件
	 * @param name 列名
	 * @return
	 */
	public static Criterion group(String name) {
		return new DefaultCriterion(" GROUP BY " + name);
	}

	/**
	 * SQL语句中IN条件
	 * @param name 列名
	 * @param value 值集合
	 * @return
	 */
	public static Criterion in(String name, Collection<?> value) {
		return in(name,value,false);
	}
	
	/**
	 * SQL语句中IN条件
	 * @param name 列名
	 * @param value 值集合
	 * @param noWrap 值是否添加''
	 * @return
	 */
	public static Criterion in(String name, Collection<?> value , boolean noWrap) {
		StringBuffer sb = new StringBuffer("(");
		if (value.size() > 0) {
			for (Object o : value) {
				if (noWrap){
					sb.append(o.toString());
				}else{
					sb.append(generateValue(o));
				}
				sb.append(",");
			}
			sb.deleteCharAt(sb.length() - 1);
		}
		sb.append(")");

		return new DefaultCriterion(name, "IN", sb.toString());
	}

	/**
	 * SQL语句中NOT IN条件
	 * @param name 列名
	 * @param value 值集合
	 * @return
	 */
	public static Criterion notIn(String name, Collection<?> value ) {
		return notIn(name,value,false);
	}
	
	/**
	 * SQL语句中NOT IN条件
	 * @param name 列名
	 * @param value 值集合
	 * @param noWrap 值是否添加''
	 * @return
	 */
	public static Criterion notIn(String name, Collection<?> value , boolean noWrap) {
		StringBuffer sb = new StringBuffer("(");
		if (value.size() > 0) {
			for (Object o : value) {
				if (noWrap){
					sb.append(o.toString());
				}else{
					sb.append(generateValue(o));
				}
				sb.append(",");
			}
			sb.deleteCharAt(sb.length() - 1);
		}
		sb.append(")");

		return new DefaultCriterion(name, "NOT IN", sb.toString());
	}
	
	/**
	 * SQL语句中LIKE条件
	 * @param name 列名
	 * @param value 值 
	 * @return
	 */
	public static Criterion like(String name, Object value) {
		return new DefaultCriterion(name, "LIKE", generateValue(value));
	}

	/**
	 * SQL语句中LIKE条件 like 中的值不带 ''
	 * @param name 列名
	 * @param value 值
	 * @return
	 */
	public static Criterion likeTwo(String name, Object value) {
		return new DefaultCriterion(name, "LIKE", generateValue2(value));
	}

	/**
	 * SQL语句中ORDER BY
	 * @param name 列名
	 * @param order ASC OR DESC
	 * @return
	 */
	public static Criterion order(String name, String order) {
		return new DefaultCriterion("ORDER BY " + name + " " + order);
	}

	/**
	 * SQL语句中LIMIT
	 * @param start 起始位置
	 * @param end 偏移值
	 * @return
	 */
	public static Criterion limit(String start, String end) {
		return new DefaultCriterion("LIMIT " + start + "," + end);
	}

	/**
	 * SQL语句中BETWEEN条件
	 * @param name 列名
	 * @param value1 值
	 * @param value2 值
	 * @return
	 */
	public static Criterion between(String name,Object value1,Object value2) {
		return between(name,value1,value2,false);
	}

	/**
	 * SQL语句中BETWEEN条件
	 * @param name 列名
	 * @param value1 值
	 * @param value2 值
	 * @param noWrap 值是否添加''
	 * @return
	 */
	public static Criterion between(String name,Object value1,Object value2, boolean noWrap) {
		StringBuffer sb = new StringBuffer("(");
		sb.append(name);
		sb.append(" BETWEEN ");
		if (noWrap){
			sb.append(value1.toString());
		}else{
			sb.append(generateValue(value1));
		}
		sb.append(" AND ");
		if (noWrap){
			sb.append(value2.toString());
		}else{
			sb.append(generateValue(value2));
		}
		sb.append(")");
		
		return new DefaultCriterion(sb.toString());
	}
	
	/**
	 * SQL语句中IS NULL条件
	 * @param name 列名
	 * @return
	 */
	public static Criterion isNull(String name) {
		StringBuffer sb = new StringBuffer();
		sb.append(name);
		sb.append(" is null ");
		
		return new DefaultCriterion(sb.toString());
	}
	
	/**
	 * SQL语句中IS NOT NULL条件
	 * @param name 列名
	 * @return
	 */
	public static Criterion isNotNull(String name) {
		StringBuffer sb = new StringBuffer();
		sb.append(name);
		sb.append(" is not null ");
		
		return new DefaultCriterion(sb.toString());
	}
	/**
	 * 添加自定义SQL条件
	 * @param sql 标准SQL
	 * @return
	 */
	public static Criterion sql(String sql) {
		return new DefaultCriterion(sql);
	}
}