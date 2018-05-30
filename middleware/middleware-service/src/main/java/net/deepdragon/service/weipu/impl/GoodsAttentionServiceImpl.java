package net.deepdragon.service.weipu.impl;

import net.deepdragon.condition.Criteria;
import net.deepdragon.condition.Restrictions;
import net.deepdragon.constant.weipu.Weipu;
import net.deepdragon.dao.weipu.BaseDao;
import net.deepdragon.dao.weipu.GoodsAttentionDao;
import net.deepdragon.entity.weipu.GoodsAttention;
import net.deepdragon.service.weipu.GoodsAttentionService;
import net.deepdragon.util.Constant;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;
import java.util.Map;

@Service(Weipu.SIGN + "GoodsAttentionServiceImpl")
public class GoodsAttentionServiceImpl extends BaseServiceImpl<GoodsAttention, String> implements GoodsAttentionService {

	@Resource(name = Weipu.SIGN + "GoodsAttentionDaoImpl")
	private GoodsAttentionDao goodsAttentionDao;

	@Override
	public BaseDao<GoodsAttention, String> getBaseDao() {
		return this.goodsAttentionDao;
	}

	@Override
	public Boolean saveHistoryValues(Map<String, Object> paramMap, String memberId, String goodsId) throws Exception {
		try {
			GoodsAttention g = new GoodsAttention();
			g.setMemberId(memberId);
			g.setCreateUser(memberId);
			g.setTenantId(paramMap.get(Constant.TENANTID_KEY).toString());
			g.setGoodsId(goodsId);
			g.setCreateDate(new Date());
			Criteria criteria = new Criteria();
			criteria.add(Restrictions.eq("c.memberId", memberId));
			criteria.add(Restrictions.eq("c.goodsId", goodsId));
			List<GoodsAttention> list = goodsAttentionDao.getList(paramMap, criteria);
			if (list != null && list.size() > 0) {
				GoodsAttention goodsAttention = list.get(0);
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
	public List<GoodsAttention> getListByMemberId(Map<String, Object> paramMap, String memberId) throws Exception {
		return goodsAttentionDao.getListByMemberId(paramMap, memberId);
	}

	@Override
	public int deleteAllByMemberId(Map<String, Object> paramMap, String memberId) throws Exception {
		return goodsAttentionDao.deleteAllByMemberId(paramMap, memberId);
	}
}
