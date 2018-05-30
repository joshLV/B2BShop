package net.deepdragon.service.weipu.impl;


import net.deepdragon.condition.Criteria;
import net.deepdragon.constant.weipu.Weipu;
import net.deepdragon.dao.weipu.BaseDao;
import net.deepdragon.dao.weipu.TodayCommendDao;
import net.deepdragon.entity.weipu.Goods;
import net.deepdragon.entity.weipu.TodayCommend;
import net.deepdragon.service.weipu.TodayCommendService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

@Service(Weipu.SIGN+"TodayCommendServiceImpl")
public class TodayCommendServiceImpl extends BaseServiceImpl<TodayCommend, String> implements TodayCommendService{

	@Resource(name= Weipu.SIGN+"TodayCommendDaoImpl")
	private TodayCommendDao todayCommendDao;
	
	@Override
	public BaseDao<TodayCommend, String> getBaseDao() {
		return this.todayCommendDao;
	}

	/**
	 * 获取今日爆款商品
	 *
	 * @param paramMap
	 *            参数Map
	 * @param criteria
	 *            字段条件
	 * @return 参数列表
	 */
	@Override
	public List<Goods> getTodayCommendGoods(Map<String, Object> paramMap, Criteria criteria) {
		return todayCommendDao.getTodayCommendGoods(paramMap, criteria);
	}

	@Override
	public List<Goods> getTodayCommendGoodsNew(Map<String, Object> paramMap, Criteria criteria) {
		return todayCommendDao.getTodayCommendGoodsNew(paramMap, criteria);
	}
}

