package net.deepdragon.service.weipu;

import net.deepdragon.entity.weipu.OrderOfflinepayVoucher;

import java.util.List;
import java.util.Map;

/**
 * b2b_order_offlinepay_voucher数据接口
*/
public interface OrderOfflinepayVoucherService extends BaseService<OrderOfflinepayVoucher, String> {

    //获取线下订单上传的支付凭证
    List<OrderOfflinepayVoucher> findListByOrderSn(Map<String, Object> paramMap,String property, Object value);

}
