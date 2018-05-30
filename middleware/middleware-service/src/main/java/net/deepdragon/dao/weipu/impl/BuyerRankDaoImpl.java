package net.deepdragon.dao.weipu.impl;

import net.deepdragon.dao.weipu.BuyerRankDao;
import net.deepdragon.entity.weipu.BuyerRank;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.Map;

/**
 * 采购商等级数据接口实现
*/
@Repository(net.deepdragon.constant.weipu.Weipu.SIGN + "BuyerRankDaoImpl")
public class BuyerRankDaoImpl extends BaseDaoImpl<BuyerRank, String> implements
		BuyerRankDao {
	@Override
	public BuyerRank getDefaultBuyerRank(Map<String, Object> paramMap) {
		String defaultStatement = BuyerRank.class.getName() + "Mapper.getDefaultBuyerRank";
		return sqlSessionTemplateFactory.getSqlSessionTemplate().selectOne(
				defaultStatement, paramMap);
	}

}
