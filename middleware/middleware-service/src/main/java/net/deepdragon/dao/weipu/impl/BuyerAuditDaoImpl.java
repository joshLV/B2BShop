package net.deepdragon.dao.weipu.impl;

import net.deepdragon.dao.weipu.BuyerAuditDao;
import net.deepdragon.entity.weipu.BuyerAudit;
import org.springframework.stereotype.Repository;

/**
 * 采购商信息审核表数据接口实现
*/
@Repository(net.deepdragon.constant.weipu.Weipu.SIGN + "BuyerAuditDaoImpl")
public class BuyerAuditDaoImpl extends BaseDaoImpl<BuyerAudit, String> implements
		BuyerAuditDao {

}
