package net.deepdragon.weipu.cache.ehcache;

import net.sf.ehcache.CacheException;
import net.sf.ehcache.Ehcache;
import net.sf.ehcache.Element;
import net.sf.ehcache.event.CacheEventListener;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class EhCacheListener implements CacheEventListener {

	protected static final Logger logger = LoggerFactory.getLogger(EhCacheListener.class);
	
	public Object clone() {
		return this;
	}

	public void dispose() {
		logger.debug("ehcache dispose");
	}

	public void notifyElementEvicted(Ehcache cache, Element element) {
		logger.info(cache.getName()+":"+element.getObjectKey() +" has been evicted");
	}

	public void notifyElementExpired(Ehcache cache, Element element) {
		logger.info(cache.getName()+":"+element.getObjectKey() +" has been expired");
	}

	public void notifyElementPut(Ehcache cache, Element element)
			throws CacheException {
		logger.info(cache.getName()+":"+element.getObjectKey() +" has been added");
	}

	public void notifyElementRemoved(Ehcache cache, Element element)
			throws CacheException {
		logger.info(cache.getName()+":"+element.getObjectKey() +" has been removed");
	}

	public void notifyElementUpdated(Ehcache cache, Element element)
			throws CacheException {
		logger.info(cache.getName()+":"+element.getObjectKey() +" has been updated");
	}

	public void notifyRemoveAll(Ehcache cache) {
		logger.info(cache.getName() +" has been remove all");
	}
		
}
