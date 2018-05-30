package net.deepdragon.dao.weipu;

import net.deepdragon.entity.weipu.MerchantType;

import java.util.Map;

public interface MerchantTypeDao extends BaseDao<MerchantType, String> {
	
	int updateDefault(Map<String, Object> paramMap, String id);
}
