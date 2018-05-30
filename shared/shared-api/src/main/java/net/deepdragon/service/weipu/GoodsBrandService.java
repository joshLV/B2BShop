package net.deepdragon.service.weipu;

import net.deepdragon.entity.weipu.GoodsBrand;

import java.util.List;
import java.util.Map;

/**
 * 商品品牌表数据接口
 */
public interface GoodsBrandService extends BaseService<GoodsBrand, String> {

	/**
	 * 获取分类下的品牌
	 * 
	 * @param paramMap
	 * @param categoryId
	 * @param size
	 * @return
	 */
	List<GoodsBrand> getGoodsBrandByCategoryId(Map<String, Object> paramMap,
											   String categoryId, int size);

	/**
	 * 获取分类下的所有品牌,showNoGoods参数标识是否显示该类别下无商品的品牌
	 * 
	 * @param paramMap
	 * @param goodsCategoryPath
	 * @param showNoGoods
	 * @return
	 */
	List<GoodsBrand> getListByGoodsCategoryPath(Map<String, Object> paramMap, String goodsCategoryPath,
												boolean showNoGoods) throws Exception;
	
}
