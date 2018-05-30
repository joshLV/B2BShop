package net.deepdragon.dao.weipu.impl;

import net.deepdragon.dao.weipu.EcLogDao;
import net.deepdragon.entity.weipu.EcLog;

import org.springframework.stereotype.Repository;

/**
 * sys_ec_log数据接口实现
*/
@Repository(net.deepdragon.constant.weipu.Weipu.SIGN + "EcLogDaoImpl")
public class EcLogDaoImpl extends BaseDaoImpl<EcLog, String> implements
		EcLogDao {

}
