package net.deepdragon.condition;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Collection;

public class Criteria implements Serializable {

	private static final long serialVersionUID = 3243367222189954225L;

	private Collection<Criterion> criterions = new ArrayList<Criterion>();

	private Collection<Criterion> orderCriterions = new ArrayList<Criterion>();

	private Collection<Criterion> groupCriterions = new ArrayList<Criterion>();

	private Criterion limitCriterion;

	public void add(Criterion criterion) {
		if (criterion.isLimit()) {
			limitCriterion = criterion;
		} else if (criterion.isOrder()) {
			this.orderCriterions.add(criterion);
		} else if (criterion.isGroup()) {
			this.groupCriterions.add(criterion);
		} else {
			this.criterions.add(criterion);
		}
	}

	public String toSQL() {
		return this.generate().replaceFirst(
				"^\\s*((and)|(or)|(where)|(AND)|(OR)|(WHERE))\\s", " ");
	}

	public String getCondition() {
		if (criterions.size() > 0){
			return " WHERE " + toSQL();
		}
		return toSQL();
	}

	private String generate() {
		StringBuffer sb = new StringBuffer();
		for (Criterion cri : criterions) {
			sb.append(" AND ");
			sb.append(cri.toSqlString());
		}
		if (groupCriterions.size() > 0) {
			sb.append(" GROUP BY ");
			for (Criterion cri : groupCriterions) {
				sb.append(cri.toSqlString());
				sb.append(",");
			}
			sb = new StringBuffer(sb.substring(0, sb.length() - 1));
		}

		if (orderCriterions.size() > 0) {
			sb.append(" ORDER BY ");
			for (Criterion cri : orderCriterions) {
				sb.append(cri.toSqlString());
				sb.append(",");
			}
			sb = new StringBuffer(sb.substring(0, sb.length() - 1));
		}
		if (limitCriterion != null) {
			sb.append(" limit ");
			sb.append(limitCriterion.toSqlString());
		}
		return sb.toString();
	}


}