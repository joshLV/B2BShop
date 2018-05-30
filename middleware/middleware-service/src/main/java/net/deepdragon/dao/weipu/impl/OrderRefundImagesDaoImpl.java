package net.deepdragon.dao.weipu.impl;

import net.deepdragon.constant.weipu.Weipu;
import net.deepdragon.dao.weipu.OrderRefundImagesDao;
import net.deepdragon.entity.weipu.OrderRefundImages;
import org.springframework.stereotype.Repository;

/**
 * 退款凭证表数据接口实现
*/
@Repository(Weipu.SIGN + "OrderRefundImagesDaoImpl")
public class OrderRefundImagesDaoImpl extends BaseDaoImpl<OrderRefundImages, String> implements
		OrderRefundImagesDao {

}
