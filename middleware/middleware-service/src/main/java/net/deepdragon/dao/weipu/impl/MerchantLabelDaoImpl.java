package net.deepdragon.dao.weipu.impl;

import net.deepdragon.dao.weipu.MerchantLabelDao;
import net.deepdragon.entity.weipu.MerchantLabel;
import org.springframework.stereotype.Repository;

/**
 * 供应商-采购商标签关联表数据接口实现
*/
@Repository(net.deepdragon.constant.weipu.Weipu.SIGN + "MerchantLabelDaoImpl")
public class MerchantLabelDaoImpl extends BaseDaoImpl<MerchantLabel, String> implements
		MerchantLabelDao {

}
