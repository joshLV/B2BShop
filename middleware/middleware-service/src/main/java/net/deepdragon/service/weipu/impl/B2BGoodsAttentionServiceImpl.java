package net.deepdragon.service.weipu.impl;

import net.deepdragon.condition.Criteria;
import net.deepdragon.condition.Restrictions;
import net.deepdragon.constant.weipu.Weipu;
import net.deepdragon.dao.weipu.B2BGoodsAttentionDao;
import net.deepdragon.dao.weipu.BaseDao;
import net.deepdragon.entity.weipu.B2BGoodsAttention;
import net.deepdragon.service.weipu.B2BGoodsAttentionService;
import net.deepdragon.util.Constant;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;
import java.util.Map;

@Service(Weipu.SIGN + "B2BGoodsAttentionServiceImpl")
public class B2BGoodsAttentionServiceImpl extends BaseServiceImpl<B2BGoodsAttention, String> implements B2BGoodsAttentionService {

	@Resource(name = Weipu.SIGN + "B2BGoodsAttentionDaoImpl")
	private B2BGoodsAttentionDao goodsAttentionDao;

	@Override
	public BaseDao<B2BGoodsAttention, String> getBaseDao() {
		return this.goodsAttentionDao;
	}

	@Override
	public Boolean saveHistoryValues(Map<String, Object> paramMap, String buyerId, String buyerUserName, String goodsId) throws Exception {
		try {
			B2BGoodsAttention g = new B2BGoodsAttention();
			g.setBuyerId(buyerId);
			g.setTenantId(paramMap.get(Constant.TENANTID_KEY).toString());
			g.setGoodsId(goodsId);
			g.setCreateDate(new Date());
			g.setCreateUser(buyerUserName);
			Criteria criteria = new Criteria();
			criteria.add(Restrictions.eq("c.buyerId", buyerId));
			criteria.add(Restrictions.eq("c.goodsId", goodsId));
			List<B2BGoodsAttention> list = goodsAttentionDao.getList(paramMap, criteria);
			if (list != null && list.size() > 0) {
				B2BGoodsAttention goodsAttention = list.get(0);
				goodsAttention.setCreateDate(new Date());
				goodsAttentionDao.update(paramMap, goodsAttention);
			} else {
				goodsAttentionDao.save(paramMap, g);
			}
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}

	@Override
	public List<B2BGoodsAttention> getListByBuyerId(Map<String, Object> paramMap, String memberId) throws Exception {
		return goodsAttentionDao.getListByBuyerId(paramMap, memberId);
	}

	@Override
	public int deleteAllByBuyerId(Map<String, Object> paramMap, String memberId) throws Exception {
		return goodsAttentionDao.deleteAllByBuyerId(paramMap, memberId);
	}
}
