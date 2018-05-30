package net.deepdragon.weipu.cache;

import java.io.Serializable;

public interface CacheService extends Serializable{
        
    /**
     * 通过给定的缓存名和key，获取缓存的内容。
     *
     * @param cacheName 缓存名
     * @param key       缓存的key
     * @return key对应的值内容
     */
	Object get(String cacheName, String key) throws Exception;
       
    /**
     * 向给定的缓存名中存放一个缓存对象。
     *
     * @param cacheName 缓存名
     * @param key       缓存的key名字
     * @param value    key对应的值内容
     * @return 存放成功，返回true；否则返回false
     */
	void set(String cacheName, String key, int secondsToExpire,Object value) throws Exception;
	
    /**
     * 通过给定的缓存名和key，清除其缓存信息。
     *
     * @param cacheName 缓存名
     * @param cacheKey  缓存的key
     * @return 移除缓存成功，返回true；否则返回false
     */
	boolean delete(String cacheName, String cacheKey) throws Exception;
}
