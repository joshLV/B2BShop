package net.deepdragon.dao;

import net.deepdragon.entity.DeliveryMethod;

import java.util.List;
import java.util.Map;

public interface DeliveryMethodDao extends BaseDao<DeliveryMethod, String> {
    /**
     *
     * @param obshopId 活动ID
     */
    List<DeliveryMethod> getobshopByMethodId(Map<String,Object> paramMap ,String obshopId);
}
