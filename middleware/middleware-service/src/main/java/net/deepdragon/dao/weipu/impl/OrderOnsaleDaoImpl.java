package net.deepdragon.dao.weipu.impl;

import net.deepdragon.constant.weipu.Weipu;
import net.deepdragon.dao.weipu.OrderOnsaleDao;
import net.deepdragon.entity.weipu.OrderOnsale;
import org.springframework.stereotype.Repository;

/**
 * 订单优惠表数据接口实现
*/
@Repository(Weipu.SIGN + "OrderOnsaleDaoImpl")
public class OrderOnsaleDaoImpl extends BaseDaoImpl<OrderOnsale, String> implements
		OrderOnsaleDao {

}
