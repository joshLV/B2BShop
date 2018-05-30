package net.deepdragon.dao.weipu.impl;

import net.deepdragon.condition.Criteria;
import net.deepdragon.dao.weipu.TodayCommendDao;
import net.deepdragon.entity.weipu.Goods;
import net.deepdragon.entity.weipu.TodayCommend;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

/**
 * 今日爆款数据接口实现
*/
@Repository(net.deepdragon.constant.weipu.Weipu.SIGN + "TodayCommendDaoImpl")
public class TodayCommendDaoImpl extends BaseDaoImpl<TodayCommend, String> implements
		TodayCommendDao {

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
		String defaultStatement = TodayCommend.class.getName() + "Mapper.getTodayCommendGoods";

		return sqlSessionTemplateFactory.getSqlSessionTemplate().selectList(
				defaultStatement, criteria);
	}

	@Override
	public List<Goods> getTodayCommendGoodsNew(Map<String, Object> paramMap, Criteria criteria) {
		String defaultStatement = TodayCommend.class.getName() + "Mapper.getTodayCommendGoodsNew";

		return sqlSessionTemplateFactory.getSqlSessionTemplate().selectList(
				defaultStatement, criteria);
	}

}
