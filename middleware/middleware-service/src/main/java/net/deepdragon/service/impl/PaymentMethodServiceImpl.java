package net.deepdragon.service.impl;


import net.deepdragon.constant.Shared;
import net.deepdragon.dao.BaseDao;
import net.deepdragon.dao.PaymentMethodDao;
import net.deepdragon.entity.PaymentMethod;
import net.deepdragon.service.PaymentMethodService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service(Shared.SIGN+"PaymentMethodServiceImpl")
public class PaymentMethodServiceImpl extends BaseServiceImpl<PaymentMethod, String> implements PaymentMethodService{

	@Resource(name= Shared.SIGN+"PaymentMethodDaoImpl")
	private PaymentMethodDao paymentMethodDao;
	
	@Override
	public BaseDao<PaymentMethod, String> getBaseDao() {
		return this.paymentMethodDao;
	}
	
}

