package net.deepdragon.dao.weipu;

import net.deepdragon.condition.Criteria;
import net.deepdragon.entity.weipu.Quotation;
import net.deepdragon.mybatis.domain.PageBounds;

import java.util.List;
import java.util.Map;

public interface QuotationDao extends BaseDao<Quotation, String> {
    /**
     * 根据询价单获取分页数据
     *
     * @param paramMap
     *            租户标识
     * @param criteria
     *            查询条件
     * @param pageBounds
     * @return List
     * @throws Exception
     */
    List<Map<String,Object>> getPagerByEnquiryId(Map<String, Object> paramMap, Criteria criteria, PageBounds pageBounds);

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
    List<Map<String,Object>> getListByEnquiryId(Map<String, Object> paramMap, Criteria criteria);


    /**
     * 更新报价单 是否下单
     */
    int updateQuotationToDown(Map<String, Object> paramMap,int isDownOrder,String quotationId);
}
