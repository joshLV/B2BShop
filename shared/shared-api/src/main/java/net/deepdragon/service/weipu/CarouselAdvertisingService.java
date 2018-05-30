package net.deepdragon.service.weipu;

import net.deepdragon.entity.weipu.CarouselAdvertising;

import java.util.List;
import java.util.Map;

/**
 * 轮播广告数据接口
*/
public interface CarouselAdvertisingService extends BaseService<CarouselAdvertising, String> {
	/**
	 * 更新商品相关的一系列东西
	 * 
	 * @param paramMap
	 *            租户Id
	 * @param goodsMap
	 *            商品相关数据
	 */
	boolean saveCarouselAdvertisings(Map<String, Object> paramMap, List<CarouselAdvertising> updatentity,
									 List<CarouselAdvertising> saveentity) throws Exception;
}
