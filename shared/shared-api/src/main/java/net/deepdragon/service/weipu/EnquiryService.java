package net.deepdragon.service.weipu;

import net.deepdragon.entity.weipu.Enquiry;

import java.util.Map;

/**
 * 询价表数据接口
*/
public interface EnquiryService extends BaseService<Enquiry, String> {

    /**
     * 保存询价单及询价单商品
     * @param paramMap
     * @param buyerId 采购商Id
     * @param enquiry
     */
    void saveEnquiry(Map<String, Object> paramMap, String buyerId, Enquiry enquiry) throws Exception;

    /**
     * 统计各状态询价单数量
     * @param paramMap
     * @param buyerId 采购商ID
     * @return
     */
    Object getCount(Map<String, Object> paramMap, String buyerId) throws Exception;

    /**
     * 更新状态
     * @param paramMap
     * @param buyerId 采购商ID
     * @param enquiryState 更新后的状态
     * @throws Exception
     */
    void updateState(Map<String, Object> paramMap, String buyerId, int enquiryState) throws Exception;
}
