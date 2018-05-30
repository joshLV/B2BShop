package net.deepdragon.service.weipu.impl;


import net.deepdragon.constant.weipu.Weipu;
import net.deepdragon.dao.weipu.*;
import net.deepdragon.entity.weipu.OrderItem;
import net.deepdragon.entity.weipu.OrderRefund;
import net.deepdragon.entity.weipu.OrderRefundImages;
import net.deepdragon.entity.weipu.OrderRefundLog;
import net.deepdragon.service.weipu.OrderRefundService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

@Service(Weipu.SIGN+"OrderRefundServiceImpl")
public class OrderRefundServiceImpl extends BaseServiceImpl<OrderRefund, String> implements OrderRefundService{



    @Resource(name= Weipu.SIGN+"OrderRefundDaoImpl")
	private OrderRefundDao orderRefundDao;
    @Resource(name= Weipu.SIGN+"OrderRefundLogDaoImpl")
    private OrderRefundLogDao orderRefundLogDao;
    @Resource(name= Weipu.SIGN+"OrderRefundImagesDaoImpl")
    private OrderRefundImagesDao orderRefundImagesDao;

    @Resource(name = Weipu.SIGN + "OrderItemDaoImpl")
    private OrderItemDao orderItemDao;
	
	@Override
	public BaseDao<OrderRefund, String> getBaseDao() {
		return this.orderRefundDao;
	}

    @Override
    public void updateRefund(Map<String,Object> paramMap, OrderRefund orderRefund, OrderRefundLog orderRefundLog, OrderRefundImages orderRefundImages) {
        orderRefundDao.update(paramMap,orderRefund);
        orderRefundImagesDao.save(paramMap,orderRefundImages);
        orderRefundLogDao.save(paramMap,orderRefundLog);
    }

    @Override
    public synchronized void updateOrderRefund(Map<String,Object> paramMap, OrderRefund refund) {
        orderRefundDao.update(paramMap, refund);

        List<OrderItem> items = orderItemDao.findList(paramMap, "orderSn", refund.getOrderSn());
        if( items != null && items.size() > 0 ){
            for(OrderItem item : items ){
                orderRefundDao.updateGoodsStock( item.getGoodsId(), item.getQuantity());
            }
        }

    }
}

