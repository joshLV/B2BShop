package net.deepdragon.service.weipu.impl;

import net.deepdragon.condition.Criteria;
import net.deepdragon.condition.Restrictions;
import net.deepdragon.constant.weipu.Weipu;
import net.deepdragon.dao.weipu.BaseDao;
import net.deepdragon.dao.weipu.HistoryDao;
import net.deepdragon.entity.weipu.Goods;
import net.deepdragon.entity.weipu.History;
import net.deepdragon.service.weipu.HistoryService;
import net.deepdragon.util.Constant;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;
import java.util.Map;

@Service(Weipu.SIGN + "HistoryServiceImpl")
public class HistoryServiceImpl extends BaseServiceImpl<History, String> implements HistoryService {

	@Resource(name = Weipu.SIGN + "HistoryDaoImpl")
	private HistoryDao historyDao;

	@Override
	public BaseDao<History, String> getBaseDao() {
		return this.historyDao;
	}

	@Override
	public Boolean saveHistoryValues(Map<String, Object> paramMap, String memberId, String goodsId) throws Exception {
		try {
			History h = new History();
			h.setMemberId(memberId);
			h.setCreateUser(memberId);
			h.setTenantId(paramMap.get(Constant.TENANTID_KEY).toString());
			h.setGoodsId(goodsId);
			h.setCreateDate(new Date());
			Criteria criteria = new Criteria();
			criteria.add(Restrictions.eq("c.memberId", memberId));
			criteria.add(Restrictions.eq("c.goodsId", goodsId));
			List<History> list = historyDao.getList(paramMap, criteria);
			if (list != null && list.size() > 0) {
				History history = list.get(0);
				history.setCreateDate(new Date());
				historyDao.update(paramMap, history);
			} else {
				historyDao.save(paramMap, h);
			}
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}

	@Override
	public Boolean saveHistoryValuesByUserKey(Map<String, Object> paramMap, String userkey, String goodsId) throws Exception {
		try {
			History h = new History();
			h.setUserkey(userkey);
			h.setCreateUser(userkey);
			h.setTenantId(paramMap.get(Constant.TENANTID_KEY).toString());
			h.setGoodsId(goodsId);
			Criteria criteria = new Criteria();
			criteria.add(Restrictions.eq("userkey", userkey));
			criteria.add(Restrictions.eq("goodsId", goodsId));
			List<History> list = historyDao.getList(paramMap, criteria);
			if (list != null && list.size() > 0) {
				History history = list.get(0);
				history.setCreateDate(new Date());
				historyDao.update(paramMap, history);
			} else {
				historyDao.save(paramMap, h);
			}
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}

	@Override
	public List<History> getListByMemberId(Map<String, Object> paramMap, String memberId) throws Exception {
		return historyDao.getListByMemberId(paramMap, memberId);
	}

	@Override
	public int deleteAllByMemberId(Map<String, Object> paramMap, String memberId) throws Exception {
		return historyDao.deleteAllByMemberId(paramMap, memberId);
	}

	@Override
	public List<Goods> getGoodsByCatelog4ViewCount(Map<String, Object> paramMap, String catelogId) throws Exception {
		return historyDao.getGoodsByCatelog4ViewCount(paramMap, catelogId);
	}
}
