package net.deepdragon.dao.impl;

import net.deepdragon.constant.Shared;
import net.deepdragon.dao.LogisticsCompanyDao;
import net.deepdragon.entity.LogisticsCompany;
import org.springframework.stereotype.Repository;

/**
 * 物流公司数据接口实现
*/
@Repository(Shared.SIGN + "LogisticsCompanyDaoImpl")
public class LogisticsCompanyDaoImpl extends BaseDaoImpl<LogisticsCompany, String> implements
		LogisticsCompanyDao {

}
