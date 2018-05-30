package net.deepdragon.service.weipu.impl;


import net.deepdragon.condition.Criteria;
import net.deepdragon.constant.weipu.Weipu;
import net.deepdragon.dao.weipu.B2BGoodsReviewDao;
import net.deepdragon.dao.weipu.BaseDao;
import net.deepdragon.entity.weipu.B2BGoodsReview;
import net.deepdragon.entity.weipu.GoodsReview;
import net.deepdragon.service.weipu.B2BGoodsReviewService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

@Service(Weipu.SIGN+"B2BGoodsReviewServiceImpl")
public class B2BGoodsReviewServiceImpl extends BaseServiceImpl<B2BGoodsReview, String> implements B2BGoodsReviewService {

	@Resource(name= Weipu.SIGN+"B2BGoodsReviewDaoImpl")
	private B2BGoodsReviewDao goodsReviewDao;
	
	@Override
	public BaseDao<B2BGoodsReview, String> getBaseDao() {
		return this.goodsReviewDao;
	}
	
	public int updateGoodsScore(Map<String, Object> paramMap, String goodsId , Double score){
		return goodsReviewDao.updateGoodsScore(paramMap, goodsId, score);
	}

	@Override
	public List<B2BGoodsReview> getReply(Map<String, Object> paramMap,String parentId) {
		return goodsReviewDao.getReply(paramMap,parentId);
	}

	@Override
	public List<B2BGoodsReview> getAllByCriteria(Map<String, Object> paramMap, Criteria criteria) {
		return goodsReviewDao.getAllByCriteria(paramMap, criteria);
	}
}

