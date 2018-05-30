package net.deepdragon.service.weipu;

import net.deepdragon.bean.Pager;
import net.deepdragon.condition.Criteria;
import net.deepdragon.entity.weipu.OrderItem;

import java.util.List;
import java.util.Map;

/**
 * 订单(购物)明细数据接口
*/
public interface OrderItemService extends BaseService<OrderItem, String> {

	List<OrderItem> getExportList(Map<String, Object> paramMap, Criteria criteria)
			throws Exception;

    Pager getOrderItemPager(Map<String, Object> paramMap, Criteria criteria, Pager
            pager)
            throws Exception;
    /*
     * 根据时间查找畅销商品
     * 
     * */
    List<Map<String, Object>> getBestSellersGoodsByTime(Map<String, Object> paramMap, String start, String end, int num)  throws Exception;
    /*
     * 根据时间查找滞销产品
     * 
     * */
    List<Map<String, Object>> getDullSellersGoodsByTime(Map<String, Object> paramMap, String start, String end, int num);

    /*
     * 查找跨境商品列表
     *
     * */
    List<Map<String, Object>> getCrossBorderItemList(Map<String, Object> paramMap, Criteria criteria)  throws Exception;


    /**
     *
     * @param paramMap
     *            租户标识
     * @param criteria
     *            查询条件
     * @param pager
     * @return
     * @throws Exception
     */
    Pager getPagerItemsGpGoodsId(Map<String, Object> paramMap, Criteria criteria, Pager pager) throws Exception;


}
