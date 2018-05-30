package net.deepdragon.service.weipu.impl;


import net.deepdragon.condition.Criteria;
import net.deepdragon.constant.weipu.Weipu;
import net.deepdragon.dao.weipu.BaseDao;
import net.deepdragon.dao.weipu.GoodsReviewDao;
import net.deepdragon.entity.weipu.GoodsReview;
import net.deepdragon.service.weipu.GoodsReviewService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

@Service(Weipu.SIGN+"GoodsReviewServiceImpl")
public class GoodsReviewServiceImpl extends BaseServiceImpl<GoodsReview, String> implements GoodsReviewService {

	@Resource(name= Weipu.SIGN+"GoodsReviewDaoImpl")
	private GoodsReviewDao goodsReviewDao;
	
	@Override
	public BaseDao<GoodsReview, String> getBaseDao() {
		return this.goodsReviewDao;
	}
	
	public int updateGoodsScore(Map<String, Object> paramMap, String goodsId , Double score){
		return goodsReviewDao.updateGoodsScore(paramMap, goodsId, score);
	}

	@Override
	public List<GoodsReview> getReply(Map<String, Object> paramMap,String parentId) {
		return goodsReviewDao.getReply(paramMap,parentId);
	}

	@Override
	public List<GoodsReview> getAllByCriteria(Map<String, Object> paramMap, Criteria criteria) {
		return goodsReviewDao.getAllByCriteria(paramMap, criteria);
	}

}

