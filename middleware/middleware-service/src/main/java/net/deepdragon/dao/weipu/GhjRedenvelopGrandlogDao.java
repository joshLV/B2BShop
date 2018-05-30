package net.deepdragon.dao.weipu;

import net.deepdragon.condition.Criteria;
import net.deepdragon.entity.weipu.GhjRedenvelopGrandlog;

import java.util.List;
import java.util.Map;

public interface GhjRedenvelopGrandlogDao extends BaseDao<GhjRedenvelopGrandlog, String> {
    List<GhjRedenvelopGrandlog> getRedEnvelopByShopId(Map<String, Object> paramMap, Criteria criteria);
}
