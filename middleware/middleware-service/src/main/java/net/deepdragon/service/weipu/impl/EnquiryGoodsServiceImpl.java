package net.deepdragon.service.weipu.impl;


import net.deepdragon.dao.weipu.BaseDao;
import net.deepdragon.dao.weipu.EnquiryGoodsDao;
import net.deepdragon.entity.weipu.EnquiryGoods;
import net.deepdragon.service.weipu.EnquiryGoodsService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service(net.deepdragon.constant.weipu.Weipu.SIGN+"EnquiryGoodsServiceImpl")
public class EnquiryGoodsServiceImpl extends BaseServiceImpl<EnquiryGoods, String> implements EnquiryGoodsService{

	@Resource(name=net.deepdragon.constant.weipu.Weipu.SIGN+"EnquiryGoodsDaoImpl")
	private EnquiryGoodsDao enquiryGoodsDao;
	
	@Override
	public BaseDao<EnquiryGoods, String> getBaseDao() {
		return this.enquiryGoodsDao;
	}
	
}

