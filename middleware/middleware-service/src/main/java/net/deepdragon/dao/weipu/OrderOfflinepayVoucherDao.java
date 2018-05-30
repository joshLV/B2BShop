package net.deepdragon.dao.weipu;

import net.deepdragon.entity.weipu.OrderOfflinepayVoucher;

import java.util.List;
import java.util.Map;
public interface OrderOfflinepayVoucherDao extends BaseDao<OrderOfflinepayVoucher, String> {


    //获取线下订单上传的支付凭证
    List <OrderOfflinepayVoucher> findListByOrderSn(Map<String, Object> paramMap, String property, Object value);


}
