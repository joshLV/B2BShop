package net.deepdragon.dao.weipu;

import net.deepdragon.entity.weipu.OrderRefund;

public interface OrderRefundDao extends BaseDao<OrderRefund, String> {

    /**
     * 退款退货成功时。更新库存：增库存
     * @param goodsId
     * @param stock
     */
    public void updateGoodsStock(String goodsId, Integer stock);
}
