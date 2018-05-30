package net.deepdragon.dao.weipu;

import net.deepdragon.condition.Criteria;
import net.deepdragon.entity.weipu.GoodsReview;

import java.util.List;
import java.util.Map;

public interface GoodsReviewDao extends BaseDao<GoodsReview, String> {

	int updateGoodsScore(Map<String, Object> paramMap, String goodsId , Double score);

	List<GoodsReview> getReply(Map<String, Object> paramMap,String parentId);

	List<GoodsReview> getAllByCriteria(Map<String, Object> paramMap,Criteria criteria);
}
