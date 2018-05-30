package net.deepdragon.dao.weipu;

import net.deepdragon.entity.weipu.Enquiry;

import java.util.List;
import java.util.Map;

public interface EnquiryDao extends BaseDao<Enquiry, String> {
    /**
     * 更新状态
     * 必传属性：enquiryState、tenantId、buyerId、isDelete
     * 选传属性：offerEndDateTime（小于）
     * @param enquiry
     */
    int updateState(Enquiry enquiry);

    /**
     * 统计各状态询价单数量
     * @param paramMap
     * @param buyerId 采购商ID
     * @return
     */
    List<Map<String,Object>> getCount(Map<String, Object> paramMap, String buyerId);
}
