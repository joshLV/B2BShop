package net.deepdragon.dao.weipu;

import net.deepdragon.condition.Criteria;
import net.deepdragon.entity.weipu.CartItem;
import net.deepdragon.entity.weipu.Goods;
import net.deepdragon.entity.weipu.PurchaseOrder;
import net.deepdragon.entity.weipu.PurchaseOrderDetail;
import net.deepdragon.mybatis.domain.PageBounds;

import java.util.List;
import java.util.Map;

public interface PurchaseOrderDetailDao extends BaseDao<PurchaseOrderDetail, String> {
    /**
     * 获取采购单明细
     *
     * @param criteria
     *            字段条件
     * @return 参数列表
     */
    List<Goods> getPurchaseOrderDetailList(Map<String, Object> paramMap, Criteria criteria, PageBounds pageBounds);

    /**
     * 获取非平台采购单明细
     *
     * @param criteria
     *            字段条件
     * @return 参数列表
     */
    List<PurchaseOrderDetail> getPurchaseOrderNoPlatformDetailList(Map<String, Object> paramMap, Criteria criteria, PageBounds pageBounds);

    /**
     * 获取非平台采购单明细
     *
     * @param buyerId
     *            采购商ID
     * @param ids
     *            采购单明细ID集合
     * @return 参数列表
     */
    List<CartItem> getListByBuyerIdAndIdsPurchaseOrder(Map<String, Object> paramMap, String buyerId, List<String> ids);

    /**
     * 获取非平台采购单明细统计
     * @param paramMap
     * @param criteria
     * @param pageBounds
     * @return
     */
    List<PurchaseOrderDetail> getPagerGroupName(Map<String, Object> paramMap, Criteria criteria, PageBounds pageBounds);

    /**
     * 查询平台采购单的导出数据
     * @param paramMap
     * @param purchasOrdereId 采购单主表ID
     * @param ids 采购单子表ID集合
     * @return
     */
    List<Map<String,String>> getInPlatformExportData(Map<String, Object> paramMap, String purchasOrdereId, List<String> ids);
}
