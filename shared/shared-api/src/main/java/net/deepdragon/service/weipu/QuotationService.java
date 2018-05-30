package net.deepdragon.service.weipu;

import net.deepdragon.bean.Pager;
import net.deepdragon.condition.Criteria;
import net.deepdragon.entity.weipu.Quotation;

import java.util.List;
import java.util.Map;

/**
 * 报价表数据接口
*/
public interface QuotationService extends BaseService<Quotation, String> {
//    void saveQuotationToOrder(Map<String, Object> paramMap,String quotationId,boolean isEnableConfirm);
    /**
     * 根据询价单获取分页数据
     *
     * @param paramMap
     *            租户标识
     * @param criteria
     *            查询条件 必查criteria.add(Restrictions.eq("o.enquiryId", buyer.getId()));
     * @param pager
     * @return
     * @throws Exception
     */
    Pager getPagerByEnquiryId(Map<String, Object> paramMap, Criteria criteria, Pager pager)
            throws Exception;

    /**
     * 根据询价单获取列表数据
     *
     * @param paramMap
     *            租户标识
     * @param criteria
     *            查询条件
     * @return
     * @throws Exception
     */
    List<Map<String,Object>> getListByEnquiryId(Map<String, Object> paramMap, Criteria criteria)
            throws Exception;

}
