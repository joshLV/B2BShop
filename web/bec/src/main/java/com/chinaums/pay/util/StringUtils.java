package com.chinaums.pay.util;

import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;

public class StringUtils {
	
	public static Map<String, String> getHttpParameters(String requestString) throws Exception {
		Map<String, String> map = new HashMap<String, String>();
		String[] params = requestString.split("&");
		for (String param : params) {
			String[] keyValue = param.split("=");
			if (keyValue.length == 2) {
				String key = URLDecoder.decode(keyValue[0], "UTF-8");
				String value = URLDecoder.decode(keyValue[1], "UTF-8");

				map.put(key, value);
			}
		}
		return map;
	}

	public static String buildHttpParameterString(String[] params) throws Exception {
		StringBuilder buf = new StringBuilder();
		for (int i = 0; i < params.length; i += 2) {
			buf.append(URLEncoder.encode(params[i], "UTF-8"));
			buf.append("=");
			buf.append(URLEncoder.encode(params[(i + 1)], "UTF-8"));
			if (i + 2 < params.length) {
				buf.append("&");
			}
		}
		System.out.println("request" + buf.toString());
		return buf.toString();
	}

	public static byte[] str2Pinblock(String str) {
		if (str == null)
			return null;
		byte[] bcd = str2CBCD(str);
		byte[] pinblock = new byte[8];

		pinblock[0] = (byte) str.length();
		for (int i = 1; i < 8; i++) {
			if (i - 1 < bcd.length)
				pinblock[i] = bcd[(i - 1)];
			else
				pinblock[i] = -1;
		}
		return pinblock;
	}

	public static byte[] str2CBCD(String str) {
		if (str == null) {
			return null;
		}
		byte[] bytes = str.getBytes();
		byte[] cbcd = new byte[(bytes.length + 1) / 2];

		for (int i = 0; i < bytes.length; i++) {
			byte b = bytes[i];
			if ((b < 48) || (b > 57))
				throw new IllegalArgumentException("Bad string");
			byte c = (byte) (b - 48);
			if (i % 2 == 0) {
				int tmp72_71 = (i / 2);
				byte[] tmp72_68 = cbcd;
				tmp72_68[tmp72_71] = (byte) (tmp72_68[tmp72_71] | c << 4);
			} else {
				int tmp88_87 = (i / 2);
				byte[] tmp88_84 = cbcd;
				tmp88_84[tmp88_87] = (byte) (tmp88_84[tmp88_87] | c);
			}
		}
		return cbcd;
	}

	public static boolean isEmptyString(String str) {
		return (str == null) || (str.trim().length() == 0);
	}

	public static boolean isNotEmptyString(String str) {
		return (str != null) && (str.trim().length() > 0);
	}
	
}