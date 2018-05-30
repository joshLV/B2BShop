package net.deepdragon.weipu.tools;

import net.deepdragon.util.StringUtil;

import javax.servlet.http.HttpServletRequest;

public class IpUtil {
	/**
	 * 获取登录用户IP地址
	 * 
	 * @param request
	 * @return
	 */
	public static String getIpAddr(HttpServletRequest request) {
		try {
			String ip = request.getHeader("x-forwarded-for");
			if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
				ip = request.getHeader("Proxy-Client-IP");
			}
			if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
				ip = request.getHeader("WL-Proxy-Client-IP");
			}
			if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
				ip = request.getRemoteAddr();
			}
			if (ip.equals("0:0:0:0:0:0:0:1")) {
				ip = "本地";
			}
			if(StringUtil.isNotEmpty( ip ) && ip.indexOf(",") > 0){
				ip = ip.substring(0, ip.indexOf(",")-1);
			}
			return ip;
		}catch (Exception e){
			return "undefined";
		}

	}



}
