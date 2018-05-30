package net.deepdragon.dao.weipu.impl;

import net.deepdragon.constant.weipu.Weipu;
import net.deepdragon.dao.weipu.MerchantSettingDao;
import net.deepdragon.entity.weipu.MerchantSetting;
import org.apache.ibatis.session.ExecutorType;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.Map;

/**
 * 店铺设置数据接口实现
 */
@Repository(Weipu.SIGN + "MerchantSettingDaoImpl")
public class MerchantSettingDaoImpl extends BaseDaoImpl<MerchantSetting, String> implements MerchantSettingDao {
	@Override
	public int deleteAll(Map<String, Object> paramMap, String shopId) {
		String defaultStatement = MerchantSetting.class.getName() + "Mapper.deleteAll";
		Map<String, Object> parameter = new HashMap<String, Object>();
		parameter.put("shopId", shopId);
		return sqlSessionTemplateFactory.getSqlSessionTemplate(ExecutorType.BATCH).delete(defaultStatement, parameter);
	}

}
