package net.deepdragon.dao.weipu.impl;

import net.deepdragon.dao.weipu.BuyerScoreDao;
import net.deepdragon.entity.weipu.BuyerScore;
import org.springframework.stereotype.Repository;

/**
 * 采购商积分表(采购商消费所产生的积分)数据接口实现
*/
@Repository(net.deepdragon.constant.weipu.Weipu.SIGN + "BuyerScoreDaoImpl")
public class BuyerScoreDaoImpl extends BaseDaoImpl<BuyerScore, String> implements
		BuyerScoreDao {

}
