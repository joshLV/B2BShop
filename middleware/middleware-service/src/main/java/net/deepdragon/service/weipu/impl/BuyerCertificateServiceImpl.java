package net.deepdragon.service.weipu.impl;


import net.deepdragon.dao.weipu.BaseDao;
import net.deepdragon.dao.weipu.BuyerCertificateDao;
import net.deepdragon.entity.weipu.BuyerCertificate;
import net.deepdragon.service.weipu.BuyerCertificateService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service(net.deepdragon.constant.weipu.Weipu.SIGN+"BuyerCertificateServiceImpl")
public class BuyerCertificateServiceImpl extends BaseServiceImpl<BuyerCertificate, String> implements BuyerCertificateService{

	@Resource(name=net.deepdragon.constant.weipu.Weipu.SIGN+"BuyerCertificateDaoImpl")
	private BuyerCertificateDao buyerCertificateDao;
	
	@Override
	public BaseDao<BuyerCertificate, String> getBaseDao() {
		return this.buyerCertificateDao;
	}
	
}

