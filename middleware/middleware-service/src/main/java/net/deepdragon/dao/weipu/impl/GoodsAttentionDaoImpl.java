package net.deepdragon.dao.weipu.impl;

import net.deepdragon.constant.weipu.Weipu;
import net.deepdragon.dao.weipu.GoodsAttentionDao;
import net.deepdragon.entity.weipu.GoodsAttention;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

/**
 * 商品关注列表数据接口实现
 */
@Repository(Weipu.SIGN + "GoodsAttentionDaoImpl")
public class GoodsAttentionDaoImpl extends BaseDaoImpl<GoodsAttention, String> implements GoodsAttentionDao {
	@Override
	public List<GoodsAttention> getListByMemberId(Map<String, Object> paramMap, String memberId) {
		String defaultStatement = GoodsAttention.class.getName() + "Mapper.getListByMemberId";
		return sqlSessionTemplateFactory.getSqlSessionTemplate().selectList(defaultStatement, memberId);
	}

	@Override
	public int deleteAllByMemberId(Map<String, Object> paramMap, String memberId) {
		String defaultStatement = GoodsAttention.class.getName() + "Mapper.deleteAllByMemberId";
		return sqlSessionTemplateFactory.getSqlSessionTemplate().delete(defaultStatement, memberId);
	}

}
