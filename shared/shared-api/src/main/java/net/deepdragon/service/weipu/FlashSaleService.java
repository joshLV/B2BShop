package net.deepdragon.service.weipu;

import net.deepdragon.entity.weipu.FlashSale;

import java.util.List;
import java.util.Map;

/**
 * 参与活动的产品数据接口
*/
public interface FlashSaleService extends BaseService<FlashSale, String> {
    /**
     * 删除文章标签数据
     *
     * @param paramMap
     *            租户标识
     * @param detailId
     *            详细方案ID
     *            * @param flashSale
     *            活动商品
     */
    boolean svaeFlashSale(Map<String, Object> paramMap, List<FlashSale> flashSaleList, String detailId);
    
    /**
     * 获取秒杀商品列表
     * @param paramMap
     * @return
     */
    List<Map<String, Object>> getFlashSaleGoods(Map<String, Object> paramMap, int type);
    
    /**
     * 获取当前时间以后的所有秒杀商品
     * @param paramMap
     * @param type
     * @return
     */
    List<Map<String,Object>> getAllFlashSaleGoods(Map<String, Object> paramMap, int type);
    
}
