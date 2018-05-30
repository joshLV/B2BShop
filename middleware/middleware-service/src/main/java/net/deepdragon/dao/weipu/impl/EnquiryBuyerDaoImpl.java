package net.deepdragon.dao.weipu.impl;

import net.deepdragon.dao.weipu.EnquiryBuyerDao;
import net.deepdragon.entity.weipu.EnquiryBuyer;
import org.springframework.stereotype.Repository;

/**
 * 询价单采购商中间表数据接口实现
*/
@Repository(net.deepdragon.constant.weipu.Weipu.SIGN + "EnquiryBuyerDaoImpl")
public class EnquiryBuyerDaoImpl extends BaseDaoImpl<EnquiryBuyer, String> implements
		EnquiryBuyerDao {

}
