package net.deepdragon.service;

import net.deepdragon.entity.DeliveryMethod;

import java.util.List;
import java.util.Map;

/**
 * 配送方式数据接口
*/
public interface DeliveryMethodService extends BaseService<DeliveryMethod, String> {
    /**
     *
     * @param paramMap
     * @param obshopId 活动ID
     * @return
     */
    List<DeliveryMethod> getobshopByMethodId(Map<String,Object> paramMap ,String obshopId);
}
