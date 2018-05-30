package net.deepdragon.dao.weipu.impl;

import net.deepdragon.constant.weipu.Weipu;
import net.deepdragon.dao.weipu.B2BGoodsAttentionDao;
import net.deepdragon.entity.weipu.B2BGoodsAttention;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

/**
 * 商品关注列表数据接口实现
 */
@Repository(Weipu.SIGN + "B2BGoodsAttentionDaoImpl")
public class B2BGoodsAttentionDaoImpl extends BaseDaoImpl<B2BGoodsAttention, String> implements B2BGoodsAttentionDao {
	@Override
	public List<B2BGoodsAttention> getListByBuyerId(Map<String, Object> paramMap, String buyerId) {
		String defaultStatement = B2BGoodsAttention.class.getName() + "Mapper.getListByBuyerId";
		return sqlSessionTemplateFactory.getSqlSessionTemplate().selectList(defaultStatement, buyerId);
	}

	@Override
	public int deleteAllByBuyerId(Map<String, Object> paramMap, String buyerId) {
		String defaultStatement = B2BGoodsAttention.class.getName() + "Mapper.deleteAllByBuyerId";
		return sqlSessionTemplateFactory.getSqlSessionTemplate().delete(defaultStatement, buyerId);
	}

}
