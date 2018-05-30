package net.deepdragon.dao.weipu;

import net.deepdragon.entity.weipu.QuotationDetails;

import java.util.List;
import java.util.Map;

public interface QuotationDetailsDao extends BaseDao<QuotationDetails, String> {
    public List<QuotationDetails> getListByQuotationId(Map<String, Object> paramMap, String quotationId);
}
