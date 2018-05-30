package net.deepdragon.dao.impl;

import net.deepdragon.constant.Shared;
import net.deepdragon.dao.DeliveryTimeDao;
import net.deepdragon.entity.DeliveryTime;
import org.springframework.stereotype.Repository;

/**
 * 送货日期数据接口实现
*/
@Repository(Shared.SIGN + "DeliveryTimeDaoImpl")
public class DeliveryTimeDaoImpl extends BaseDaoImpl<DeliveryTime, String> implements
		DeliveryTimeDao {

}
