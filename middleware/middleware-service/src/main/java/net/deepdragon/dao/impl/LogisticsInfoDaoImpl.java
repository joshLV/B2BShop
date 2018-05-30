package net.deepdragon.dao.impl;

import net.deepdragon.constant.Shared;
import net.deepdragon.dao.LogisticsCompanyDao;
import net.deepdragon.dao.LogisticsInfoDao;
import net.deepdragon.entity.DeliveryMethod;
import net.deepdragon.entity.LogisticsCompany;
import net.deepdragon.entity.LogisticsInfo;
import net.deepdragon.util.Constant;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 物流公司数据接口实现
*/
@Repository(Shared.SIGN + "LogisticsInfoDaoImpl")
public class LogisticsInfoDaoImpl extends BaseDaoImpl<LogisticsInfo, String> implements
		LogisticsInfoDao {

}
