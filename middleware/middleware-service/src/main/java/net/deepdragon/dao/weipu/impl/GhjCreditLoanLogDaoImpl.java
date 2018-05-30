package net.deepdragon.dao.weipu.impl;

import net.deepdragon.dao.weipu.GhjCreditLoanLogDao;
import net.deepdragon.entity.weipu.GhjCreditLoanLog;

import org.springframework.stereotype.Repository;

/**
 * 申请放款记录表数据接口实现
*/
@Repository(net.deepdragon.constant.weipu.Weipu.SIGN + "GhjCreditLoanLogDaoImpl")
public class GhjCreditLoanLogDaoImpl extends BaseDaoImpl<GhjCreditLoanLog, String> implements
		GhjCreditLoanLogDao {

}
