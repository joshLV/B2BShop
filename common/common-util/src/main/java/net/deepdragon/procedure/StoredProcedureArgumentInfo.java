package net.deepdragon.procedure;

import java.io.Serializable;

public class StoredProcedureArgumentInfo implements Serializable {

	private static final long serialVersionUID = -2151298499270477094L;

	public static final short OUT = 4;
	public static final short INOUT = 2;
	public static final short IN = 1;

	public static final short FUNCTION_RETURN = 5;
	public static final short FUNCTION_RESULT = 3;

	private StatementArgument statementArgument;
	private String columnName;
	private short columnType;
	private short dataType;

	private Object dataValue;

	private String dataTypeName;
	private String columnTypeName;

	public StoredProcedureArgumentInfo() {
	}

	public StoredProcedureArgumentInfo(int columnIndex, String columnName,
			short columnType, short dataType) throws IllegalStateException {
		this.columnName = columnName;
		this.columnType = columnType;
		this.dataType = dataType;

		statementArgument = new StatementArgument(columnName, columnIndex);

		dataTypeName = TypeNameUtil.getName(dataType);

		switch (columnType) {
		case IN:
			columnTypeName = "IN";
			break;
		case OUT:
			columnTypeName = "OUT";
			break;
		case INOUT:
			columnTypeName = "INOUT";
			break;
		case FUNCTION_RETURN:
			columnTypeName = "FUNCTION_RETURN";
			break;
		case FUNCTION_RESULT:
			columnTypeName = "RESULT";
			break;
		default:
			throw new IllegalStateException("Column type " + columnType
					+ " is not supported for column '" + columnName + "'");
		}
	}

	/**
	 * Column name
	 * 
	 * @return Column name
	 */
	public String getColumnName() {
		return columnName;
	}

	/**
	 * Column type
	 * 
	 * @return type of column
	 */
	public short getColumnType() {
		return columnType;
	}

	/**
	 * Column type name (IN or OUT)
	 * 
	 * @return type name of column
	 */
	public String getColumnTypeName() {
		return columnTypeName;
	}

	/**
	 * Data type
	 * 
	 * @return Types.*
	 */
	public short getDataType() {
		return dataType;
	}

	public Object getDataValue() {
		return dataValue;
	}

	public void setDataValue(Object dataValue) {
		this.dataValue = dataValue;
	}

	/**
	 * Data type name
	 * 
	 * @return Types.* name
	 */
	public String getDataTypeName() {
		return dataTypeName;
	}

	public boolean isOutputParameter() {
		return columnType == OUT;
	}

	public boolean isInputParameter() {
		return columnType == IN;
	}

	public boolean isInOutputParameter() {
		return columnType == INOUT;
	}

	public boolean isFunctionReturnParameter() {
		return columnType == FUNCTION_RETURN;
	}

	public StatementArgument getStatementArgument() {
		return statementArgument;
	}

	public String toString() {
		return "StoredProcedureArgumentInfo{" + "columnName='" + columnName
				+ '\'' + ", columnType=" + columnTypeName + ", dataType="
				+ dataTypeName + ", dataValue=" + dataValue
				+ ", argumentIndex =" + statementArgument.getParameterIndex()
				+ '}';
	}
}
