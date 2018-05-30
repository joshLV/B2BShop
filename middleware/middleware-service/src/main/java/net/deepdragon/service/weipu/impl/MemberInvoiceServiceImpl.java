package net.deepdragon.service.weipu.impl;

import net.deepdragon.constant.weipu.Weipu;
import net.deepdragon.dao.weipu.BaseDao;
import net.deepdragon.dao.weipu.MemberInvoiceDao;
import net.deepdragon.entity.weipu.MemberInvoice;
import net.deepdragon.service.weipu.MemberInvoiceService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Map;

/**
 * Created by gzj on 2015/9/24 0024.
 */
@Service(Weipu.SIGN + "MemberInvoiceServiceImpl")
public class MemberInvoiceServiceImpl extends BaseServiceImpl<MemberInvoice, String> implements MemberInvoiceService{

    @Resource(name = Weipu.SIGN + "MemberInvoiceDaoImpl")
    private MemberInvoiceDao memberInvoiceDao;


    @Override
    protected BaseDao<MemberInvoice, String> getBaseDao() {
        return memberInvoiceDao;
    }

    @Override
    public MemberInvoice getDefaultInvoiceInfo(Map<String, Object> paramMap, String memberId) {
        return memberInvoiceDao.getDefaultInvoiceInfo(paramMap, memberId);
    }

    @Override
    public void updateDefault(Map<String, Object> paramMap, String memberId, String id) {
        memberInvoiceDao.updateDefault(paramMap, memberId,id);
    }
}
