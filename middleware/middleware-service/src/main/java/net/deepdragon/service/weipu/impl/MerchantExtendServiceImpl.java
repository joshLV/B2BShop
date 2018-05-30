package net.deepdragon.service.weipu.impl;


import net.deepdragon.constant.weipu.Weipu;
import net.deepdragon.dao.weipu.BaseDao;
import net.deepdragon.dao.weipu.MerchantExtendDao;
import net.deepdragon.entity.weipu.MerchantExtend;
import net.deepdragon.service.weipu.MerchantExtendService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service(Weipu.SIGN+"MerchantExtendServiceImpl")
public class MerchantExtendServiceImpl extends BaseServiceImpl<MerchantExtend, String> implements MerchantExtendService{
	@Resource(name = Weipu.SIGN + "MerchantExtendDaoImpl")
	private MerchantExtendDao merchantExtendDao;

	@Override
	protected BaseDao<MerchantExtend, String> getBaseDao() {
		return this.merchantExtendDao;
	}
}
