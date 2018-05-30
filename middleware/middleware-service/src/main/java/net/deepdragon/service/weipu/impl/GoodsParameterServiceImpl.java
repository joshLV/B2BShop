package net.deepdragon.service.weipu.impl;


import net.deepdragon.constant.weipu.Weipu;
import net.deepdragon.dao.weipu.BaseDao;
import net.deepdragon.dao.weipu.GoodsParameterDao;
import net.deepdragon.entity.weipu.GoodsParameter;
import net.deepdragon.service.weipu.GoodsParameterService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

@Service(Weipu.SIGN+"GoodsParameterServiceImpl")
public class GoodsParameterServiceImpl extends BaseServiceImpl<GoodsParameter, String> implements GoodsParameterService {

	@Resource(name= Weipu.SIGN+"GoodsParameterDaoImpl")
	private GoodsParameterDao goodsParameterDao;
	
	@Override
	public BaseDao<GoodsParameter, String> getBaseDao() {
		return this.goodsParameterDao;
	}

	@Override
	public List<Map<String,Object>> getParamNoGroup(Map<String, Object> paramMap, String goodsId){
		return this.goodsParameterDao.getParamNoGroup(paramMap,goodsId);
	}


}

