package net.deepdragon.dao.weipu.impl;

import net.deepdragon.constant.weipu.Weipu;
import net.deepdragon.dao.weipu.MerchantAuditDao;
import net.deepdragon.entity.weipu.MerchantAudit;
import org.springframework.stereotype.Repository;

/**
 * 店铺审核意见数据接口实现
*/
@Repository(Weipu.SIGN + "MerchantAuditDaoImpl")
public class MerchantAuditDaoImpl extends BaseDaoImpl<MerchantAudit, String> implements
		MerchantAuditDao {

}
