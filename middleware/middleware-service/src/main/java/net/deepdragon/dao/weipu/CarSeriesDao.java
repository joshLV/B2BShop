package net.deepdragon.dao.weipu;

import net.deepdragon.condition.Criteria;
import net.deepdragon.entity.weipu.CarSeries;
import net.deepdragon.mybatis.domain.PageBounds;

import java.util.List;
import java.util.Map;

public interface CarSeriesDao extends BaseDao<CarSeries, String> {
    /**
     * 最直接的分页获取数据
     *
     * @param paramMap
     *            租户ID
     * @param criteria
     *            查询条件
     * @param pageBounds
     *            分页参数
     *
     * @return 分页对象
     */
    List<?> getSeriesPager(Map<String, Object> paramMap, Criteria criteria, PageBounds pageBounds);
}
