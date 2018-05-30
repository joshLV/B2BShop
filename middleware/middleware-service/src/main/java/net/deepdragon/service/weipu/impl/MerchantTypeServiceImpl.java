package net.deepdragon.service.weipu.impl;

import net.deepdragon.constant.weipu.Weipu;
import net.deepdragon.dao.weipu.BaseDao;
import net.deepdragon.dao.weipu.MerchantTypeDao;
import net.deepdragon.entity.weipu.MerchantType;
import net.deepdragon.service.weipu.MerchantTypeService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Map;

@Service(Weipu.SIGN + "MerchantTypeServiceImpl")
public class MerchantTypeServiceImpl extends
		BaseServiceImpl<MerchantType, String> implements MerchantTypeService {

	@Resource(name = Weipu.SIGN
			+ "MerchantTypeDaoImpl")
	private MerchantTypeDao merchantTypeDao;

	@Override
	public BaseDao<MerchantType, String> getBaseDao() {
		return this.merchantTypeDao;
	}

	@Override
	public MerchantType save(Map<String, Object> paramMap, MerchantType entity)
			throws Exception {
		MerchantType mt = merchantTypeDao.save(paramMap, entity);
		merchantTypeDao.updateDefault(paramMap, mt.getId());
		return mt;
	}

	@Override
	public int update(Map<String, Object> paramMap, MerchantType entity) throws Exception {
		int mt = merchantTypeDao.update(paramMap, entity);
		merchantTypeDao.updateDefault(paramMap, entity.getId());
		return mt;
	}

}
