package net.deepdragon.dao.weipu.impl;

import net.deepdragon.dao.weipu.BuyerCertificateDao;
import net.deepdragon.entity.weipu.BuyerCertificate;
import org.springframework.stereotype.Repository;

/**
 * 采购商证件表数据接口实现
*/
@Repository(net.deepdragon.constant.weipu.Weipu.SIGN + "BuyerCertificateDaoImpl")
public class BuyerCertificateDaoImpl extends BaseDaoImpl<BuyerCertificate, String> implements
		BuyerCertificateDao {

}
