package net.deepdragon.service.weipu.impl;

import net.deepdragon.constant.weipu.Weipu;
import net.deepdragon.dao.weipu.BaseDao;
import net.deepdragon.dao.weipu.GoodsBrandDao;
import net.deepdragon.entity.weipu.GoodsBrand;
import net.deepdragon.service.weipu.GoodsBrandService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

@Service(Weipu.SIGN + "GoodsBrandServiceImpl")
public class GoodsBrandServiceImpl extends BaseServiceImpl<GoodsBrand, String>
		implements GoodsBrandService {

	@Resource(name = Weipu.SIGN + "GoodsBrandDaoImpl")
	private GoodsBrandDao goodsBrandDao;

	@Override
	public BaseDao<GoodsBrand, String> getBaseDao() {
		return goodsBrandDao;
	}

	@Override
	public List<GoodsBrand> getGoodsBrandByCategoryId(Map<String, Object> paramMap,
			String categoryId, int size) {
		return goodsBrandDao.getGoodsBrandByCategoryId(paramMap, categoryId,
				size);
	}

	@Override
	public List<GoodsBrand> getListByGoodsCategoryPath(Map<String, Object> paramMap, String goodsCategoryPath,
			boolean showNoGoods) throws Exception {
		return this.goodsBrandDao.getListByGoodsCategoryPath(paramMap, goodsCategoryPath, showNoGoods);
	}
	
}
