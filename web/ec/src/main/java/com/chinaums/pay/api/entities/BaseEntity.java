package com.chinaums.pay.api.entities;

import java.lang.reflect.Method;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.builder.ReflectionToStringBuilder;

public abstract class BaseEntity {

	public String convertToJsonString() throws Exception {
		return "";
	}

	public void parseFromJsonString(String json) throws Exception {
	}
	
	public void parseFromHttpServletRequest(HttpServletRequest request) throws Exception {
	}

	public abstract String buildVerifyString();

	public abstract String buildSignString();

	protected String buildStringFromFields(String[] params) {
		StringBuilder buf = new StringBuilder();

		for (String f : params) {
			Object value = getFieldValue(f);
			if (value != null) {
				buf.append(value);
			}
		}
		String data = buf.toString();
		return data;
	}

	private Object getFieldValue(String f) {
		String methodName = "get" + f;
		Object result = null;
		try {
			Method method = getClass().getMethod(methodName, new Class[0]);
			result = method.invoke(this, new Object[0]);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	public String toString() {
		return ReflectionToStringBuilder.toString(this);
	}

}