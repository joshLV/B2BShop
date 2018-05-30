package net.deepdragon.dao.weipu.impl;

import net.deepdragon.constant.weipu.Weipu;
import net.deepdragon.dao.weipu.ReceiverDao;
import net.deepdragon.entity.weipu.Receiver;
import org.springframework.stereotype.Repository;

/**
 * 收货地址数据接口实现
*/
@Repository(Weipu.SIGN + "ReceiverDaoImpl")
public class ReceiverDaoImpl extends BaseDaoImpl<Receiver, String> implements
		ReceiverDao {

}
