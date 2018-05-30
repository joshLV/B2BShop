package net.deepdragon.procedure;

import java.io.Serializable;

public class StatementArgument  implements Serializable{

	private static final long serialVersionUID = -3097184725829159135L;
	private int parameterIndex;
	private String parameterName;

	public StatementArgument(){}
	
	public StatementArgument(String parameterName, int parameterIndex) {
		this.parameterName = parameterName;
		this.parameterIndex = parameterIndex;
	}

	public int getParameterIndex() {
		return parameterIndex;
	}

	public String getName() {
		return parameterName;
	}

}