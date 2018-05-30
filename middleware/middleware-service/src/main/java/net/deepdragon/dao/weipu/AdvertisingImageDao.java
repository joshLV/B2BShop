package net.deepdragon.dao.weipu;

import net.deepdragon.entity.weipu.AdvertisingImage;

import java.util.List;
import java.util.Map;

public interface AdvertisingImageDao extends BaseDao<AdvertisingImage, String> {

	/**
	 * 获取集合对象
	 * 
	 * @param paramMap
	 *            租户ID
	 * @param sign
	 *            广告位标识
	 * @param size
	 *            条数
	 * @return
	 */
	List<AdvertisingImage> getAds(Map<String, Object> paramMap, String sign, int size);
	/**
	 * 获取集合对象
	 * 
	 * @param paramMap
	 *            租户ID
	 * @param sign
	 *            广告位标识
	 * @param size
	 *            条数
	 * @return
	 */
	List<AdvertisingImage> getNewAds(Map<String, Object> paramMap, String sign, int size);
	
}
