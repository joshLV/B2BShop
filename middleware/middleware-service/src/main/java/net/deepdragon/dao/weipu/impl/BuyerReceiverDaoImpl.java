package net.deepdragon.dao.weipu.impl;

import net.deepdragon.dao.weipu.BuyerReceiverDao;
import net.deepdragon.entity.weipu.BuyerReceiver;
import org.springframework.stereotype.Repository;

/**
 * 采购商收货地址数据接口实现
*/
@Repository(net.deepdragon.constant.weipu.Weipu.SIGN + "BuyerReceiverDaoImpl")
public class BuyerReceiverDaoImpl extends BaseDaoImpl<BuyerReceiver, String> implements
		BuyerReceiverDao {

}
