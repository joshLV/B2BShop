package net.deepdragon.service.weipu;

import net.deepdragon.condition.Criteria;
import net.deepdragon.entity.weipu.Keywords;
import net.deepdragon.entity.weipu.Navigation;

import java.util.List;
import java.util.Map;

/**
 * 导航管理数据接口
*/
public interface NavigationService extends BaseService<Navigation, String> {
    /**
     * 获取热词列表
     *
     * @param paramMap
     *            租户标识
     * @param criteria
     *            查询条件
     * @return
     * @throws Exception
     */
    List<Keywords> getListKeywords(Map<String, Object> paramMap, Criteria criteria)
            throws Exception;
}
