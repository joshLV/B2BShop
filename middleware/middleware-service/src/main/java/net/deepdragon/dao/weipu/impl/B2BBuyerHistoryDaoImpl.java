package net.deepdragon.dao.weipu.impl;

import net.deepdragon.constant.weipu.Weipu;
import net.deepdragon.dao.weipu.B2BBuyerHistoryDao;
import net.deepdragon.entity.weipu.B2BBuyerHistory;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

/**
 * 会员浏览历史表数据接口实现
 */
@Repository(Weipu.SIGN + "B2BBuyerHistoryDaoImpl")
public class B2BBuyerHistoryDaoImpl extends BaseDaoImpl<B2BBuyerHistory, String> implements B2BBuyerHistoryDao {

	@Override
	public List<B2BBuyerHistory> getListByBuyerId(Map<String, Object> paramMap, String buyerId) {
		String defaultStatement = B2BBuyerHistory.class.getName() + "Mapper.getListByMemberId";
		return sqlSessionTemplateFactory.getSqlSessionTemplate().selectList(defaultStatement, buyerId);
	}

	@Override
	public int deleteAllByBuyerId(Map<String, Object> paramMap, String buyerId) {
		String defaultStatement = B2BBuyerHistory.class.getName() + "Mapper.deleteAllByMemberId";
		return sqlSessionTemplateFactory.getSqlSessionTemplate().delete(defaultStatement, buyerId);
	}

}
