package net.deepdragon.service.weipu;

import net.deepdragon.condition.Criteria;
import net.deepdragon.entity.weipu.B2BGoodsReview;
import net.deepdragon.entity.weipu.GoodsReview;

import java.util.List;
import java.util.Map;

/**
 * 商品评论表数据接口
*/
public interface B2BGoodsReviewService extends BaseService<B2BGoodsReview, String> {

	int updateGoodsScore(Map<String, Object> paramMap, String goodsId, Double score);

	List<B2BGoodsReview> getReply(Map<String, Object> paramMap, String parentId);

	List<B2BGoodsReview> getAllByCriteria(Map<String, Object> paramMap, Criteria criteria);
}
