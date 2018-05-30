package net.deepdragon.service.weipu;

import net.deepdragon.bean.Pager;
import net.deepdragon.condition.Criteria;
import net.deepdragon.entity.weipu.CartItem;
import net.deepdragon.entity.weipu.PurchaseOrderDetail;

import java.util.List;
import java.util.Map;

/**
 * 采购单明细表数据接口
*/
public interface PurchaseOrderDetailService extends BaseService<PurchaseOrderDetail, String> {
    /**
     * 获取采购单明细
     *
     * @param paramMap
     *            租户标识
     * @param criteria
     *            字段条件
     * @return 参数列表
     */
    Pager getPurchaseOrderDetailList(Map<String, Object> paramMap, Criteria criteria, Pager pager) throws Exception;

    /**
     * 获取非平台采购单明细
     *
     * @param paramMap
     *            租户标识
     * @param criteria
     *            字段条件
     * @return 参数列表
     */
    Pager getPurchaseOrderNoPlatformDetailList(Map<String, Object> paramMap, Criteria criteria, Pager pager) throws Exception;

    /**
     * 获取非平台采购单明细
     *
     * @param buyerId
     *            采购商ID
     * @param ids
     *            采购单明细ID集合
     * @return 参数列表
     */
    List<CartItem> getListByBuyerIdAndIdsPurchaseOrder(Map<String, Object> paramMap, String buyerId,List<String> ids)
            throws Exception;

    /**
     * 获取非平台采购单明细统计
     * @param paramMap
     * @param criteria
     * @param pager
     * @return
     * @throws Exception
     */
    Pager getPagerGroupName(Map<String, Object> paramMap, Criteria criteria, Pager pager) throws Exception;

    /**
     * 查询平台采购单的导出数据
     * @param paramMap
     * @param purchasOrdereId 采购单主表ID
     * @param ids 采购单子表ID集合
     * @return
     */
    List<Map<String,String>> getInPlatformExportData(Map<String, Object> paramMap, String purchasOrdereId, List<String> ids);
}
