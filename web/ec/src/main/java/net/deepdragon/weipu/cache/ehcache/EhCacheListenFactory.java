package net.deepdragon.weipu.cache.ehcache;

import net.sf.ehcache.event.CacheEventListener;
import net.sf.ehcache.event.CacheEventListenerFactory;

import java.util.Properties;

public class EhCacheListenFactory extends CacheEventListenerFactory{

	@Override
	public CacheEventListener createCacheEventListener(Properties properties) {
		return new EhCacheListener();  
	}
	
}
