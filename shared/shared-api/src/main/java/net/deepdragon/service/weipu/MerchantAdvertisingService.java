package net.deepdragon.service.weipu;

import net.deepdragon.entity.weipu.MerchantAdvertising;

import java.util.List;
import java.util.Map;

/**
 * 店铺广告数据接口
 */
public interface MerchantAdvertisingService extends BaseService<MerchantAdvertising, String> {
	/**
	 * 更新商品相关的一系列东西
	 * 
	 * @param paramMap
	 *            租户Id
	 * @param goodsMap
	 *            商品相关数据
	 */
	boolean saveMerchantAdvertisings(Map<String, Object> paramMap, List<MerchantAdvertising> updatentity, List<MerchantAdvertising> saveentity) throws Exception;

}
