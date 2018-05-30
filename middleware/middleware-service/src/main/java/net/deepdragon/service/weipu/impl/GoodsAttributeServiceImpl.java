package net.deepdragon.service.weipu.impl;


import net.deepdragon.dao.weipu.BaseDao;
import net.deepdragon.dao.weipu.GoodsAttributeDao;
import net.deepdragon.entity.weipu.GoodsAttribute;
import net.deepdragon.service.weipu.GoodsAttributeService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service(net.deepdragon.constant.weipu.Weipu.SIGN+"GoodsAttributeServiceImpl")
public class GoodsAttributeServiceImpl extends BaseServiceImpl<GoodsAttribute, String> implements GoodsAttributeService{

	@Resource(name=net.deepdragon.constant.weipu.Weipu.SIGN+"GoodsAttributeDaoImpl")
	private GoodsAttributeDao goodsAttributeDao;
	
	@Override
	public BaseDao<GoodsAttribute, String> getBaseDao() {
		return this.goodsAttributeDao;
	}
	
}

