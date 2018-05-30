package net.deepdragon.dao.weipu.impl;

import net.deepdragon.dao.weipu.EnterpriseBaseQcDao;
import net.deepdragon.entity.weipu.EnterpriseBaseQc;
import org.springframework.stereotype.Repository;

/**
 * 企业基本资格证书数据接口实现
*/
@Repository(net.deepdragon.constant.weipu.Weipu.SIGN + "EnterpriseBaseQcDaoImpl")
public class EnterpriseBaseQcDaoImpl extends BaseDaoImpl<EnterpriseBaseQc, String> implements
		EnterpriseBaseQcDao {

}
