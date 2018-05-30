package net.deepdragon.service.weipu.impl;

import net.deepdragon.condition.Criteria;
import net.deepdragon.condition.Restrictions;
import net.deepdragon.constant.weipu.Weipu;
import net.deepdragon.dao.weipu.B2BBuyerHistoryDao;
import net.deepdragon.dao.weipu.BaseDao;
import net.deepdragon.entity.weipu.B2BBuyerHistory;
import net.deepdragon.service.weipu.B2BBuyerHistoryService;
import net.deepdragon.util.Constant;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;
import java.util.Map;

@Service(Weipu.SIGN + "B2BBuyerHistoryServiceImpl")
public class B2BBuyerHistoryServiceImpl extends BaseServiceImpl<B2BBuyerHistory, String> implements B2BBuyerHistoryService {

	@Resource(name = Weipu.SIGN + "B2BBuyerHistoryDaoImpl")
	private B2BBuyerHistoryDao historyDao;

	@Override
	public BaseDao<B2BBuyerHistory, String> getBaseDao() {
		return this.historyDao;
	}

	@Override
	public Boolean saveHistoryValues(Map<String, Object> paramMap, String buyerId, String goodsId) throws Exception {
		try {
			B2BBuyerHistory h = new B2BBuyerHistory();
			h.setBuyerId(buyerId);
			h.setCreateUser(buyerId);
			h.setTenantId(paramMap.get(Constant.TENANTID_KEY).toString());
			h.setGoodsId(goodsId);
			h.setCreateDate(new Date());
			Criteria criteria = new Criteria();
			criteria.add(Restrictions.eq("c.buyerId", buyerId));
			criteria.add(Restrictions.eq("c.goodsId", goodsId));
			List<B2BBuyerHistory> list = historyDao.getList(paramMap, criteria);
			if (list != null && list.size() > 0) {
				B2BBuyerHistory history = list.get(0);
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
			B2BBuyerHistory h = new B2BBuyerHistory();
			h.setUserkey(userkey);
			h.setCreateUser(userkey);
			h.setTenantId(paramMap.get(Constant.TENANTID_KEY).toString());
			h.setGoodsId(goodsId);
			Criteria criteria = new Criteria();
			criteria.add(Restrictions.eq("userkey", userkey));
			criteria.add(Restrictions.eq("goodsId", goodsId));
			List<B2BBuyerHistory> list = historyDao.getList(paramMap, criteria);
			if (list != null && list.size() > 0) {
				B2BBuyerHistory history = list.get(0);
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
	public List<B2BBuyerHistory> getListByBuyerId(Map<String, Object> paramMap, String buyerId) throws Exception {
		return historyDao.getListByBuyerId(paramMap, buyerId);
	}

	@Override
	public int deleteAllByBuyerId(Map<String, Object> paramMap, String buyerId) throws Exception {
		return historyDao.deleteAllByBuyerId(paramMap, buyerId);
	}

}
