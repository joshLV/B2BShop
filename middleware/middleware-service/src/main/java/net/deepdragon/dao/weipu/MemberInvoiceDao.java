package net.deepdragon.dao.weipu;

import net.deepdragon.entity.weipu.MemberInvoice;

import java.util.Map;

/**
 * Created by gzj on 2015/9/24 0024.
 */
public interface MemberInvoiceDao extends BaseDao<MemberInvoice,String> {
    MemberInvoice getDefaultInvoiceInfo(Map<String, Object> paramMap, String memberId);
    void updateDefault(Map<String, Object> paramMap, String memberId,String id);
}
