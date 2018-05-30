package net.deepdragon.dao.weipu.impl;

import net.deepdragon.constant.weipu.Weipu;
import net.deepdragon.dao.weipu.HistoryDao;
import net.deepdragon.entity.weipu.Goods;
import net.deepdragon.entity.weipu.History;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

/**
 * 会员浏览历史表数据接口实现
 */
@Repository(Weipu.SIGN + "HistoryDaoImpl")
public class HistoryDaoImpl extends BaseDaoImpl<History, String> implements HistoryDao {

	@Override
	public List<History> getListByMemberId(Map<String, Object> paramMap, String memberId) {
		String defaultStatement = History.class.getName() + "Mapper.getListByMemberId";
		return sqlSessionTemplateFactory.getSqlSessionTemplate().selectList(defaultStatement, memberId);
	}

	@Override
	public int deleteAllByMemberId(Map<String, Object> paramMap, String memberId) {
		String defaultStatement = History.class.getName() + "Mapper.deleteAllByMemberId";
		return sqlSessionTemplateFactory.getSqlSessionTemplate().delete(defaultStatement, memberId);
	}

	@Override
	public List<Goods> getGoodsByCatelog4ViewCount(Map<String, Object> paramMap, String catelogId) {
		String defaultStatement = History.class.getName() + "Mapper.getGoodsByCatelog4ViewCount";
		return sqlSessionTemplateFactory.getSqlSessionTemplate().selectList(defaultStatement, catelogId);
	}
}
