package net.deepdragon.dao.weipu.impl;

import net.deepdragon.dao.weipu.GhjCreditDao;
import net.deepdragon.entity.weipu.GhjCredit;

import org.springframework.stereotype.Repository;

/**
 * ghj_ghj_credit数据接口实现
*/
@Repository(net.deepdragon.constant.weipu.Weipu.SIGN + "GhjCreditDaoImpl")
public class GhjCreditDaoImpl extends BaseDaoImpl<GhjCredit, String> implements
		GhjCreditDao {

}
