package net.deepdragon.dao.impl;

import net.deepdragon.constant.Shared;
import net.deepdragon.dao.PaymentMethodDao;
import net.deepdragon.entity.PaymentMethod;
import org.springframework.stereotype.Repository;

/**
 * 支付方式数据接口实现
*/
@Repository(Shared.SIGN + "PaymentMethodDaoImpl")
public class PaymentMethodDaoImpl extends BaseDaoImpl<PaymentMethod, String> implements
		PaymentMethodDao {

}
