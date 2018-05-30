package net.deepdragon.dao.weipu;

import net.deepdragon.entity.weipu.BuyerInvoice;

import java.util.Map;

public interface BuyerInvoiceDao extends BaseDao<BuyerInvoice, String> {
    BuyerInvoice getDefaultInvoiceInfo(Map<String, Object> paramMap, String buyerId);
    void updateDefault(Map<String, Object> paramMap, String buyerId,String id);
}
