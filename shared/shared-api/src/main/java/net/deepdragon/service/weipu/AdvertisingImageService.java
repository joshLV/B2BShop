package net.deepdragon.service.weipu;

import net.deepdragon.entity.weipu.AdvertisingImage;

import java.util.List;
import java.util.Map;

/**
 * 广告图片管理数据接口
 */
public interface AdvertisingImageService extends BaseService<AdvertisingImage, String> {

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
	 * @throws Exception
	 */
	List<AdvertisingImage> getAds(Map<String, Object> paramMap, String sign, int size) throws Exception;
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
	 * @throws Exception
	 */
	List<AdvertisingImage> getNewAds(Map<String, Object> paramMap, String sign, int size) throws Exception;
	
}
