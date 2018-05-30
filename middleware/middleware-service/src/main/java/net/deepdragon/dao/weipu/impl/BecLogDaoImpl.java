package net.deepdragon.dao.weipu.impl;

import net.deepdragon.dao.weipu.BecLogDao;
import net.deepdragon.entity.weipu.BecLog;

import org.springframework.stereotype.Repository;

/**
 * sys_bec_log数据接口实现
*/
@Repository(net.deepdragon.constant.weipu.Weipu.SIGN + "BecLogDaoImpl")
public class BecLogDaoImpl extends BaseDaoImpl<BecLog, String> implements
		BecLogDao {

}
