package net.deepdragon.dao.weipu.impl;

import net.deepdragon.constant.weipu.Weipu;
import net.deepdragon.dao.weipu.GoodsBrandDao;
import net.deepdragon.entity.weipu.GoodsBrand;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 商品品牌表数据接口实现
 */
@Repository(Weipu.SIGN + "GoodsBrandDaoImpl")
public class GoodsBrandDaoImpl extends BaseDaoImpl<GoodsBrand, String> implements GoodsBrandDao {

	@Override
	public List<GoodsBrand> getGoodsBrandByCategoryId(Map<String, Object> paramMap, String categoryId, int size) {
		String defaultStatement = GoodsBrand.class.getName() + "Mapper.getGoodsBrandByCategoryId";
		Map<String, Object> parameter = new HashMap<String, Object>();
		parameter.put("categoryId", categoryId);
		parameter.put("size", size);
		return this.sqlSessionTemplateFactory.getSqlSessionTemplate().selectList(defaultStatement, parameter);
	}
	
	@Override
	public List<GoodsBrand> getListByGoodsCategoryPath(Map<String, Object> paramMap, String goodsCategoryPath,
			boolean showNoGoods) {
		String grandId = null;
		String parentId = null;
		String goodsCategoryId = null;
		
		String[] pathArray = StringUtils.split(goodsCategoryPath, ",");
		int level = pathArray.length;
		if (level == 1) {
			grandId = pathArray[0];
		} else if (level == 2) {
			grandId = pathArray[0];
			parentId = pathArray[1];
		} else if (level == 3) {
			grandId = pathArray[0];
			parentId = pathArray[1];
			goodsCategoryId = pathArray[2];
		} else {
			logger.error("错误的goodsCategoryPath!");
		}
		
		String defaultStatement = GoodsBrand.class.getName() + "Mapper.getListByGoodsCategoryId";// 显示该类别下的所有品牌
		if (!showNoGoods) {
			defaultStatement = GoodsBrand.class.getName() + "Mapper.getListByGoodsCategoryIdWithoutNoGoods";// 没有商品的不显示
		}
		Map<String, Object> parameter = new HashMap<String, Object>();
		parameter.put("grandId", grandId);
		parameter.put("parentId", parentId);
		parameter.put("goodsCategoryId", "%"+goodsCategoryId+"%");
		return this.sqlSessionTemplateFactory.getSqlSessionTemplate()
				.selectList(defaultStatement, parameter);
	}
	
}
