package net.deepdragon.service.weipu;

import net.deepdragon.bean.Pager;
import net.deepdragon.condition.Criteria;
import net.deepdragon.entity.weipu.CarSeries;

import java.util.Map;

/**
 * 汽车系列表数据接口
*/
public interface CarSeriesService extends BaseService<CarSeries, String> {
    /**
     * 最直接的分页获取数据
     *
     * @param paramMap
     *            租户Id
     * @param criteria
     *            条件对象
     * @param pager
     *            分页对象
     *
     * @return 分页对象
     */
    Pager getSeriesPager(Map<String, Object> paramMap, Criteria criteria, Pager pager) throws Exception;
}
