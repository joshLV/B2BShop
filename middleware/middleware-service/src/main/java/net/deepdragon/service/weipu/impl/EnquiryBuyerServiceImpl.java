package net.deepdragon.service.weipu.impl;


import net.deepdragon.dao.weipu.BaseDao;
import net.deepdragon.dao.weipu.EnquiryBuyerDao;
import net.deepdragon.entity.weipu.EnquiryBuyer;
import net.deepdragon.service.weipu.EnquiryBuyerService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service(net.deepdragon.constant.weipu.Weipu.SIGN+"EnquiryBuyerServiceImpl")
public class EnquiryBuyerServiceImpl extends BaseServiceImpl<EnquiryBuyer, String> implements EnquiryBuyerService{

	@Resource(name=net.deepdragon.constant.weipu.Weipu.SIGN+"EnquiryBuyerDaoImpl")
	private EnquiryBuyerDao enquiryBuyerDao;
	
	@Override
	public BaseDao<EnquiryBuyer, String> getBaseDao() {
		return this.enquiryBuyerDao;
	}
	
}

