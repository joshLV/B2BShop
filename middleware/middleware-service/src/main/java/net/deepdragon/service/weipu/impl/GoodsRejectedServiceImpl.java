package net.deepdragon.service.weipu.impl;


import net.deepdragon.dao.weipu.BaseDao;
import net.deepdragon.dao.weipu.GoodsRejectedDao;
import net.deepdragon.entity.weipu.GoodsRejected;
import net.deepdragon.service.weipu.GoodsRejectedService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Map;

@Service(net.deepdragon.constant.weipu.Weipu.SIGN+"GoodsRejectedServiceImpl")
public class GoodsRejectedServiceImpl extends BaseServiceImpl<GoodsRejected, String> implements GoodsRejectedService{

	@Resource(name=net.deepdragon.constant.weipu.Weipu.SIGN+"GoodsRejectedDaoImpl")
	private GoodsRejectedDao goodsRejectedDao;

	@Override
	public BaseDao<GoodsRejected, String> getBaseDao() {
		return this.goodsRejectedDao;
	}


	@Override
	public Object saveGoodsRejected(Map<String, Object> param, GoodsRejected goodsRejected) throws Exception{
		return goodsRejectedDao.saveGoodsRejected(param, goodsRejected);
	}

}

