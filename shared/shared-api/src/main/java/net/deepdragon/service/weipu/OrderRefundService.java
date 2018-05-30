package net.deepdragon.service.weipu;

import net.deepdragon.entity.weipu.OrderRefund;
import net.deepdragon.entity.weipu.OrderRefundImages;
import net.deepdragon.entity.weipu.OrderRefundLog;

import java.util.Map;

/**
 * 退款单信息数据接口
*/
public interface OrderRefundService extends BaseService<OrderRefund, String> {
    void updateRefund(Map<String,Object> paramMap, OrderRefund orderRefund, OrderRefundLog orderRefundLog, OrderRefundImages orderRefundImages);

    /**
     * 退款成功后调用，同时调整库存
     * @param paramMap
     * @param refund
     */
    void updateOrderRefund(Map<String,Object> paramMap, OrderRefund refund);
}
