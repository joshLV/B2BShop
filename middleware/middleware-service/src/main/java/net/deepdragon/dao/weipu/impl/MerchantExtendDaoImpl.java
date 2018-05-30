package net.deepdragon.dao.weipu.impl;

import net.deepdragon.constant.weipu.Weipu;
import net.deepdragon.dao.weipu.MerchantExtendDao;
import net.deepdragon.entity.weipu.MerchantExtend;
import org.springframework.stereotype.Repository;

/**
 * wp_merchant_extend数据接口实现
*/
@Repository(Weipu.SIGN + "MerchantExtendDaoImpl")
public class MerchantExtendDaoImpl extends BaseDaoImpl<MerchantExtend, String> implements
		MerchantExtendDao {
}
