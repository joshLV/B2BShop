package net.deepdragon.dao.weipu.impl;

import net.deepdragon.dao.weipu.QuotationLogDao;
import net.deepdragon.entity.weipu.QuotationLog;
import org.springframework.stereotype.Repository;

/**
 * 报价表日志表数据接口实现
*/
@Repository(net.deepdragon.constant.weipu.Weipu.SIGN + "QuotationLogDaoImpl")
public class QuotationLogDaoImpl extends BaseDaoImpl<QuotationLog, String> implements
		QuotationLogDao {

}
