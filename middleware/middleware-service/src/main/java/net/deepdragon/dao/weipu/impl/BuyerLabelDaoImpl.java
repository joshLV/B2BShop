package net.deepdragon.dao.weipu.impl;

import net.deepdragon.dao.weipu.BuyerLabelDao;
import net.deepdragon.entity.weipu.BuyerLabel;
import org.springframework.stereotype.Repository;

/**
 * 采购商标签管理数据接口实现
*/
@Repository(net.deepdragon.constant.weipu.Weipu.SIGN + "BuyerLabelDaoImpl")
public class BuyerLabelDaoImpl extends BaseDaoImpl<BuyerLabel, String> implements
		BuyerLabelDao {

}
