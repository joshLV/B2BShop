package net.deepdragon.dao.weipu.impl;

import net.deepdragon.dao.weipu.EnquiryMerchantDao;
import net.deepdragon.entity.weipu.EnquiryMerchant;
import org.springframework.stereotype.Repository;

/**
 * 询价单采购商中间表数据接口实现
*/
@Repository(net.deepdragon.constant.weipu.Weipu.SIGN + "EnquiryMerchantDaoImpl")
public class EnquiryMerchantDaoImpl extends BaseDaoImpl<EnquiryMerchant, String> implements
		EnquiryMerchantDao {

}
