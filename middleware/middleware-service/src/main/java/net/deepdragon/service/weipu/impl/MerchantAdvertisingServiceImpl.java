package net.deepdragon.service.weipu.impl;

import net.deepdragon.constant.weipu.Weipu;
import net.deepdragon.dao.weipu.BaseDao;
import net.deepdragon.dao.weipu.MerchantAdvertisingDao;
import net.deepdragon.entity.weipu.MerchantAdvertising;
import net.deepdragon.service.weipu.MerchantAdvertisingService;
import org.apache.commons.collections.CollectionUtils;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

@Service(Weipu.SIGN + "MerchantAdvertisingServiceImpl")
public class MerchantAdvertisingServiceImpl extends BaseServiceImpl<MerchantAdvertising, String> implements MerchantAdvertisingService {

	@Resource(name = Weipu.SIGN + "MerchantAdvertisingDaoImpl")
	private MerchantAdvertisingDao merchantAdvertisingDao;

	@Override
	public BaseDao<MerchantAdvertising, String> getBaseDao() {
		return this.merchantAdvertisingDao;
	}

	@Override
	public boolean saveMerchantAdvertisings(Map<String, Object> paramMap, List<MerchantAdvertising> updatentity, List<MerchantAdvertising> saveentity) throws Exception {
		if (CollectionUtils.isNotEmpty(updatentity)) {
			merchantAdvertisingDao.update(paramMap, updatentity);
		}
		if (CollectionUtils.isNotEmpty(saveentity)) {
			merchantAdvertisingDao.save(paramMap, saveentity);
		}
		return false;
	}

}
