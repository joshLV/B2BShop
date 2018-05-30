package net.deepdragon.dao.weipu;

import net.deepdragon.entity.weipu.FlashSalePlandetail;

import java.util.Map;

public interface FlashSalePlandetailDao extends BaseDao<FlashSalePlandetail, String> {

    void deleteDetailByPlanId(Map<String, Object> paramMap, String planId);
    
    public FlashSalePlandetail getFlashSalePlandetail(Map<String, Object> paramMap, String id);
}
