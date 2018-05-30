package net.deepdragon.dao.weipu;

import net.deepdragon.entity.weipu.FlashSale;

import java.util.List;
import java.util.Map;

public interface FlashSaleDao extends BaseDao<FlashSale, String> {
    /**
     * 删除活动商品
     *
     * @param detailId
     *
     * @return
     * @throws Exception
     */
    int delFlashSale(Map<String, Object> paramMap, String detailId);
    
    /**
     * 存储关联商品信息
     * @param paramMap
     * @param entity
     * @return
     */
    int saveFlashSale(Map<String, Object> paramMap,FlashSale entity);
    
    /**
     * 获取时段促销商品
     * @param paramMap
     * @return
     */
    List<Map<String,Object>> getFlashSaleGoods(Map<String, Object> paramMap,int type);
    
    /**
     * 获取当前时间以后的所有秒杀商品
     * @param paramMap
     * @param type
     * @return
     */
    List<Map<String,Object>> getAllFlashSaleGoods(Map<String, Object> paramMap,int type);
    
}
