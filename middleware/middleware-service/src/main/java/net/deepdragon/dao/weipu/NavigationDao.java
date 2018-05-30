package net.deepdragon.dao.weipu;

import net.deepdragon.condition.Criteria;
import net.deepdragon.entity.weipu.Keywords;
import net.deepdragon.entity.weipu.Navigation;

import java.util.List;
import java.util.Map;

public interface NavigationDao extends BaseDao<Navigation, String> {
    /**
     * 获取热词列表
     *
     * @param paramMap
     *            租户ID
     * @param criteria
     *            查询条件
     * @return
     */
    List<Keywords> getListKeywords(Map<String, Object> paramMap, Criteria criteria);

}
