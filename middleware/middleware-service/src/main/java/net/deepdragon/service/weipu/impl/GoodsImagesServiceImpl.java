package net.deepdragon.service.weipu.impl;


import net.deepdragon.constant.weipu.Weipu;
import net.deepdragon.dao.weipu.BaseDao;
import net.deepdragon.dao.weipu.GoodsImagesDao;
import net.deepdragon.entity.weipu.GoodsImages;
import net.deepdragon.service.weipu.GoodsImagesService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service(Weipu.SIGN+"GoodsImagesServiceImpl")
public class GoodsImagesServiceImpl extends BaseServiceImpl<GoodsImages, String> implements GoodsImagesService {

	@Resource(name= Weipu.SIGN+"GoodsImagesDaoImpl")
	private GoodsImagesDao goodsImagesDao;
	
	@Override
	public BaseDao<GoodsImages, String> getBaseDao() {
		return this.goodsImagesDao;
	}
	
}

