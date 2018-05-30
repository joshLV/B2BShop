package net.deepdragon.dao.weipu;

import net.deepdragon.condition.Criteria;
import net.deepdragon.entity.weipu.Order;
import net.deepdragon.weipu.bean.PayType;

import java.util.List;
import java.util.Map;

public interface CrossBorderOrderDao extends BaseDao<Order, String> {

    Map<String, Object> getCrossBorderOrderMap(Map<String, Object> paramMap, Criteria criteria);

    int updateCrossBorderOrderStatus(Map<String, Object> paramMap);

    Map<String, Object> getCrossBorderOrderInfo(Map<String, Object> paramMap, Criteria criteria);

    int saveCrossBorderOrder(Map<String, Object> paramMap, Map pMap);
}
