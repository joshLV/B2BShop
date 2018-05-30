package net.deepdragon.service.weipu.impl;


import net.deepdragon.dao.weipu.BaseDao;
import net.deepdragon.dao.weipu.GoodsRejectedDetailDao;
import net.deepdragon.entity.weipu.GoodsRejectedDetail;
import net.deepdragon.service.weipu.GoodsRejectedDetailService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Map;

@Service(net.deepdragon.constant.weipu.Weipu.SIGN+"GoodsRejectedDetailServiceImpl")
public class GoodsRejectedDetailServiceImpl extends BaseServiceImpl<GoodsRejectedDetail, String> implements GoodsRejectedDetailService{

	@Resource(name=net.deepdragon.constant.weipu.Weipu.SIGN+"GoodsRejectedDetailDaoImpl")
	private GoodsRejectedDetailDao goodsRejectedDetailDao;
	
	@Override
	public BaseDao<GoodsRejectedDetail, String> getBaseDao() {
		return this.goodsRejectedDetailDao;
	}

	@Override
	public Object saveRejectedDetail(Map<String, Object> paramMap, GoodsRejectedDetail goodsRejectedDetail) {
		return goodsRejectedDetailDao.saveGoodsRejectedDetail(paramMap, goodsRejectedDetail);
	}
}

