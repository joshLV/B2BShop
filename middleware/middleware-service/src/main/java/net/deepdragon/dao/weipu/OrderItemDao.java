package net.deepdragon.dao.weipu;

import net.deepdragon.condition.Criteria;
import net.deepdragon.entity.weipu.OrderItem;
import net.deepdragon.mybatis.domain.PageBounds;

import java.util.List;
import java.util.Map;

public interface OrderItemDao extends BaseDao<OrderItem, String> {

    /**
     * 删除订单里的商品项对象
     *
     * @param paramMap 租户ID
     * @param property 字段名称
     * @param value    字段值
     * @param isBatch  是否采用批量模式操作
     *
     * @return 受影响的行数
     */
    int deleteOrderItems(Map<String, Object> paramMap, String property, Object value, boolean isBatch);
    
    List<OrderItem> getExportList(Map<String, Object> paramMap, Criteria criteria);
    List<OrderItem> getOrderItemPager(Map<String, Object> paramMap, Criteria
            criteria, PageBounds pageBounds);
    /*
     * 根据时间查找畅销商品
     * 
     * */
    List<Map<String, Object>> getBestSellersGoodsByTime(Map<String, Object> paramMap,String start,String end,int num);
    /*
     * 根据时间查找滞销产品
     * 
     * */
    List<Map<String, Object>> getDullSellersGoodsByTime(Map<String, Object> paramMap,String start,String end,int num);

    /*
    * 查找跨境商品列表
    *
    * */
    List<Map<String,Object>> getCrossBorderItemList(Map<String, Object> paramMap, Criteria criteria);


    List<OrderItem> getPagerItemsGpGoodsId(Map<String, Object> paramMap, Criteria criteria, PageBounds pageBounds);
}
