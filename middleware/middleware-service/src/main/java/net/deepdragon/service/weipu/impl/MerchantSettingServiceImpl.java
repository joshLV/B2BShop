package net.deepdragon.service.weipu.impl;

import net.deepdragon.constant.weipu.Weipu;
import net.deepdragon.dao.weipu.BaseDao;
import net.deepdragon.dao.weipu.MerchantSettingDao;
import net.deepdragon.entity.weipu.MerchantSetting;
import net.deepdragon.service.weipu.MerchantSettingService;
import org.apache.commons.collections.CollectionUtils;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

@Service(Weipu.SIGN + "MerchantSettingServiceImpl")
public class MerchantSettingServiceImpl extends BaseServiceImpl<MerchantSetting, String> implements MerchantSettingService {

	@Resource(name = Weipu.SIGN + "MerchantSettingDaoImpl")
	private MerchantSettingDao merchantSettingDao;

	@Override
	public BaseDao<MerchantSetting, String> getBaseDao() {
		return this.merchantSettingDao;
	}
	@Override
	public boolean updateSet(Map<String, Object> paramMap, List<MerchantSetting> entity,String shopId) throws Exception {
		if (CollectionUtils.isNotEmpty(entity)) {
			merchantSettingDao.deleteAll(paramMap,shopId);
			merchantSettingDao.save(paramMap, entity);
		}
		return false;

	}

}
