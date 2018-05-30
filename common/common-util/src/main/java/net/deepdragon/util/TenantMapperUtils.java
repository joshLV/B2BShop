package net.deepdragon.util;

import java.io.InputStream;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * 根据数据源标识映射租户的工具类
 * @author 张莹
 *
 */
public class TenantMapperUtils {

	private static final Logger logger = LoggerFactory
			.getLogger(TenantMapperUtils.class);

	public static String TENANTS_MAPPER = "tenants-mapper.properties";

	public static String TENANTS_SPLIT_CHAR = ",";
	
	private static Properties config = null;

	static {
		try {
			config = new Properties();
			InputStream in = TenantMapperUtils.class.getResourceAsStream(System
					.getProperty("tenant.mapper.file", "/config/")
					+ TENANTS_MAPPER);
			config.load(in);
			in.close();
			
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}

	public static void reload(String filePath){
		config = new Properties();
		try{
			InputStream in = TenantMapperUtils.class.getResourceAsStream(filePath);
			config.load(in);
			in.close();		
		}catch (Exception e) {
			logger.info("reload exception",e);
		}
	}

	// 根据key读取value
	public static String getValue(String key) {
		try {
			String value = config.getProperty(key);
			return value;
		} catch (Exception e) {
			logger.error("getValue Exception", e);
			return null;
		}
	}

	public static Map<Object, Object> getAll() {
		Map<Object, Object> result = new HashMap<Object, Object>();
		try {
			Enumeration<?> enumeration = config.propertyNames();
			while (enumeration.hasMoreElements()) {
				String key = (String) enumeration.nextElement();
				String value = config.getProperty(key);

				result.put(key, value);
			}
		} catch (Exception e) {
			logger.error("getAll Excpetion", e);
		}

		return result;
	}

}
