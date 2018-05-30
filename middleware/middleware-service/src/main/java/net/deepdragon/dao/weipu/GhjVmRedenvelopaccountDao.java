package net.deepdragon.dao.weipu;

import net.deepdragon.condition.Criteria;
import net.deepdragon.entity.weipu.GhjVmRedenvelopaccount;
import net.deepdragon.mybatis.domain.PageBounds;

import java.util.List;
import java.util.Map;

public interface GhjVmRedenvelopaccountDao extends BaseDao<GhjVmRedenvelopaccount, String> {

    List<GhjVmRedenvelopaccount> getDirectionalMerchantList(Map<String, Object> paramMap, Criteria criteria);
    List<GhjVmRedenvelopaccount> getRedenvelopList(Map<String, Object> paramMap, Criteria criteria);
    /**
     * 获取红包记录
     *
     * @param paramMap
     *            租户标识
     * @param criteria
     *            字段条件
     * @param pageBounds
     *            分页信息
     */
    List<GhjVmRedenvelopaccount> getRedenvelopRecord(Map<String, Object> paramMap, Criteria criteria, PageBounds pageBounds);
}
