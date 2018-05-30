package net.deepdragon.dao.weipu;

import net.deepdragon.condition.Criteria;
import net.deepdragon.entity.weipu.Goods;
import net.deepdragon.entity.weipu.TodayCommend;

import java.util.List;
import java.util.Map;

public interface TodayCommendDao extends BaseDao<TodayCommend, String> {
    /**
     * 获取今日爆款商品
     *
     * @param paramMap
     *            参数Map
     * @param criteria
     *            字段条件
     * @return 参数列表
     */
    List<Goods> getTodayCommendGoods(Map<String, Object> paramMap, Criteria criteria);
    List<Goods> getTodayCommendGoodsNew(Map<String, Object> paramMap, Criteria criteria);

}
