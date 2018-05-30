package net.deepdragon.service.weipu;

import net.deepdragon.entity.weipu.QuotationDetails;

import java.util.List;
import java.util.Map;

/**
 * 报价详情表数据接口
*/
public interface QuotationDetailsService extends BaseService<QuotationDetails, String> {
    List<QuotationDetails> getListByQuotationId(Map<String, Object> paramMap, String quotationId);
}
