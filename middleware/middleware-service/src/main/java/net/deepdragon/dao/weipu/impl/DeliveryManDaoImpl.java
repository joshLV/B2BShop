package net.deepdragon.dao.weipu.impl;

import net.deepdragon.constant.weipu.Weipu;
import net.deepdragon.dao.weipu.DeliveryManDao;
import net.deepdragon.entity.weipu.DeliveryMan;
import org.springframework.stereotype.Repository;

/**
 * 配送员信息数据接口实现
*/
@Repository(Weipu.SIGN + "DeliveryManDaoImpl")
public class DeliveryManDaoImpl extends BaseDaoImpl<DeliveryMan, String> implements
		DeliveryManDao {

}
