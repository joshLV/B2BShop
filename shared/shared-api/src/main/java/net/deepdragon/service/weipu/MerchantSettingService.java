package net.deepdragon.service.weipu;

import net.deepdragon.entity.weipu.MerchantSetting;

import java.util.List;
import java.util.Map;

/**
 * 店铺设置数据接口
 */
public interface MerchantSettingService extends BaseService<MerchantSetting, String> {
	/**
	 * 更新系统设置项
	 * 
	 * @param paramMap
	 * @param entity
	 * @return
	 * @throws Exception
	 */
	boolean updateSet(Map<String, Object> paramMap, List<MerchantSetting> entity, String shopId) throws Exception;
}
