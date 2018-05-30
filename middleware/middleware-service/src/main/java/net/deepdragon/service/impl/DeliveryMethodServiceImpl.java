package net.deepdragon.service.impl;


import net.deepdragon.constant.Shared;
import net.deepdragon.dao.BaseDao;
import net.deepdragon.dao.DeliveryMethodDao;
import net.deepdragon.entity.DeliveryMethod;
import net.deepdragon.service.DeliveryMethodService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

@Service(Shared.SIGN+"DeliveryMethodServiceImpl")
public class DeliveryMethodServiceImpl extends BaseServiceImpl<DeliveryMethod, String> implements DeliveryMethodService {

	@Resource(name= Shared.SIGN+"DeliveryMethodDaoImpl")
	private DeliveryMethodDao deliveryMethodDao;
	
	@Override
	public BaseDao<DeliveryMethod, String> getBaseDao() {
		return this.deliveryMethodDao;
	}
    @Override
    public List<DeliveryMethod> getobshopByMethodId(Map<String,Object> paramMap, String obshopId) {
        return deliveryMethodDao.getobshopByMethodId(paramMap,obshopId);
    }
}

