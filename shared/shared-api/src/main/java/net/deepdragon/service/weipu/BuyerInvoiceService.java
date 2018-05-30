package net.deepdragon.service.weipu;

import net.deepdragon.entity.weipu.BuyerInvoice;

import java.util.Map;

/**
 * 采购商发票信息数据接口
*/
public interface BuyerInvoiceService extends BaseService<BuyerInvoice, String> {
    BuyerInvoice getDefaultInvoiceInfo(Map<String, Object> paramMap, String buyerId);
    void updateDefault(Map<String, Object> paramMap, String buyerId,String id);
}
