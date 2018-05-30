package net.deepdragon.dao.weipu.impl;

import net.deepdragon.dao.weipu.BuyerScoreSetDao;
import net.deepdragon.entity.weipu.BuyerScoreSet;
import org.springframework.stereotype.Repository;

/**
 * 采购商积分规则表数据接口实现
*/
@Repository(net.deepdragon.constant.weipu.Weipu.SIGN + "BuyerScoreSetDaoImpl")
public class BuyerScoreSetDaoImpl extends BaseDaoImpl<BuyerScoreSet, String> implements
		BuyerScoreSetDao {

}
