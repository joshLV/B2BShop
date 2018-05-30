package net.deepdragon.service.weipu;

import net.deepdragon.entity.weipu.Catelog;

import java.util.List;
import java.util.Map;

/**
 * 前台类目数据接口
*/
public interface CatelogService extends BaseService<Catelog, String> {

    /**
     * 根据后台GoodsCategory获取前台的Catelog对象
     *
     * @param paramMap   租户Id
     * @param categoryId 后端商品分类Id
     *
     * @return Catelog对象
     */
    Catelog getCatelogByGategory(Map<String, Object> paramMap, String categoryId);
    
	/**
	 * 获取店铺所上架商品对应的类目，用于店铺展示
	 * 
	 * @param paramMap
	 * @param shopId
	 * @return
	 * @throws Exception
	 */
	List<Catelog> getList4Shop(Map<String, Object> paramMap, String shopId) throws Exception;

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
     * @param Id
     * @return
     */
    List<Catelog> getSons(Map<String, Object> paramMap,String id);
    
}
