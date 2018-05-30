package net.deepdragon.dao.weipu.impl;

import net.deepdragon.dao.weipu.EnquiryLogDao;
import net.deepdragon.entity.weipu.EnquiryLog;
import org.springframework.stereotype.Repository;

/**
 * 询价单日志表数据接口实现
*/
@Repository(net.deepdragon.constant.weipu.Weipu.SIGN + "EnquiryLogDaoImpl")
public class EnquiryLogDaoImpl extends BaseDaoImpl<EnquiryLog, String> implements
		EnquiryLogDao {

}
