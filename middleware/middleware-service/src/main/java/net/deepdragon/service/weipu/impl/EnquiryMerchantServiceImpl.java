package net.deepdragon.service.weipu.impl;


import net.deepdragon.dao.weipu.BaseDao;
import net.deepdragon.dao.weipu.EnquiryMerchantDao;
import net.deepdragon.entity.weipu.EnquiryMerchant;
import net.deepdragon.service.weipu.EnquiryMerchantService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service(net.deepdragon.constant.weipu.Weipu.SIGN+"EnquiryMerchantServiceImpl")
public class EnquiryMerchantServiceImpl extends BaseServiceImpl<EnquiryMerchant, String> implements EnquiryMerchantService{

	@Resource(name=net.deepdragon.constant.weipu.Weipu.SIGN+"EnquiryMerchantDaoImpl")
	private EnquiryMerchantDao EnquiryMerchantDao;
	
	@Override
	public BaseDao<EnquiryMerchant, String> getBaseDao() {
		return this.EnquiryMerchantDao;
	}
	
}

