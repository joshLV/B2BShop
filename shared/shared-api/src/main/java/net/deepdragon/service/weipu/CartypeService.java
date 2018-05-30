package net.deepdragon.service.weipu;

import net.deepdragon.bean.Pager;
import net.deepdragon.condition.Criteria;
import net.deepdragon.entity.weipu.Cartype;

import java.util.Map;

/**
 * 车型表数据接口
*/
public interface CartypeService extends BaseService<Cartype, String> {
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
    Pager getCartypePager(Map<String, Object> paramMap, Criteria criteria, Pager pager) throws Exception;
}
