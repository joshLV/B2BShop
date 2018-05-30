package net.deepdragon.service.weipu;

import net.deepdragon.bean.Pager;
import net.deepdragon.condition.Criteria;
import net.deepdragon.entity.weipu.GoodsCartype;

import java.util.Map;

/**
 * 商品(配件)车型关联关系数据接口
*/
public interface GoodsCartypeService extends BaseService<GoodsCartype, String> {
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
    Pager getGoodsPager(Map<String, Object> paramMap, Criteria criteria, Pager pager) throws Exception;
}
