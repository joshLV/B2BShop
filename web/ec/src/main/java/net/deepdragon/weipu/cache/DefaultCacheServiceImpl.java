package net.deepdragon.weipu.cache;

import net.deepdragon.util.SpringUtils;
import net.sf.ehcache.Cache;
import net.sf.ehcache.Element;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.cache.ehcache.EhCacheCacheManager;

public class DefaultCacheServiceImpl implements CacheService {

	private static final long serialVersionUID = -529901410163541336L;

	protected static final Logger logger = LoggerFactory.getLogger(DefaultCacheServiceImpl.class);

	private static final String defaultCacheName = "bigDataCache";

	private EhCacheCacheManager cacheManager;

	public DefaultCacheServiceImpl() {
		super();
		this.cacheManager = SpringUtils.getApplicationContext().getBean(EhCacheCacheManager.class);
	}

	@Override
	public Object get(String cacheName, String key) throws Exception {
		Object value = null;
		try {
			Cache cache = getCache(cacheName);
			if (cache != null && cache.get(key) != null) {
				Element element = cache.get(key);
				value = element.getObjectValue();
			}
		} catch (Exception e) {
			String failedMessage = "Failed to get value on ehcache! (name:"
					+ cacheName + ",key:" + key + ")";
			throw new Exception(failedMessage, e);
		}
		
		if (value != null) {
			String successMessage = "缓存命中！ (name:" + cacheName + ",key:" + key + ")";
			logger.debug(successMessage);
		}
		
		return value;
	}

	@Override
	public void set(String cacheName, String key, int secondsToExpire,
			Object value) throws Exception {
		try {
			if (value != null) {
				Cache cache = getCache(cacheName);
				if (cache != null) {
					cache.put(new Element(key, value,secondsToExpire));
					cache.flush();
				}
			}
		} catch (Exception e) {
			String failedMessage = "Failed to set value on ehcache! "
					+ "(name:" + cacheName + ",key:" + key
					+ ",secondsToExpire:" + secondsToExpire + ",value:" + value
					+ ")";
			throw new Exception(failedMessage, e);
		}
	}

	@Override
	public boolean delete(String cacheName, String cacheKey) throws Exception {
		try {
			Cache cache = getCache(cacheName);
			if (cache != null) {
				cache.remove(cacheKey);
				String successMessage = "删除缓存！ (name:" + cacheName + ",key:" + cacheKey + ")";
				logger.debug(successMessage);
			}
			return true;
		} catch (Exception e) {
			String failedMessage = "Failed to delete value on ehcache! (name:"
					+ cacheName + ",key:" + cacheKey + ")";
			throw new Exception(failedMessage, e);
		}
	}

	public EhCacheCacheManager getCacheManager() {
		return cacheManager;
	}

	public void setCacheManager(EhCacheCacheManager cacheManager) {
		this.cacheManager = cacheManager;
	}
	
	private Cache getCache(String cacheName) {
		Cache cache = cacheManager.getCacheManager().getCache(cacheName);
		if (cache == null) {
			logger.warn("未找到缓存" + cacheName + ",使用系统默认缓存配置(" + cacheName + ")。");
			cache = cacheManager.getCacheManager().getCache(defaultCacheName);
		}
		return cache;
	}
	
}