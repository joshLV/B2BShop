package net.deepdragon.dao.weipu.impl;

import net.deepdragon.condition.Criteria;
import net.deepdragon.constant.weipu.Weipu;
import net.deepdragon.dao.weipu.B2BGoodsReviewDao;
import net.deepdragon.entity.weipu.B2BGoodsReview;
import net.deepdragon.entity.weipu.GoodsReview;
import org.apache.ibatis.session.ExecutorType;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 商品评论表数据接口实现
*/
@Repository(Weipu.SIGN + "B2BGoodsReviewDaoImpl")
public class B2BGoodsReviewDaoImpl extends BaseDaoImpl<B2BGoodsReview, String> implements
		B2BGoodsReviewDao {
	@Override
	public int updateGoodsScore(Map<String, Object> paramMap, String goodsId , Double score) {
		String defaultStatement = B2BGoodsReview.class.getName() + "Mapper.updateGoodsScore";
		Map<String, Object> parameter = new HashMap<String, Object>();
		parameter.put("score", score);
		parameter.put("id", goodsId);
		return sqlSessionTemplateFactory.getSqlSessionTemplate(ExecutorType.BATCH).update(defaultStatement, parameter);
	}

	@Override
	public List<B2BGoodsReview> getReply(Map<String, Object> paramMap,String parentId) {
		String defaultStatement = B2BGoodsReview.class.getName() + "Mapper.getReply";
		Map<String, Object> parameter = new HashMap<String, Object>();
		parameter.put("parentId", parentId);
		return sqlSessionTemplateFactory.getSqlSessionTemplate().selectList(defaultStatement,parameter);
	}

	@Override
	public List<B2BGoodsReview> getAllByCriteria(Map<String, Object> paramMap, Criteria criteria) {
		String defaultStatement = B2BGoodsReview.class.getName() + "Mapper.getAllByCriteria";

		return sqlSessionTemplateFactory.getSqlSessionTemplate().selectList(
				defaultStatement, criteria);
	}
}
