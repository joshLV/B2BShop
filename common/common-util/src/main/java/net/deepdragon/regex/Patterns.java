package net.deepdragon.regex;

import java.util.regex.Pattern;

public enum Patterns {
	
	INTEGER("[0-9]+$"), 
	MOBILE("^[1][3-8]\\d{9}$"),
	EMAIL("\\w+([\\.-]?\\w+)*@\\w+([\\.-]?\\w+)*(\\.\\w{1,3})+$");

	private Pattern pattern;

	private Patterns(String patterns) {
		this.pattern = Pattern.compile(patterns);
	}

	public Pattern getPattern() {
		return this.pattern;
	}

	public boolean matches(String value) {
		return pattern.matcher(value).matches();
	}
}