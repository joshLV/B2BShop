package net.deepdragon.dao.weipu.impl;

import net.deepdragon.dao.weipu.GhjCreditUsedLogDao;
import net.deepdragon.entity.weipu.GhjCreditUsedLog;

import org.springframework.stereotype.Repository;

/**
 * ghj_ghj_credit_used_log数据接口实现
*/
@Repository(net.deepdragon.constant.weipu.Weipu.SIGN + "GhjCreditUsedLogDaoImpl")
public class GhjCreditUsedLogDaoImpl extends BaseDaoImpl<GhjCreditUsedLog, String> implements
		GhjCreditUsedLogDao {

}
