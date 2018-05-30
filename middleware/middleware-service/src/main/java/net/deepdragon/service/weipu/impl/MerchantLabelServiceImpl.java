package net.deepdragon.service.weipu.impl;


import net.deepdragon.dao.weipu.BaseDao;
import net.deepdragon.dao.weipu.MerchantLabelDao;
import net.deepdragon.entity.weipu.MerchantLabel;
import net.deepdragon.service.weipu.MerchantLabelService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service(net.deepdragon.constant.weipu.Weipu.SIGN+"MerchantLabelServiceImpl")
public class MerchantLabelServiceImpl extends BaseServiceImpl<MerchantLabel, String> implements MerchantLabelService{

	@Resource(name=net.deepdragon.constant.weipu.Weipu.SIGN+"MerchantLabelDaoImpl")
	private MerchantLabelDao merchantLabelDao;
	
	@Override
	public BaseDao<MerchantLabel, String> getBaseDao() {
		return this.merchantLabelDao;
	}
	
}

