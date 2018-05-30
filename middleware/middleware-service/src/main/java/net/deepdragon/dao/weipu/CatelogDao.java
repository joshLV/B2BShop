package net.deepdragon.dao.weipu;

import net.deepdragon.condition.Criteria;
import net.deepdragon.entity.weipu.Catelog;

import java.util.List;
import java.util.Map;

public interface CatelogDao extends BaseDao<Catelog, String> {

	/**
	 * 根据后台GoodsCategory获取前台的Catelog对象
	 * 
	 * @param criteria
	 *            条件对象
	 * 
	 * @return Category对象列表
	 */
	List<Catelog> getCatelogByGategory(Criteria criteria);

	/**
	 * 获取店铺所上架商品对应的类目，用于店铺展示
	 * 
	 * @param paramMap
	 * @param shopId
	 * @return
	 */
	List<Catelog> getList4Shop(Map<String, Object> paramMap, String shopId);

	/**
	 * 获取所有父级分类
	 *
	 * @param paramMap
	 * @return
	 */
	List<Catelog> getAllParents(Map<String, Object> paramMap);

	/**
	 * 获取分类下面所有的子分类
	 *
	 * @param paramMap
	 * @param id
	 * @return
	 */
	List<Catelog> getSons(Map<String, Object> paramMap,String id);

}
