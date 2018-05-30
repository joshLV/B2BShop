package net.deepdragon.dao.weipu;

import net.deepdragon.entity.weipu.GoodsBrand;

import java.util.List;
import java.util.Map;

public interface GoodsBrandDao extends BaseDao<GoodsBrand, String> {
	
	/**
	 * 获取分类对应的品牌
	 * 
	 * @param paramMap
	 * @param categoryId
	 * @param size
	 * @return
	 */

	List<GoodsBrand> getGoodsBrandByCategoryId(Map<String, Object> paramMap, String categoryId, int size);
	
	/**
	 * 获取分类下的所有品牌,showNoGoods参数标识是否显示该类别下无商品的品牌
	 * 
	 * @param paramMap
	 * @param goodsCategoryPath
	 * @param showNoGoods
	 * @return
	 */
	List<GoodsBrand> getListByGoodsCategoryPath(Map<String, Object> paramMap, String goodsCategoryPath,
			boolean showNoGoods);
	
}
