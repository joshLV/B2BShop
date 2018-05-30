package net.deepdragon.dao.weipu.impl;

import net.deepdragon.constant.weipu.Weipu;
import net.deepdragon.dao.weipu.MerchantAdvertisingDao;
import net.deepdragon.entity.weipu.MerchantAdvertising;
import org.springframework.stereotype.Repository;

/**
 * 店铺广告数据接口实现
*/
@Repository(Weipu.SIGN + "MerchantAdvertisingDaoImpl")
public class MerchantAdvertisingDaoImpl extends BaseDaoImpl<MerchantAdvertising, String> implements
		MerchantAdvertisingDao {

}
