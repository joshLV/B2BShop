package net.deepdragon.dao.weipu;

import net.deepdragon.entity.weipu.MerchantSetting;

import java.util.Map;

public interface MerchantSettingDao extends BaseDao<MerchantSetting, String> {
	/**
	 * 
	 * @param paramMap
	 * @return
	 */
	int deleteAll(Map<String, Object> paramMap,String shopId);
}
