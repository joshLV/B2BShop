package net.deepdragon.util;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.apache.commons.lang3.StringUtils;

public class RegexUtils {

	/**
	 * 是否匹配
	 * 
	 * @param str
	 * @param regex
	 * @return
	 */
	public static boolean isMatch(String str, String regex) {
		if (StringUtils.isEmpty(str) || StringUtils.isEmpty(regex)) {
			return false;
		}
		return StringUtils.isNotEmpty(match(str, regex)) ? true : false;
	}

	/**
	 * 过滤原字符
	 * 
	 * @param str
	 * @param regex
	 * @return
	 */
	public static String filter(String str, String regex) {
		if (StringUtils.isEmpty(str)) {
			return "";
		}
		if (StringUtils.isEmpty(regex)) {
			return str;
		}
		Pattern p = Pattern.compile(regex);
		Matcher m = p.matcher(str);
		str = m.replaceAll("");
		return str;
	}

	/**
	 * 匹配原字符
	 * 
	 * @param str
	 * @param regex
	 * @return
	 */
	public static String match(String str, String regex) {
		if (StringUtils.isEmpty(str)) {
			return "";
		}
		if (StringUtils.isEmpty(regex)) {
			return str;
		}
		Pattern p = Pattern.compile(regex);
		Matcher m = p.matcher(str);
		return m.find() ? m.group() : "";
	}

	/**
	 * 过滤敏感数据,关键部分用星号代替 如手机号：13499995799 替换后 134****5799
	 * 
	 * @param sourceStr
	 * @param frontSize
	 *            前保留位数
	 * @param backSize
	 *            后保留位数
	 * @return
	 */
	public static String filterSensitiveData(String sourceStr, int frontSize,
			int backSize) {
		String result = "";
		if (StringUtils.isNotEmpty(sourceStr)) {
			int len = sourceStr.length();
			if (len >= frontSize + backSize) {
				result = sourceStr.substring(0, frontSize)
						+ (sourceStr.substring(frontSize, sourceStr.length()
								- backSize)).replaceAll(".", "*")
						+ sourceStr.substring(sourceStr.length() - backSize);
			} else {
				result = sourceStr.replaceAll(".", "*");
			}
		}
		return result;
	}

	/**
	 * 判读字符串中是否包含中文
	 * @param str
	 * @return
	 */
	public static boolean isContainsChinese(String str) {
		String regEx = "[\u4e00-\u9fa5]";
		Pattern pat = Pattern.compile(regEx);
		Matcher matcher = pat.matcher(str);
		boolean flg = false;
		if (matcher.find()) {
			flg = true;
		}
		return flg;
	}
	
	public static void main(String[] args) {  
		System.out.println(isContainsChinese("aasdf//张"));     
	}
}
