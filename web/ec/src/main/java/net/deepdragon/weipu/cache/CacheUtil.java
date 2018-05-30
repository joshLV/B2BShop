package net.deepdragon.weipu.cache;

import net.deepdragon.weipu.Global;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * CacheUtil CacheService工具类
 */
public class CacheUtil {
	
	private static Logger logger = LoggerFactory.getLogger(CacheUtil.class);
	
	private static CacheService cacheService;
	
	private static int defaultSecondsToExpire = 60 * 30;// 默认缓存过期时间(30分钟)
	
	private static CacheService getCacheService() {
		if (cacheService == null) {
			cacheService = new DefaultCacheServiceImpl();
		}
		return cacheService;
	}
	
	/**
	 * 向给定的缓存名中存放一个缓存对象。
	 * 
	 * @param cacheName
	 *            缓存名
	 * @param key
	 *            缓存的key名字
	 * @param object
	 *            key对应的值内容
	 * @param secondsToExpire
	 *            缓存过期时间
	 * @return 存放成功，返回true；否则返回false
	 */
	public static boolean set(String key, Object value, int secondsToExpire) {
		boolean result = false;
		try {
			getCacheService().set(getCacheName(), key, secondsToExpire, value);
			result = true;
		} catch (Exception e) {
			logger.warn("向缓存中放入数据[key:" + key + "]时发生异常,Exception:" + e);
			e.printStackTrace();
		}
		return result;
	}

	/**
	 * 向给定的缓存名中存放一个缓存对象。
	 * 
	 * @param cacheName
	 *            缓存名
	 * @param key
	 *            缓存的key名字
	 * @param object
	 *            key对应的值内容
	 * @return 存放成功，返回true；否则返回false
	 */
	public static boolean set(String key, Object value) {
		return set(key, value, defaultSecondsToExpire);
	}

	/**
	 * 通过给定的缓存名和key，获取缓存的内容。
	 *
	 * @param key
	 *            缓存的key
	 * @return key对应的值内容
	 */
	public static Object get(String key) {
		Object value = null;
		try {
			value = getCacheService().get(getCacheName(), key);
//			logger.debug("获取缓存数据[key:" + key + "]，value[" + value + "]。");
		} catch (Exception e) {
			logger.warn("获取缓存的数据[key:" + key + "]时发生异常,Exception:" + e);
			e.printStackTrace();
		}
		return value;
	}

	/**
	 * 通过给定的缓存名和key，清除其缓存信息。
	 * 
	 * @param cacheName
	 *            缓存名
	 * @param key
	 *            缓存的key
	 * @return 移除缓存成功，返回true；否则返回false
	 */
	public static boolean delete(String key) {
		boolean result = false;
		try {
			result = getCacheService().delete(getCacheName(), key);
			if (result) {
				logger.debug("删除缓存数据[key:" + key + "]成功[" + result + "]。");
			}else{
				logger.error("删除缓存数据[key:" + key + "]失败[" + result + "]。");
			}
		} catch (Exception e) {
			logger.error("删除缓存数据[key:" + key + "]时发生异常,Exception:" + e);
			e.printStackTrace();
		}
		return result;
	}

	/**
	 * 生成新的缓存名
	 */
	private static String getCacheName() {
		return Global.MALL+"deepdragon" + Global.APP_SIGN;
	}
	
}
