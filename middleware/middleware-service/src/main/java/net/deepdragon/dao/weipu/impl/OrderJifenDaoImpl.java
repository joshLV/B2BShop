package net.deepdragon.dao.weipu.impl;

import net.deepdragon.constant.weipu.Weipu;
import net.deepdragon.dao.weipu.OrderJifenDao;
import net.deepdragon.entity.weipu.OrderJifen;
import org.springframework.stereotype.Repository;

/**
 * 订单积分信息数据接口实现
*/
@Repository(Weipu.SIGN + "OrderJifenDaoImpl")
public class OrderJifenDaoImpl extends BaseDaoImpl<OrderJifen, String> implements
		OrderJifenDao {

}
